
local unpack = unpack or table.unpack --为已经废弃的unpack函数做兼容

local function OnTimerDone(inst, data)
    if data.name == "buffover" then
        inst.components.debuff:Stop()
    end
end

local function MakeBuff(name, data)
    --buff触发时执行
    local function OnAttached(inst, target)
        inst.entity:SetParent(target.entity)
        inst.Transform:SetPosition(0, 0, 0) --in case of loading
        inst:ListenForEvent("death", function() --死亡时buff停止
            inst.components.debuff:Stop()
        end, target)

        if data.onattachedfn ~= nil then
            data.onattachedfn(inst, target)
        end
        if data.ontickfn ~= nil then
            inst.task = inst:DoPeriodicTask(data.frequency, data.ontickfn, nil, target)
        end
    end
    --存在该buff时欲添加相同buff则执行该函数
    local function OnExtended(inst, target)

        if data.onextendedfn ~= nil then
            data.onextendedfn(inst, target)
        end
    end
    --buff结束时执行
    local function OnDetached(inst, target)
        if data.ondetachedfn ~= nil then
            data.ondetachedfn(inst, target)
        end
        if inst.task ~= nil then
            inst.task:Cancel()
            inst.task = nil
        end
        inst:Remove()
    end

    local function fn()
        local inst = CreateEntity()

        if not TheWorld.ismastersim then
            --V2c:Not meant for client!
            inst:DoTaskInTime(0, inst.Remove)
            return inst
        end

        inst.entity:AddTransform()

        --[[Non-networked entity]]
        --inst.entity:SetCanSleep(false)
        inst.entity:Hide()
        inst.persists = false

        inst:AddTag("CLASSIFIED")

        inst:AddComponent("debuff")
        inst.components.debuff:SetAttachedFn(OnAttached)
        inst.components.debuff:SetDetachedFn(OnDetached)
        inst.components.debuff:SetExtendedFn(OnExtended)
        inst.components.debuff.keepondespawn = true

        inst:AddComponent("timer")
        inst.components.timer:StartTimer("buffover", data.duration) --开始一个名为buffover的计时
        inst:ListenForEvent("timerdone", OnTimerDone)

        return inst
    end

    return Prefab("yoshino_buff_"..name, fn, nil, nil)
end

local prefs = {}
for name, data in pairs(require("util/yoshino_bufflists")) do
    table.insert(prefs, MakeBuff(name, data))
end

return unpack(prefs)
