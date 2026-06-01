local PERIOD = 1
local function onmax(self, max)
    self.inst.replica.spiritual_energy:SetMax(max)
end

local function oncurrent(self, current)
    self.inst.replica.spiritual_energy:SetCurrent(current)
end

local function OnTaskTick(inst, self)
    if TheNet:IsServerPaused() or inst:HasTag("playerghost") then	--服务器暂停时以及人物死亡时不更新
		return
	end
    self:DoDec(PERIOD)
end


local Spiritual_Energy = Class(function(self, inst)
        self.inst = inst
        self.max = TUNING.MOD_YOSHINO.badge.spiritual_energy.max or 100
        self.current = self.max * 0.6
        self.rate = 8/60 --基础速率
        self.real_rate = self.rate  --真实速率,由多种因素计算而来,不可随意变动
        self.inst:DoPeriodicTask(PERIOD, OnTaskTick, nil, self)
    end,
    nil,
    {
        max = onmax,
        current = oncurrent,
    }
)
function Spiritual_Energy:SetMax(amount)
    self.max = amount
    if self.current > amount then
        self.current = amount
    end
    self:DoDelta(0)
end

function Spiritual_Energy:DoDelta(delta, overtime)
    local oldcurrent = self.current
    self.current = math.max(0, math.min(self.max, self.current + delta))
    self.inst:PushEvent("yoshino_reiryoku_delta",{old = oldcurrent, new = self.current, per = self.current/self.max})
    --print("有变化了,新值="..tostring(self.current))
end

function Spiritual_Energy:DoDec(dt,ignore_damage)
    local new_rate = self:Recalc()
    self.real_rate = new_rate + self.rate
    self:DoDelta(self.real_rate * dt, true)
end

function Spiritual_Energy:LongUpdate(dt)
    self:DoDec(dt)
end

function Spiritual_Energy:Recalc()

    --装备的影响
    local equip_rate = 0
    if self.inst.components.inventory then                                --存在物品栏组件
        for _, v in pairs(self.inst.components.inventory.equipslots) do          --查找装备栏的装备
            if v.components.equippable then                               --如果装备有可装备组件
                if v.components.equippable.spireng ~= nil then            --可装备组件上挂载的spireng变量不为空的话
                    equip_rate = equip_rate + v.components.equippable.spireng --把这件装备的此条目数字加上去
                end
            end
        end
    end

    --环境影响
    local env_rate = 0
    if TheWorld.state.israining or TheWorld.state.issnowing then --下雪下雨
        env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.ros
    end
    if TheWorld.state.iswinter then --是冬天
        env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.winter
    end
    if TheWorld.state.isfullmoon then --满月(使用 TheWorld.state.moonphase == "full" 也能实现相同效果)
        env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.fullmoon
    end

    local pos = self.inst:GetPosition()  --获取玩家当前位置
    -- 冷火或极光旁
    local nearent = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, nil, nil, { "star_cold" }) --使用添加的自定义标签搜索特定实体
    for k, v in pairs(nearent) do
        if v.prefab == "coldfirepit" or v.prefab == "coldfire" then --吸热营火或者吸热火坑
            if v.components.fueled and (not v.components.fueled:IsEmpty()) then --有燃料组件且燃料不为空时
                env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.coldfirerate
            end
           --if self.inst.components.talker then self.inst.components.talker:Say("在冷火旁") end
        end
        if v.prefab == "staffcoldlight" or v.prefab == "staffcoldlightfx" then --在极光旁
            env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.coldlight
            --if self.inst.components.talker then self.inst.components.talker:Say("在极光旁") end
        end
    end

    --海上 (IsOnOncean的参数决定是否要判断船, 为false时人物要在海里且不在船上才能返回true,参数为true时需要人物在船上或者漂浮装置上才能返回true)
    if self.inst:IsOnOcean(true) or self.inst:IsOnOcean(false) then
        env_rate = env_rate + TUNING.MOD_YOSHINO.badge.spiritual_energy.sea
        --TheNet:Say("在海上",true)   --true表示悄悄话,false或nil表示公开发言
    end

    local all_rate = equip_rate + env_rate
    
    return all_rate or 0
end

function Spiritual_Energy:GetPercent()
    return self.current / self.max
end

function Spiritual_Energy:GetCurrent()
    return self.current
end

function Spiritual_Energy:OnSave()
    return {
        max = self.max,
        current = self.current,
    }
end

function Spiritual_Energy:OnLoad(data)
    if data.current ~= nil then
        self.current = data.current
    end
    if data.max ~= nil then
        self.max = data.max
    end
    self:DoDelta(0) --刷新一下限制范围
end

return Spiritual_Energy
