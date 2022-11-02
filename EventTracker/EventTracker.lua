--[[ =================================================================
    Description:
        EventTracker is a simple AddOn that informs, by means of a
        chat message, when specific events are triggered within the
        game.

        The main purpose is to determine which events get triggered
        at what stage, to ultimately get a better understanding about
        the internals of the game, and hopefully help out in identifying
        why certain things happen or things might be failing all together.

        Update the file EventTracker_events.lua to specify which events
        need to be tracked.

    Contact:
        For questions, bug reports visit the website or send an email
        to the following address: wowaddon@xs4all.nl

    Dependencies:
        None

    Credits:
        A big 'Thank You' to all the people at Blizzard Entertainment
        for making World of Warcraft.
    ================================================================= --]]

-- Local table functions
    local tinsert, wipe = table.insert, table.wipe;
    local lower, upper, substr = string.lower, string.upper, string.sub;

-- Function to create array of return values
    function pack(...)
        return arg;
    end

-- Send message to the default chat frame
    function EventTracker_Message( msg, prefix )
        -- Initialize
        local prefixText = "";

        -- Add application prefix
        if ( prefix or true ) then
            prefixText = C_GREEN..ET_NAME..": "..C_CLOSE;
        end;

        -- Send message to chatframe
        DEFAULT_CHAT_FRAME:AddMessage( prefixText..( msg or "" ) );
    end;

-- Handle EventTracker initialization
    function EventTracker_Init()
        -- Initiliaze all parts of the saved variable
        if ( not ET_Data ) then ET_Data = {}; end;
        if ( not ET_Data["active"] ) then ET_Data["active"] = true; end;
        if ( not ET_Data["events"] ) then ET_Data["events"] = {}; end;

        -- Register slash commands
        SlashCmdList["EVENTTRACKER"] = EventTracker_SlashHandler;
        SLASH_EVENTTRACKER1 = "/et";
        SLASH_EVENTTRACKER2 = "/eventtracker";
    end;

-- Register events
    function EventTracker_RegisterEvents()
        -- Always track VARIABLES_LOADED
        this:RegisterEvent( "VARIABLES_LOADED" );

        -- Track other events
        for key, value in pairs( ET_TRACKED_EVENTS ) do
            this:RegisterEvent( strtrim( upper( value ) ) );
        end;
    end;

-- Handle startup of the addon
    function EventTracker_OnLoad()
        -- Register events to be monitored
        EventTracker_RegisterEvents();

        -- Show startup message
        EventTracker_Message( ET_STARTUP_MESSAGE, false );
    end;

-- Show or hide the Main dialog
    function EventTracker_Toggle_Main()
        if(  EventTrackerFrame:IsVisible() ) then
            --EventTrackerFrame:Hide();
        else
            -- Show the frame
            EventTrackerFrame:Show();
            EventTrackerFrame:SetBackdropColor( 0, 0, 0, .5 );

            -- Update the UI
            EventTracker_UpdateUI();
        end;
    end;

-- Show or hide the event detail dialog
    function EventTracker_Toggle_Details()
        if( EventDetailFrame:IsVisible() ) then
            EventDetailFrame:Hide();
            ExpandCollapseButton:SetText( ET_SHOW_DETAILS );
        else
            -- Show the frame
            EventDetailFrame:Show();
            EventDetailFrame:SetBackdropColor( 0, 0, 0, .5 );
            ExpandCollapseButton:SetText( ET_HIDE_DETAILS );
        end;
    end;

-- Purge event data
    function EventTracker_Purge()
        -- Clear out old data
        wipe( ET_Events );
        wipe( ET_EventDetail );
        wipe( ET_ArgumentInfo );
        wipe( ET_FrameInfo );
        ET_CurrentEvent = nil;

        -- Update UI elements
        EventTracker_Scroll_Details();
        EventTracker_Scroll_Arguments();
        EventTracker_Scroll_Frames();
        EventTracker_UpdateUI();
    end;

-- Add data to the tracking stack (for internal usage)
    local function EventTracker_AddInfo( event, data, realevent, time_usage, call_stack )
        -- Track details
        if (not ET_Events[event] ) then
            ET_Events[event] = {};
        end;
        ET_Events[event].count = ( ET_Events[event].count or 0 ) + 1;
        if ( time_usage ) then
            ET_Events[event].time = ( ET_Events[event].time or 0 ) + time_usage;
        end;
        tinsert( ET_EventDetail, { event, time(), data, realevent, time_usage, call_stack } );

        -- Update frame
        if(  EventTrackerFrame:IsVisible() ) then
            EventTracker_Scroll_Details();
            EventTracker_UpdateUI();
        end;
    end;

-- Add data to the tracking stack (for external usage)
    function EventTracker_TrackProc( procname, arginfo )
        -- Store original function
        ET_ProcList[procname] = _G[procname];

        -- Add argument information if provided
        if ( arginfo ) then
            ET_Static[procname] = arginfo;
        end;

        -- Define replacement function (includes timing information)
        _G[procname] = function( ... )
            local start = debugprofilestop();
            local retval = { ET_ProcList[procname]( ... ) };
            local usage = debugprofilestop() - start;
            local call_stack = debugstack( 2 );
            EventTracker_AddInfo( procname, { ... }, false, usage, call_stack );
            if ( retval ) then return unpack( retval ); end;
        end;
    end;

-- Handle events sent to the addon
    function EventTracker_OnEvent( self, event, ... )
        if ( event == "VARIABLES_LOADED" ) then
            EventTracker_Init();
        end;

        -- Store event data
        if ( ET_Data["active"] ) then
            EventTracker_AddInfo( event, { ... }, true );
        end;
     end;

-- Build strings for argument names and data (incl proper colors and nil handling)
    function EventTracker_GetStrings( event, index, value )
        local argName, argData;

        if ( ET_Static[event] ) then
            argName = ( ET_Static[event][index] or ET_UNKNOWN );
        else
            argName = index;
        end;

        argData = tostring(value or ET_NIL);

        return C_BLUE..argName..C_CLOSE, C_YELLOW..argData..C_CLOSE;
    end;

-- Scroll function for event details
    function EventTracker_Scroll_Details()
        local length = #ET_EventDetail;
        local line, index, button, argInfo, argName, argData;
        local offset = FauxScrollFrame_GetOffset( EventTracker_Details );
        local argName, argData;

        -- Update scrollbars
        FauxScrollFrame_Update( EventTracker_Details, length+1, ET_DETAILS, 30 );

        -- Redraw items
        for line = 1, ET_DETAILS, 1 do
            index = offset + line;
            button = getglobal( "EventItem"..line );
            button:SetID( line );
            button:SetAttribute( "index", index );
            if index <= length then
                local event, timestamp, data, realevent, time_usage, call_stack = unpack( ET_EventDetail[index] );
                getglobal( "EventItem"..line.."InfoEvent" ):SetText( event );
                getglobal( "EventItem"..line.."InfoTimestamp" ):SetText( date( "%Y-%m-%d %H:%M:%S", timestamp ) );
                argInfo = "";

                for key, value in pairs( data ) do
                    argName, argData = EventTracker_GetStrings( event, key, value );
                    argInfo = argInfo..", "..argName.." = "..argData;
                end;
                getglobal( "EventItem"..line.."InfoData" ):SetText( substr( argInfo, 3 ) );
                button:Show();
                button:Enable();
            else
                button:Hide();
            end;
        end;
    end;

-- Scroll function for event arguments
    function EventTracker_Scroll_Arguments()
        local length = #ET_ArgumentInfo;
        local line, index, button, argName, argData;
        local offset = FauxScrollFrame_GetOffset( EventTracker_Arguments );

        -- Update scrollbars
        FauxScrollFrame_Update( EventTracker_Arguments, length+1, ET_ARGUMENTS, 16 );

        -- Redraw items
        for line = 1, ET_ARGUMENTS, 1 do
            index = offset + line;
            button = getglobal( "EventArgument"..line );
            button:SetID( line );
            button:SetAttribute( "index", index );
            if index <= length then
                argName, argData = EventTracker_GetStrings( ET_CurrentEvent, index, ET_ArgumentInfo[index] );
                getglobal( "EventArgument"..line.."InfoArgument" ):SetText( argName );
                getglobal( "EventArgument"..line.."InfoData" ):SetText( argData );
                button:Show();
                button:Enable();
            else
                button:Hide();
            end;
        end;
    end;

-- Scroll function for frames registered
    function EventTracker_Scroll_Frames()
        local length = #ET_FrameInfo;
        local line, index, button;
        local offset = FauxScrollFrame_GetOffset( EventTracker_Frames );

        -- Update scrollbars
        FauxScrollFrame_Update( EventTracker_Frames, length+1, ET_FRAMES, 16 );

        -- Redraw items
        for line = 1, ET_FRAMES, 1 do
            index = offset + line;
            button = getglobal( "EventFrame"..line );
            button:SetID( line );
            button:SetAttribute( "index", index );
            if index <= length then
                getglobal( "EventFrame"..line.."InfoFrame" ):SetText( ( ET_FrameInfo[index]:GetName() or ET_UNNAMED_FRAME ) );
                button:Show();
                button:Enable();
            else
                button:Hide();
            end;
        end;
    end;

-- Update the UI
    function EventTracker_UpdateUI( currenttime )
        -- Number of events caught
        getglobal( "EventCount" ):SetText( ET_EVENT_COUNT:format( #ET_EventDetail ) );

        -- Number of events that are being tracked
        getglobal( "EventsTracked" ):SetText( ET_EVENTS_TRACKED:format( #ET_TRACKED_EVENTS ) );

        -- Memory usage
        getglobal( "EventMemory" ):SetText( ET_MEMORY:format( GetAddOnMemoryUsage( "EventTracker" ) ) );

        -- Update tracking state
        getglobal( "TrackingState" ):SetText( ET_TRACKING:format( lower( gsub( gsub( tostring( ET_Data["active"] ), "true", ET_STATE_ON ), "false", ET_STATE_OFF ) ) ) );

        -- Update current event for details
        if ( ET_CurrentEvent ) then
            getglobal( "CurrentEventName" ):SetText( ET_CurrentEvent.." ["..ET_Events[ET_CurrentEvent].count.."]" );
            getglobal( "EventTimeCurrent" ):SetText( ET_TIME_CURRENT:format( currenttime or 0 ) );
            getglobal( "EventTimeTotal" ):SetText( ET_TIME_TOTAL:format( ET_Events[ET_CurrentEvent].time or 0 ) );
        else
            getglobal( "CurrentEventName" ):SetText( ET_UNKNOWN );
            getglobal( "EventTimeCurrent" ):SetText( ET_TIME_CURRENT:format( 0 ) );
            getglobal( "EventTimeTotal" ):SetText( ET_TIME_TOTAL:format( 0 ) );
        end;
    end;

-- Toggle tracking
    function EventTracker_Toggle()
        ET_Data["active"] = not ET_Data["active"];
        EventTracker_UpdateUI();
    end;

-- Handle click on event item
    function EventTracker_EventOnClick( button )
        local event, timestamp, data, realevent, time_usage, call_stack = unpack( ET_EventDetail[ FauxScrollFrame_GetOffset( EventTracker_Details ) + this:GetID() ] );

        if ( button == "LeftButton" ) then
            if ( realevent ) then
                ET_FrameInfo = { GetFramesRegisteredForEvent( event ) };
                Event_Frame_FrameHeading:SetText( ET_REGISTERED_TEXT );
                EventCallStack:SetText( "" );
            else
                wipe( ET_FrameInfo );
                Event_Frame_FrameHeading:SetText( ET_CALLSTACK_TEXT );
                EventCallStack:SetText( call_stack );
            end;
            ET_ArgumentInfo = data;
            ET_CurrentEvent = event;
            EventTracker_Scroll_Arguments();
            EventTracker_Scroll_Frames();
            EventTracker_UpdateUI( time_usage );

            -- Show the detail window if not already showing
            if ( not EventDetailFrame:IsVisible() ) then
                EventTracker_Toggle_Details();
            end;
        end;
    end;

-- Show help message
    function EventTracker_ShowHelp()
        for key, value in pairs( ET_HELP ) do
            EventTracker_Message( value );
        end;
    end;

-- Handle slash commands
    function EventTracker_SlashHandler( msg, editbox )
        -- arguments should be handled case-insensitve
        local command, event = strsplit( " ", msg );

        command = strlower( command or "" );
        event = strtrim( strupper( event or "" ) );

        -- Handle each individual argument
        if ( command == "" ) then
            -- Show main dialog
            EventTracker_Toggle_Main();

        elseif ( command == "resetpos" ) then
            EventTrackerFrame:ClearAllPoints();
            EventTrackerFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0);

        elseif ( command == "add" ) then
            -- Add event to be tracked
            EventTracker:RegisterEvent( event );

        elseif ( command == "remove" ) then
            -- Remove event to be tracked
            EventTracker:UnregisterEvent( event );

        elseif ( command == "registerall" ) then
            -- Track all events
            EventTracker:RegisterAllEvents();

        elseif ( command == "unregisterall" ) then
            -- Track all events
            EventTracker:UnregisterAllEvents();
            EventTracker:RegisterEvent( "VARIABLES_LOADED" );

        elseif ( msg == "help" ) or ( msg == "?" ) then
            -- Show help info
            EventTracker_ShowHelp();
        end;
    end;