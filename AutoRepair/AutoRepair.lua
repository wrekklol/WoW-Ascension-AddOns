function arInit()
	this:RegisterEvent("MERCHANT_SHOW");
end

function arEvent()
	if event=="MERCHANT_SHOW" then
		if CanMerchantRepair()==1 then
			repairAllCost, canRepair = GetRepairAllCost();
			if repairAllCost>0 then
				if canRepair==1 then
					RepairAllItems();
					valC=repairAllCost%100;
					valS=math.floor((repairAllCost%10000)/100);
					valG=math.floor(repairAllCost/10000);
					DEFAULT_CHAT_FRAME:AddMessage("Ваши вещи были отремонтированы за "..valG.."з. "..valS.."с. "..valC.."м.",255,255,0);
				else
					DEFAULT_CHAT_FRAME:AddMessage("У вас не хватает денег на подчинку!",255,0,0);
				end
			end
		end
	end
end