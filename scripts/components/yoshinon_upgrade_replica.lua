

local Yoshinon_Upgrade = Class(function(self, inst)
    self.inst = inst
    self.current = net_shortint(inst.GUID, "inst.yoshinon_upgrade_current", "yoshinon_upgrade_current")
    self.max = net_shortint(inst.GUID, "inst.yoshinon_upgrade_maxlevel","yoshinon_upgrade_maxlevel")
    self.lvexp = net_shortint(inst.GUID, "yoshinon_upgrade_currentexp","yoshinon_upgrade_currentexp")
	self.needexp = net_shortint(inst.GUID, "yoshinon_upgrade_needexp","yoshinon_upgrade_needexp")

end)

function Yoshinon_Upgrade:SetMax(num)
	self.max:set(math.max(1, math.abs(num)))
end

function Yoshinon_Upgrade:SetCurrent(num)
	self.current:set(math.abs(num))
end

function Yoshinon_Upgrade:Setlvexp(num)
	self.lvexp:set(math.max(0,num))
end

function Yoshinon_Upgrade:Setneedexp(num)
	self.needexp:set(num)
end

function Yoshinon_Upgrade:GetLevel()
	return self.current:value()
end

function Yoshinon_Upgrade:Getlvexp()
	return self.lvexp:value()
end

function Yoshinon_Upgrade:Getneedexp()
	return self.needexp:value()
end

function Yoshinon_Upgrade:GetMax()
	return self.max:value()
end

return Yoshinon_Upgrade