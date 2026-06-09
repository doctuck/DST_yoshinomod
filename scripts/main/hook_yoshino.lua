--|**************************************|
--|****大部分钩子(hook)都会放在这个文件中***|
--|**************************************|

--////////////////////////////////////////////////////////////////////////////////////////////////////////////
--badge相关
local ReiryokuBadge = require("widgets/reiryokubadge")
local badgex, badgey, badgez = TUNING.MOD_YOSHINO.badge.pos[1],TUNING.MOD_YOSHINO.badge.pos[2],TUNING.MOD_YOSHINO.badge.pos[3]  --读取设置好的全局变量来定位

local old_IsCharacterIngredient = GLOBAL.IsCharacterIngredient
GLOBAL.IsCharacterIngredient = function(ingredienttype)
    if ingredienttype == "decrease_reiryoku" then
        return true
    end
    return old_IsCharacterIngredient(ingredienttype)
end
--和状态显示UI放一层(生命、饥饿、理智)
AddClassPostConstruct("widgets/statusdisplays", function(self)
    if self.owner:HasTag("player") and self.owner:HasTag("yoshino") then --仅四糸乃可以拥有
        self.reiryoku = self:AddChild(self.owner.CreateReiryokuBadge ~= nil and self.owner.CreateReiryokuBadge(self.owner) or ReiryokuBadge(self.owner))
        self.reiryoku:SetPosition(badgex or -120, badgey or 40, badgez or 0)
        self.onreiryokudelta = nil
        self.inst:ListenForEvent("reiryoku_current_change", function(owner, data)
            if owner.replica.spiritual_energy ~= nil then
                local percent = owner.replica.spiritual_energy:GetPercent()
                --local max = owner.replica.spiritual_energy:Max()
                --print("当前百分比为："..tostring(percent).." 最大值："..tostring(max))
                --print("当前近期值为："..tostring(owner.replica.spiritual_energy:GetCurrent()))
                self.reiryoku:SetPercent(percent)
                if percent >= 0.75 and percent <= 1 then
                    self.reiryoku:SetStage(1)
                elseif percent >= 0.5 and percent < 0.75 then
                    self.reiryoku:SetStage(2)
                elseif percent >= 0.25 and percent < 0.5 then
                    self.reiryoku:SetStage(3)
                elseif percent >= 0 and percent < 0.25 then
                    self.reiryoku:SetStage(4)
                end
            --elseif owner.replica.spiritual_energy == nil then
            --    print("组件为空")
            --else
            --    print("未知原因")
            end
        end, self.owner)
        local oldshowstatusnumbers = self.ShowStatusNumbers
        function self:ShowStatusNumbers()
            if oldshowstatusnumbers ~= nil then
                oldshowstatusnumbers(self)
            end
            self.reiryoku.num:Show()
        end

        local oldhidestatusnumbers = self.HideStatusNumbers
        function self:HideStatusNumbers()
            if oldhidestatusnumbers ~= nil then
                oldhidestatusnumbers(self)
            end
            self.reiryoku.num:Hide()
        end

        function self:SetReiryokuPercent(pct)
            self.reiryoku:SetPercent(pct, self.owner.replica.spiritual_energy:Max())
        end

        function self:ReiryokuDelta(data)
            self:SetReiryokuPercent(data.percent)
            if self.reiryoku ~= nil and self.reiryoku.ReiryokuDelta then --一般不触发
                self.reiryoku:ReiryokuDelta(data.current)
            end
        end

        local function OnReiryokuSetGhostMode(inst, self)
            self.reiryoku:Hide()
            if self.onreiryokudelta ~= nil then
                self.inst:RemoveEventCallback("reiryoku_current_change", self.onreiryokudelta, self.owner)
            end
            self.onreiryokudelta = nil
        end
        local function OnReiryokuSetPlayerMode(inst, self)
            self.reiryoku:Show()
            if self.onreiryokudelta == nil then
                self.onreiryokudelta = function(owner, data) self:ReiryokuDelta(data) end
                self.inst:ListenForEvent("reiryoku_current_change", self.onreiryokudelta, self.owner)
            end
            self.reiryoku:SetPercent(self.owner.replica.spiritual_energy:GetPercent())
        end

        local oldghostmode = self.SetGhostMode
        function self:SetGhostMode(ghostmode)
            if oldghostmode ~= nil then
                oldghostmode(self, ghostmode)
            end
            self.reiryoku_modetask = self.inst:DoStaticTaskInTime(0,
                ghostmode and OnReiryokuSetGhostMode or OnReiryokuSetPlayerMode, self)
        end
    --else
    --    print("灵力能量条加载失败(playername=" .. tostring(self.owner:GetDisplayName()) .. ".)")
    end
end)
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////


--/***/*/*/*/*/*//*/*/*/*/*/*/*
local ShieldTime = require("widgets/timecool_tips")
--和控制UI放一层(菜单、物品栏等)
AddClassPostConstruct("widgets/controls", function(self)
    if self.owner:HasTag("yoshino") then
        self.ShieldTime = self:AddChild(ShieldTime(self.owner)) -- 相似的写法，当成子项给添加进widgets/controls里面去

        self.ShieldTime:SetHAnchor(1) -- 设置原点x坐标位置，0、1、2分别对应屏幕中、左、右
        self.ShieldTime:SetVAnchor(2) -- 设置原点y坐标位置，0、1、2分别对应屏幕中、上、下

        self.ShieldTime:SetPosition(60, 60) -- 设置widget的位置，上面通过 SetHAnchor，SetVAnchor两个函数设置了大致位置，这里的坐标原点就是以这两个函数设置的方向为基础计算的，左减右加，上加下减

        self.ShieldTime:Show()  --设为显示

        self.ontextdelta = nil
        self.inst:ListenForEvent("shield_time", function(owner, data)
            -- 获取剩余时间
            local time = owner.net_shield_time:value() or 0
            local minute = math.floor(time / 60)
            local second = math.floor(time - minute * 60)
            local str = ""
            if time == 0 then print("time = 0") end
            -- 更新文本信息
            if self.owner.replica.spiritual_energy and self.owner.replica.spiritual_energy:GetCurrent() < TUNING.YOSHINOCONFIG.shield_cost then
                str = STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_REIRYOKU.SHORTAGE
            end
            self.ShieldTime:OnUpdate(string.format("%02d:%02d\n%s", minute, second, str))
        end, self.owner)
        
    end
end)
--/***/*/*/*/*/*//*/*/*/*/*/*/*


--//////////////////////////////////////////////////////////////////////////////////////////////
--四糸乃初始化后
AddPrefabPostInit("yoshino", function(inst)
    if TheNet:GetIsClient() or TheNet:GetServerIsClientHosted() then --以下仅是从客户端向服务端发送消息的部分
        TheInput:AddKeyDownHandler(
            TUNING.YOSHINOCONFIG["call_zadkiel_key"],
            function()
                --发送RPC
                SendModRPCToServer(MOD_RPC["yoshinomod"]["call_zadkiel"])     --发送召唤冰洁傀儡的RPC
            end
        )
    end
    if not TheWorld.ismastersim then --此行往上，主客机共有环境；此条件内部，客机环境；此条件往下，服务器环境
        return inst
    end

    inst:AddComponent("spiritual_energy")                                                        --添加新的能量槽——灵力
    inst.components.spiritual_energy:SetMax(TUNING.MOD_YOSHINO.badge.spiritual_energy.max)       --设置灵力最大值
    inst.components.spiritual_energy.rate = TUNING.MOD_YOSHINO.badge.spiritual_energy.accumulate --设置基础恢复速度

    inst:AddComponent("yoshino_savemoddata")    --一个自定义组件，在其他地方有用到

    if not inst.components.timer then inst:AddComponent("timer") end
    --免疫伤害
    local OldGetAttacked = inst.components.combat.GetAttacked
    inst.components.combat.GetAttacked = function(self, attacker, damage, weapon, stimuli, spdamage, ...)
        if self.inst.components.health and self.inst.components.health:IsDead() then
            return true
        end
        for k, v in pairs(inst.components.inventory.equipslots) do
            if v.prefab == "armorskeleton" then --有骨甲时用原来的，避免浪费计时
                return OldGetAttacked(self, attacker, damage, weapon, stimuli, spdamage, ...)
            end
        end
        --护盾冷却计时已经结束, 且当前灵力足够 ，则免疫本次伤害
        if not inst.components.timer:TimerExists("yoshino_snowshield_cooldown") and
            inst.components.spiritual_energy:GetCurrent() >= TUNING.YOSHINOCONFIG.shield_cost then

            inst.snowshield = SpawnPrefab("yoshino_snowshield")
            inst.snowshield.entity:SetParent(inst.entity)
            inst.snowshield.components.timer:StartTimer("yoshino_snowshield", 1)    --护盾存在时间的计时
            inst.components.timer:StartTimer("yoshino_snowshield_cooldown", TUNING.YOSHINOCONFIG.shield_cooldown)
            damage = 0  --物理伤害归0
            spdamage = nil
            inst.components.spiritual_energy:DoDelta(-TUNING.YOSHINOCONFIG.shield_cost)
        --以下条件是为了免疫多段伤害，避免多个怪同时攻击时只免疫其中一个
        elseif inst.snowshield and inst.snowshield:IsValid() and inst.snowshield.components.timer:TimerExists("yoshino_snowshield") then
            damage = 0  --物理伤害归0
            spdamage = nil
        end

        return OldGetAttacked(self, attacker, damage, weapon, stimuli, spdamage, ...)
    end
    --监听护盾冷却时间结束，如果还存在则设为空
    inst:ListenForEvent("timerdone",function (player, data)
        if data and data.name == "yoshino_snowshield_cooldown" then
            if inst.snowshield then
                inst.snowshield:Remove()
                inst.snowshield = nil
            end
        end
    end)

    --解决骑乘冰结傀儡时的死亡处置
    --（备注：由于使用控制台自杀不走该路径，因此会出现动画不播放且人物无法移动的问题）
    local oldHealthDoDelta = inst.components.health.DoDelta
    inst.components.health.DoDelta = function (self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
        --骑乘冰结傀儡时
        if self.inst.components.rider and self.inst.components.rider:IsRiding() and self.inst.components.rider:GetMount() == self.inst.zadkiel then
            if self.currenthealth + amount <= 0 then
                self.inst.components.rider:Dismount()
                amount = -(self.currenthealth - 1)  --保留 1 点生命
                inst.components.talker:Say("四糸乃...撑不住了...")
                --为了防止有人反复骑乘反复触发保血机制，因此 2 秒后坐骑自动删除
                inst:DoTaskInTime(2,function ()
                    --持续类伤害使血量变动频率太高，导致频繁触发延时任务，但只有第一次触发时inst.zadkiel才有值，因此这里必须判空
                    if self.inst:IsValid() and self.inst.zadkiel ~= nil then
                        self.inst.zadkiel.sg:GoToState("despawn")
                        self.inst.zadkiel = nil
                    end
                end)
            else
                amount = math.floor(amount / 2 )    --骑乘冰结傀儡时受到物理伤害减半
            end
        end
        oldHealthDoDelta(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
    end
end)
--//////////////////////////////////////////////////////////////////////////////////////////////

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--能力值相关的配方(抄星璃mod的，太感谢了！)
local function AddNewCharacterIngredient(Builder)
    local old_HasCharacterIngredient = Builder.HasCharacterIngredient
    function Builder:HasCharacterIngredient(ingredient)
        if ingredient.type == CHARACTER_INGREDIENT.REIRYOKU then
            local amount_required = ingredient.amount
            local current = 0
            if self.inst.components.spiritual_energy ~= nil then
                current = math.ceil(self.inst.components.spiritual_energy.current)
            elseif self.inst.replica.spiritual_energy ~= nil then
                current = math.ceil(self.inst.replica.spiritual_energy:GetCurrent())
            end
            return current >= amount_required, current
        end
        return old_HasCharacterIngredient(self, ingredient)
    end

    local old_RemoveIngredients = Builder.RemoveIngredients
    if not old_RemoveIngredients then
        return
    end
    function Builder:RemoveIngredients(ingredients, recname, discounted)
        if self.freebuildmode then
            return
        end
        local recipe = AllRecipes[recname]
        if recipe then
            for k, v in pairs(recipe.character_ingredients) do
                if v.type == CHARACTER_INGREDIENT.REIRYOKU then
                    self.inst.components.spiritual_energy:DoDelta(-v.amount)
                end
            end
        end
        old_RemoveIngredients(self, ingredients, recname, discounted)
    end
end
AddComponentPostInit("builder", function(self)
    AddNewCharacterIngredient(self)
end)
AddClassPostConstruct("components/builder_replica", function(self)
    AddNewCharacterIngredient(self)
end)
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


--给极光及其特效、吸热营火、吸热火坑添加自定义标签
local entstag = { "staffcoldlight", "staffcoldlightfx", "coldfirepit", "coldfire" }
for _, v in pairs(entstag) do
    AddPrefabPostInit(v, function(inst)
        inst:AddTag("star_cold")
    end)
end

--没什么用的悬浮文字显示(紧接在物品名字和动作显示之后的下一行)
AddClassPostConstruct("widgets/hoverer", function(self)
    local old_SetString = self.text.SetString
    local thismessage = "\n当前已暂停腐烂"
    self.text.SetString = function(text, str)
        local target = TheInput:GetHUDEntityUnderMouse() --适用于实体在物品栏
        if target ~= nil then
            target = target.widget ~= nil and target.widget.parent ~= nil and target.widget.parent.item
        else
            target = TheInput:GetWorldEntityUnderMouse() --适用于实体在游戏内的地皮上
        end
        if target and target.entity ~= nil then
            if target:HasTag("inyoshinon") then
                str = str .. thismessage
            end
            if target:HasTag("recoverspiritual") then
                str = str .. "\n灵力: +100"
            end
        end
        return old_SetString(text, str)
    end
end)



--//////////////////////////////////////////////////////////////////////////
--四糸乃的料理相关
local foodbyyoshino = require("yoshino_foods")
for _, v in pairs(foodbyyoshino) do
    -- 将料理添加到烹饪锅
    AddCookerRecipe("cookpot", v)
    AddCookerRecipe("archive_cookpot", v)
    --将所有料理添加到便携锅
    AddCookerRecipe("portablecookpot", v)


    if v.card_def then
        -- 如果有食谱卡定义则生成对应的食谱卡，大厨料理食谱卡无法被解读
        AddRecipeCard("cookpot", v)
    end
    RegisterInventoryItemAtlas(v.atlasname, v.imagename .. ".tex")
    if v.cookbook_atlas then
        table.insert(Assets, Asset("ALTAS", v.cookbook_atlas))
        RegisterInventoryItemAtlas(v.cookbook_atlas, v.cookbook_tex)
    end
end

---添加调味
GenerateSpicedFoods(foodbyyoshino)
-- 生成的调味料理定义在官方的表中，但是由于模组加载晚于游戏因此需要自行添加到调味站配方
local spicedfoods = require("spicedfoods")
for _, v in pairs(spicedfoods) do
    if v.whethermod ~= true and v.whethermod == "yoshino_modfood" then
        -- 设定模组料理为非官方料理
        v.official = false
        -- 将调味料理配方添加到便携式调味站
        AddCookerRecipe("portablespicer", v)
    end
end
--//////////////////////////////////////////////////////////////////////////

--//////****************//////////////////////////*************/////////////
--在预设物初始化后
----蚁狮陷坑----------
local function ontimeoutbyyoshino(inst, data)
    if data ~= nil and data.name == "sinkhole_byyoshino" and inst.components.timer then
        inst.components.timer:StopTimer("sinkhole_byyoshino")
        inst:Remove()
        --TheNet:Say("空间震影响消失")
    end
end
AddPrefabPostInit("antlion_sinkhole", function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
    inst:ListenForEvent("spawnbyyoshino", function(inst, data)
        inst.components.timer:StartTimer("sinkhole_byyoshino", TUNING.TOTAL_DAY_TIME * 0.5)
        --TheNet:Say("空间震生成")
    end)
    inst:ListenForEvent("timerdone", ontimeoutbyyoshino)
end)
----------------------
----部分暗影阵营生物----------
local shadowtags = { "ruins_shadeling", "bishop_nightmare", "shadow_bishop", "rook_nightmare", "shadow_rook",
    "knight_nightmare", "shadow_knight", "shadowthrall_hands", "shadowthrall_wings", "shadowthrall_horns", "stalker",
    "stalker_forest", "stalker_atrium", "shadow_leech", "eyeofterror", "twinofterror1", "twinofterror2", "oceanhorror",
    "terrorbeak", "nightmarebeak", "crawlinghorror", "crawlingnightmare", "gelblob", "itemmimic_revealed", "merm_shadow",
    "mermguard_shadow", "chest_mimic_revealed", "daywalker", "shadowthrall_centipede_controller", "ruinsnightmare",
    "fused_shadeling", "shadowthrall_mouth", "minotaur" }
for _, v in pairs(shadowtags) do
    AddPrefabPostInit(v, function(inst)
        if not TheWorld.ismastersim then return end    --主客机判断
        if not inst.components.lootdropper then inst:AddComponent("lootdropper") end --确保有掉落器组件
        local old_loot = inst.components.lootdropper.lootsetupfn
        inst.components.lootdropper.lootsetupfn = function(self)
            if old_loot then
                old_loot(self)
            end
            --考虑到游戏崩溃重载时，可能存在已经添加在其中的情况，因此需要去除重复
            if self.chanceloot then
                for i = #self.chanceloot, 1, -1 do
                    if self.chanceloot[i].prefab == "yoshino_anticrystal" then
                        table.remove(self.chanceloot, i)
                    end
                end
            end
            self:AddChanceLoot("yoshino_anticrystal", TUNING.MOD_YOSHINO.ANTICRYSTAL_DROP)       --15% 概率掉落反灵结晶
        end
    end)
end
-----------------------------
--
---------------------------
--//////****************//////////////////////////*************/////////////

--/////骑乘相关//////////////////////////
-- 禁用跳船（下面这样写不用考虑主客机同步和玩家开关延迟补偿, 让组件自己考虑去）
AddComponentPostInit("locomotor", function(self)
    local OldScanForPlatform = self.ScanForPlatform
    function self:ScanForPlatform(...)
        local can_hop, hop_x, hop_z, target_platform, blocked = OldScanForPlatform(self, ...)

        local rider = self.inst.replica and self.inst.replica.rider
        local mount = rider and rider:GetMount()
        if mount and mount:HasTag("yoshino_zadkiel") then
            can_hop = false
            blocked = true
        end
        return can_hop, hop_x, hop_z, target_platform, blocked
    end
end)


-- 修改目标state（两边同时修改的才放这里，单独的放在对应SG底部）
local function SGwilson(sg)
    local locomote_fn = sg.events.locomote.fn
    sg.events.locomote.fn = function(inst, data)
        local rider = inst.replica.rider
        local mount = rider and rider:GetMount()
        if not mount or not mount:HasTag("yoshino_zadkiel") then
            return locomote_fn(inst, data)
        end

        local old_GoToState = inst.sg.GoToState
        inst.sg.GoToState = function(self, state, ...)
            if state == "run_start" then
                state = "mount_zadkiel_run_start"
            elseif state == "run_stop" then
                state = "mount_zadkiel_run_stop"
            end
            return old_GoToState(self, state, ...)
        end

        locomote_fn(inst, data)
        inst.sg.GoToState = old_GoToState
    end

end
AddComponentPostInit("rider", function(self)
    local old_mount = self.Mount
    function self:Mount(target, instant)
        --坐骑为冰结傀儡时使用以下内容
        if target:HasTag("yoshino_zadkiel") then
            --if not self.inst:HasTag("yoshino") then
            --    return nil
            --end
            old_mount(self,target,instant)
            self.inst.Transform:SetEightFaced()
            self.inst.components.combat.redirectdamagefn = nil

            --骑乘时免疫落水
            if self.inst.components.drownable then
                self.inst.components.drownable.enabled = false
            end
            --修改物理碰撞组
            self.inst.Physics:SetCollisionMask(
                COLLISION.GROUND,
	        	--COLLISION.WORLD,
	        	COLLISION.OBSTACLES,
	        	COLLISION.SMALLOBSTACLES,
	        	COLLISION.CHARACTERS,
	        	COLLISION.GIANTS
	        )
            --修改战斗攻击范围和击中范围(使用冰结傀儡的范围)
            self.inst.components.combat:SetRange(TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.ATK_RANGE, TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.HIT_RANGE)
            return true
        end
        return old_mount(self,target,instant)
    end

    local old_actualdismount = self.ActualDismount
    function self:ActualDismount()
        if not self.riding then
            return
        end
        if self.mount:HasTag("yoshino_zadkiel") then
            --恢复可落水
            if self.inst.components.drownable then
                self.inst.components.drownable.enabled = true
            end
            --恢复原物理碰撞组
            self.inst.Physics:SetCollisionMask(
	        	COLLISION.WORLD,
	        	COLLISION.OBSTACLES,
	        	COLLISION.SMALLOBSTACLES,
	        	COLLISION.CHARACTERS,
	        	COLLISION.GIANTS
	        )
            --恢复原攻击范围和击中范围
            self.inst.components.combat:SetRange(TUNING.DEFAULT_ATTACK_RANGE)
        end
        return old_actualdismount(self)
    end
end)
AddStategraphPostInit("wilson", SGwilson)
AddStategraphPostInit("wilson_client", SGwilson)

--hook骑行动作
local MOUNT_fn = ACTIONS.MOUNT.fn
ACTIONS.MOUNT.fn = function(act)
    local rider = act.doer
    local mount = act.target
    if mount and mount:HasTag("yoshino_zadkiel") then
        if rider:HasTag("yoshino") and not mount.components.rideable:IsBeingRidden() and
            (mount.components.follower:GetLeader() == rider) and
            (rider.components.spiritual_energy and rider.components.spiritual_energy:GetCurrent() >= (TUNING.YOSHINOCONFIG.zadkiel_ride_cost + 0.3))
            then  --如果是四糸乃且为召唤之人,当灵力需求足够时，可直接满足动作条件
            rider.components.rider:Mount(mount)
            return true
        elseif rider.components.spiritual_energy and rider.components.spiritual_energy:GetCurrent() < (TUNING.YOSHINOCONFIG.zadkiel_ride_cost) then
            return false, "SHORTAGE"
        elseif mount.components.rideable:IsBeingRidden() then
            return false, "INUSE"
        else
            return false, "NOTYOSHINO"
        end
    end
    return MOUNT_fn(act)
end
--禁止在虚空或水中离开冰结傀儡
local DrownCheckClientUnSafe = function(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    if inst:GetCurrentPlatform() then
        return false
    else
        local platform = TheWorld.Map:GetPlatformAtPoint(x, z)
        if platform then
            return false
    	end
    end

    if TheWorld.Map:IsOceanTileAtPoint(x, y, z) or TheWorld.Map:IsInvalidTileAtPoint(x, y, z) then
        return true
    end
end
local DISMOUNT_fn = ACTIONS.DISMOUNT.fn
ACTIONS.DISMOUNT.fn = function(act)
    local rider = act.doer.components.rider
    local mount = rider and rider:GetMount()
    if mount and mount:HasTag("yoshino_zadkiel") and DrownCheckClientUnSafe(act.doer) then
        return false, "OVERWATER"
    end
    return DISMOUNT_fn(act)
end

AddPlayerPostInit(function(inst)    --这块抄骑行龙蝇的，做了一些修改，十分感谢
    if not inst:HasTag("yoshino") then return end
    -- 加载时检查位置自动骑乘（记得免疫落水、虚空跌落 才能生效）
    local function HookTeleport(inst, fn)
        local new_fn = function(...)
            local my_x, my_y, my_z = inst.Transform:GetWorldPosition()
            if not TheWorld.Map:IsPassableAtPoint(my_x, my_y, my_z) then
                local follow_mount = inst.components.leader and inst.components.leader:GetFollowersByTag("yoshino_zadkiel")

                if follow_mount and next(follow_mount) and inst.components.rider then
                    for _,k in pairs(follow_mount) do
                        inst.components.rider:Mount(k,true)
                        return
                    end
                end
            end
            return fn(...)
        end
        return new_fn
    end

    local _OnLoad = inst.OnLoad or function() end
    inst.OnLoad = function(inst, data, ...)
        local _DoTaskInTime = inst.DoTaskInTime
        inst.DoTaskInTime = function(inst, time, fn, ...)
            local info = debug.getinfo(fn, "S")
            local source = info and info.source or ""
            if string.find(source, "player_common.lua", 1, true) then
                fn = HookTeleport(inst, fn)
            end
            return _DoTaskInTime(inst, time, fn, ...)
        end

        _OnLoad(inst, data, ...)

        inst.DoTaskInTime = _DoTaskInTime
    end
end)

--/////以上/骑乘相关/////////////////////
