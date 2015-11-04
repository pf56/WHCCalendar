local WHC = Apollo.GetAddon("WHCCalendar")
local StateIDLE = { }

function StateIDLE.Init()
	local self = {
		d = { }	
	}
	
	function self:OnMessage(tChannel, tMsg, strSender)
		if not tMsg.TYPE == WHC.MessageType.SYNC_REQ then
			return
		end
		
		Print(strSender.." requests sync")
		
		WHC:SendMessage(WHC.MessageType.SYNC_OFF, nil, strSender)
		WHC:SwitchState(WHC.StateWAITACK)
	end
	
	function self:GetTimeout()
		return 0
	end
	
	function self:Do()
	end
	
	return self
end

Apollo.RegisterPackage(StateIDLE, "WHCCalendar:StateIDLE", 1, {})
