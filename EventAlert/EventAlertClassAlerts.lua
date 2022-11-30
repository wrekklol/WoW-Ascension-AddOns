function Class_Events_OnLoad()
    UIPanelWindows["Class_Events_Frame"] = {area = "center", pushable = 0};

	Class_Events_Frame_EditBox:SetFontObject(ChatFontNormal);
	Class_Events_Frame_EditBox:SetText("http://www.wowhead.com/?spell=SPELLIDHERE")
end

function Class_Events_Frame_MouseDown(button)
    if button == "LeftButton" then
        Class_Events_Frame:StartMoving();
    end
end

function Class_Events_Frame_MouseUp(button)
    if button == "LeftButton" then
        Class_Events_Frame:StopMovingOrSizing();
    end
end