
local function Ondirty(self,inst)
    self.inst:PushEvent("reiryoku_current_change", {current = self:GetCurrent(), percent = self:GetPercent(), max = self:Max()})
end


local Spiritual_Energy = Class(function(self, inst)
    self.inst = inst
    self.current = net_ushortint(inst.GUID, "spiritual_energy.current", "spiritual_energy_current_change")
    self.max = net_ushortint(inst.GUID, "spiritual_energy.max","spiritual_energy_max_change")
    self.inst:ListenForEvent("spiritual_energy_current_change", function(inst) Ondirty(self,inst) end)

end)
function Spiritual_Energy:SetMax(num)
    self.max:set(num)
end

function Spiritual_Energy:Max()
    return self.max:value()
end

function Spiritual_Energy:SetCurrent(num)
    self.current:set(num)
end

function Spiritual_Energy:GetCurrent()
    return self.current:value()
end

function Spiritual_Energy:GetPercent()
    return self.current:value() / self.max:value()
end


return Spiritual_Energy
