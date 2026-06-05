local asset = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"), --固定语句
    Asset("ANIM", "anim/yoshino.zip"),                    --人物动画
    Asset("SOUND", "sound/wendy.fsb"),                    --使用温蒂的音效
}

local MakePlayerCharacter = require "prefabs/player_common" --固定语句

local prefabs = { "yoshino_crystal", "yoshino_snowshield", "yoshino_atkspike" } --加载引用其他预设物
local start_inv = { "yoshinon" }    --加载初始物品

--部分冷食
local coldfoods = { "winter_food9", "icecream", "frozenbananadaiquiri", "hermitcrabtea_succulent_picked", "fruitmedley", "carnivalfood_corntea", "gazpacho", "watermelonicle", "ceviche", "bananapop" }

--这个函数将在服务器和客户端都会执行
local function common_postinit(inst)
    inst.MiniMapEntity:SetIcon("map_yoshino.tex") --小地图显示
    inst:AddTag("yoshino")                        --增加人物标签
    inst.net_shield_time = net_int(inst.GUID, "yoshino.shield_time", "shield_time")  --给护盾同步时间的网络变量
end

--做一个周期任务
local k1 = 0
local function Docheck(inst)
    if inst.components.health and inst.components.health:IsDead() then return end
    --检查背包或身上有没有四糸奈
    if not inst.components.inventory:HasItemWithTag("yoshinon", 1) and not inst.components.inventory:EquipHasTag("yoshinon") then
        if inst.components.sanity.current > 0 then
            inst.components.sanity:DoDelta(-100 / 60) --每分钟掉100点理智
        end
        --四糸奈不在身上且理智首次归0时触发语音
        if k1 == 0 or (inst.components.sanity.current == 0 and k1 == 1) then
            inst.components.talker:Say(STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_NO_YOSHINON_RAGDOLL)
            k1 = k1 + 1
        end
        --未装备四糸奈时， 若理智<=10% 同时 灵力>= 95% 则触发灵力紊乱
    elseif not inst.components.inventory:EquipHasTag("yoshinon") then
        if (inst.components.sanity and inst.components.sanity:GetPercent() <= 0.1) and (inst.components.spiritual_energy and inst.components.spiritual_energy:GetPercent() >= 0.95) then
            inst:PushEvent("reiryokuchaos", { hasbuff = true })
        else
            inst:PushEvent("reiryokuchaos", { hasbuff = false })
        end
    else
        inst:PushEvent("reiryokuchaos", { hasbuff = false })
        k1 = 0
    end

    --检查血量未满时每分钟扣除 2 理智
    if inst.components.health:GetPercent() < 1 then
        inst.components.sanity:DoDelta(-2 / 60)
    end
    --检查周围一个地皮内是否有其他玩家
    local posx, posy, posz = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(posx, posy or 0, posz, 4, nil, nil, { "player" })
    if #ents > 1 then   --除自己以外还有别的玩家才会触发
        inst.components.sanity:DoDelta(-2 / 60)
    end
    --理智为 0 时, 1 个地皮内的玩家每分钟降低 20 点温度（含自己）
    if inst.components.sanity:GetPercent() == 0 and ents ~= nil then
        for _, v in pairs(ents) do
            if v.components.temperature ~= nil then
                v.components.temperature:DoDelta(-20 / 60)
            end
        end
    end

    local temptime = inst.components.timer and inst.components.timer:GetTimeLeft("yoshino_snowshield_cooldown") or 0 --获取护盾剩余冷却时间
    inst.net_shield_time:set(temptime)--每秒更新一次
    
end

--复活时事件
local function OnBecamehuman(inst, data)
    -- 设置人物的额外移速（1表示1倍于wilson或1倍于基础速度）
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "yoshino_speed", 1.3)
    --如果从灵结晶复活，则完全恢复
    if data ~= nil and data.data == "bycrystal" then
        inst.components.health:SetPercent(1)
        inst.components.hunger:SetPercent(1)
        inst.components.spiritual_energy:DoDelta(TUNING.YOSHINOCONFIG.max_spiritual_energy)
        inst:DoTaskInTime(3, function() inst.components.sanity:DoDelta(TUNING.YOSHINO_SANITY) end)
    end
    if inst.checktask ~= nil then
        inst.checktask:Cancel()
        inst.checktask = nil
    end
    --复活时护盾冷却恢复计时
    --if inst.components.timer and inst.components.timer:TimerExists("yoshino_snowshield") then
    --    inst.components.timer:ResumeTimer("yoshino_snowshield")
    --end
    inst.checktask = inst:DoPeriodicTask(1,Docheck)

end
--死亡时的事件
local function OnBecameghost(inst)
    -- 变成鬼魂的时候移除速度修正
    --inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "yoshino_speed_mod")
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "yoshino_speed", 1.1)
    inst.components.talker:Say(STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_BECOMEGHOST)
    
    if inst.deathdropprefab ~= nil then --生成提前预设好的掉落物
        local skel = SpawnPrefab(inst.deathdropprefab)
        local x, y, z = inst.Transform:GetWorldPosition()
        skel.Transform:SetPosition(x, y, z)
    end
    if inst.checktask ~= nil then
        inst.checktask:Cancel()
        inst.checktask = nil
    end
    --死亡时护盾冷却暂停计时
    --if inst.components.timer and not inst.components.timer:IsPaused("yoshino_snowshield") then
    --    inst.components.timer:PauseTimer("yoshino_snowshield")
    --end

end
--消失时的事件
local function ondespawn(inst,data)
    if inst.zadkiel ~= nil and inst.zadkiel:IsValid() then
        if not inst.zadkiel.sg:HasStateTag("busy") then
		    inst.zadkiel.sg:GoToState("despawn")
	    end
        inst.zadkiel:PushEvent("player_despawn")
    end
    if inst.checktask ~= nil then
        inst.checktask:Cancel()
        inst.checktask = nil
    end
end


--每次人物重载或者生成时
local function onload(inst, data)
    local savedata_this = inst.components.yoshino_savemoddata
    --四糸乃首次进入游戏固定下雨
    if not TheWorld.state.israining then
        --从组件中读取数据判断是不是首次（挂载在哪个外部变量上不重要，重要的是可控）
        if savedata_this and savedata_this.array_data.nofirst ~= true then
            TheWorld:PushEvent("ms_forceprecipitation", true)
            --首次生成时触发空间震(延迟1秒，让人物位置能顺利读取)
            inst:DoTaskInTime(1, function()
                if TUNING.YOSHINOCONFIG.space_shake == 1 then
                    local x, y, z = inst.Transform:GetWorldPosition()
                    local sinkhole = SpawnPrefab("antlion_sinkhole") --生成蚁狮地陷坑洞
                    sinkhole.Transform:SetPosition(x, 0, z)
                    sinkhole:PushEvent("spawnbyyoshino")
                end
            end)
            --防止下雨时间过长
            inst:DoTaskInTime(60, function()
                if TheWorld.state.israining then
                    TheWorld:PushEvent("ms_forceprecipitation", false)
                end
            end)
            savedata_this.array_data.nofirst = true
        end
    end 
    if data and data.zadkiel then
        local zadkiel = SpawnSaveRecord(data.zadkiel)
        inst.zadkiel = zadkiel
        if zadkiel ~= nil then
            if inst.migrationpets ~= nil then
                table.insert(inst.migrationpets, zadkiel)
            end
            if zadkiel.components.follower ~= nil then
                --这里不用担心重复，SetLeader函数内部会自己判断是否相同
                zadkiel.components.follower:SetLeader(inst)
            end
        end
    end

    -- 复活时
    inst:ListenForEvent("ms_respawnedfromghost", OnBecamehuman)
    inst:ListenForEvent("respwanbycrystal", OnBecamehuman)
    -- 死亡时
    inst:ListenForEvent("ms_becameghost", OnBecameghost)
end

--灵力紊乱时触发该函数
local rainbyyoshino = 0
local function chaosdebuff(inst, data)
    --进入灵力紊乱状态
    if data and data.hasbuff == true then
        if not (TheWorld.state.israining or TheWorld.state.issnowing) and rainbyyoshino ~= 1 then
            TheWorld:PushEvent("ms_forceprecipitation", true)
        end
        rainbyyoshino = 1
        inst.components.combat.damagemultiplier = 0
        --退出灵力紊乱状态
    elseif data and data.hasbuff == false then
        if (TheWorld.state.israining or TheWorld.state.issnowing) and rainbyyoshino == 1 then
            TheWorld:PushEvent("ms_forceprecipitation", false)
        end
        rainbyyoshino = 0
        inst.components.combat.damagemultiplier = 0.8
    end
end

--吃东西的回调
local function oneatfood(inst, data)
    --吃冷食时获得3.2灵力
    if data and data.food then
        local iscold = table.contains(coldfoods, data.food.prefab) or nil
        if iscold and inst.components.spiritual_energy then
            inst.components.spiritual_energy:DoDelta(3.2)
            --冰淇淋则 +4 灵力
            if data.food.prefab == "icecream" then inst.components.spiritual_energy:DoDelta(0.8) end
        end
    end
end

--设置冷冻的重定向函数
local function onfreeze(inst, coldness, freezetime, nofreeze)
    --固定返回true，直接免疫冻结
    return true
end

--攻击时击中事件
local function onattack(inst,data)
    local mount = inst.components.rider:GetMount() or nil
    local attacker = inst
    local target = data and data.target or nil

    if target == nil then return end
    local tx, ty, tz = target.Transform:GetWorldPosition()

    --AOE范围攻击
    local exclude_tags = { "INLIMBO", "companion", "wall", "abigail", "shadowminion", "player", "yoshino_zadkiel" }  --需要排除的标签
    local ents = TheSim:FindEntities(tx, ty, tz, 4, { "_combat" }, exclude_tags)    --查找范围内的实体

    if mount ~= nil and mount.prefab == "yoshino_zadkiel" then
        -- 遍历找到的实体
        for i, ent in ipairs(ents) do
            -- 对找到的实体再次的过滤
            if ent ~= target and ent ~= attacker and attacker.components.combat:IsValidTarget(ent) and  --不是主目标，不是自己，目标可被攻击
                (attacker.components.leader ~= nil and not attacker.components.leader:IsFollower(ent)) then --不是自己的随从
                -- 推送事件给服务器来计算其它实体的血量以及通知其它玩家，当前多少实体正在被攻击
                attacker:PushEvent("onareaattackother", { target = ent, weapon = nil, stimuli = nil })
                -- 给予实体伤害，这里的伤害值传多少就是多少，如果玩家当前身上有一些攻击的buff，这里也要获取一下传进去
                ent.components.combat:GetAttacked(attacker, TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.DAMAGE_DEAFULT, nil, nil, {planar = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.PLANAR_DEAFULT } )
            end
        end
        --结束后给主目标补上位面伤害
        target.components.combat:GetAttacked(attacker, 0, nil, nil, {planar = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.PLANAR_DEAFULT } )
    end
end

--监听击中其他目标事件
local function onhittarget(inst, data)
    --data 包含 { target = self.inst, damage = damage, damageresolved = damageresolved, stimuli = stimuli, spdamage = spdamage, weapon = weapon, redirected = damageredirecttarget }
    local mount = inst.components.rider:GetMount() or nil
    if data and data.target and data.target.components.combat then
        local target = data.target
        local tx,ty,tz = target.Transform:GetWorldPosition()  --主目标位置
        if mount ~= nil and mount.prefab == "yoshino_zadkiel" then
            --目标脚下生成冰刺
            local icespike = SpawnPrefab("yoshino_atkspike")
            icespike.Transform:SetPosition(tx,0,tz)
            icespike.owner = inst
            icespike:PushEvent("spawnbyyoshino", {target = target, attacker = inst})
        end
    end
end

--监听灵力变化事件
local function onspiritual_dalta(inst, data)
    if not data then return end
    if not (inst.components.inventory and inst.components.combat) then return end

    if data.per >= 0.1 and inst.components.inventory:EquipHasTag("yoshino_sirvon") then
        --灵力>10% 且装备着冰铠时，伤害倍率翻倍（但是会受灵力紊乱debuff影响）
        inst.components.combat.externaldamagemultipliers:SetModifier("yoshino_sirvon", 2, "sirvon_equiped")
    elseif data.per < 0.1 or not inst.components.inventory:EquipHasTag("yoshino_sirvon") then
        inst.components.combat.externaldamagemultipliers:RemoveModifier("yoshino_sirvon", "sirvon_equiped")
    end
    if data.per >= 0.1 and inst.components.inventory:EquipHasTag("yoshino_elyonban") then
        --灵力>10% 且装备着神威灵装·四番时，伤害倍率增加（但是会受灵力紊乱debuff影响）
        inst.components.combat.externaldamagemultipliers:SetModifier("yoshino_elyonban", 1.5, "EL_equiped")
    elseif data.per < 0.1 or not inst.components.inventory:EquipHasTag("yoshino_elyonban") then
        inst.components.combat.externaldamagemultipliers:RemoveModifier("yoshino_elyonban", "EL_equiped")
    end
end

--潮湿度变化事件
local function onwetdelta(inst, data)
    if data == nil then return end
    if not inst.components.sanity then return end

    if data.new < 60 then
        if inst.moisturetask ~= nil then
            inst.moisturetask:Cancel()
            inst.moisturetask = nil
        end
        return
    end

    if inst.moisturetask == nil then    --每分钟恢复3.2
        inst.moisturetask = inst:DoPeriodicTask(1,function ()
            inst.components.sanity:DoDelta(3.2 / 60)
        end)
    end
end

-- 这里的的函数只在主机执行  一般组件之类的都写在这里。(单人时主机也是服务端，多人时以下代码和同世界内的其他玩家无关)
local function master_postinit(inst)
    inst.soundsname = "wendy" --人物音效，使用温蒂的
    inst:AddTag("yoshino")    --增加人物标签

    -- 三维
    inst.components.health:SetMaxHealth(TUNING.YOSHINO_HEALTH)                       --生命
    inst.components.hunger:SetMax(TUNING.YOSHINO_HUNGER)                             --饥饿
    inst.components.sanity:SetMax(TUNING.YOSHINO_SANITY)                             --理智
    --其他杂项
    inst.components.combat.damagemultiplier = TUNING.MOD_YOSHINO.yoshino.DAMAGE_DEAFULT_Ratio  --伤害系数，0.8倍 (即无加成时8点伤害,有加成时加成乘0.8)
    --inst.components.combat:SetRange(10, 10)                                          --设置攻击范围和命中范围
    inst.components.health.absorb = 0                                                --防御系数,absorb = 1时抵抗百分之百的伤害，即免疫，为负数则表示所受伤害增加。
    inst.components.hunger.hungerrate = 0.9 * TUNING.WILSON_HUNGER_RATE              --饥饿速度，每天(0.9*75)
    inst.components.foodaffinity:AddPrefabAffinity("icecream", TUNING.AFFINITY_15_CALORIES_HUGE)        --最喜欢的食物是冰淇淋
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "yoshino_speed", 1.3) --设置额外移速，基础移速的1.3倍（备注：人物基础跑步速度是6，所以此处为6*1.3=7.8）
    --inst.components.temperature.mintemp = -10                                         --设置最低温度为-10
    inst.components.temperature.overheattemp = 60                                    --炎热抗性，默认是70
    inst.skeleton_prefab = nil                                                       --死亡不掉落骨架
    inst.deathdropprefab = "yoshino_crystal"                                         --死亡掉落灵结晶
    --inst.components.builder.science_bonus = 1                                        --自带科技一本
    --inst.components.builder.magic_bonus = 2                                          --自带魔法一本
    inst.components.freezable:SetRedirectFn(onfreeze)            --重定向冻结函数，以此免疫冻结
    inst.components.temperature:SetFreezingHurtRate(0)           --免疫过冷伤害

    inst.checktask = inst:DoPeriodicTask(1,Docheck)

    --免疫猴子诅咒
    if inst.components.cursable then
        inst.components.cursable.IsCursable = function(...)
            return false
        end
        inst.components.cursable.ApplyCurse = function(...)
        end
    end

    inst:ListenForEvent("moisturedelta", onwetdelta)                 --监听潮湿值变化事件，当值大于60时理智恢复 <--这玩意居然按帧频率发送！
    inst:ListenForEvent("onattackother", onattack)                   --监听击中事件（执行攻击时发送）
    inst:ListenForEvent("onhitother", onhittarget)                   --监听击中事件（目标被击中向攻击者发送）
    inst:ListenForEvent("yoshino_reiryoku_delta", onspiritual_dalta) --监听灵力值变化事件
    inst:ListenForEvent("reiryokuchaos", chaosdebuff)                --执行灵力紊乱
    inst:ListenForEvent("oneat", oneatfood)                          --监听吃东西事件
    inst:ListenForEvent("remove_zadkiel", function ()                --移除冰结傀儡时会监听到该事件
        if inst.zakiel then inst.zadkiel = nil end
    end)

    inst.OnDespawn = ondespawn
    -- 跨世界迁移：保存随从数据
    local OldSave = inst.OnSave or function(inst,data) end
    inst.OnSave = function(inst, data)
        if inst.zadkiel ~= nil and inst.zadkiel:IsValid() then
            data.zadkiel = inst.zadkiel:GetSaveRecord()
        end
        return OldSave(inst, data)
    end
    inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

require("skins_data/yoshino_skins") --皮肤配置

return MakePlayerCharacter("yoshino", prefabs, asset, common_postinit, master_postinit, start_inv)