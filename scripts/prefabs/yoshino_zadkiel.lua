--资源加载
local assets = {
    Asset("ANIM", "anim/yoshino_zadkiel.zip"), --动画
    Asset("ANIM", "anim/wilsonzadkiel.zip"),
    --Asset("IMAGE", "images/map_icons/map_zadkiel.tex"), --小地图图标
    --Asset("ATLAS", "images/map_icons/map_zadkiel.xml"),
}
--添加预制物的预制物
local prefabs = {}

local attack_range = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.ATK_RANGE
local hit_range = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.HIT_RANGE
local damage = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.DAMAGE_DEAFULT

local brain = require("brains/zadkiel_brain")

-- 清除覆盖的build
local function ClearBuildOverrides(inst, animstate)
    local basebuild = inst.AnimState:GetBuild()
    if animstate ~= inst.AnimState then
        animstate:ClearOverrideBuild(basebuild)
    end
end
local function ApplyBuildOverrides(inst, animstate)
    local basebuild = inst.AnimState:GetBuild()
    --[[
    该方法在rider组件的Mount方法中被调用，且在SetBank("wilsonbeefalo")之后，
    此时传入的是人物的AnimState, 即animstate ~= inst.AnimState,
    ]] --
    if animstate ~= nil and animstate ~= inst.AnimState then
        animstate:SetBank("wilsonzadkiel")
        animstate:AddOverrideBuild(basebuild)
    else
        animstate:SetBuild(basebuild)
    end
end

local RETARGET_MUST_TAGS = { "_combat","_health" }    --必须要有这里面的标签才能攻击
local RETARGET_CANT_TAGS = { "companion", "wall", "INLIMBO", "yoshino" } --包含此类标签的不能攻击（同伴、墙、……、四糸乃）
local function CommonRetarget(inst, v)
    return v ~= inst and not v:HasTag("player") and v.entity:IsVisible() --不是自己、不是玩家、实体有效
            and inst.components.combat:CanTarget(v) --是可攻击目标
            and v.components.minigame_participator == nil   --对方未在参与小游戏
end
local function Retarget(inst)
    local leader = inst.components.follower:GetLeader()
    local ix, iy, iz = inst.Transform:GetWorldPosition()
    
    local entities = TheSim:FindEntities(ix,iy,iz,
                            TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.SEARCH_RANGE,
                            RETARGET_MUST_TAGS,RETARGET_CANT_TAGS,nil)

    for _, entity_near_me in ipairs(entities) do
        if CommonRetarget(inst, entity_near_me) then
            local combat = entity_near_me.components.combat
            if combat and ((leader and combat.target == leader) or combat.target == inst) then
                return entity_near_me
            end
        end
    end

end

local function KeepTarget(inst, target)
    return inst.components.combat:CanTarget(target)
end
local function OnNewLeader(inst, data)
    if data ~= nil and data.target ~= nil and inst.components.follower ~= nil and data.target == inst.components.follower.leader then
        inst.components.follower:SetLeader(nil)
    end
end
local function OnAttacked(inst, data)
    if inst._ridersleeptask ~= nil then
        inst._ridersleeptask:Cancel()
        inst._ridersleeptask = nil
    end
    inst._ridersleep = nil
    if inst.components.rideable:IsBeingRidden() then
        --没有训势组件，不需要这些功能
        --if not inst.components.domesticatable:IsDomesticated() or not inst.tendency == TENDENCY.ORNERY then
        --    inst.components.domesticatable:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_ATTACKED_DOMESTICATION)
        --    inst.components.domesticatable:DeltaObedience(TUNING.BEEFALO_DOMESTICATION_ATTACKED_OBEDIENCE)
        --end
        --inst.components.domesticatable:DeltaTendency(TENDENCY.ORNERY, TUNING.BEEFALO_ORNERY_ATTACKED)
    else
        --if data.attacker ~= nil and data.attacker:HasTag("player") then
        --    inst.components.domesticatable:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_ATTACKED_BY_PLAYER_DOMESTICATION, data.attacker)
        --    inst.components.domesticatable:DeltaObedience(TUNING.BEEFALO_DOMESTICATION_ATTACKED_BY_PLAYER_OBEDIENCE)
        --end
        inst.components.combat:SetTarget(data.attacker)
        --inst.components.combat:ShareTarget(data.attacker, 30, CanShareTarget, 5)  --不是群居生物，不用共享攻击目标
    end

    --没有拴绳组件，冰结傀儡不会被拴住
    --if inst.components.hitchable and not inst.components.hitchable.canbehitched then
    --    inst.components.hitchable:Unhitch()
    --end
end

local function ClearOwner(inst)
    if inst._marked_for_despawn then
        -- We're marked for despawning, so don't disconnect anything,
        -- in case we get saved for real i.e. when despawning in caves.
        return
    end

    inst.components.follower:SetLeader(nil)
    inst.components.rideable:SetShouldSave(true)
end
--落水安全检查
local function DrownCheckClientUnSafe(inst)
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

-- 上坐骑回调
local function OnRidden(inst, rider)
    local cost_reiryoku = TUNING.YOSHINOCONFIG.zadkiel_ride_cost / 60
    --骑乘时每分钟减少一定灵力, 不足时自动下来
    if rider.components.spiritual_energy then
        if rider.mountzadkieltask ~= nil then
            rider.mountzadkieltask:Cancel()
            rider.mountzadkieltask = nil
        end
        rider.mountzadkieltask = rider:DoPeriodicTask(1,function()
            rider.components.spiritual_energy:DoDelta(-cost_reiryoku)
            if rider.components.spiritual_energy:GetCurrent() < TUNING.YOSHINOCONFIG.zadkiel_ride_cost then
                --仅在安全可到达的地方才会下来（允许灵力不足时一直在海上或虚空中卡 bug 远程攻击怪物）
                if not DrownCheckClientUnSafe(rider) then
                    rider.components.rider:Dismount()
                    rider.components.talker:Say(STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_REIRYOKU.SHORTAGE)
                end
            end
        end)
    end
end
-- 下坐骑回调
local function OnDismount(inst, rider)
    if rider.mountzadkieltask ~= nil then
        rider.mountzadkieltask:Cancel()
        rider.mountzadkieltask = nil
    end
    -- 取消跳船：防止因为某些异常原因卡在跳船状态，导致没法寻路而“发呆”
    -- ps: 修改了碰撞组后理论不会发生跳船，但你永远都不知道其他人为什么会触发奇奇怪怪的问题
    if inst.components.locomotor.hopping then
        inst.components.embarker:Cancel()
    end
end
local function OnRiderChanged(inst, data)
    if inst._ridersleeptask ~= nil then
        inst._ridersleeptask:Cancel()
        inst._ridersleeptask = nil
    end

    if data.oldrider then
        OnDismount(inst, data.oldrider)
    end

    if data.newrider ~= nil then
        if inst.components.sleeper ~= nil then
            inst.components.sleeper:WakeUp()
        end
        OnRidden(inst, data.newrider)
        inst.components.knownlocations:RememberLocation("loiteranchor", inst:GetPosition()) -- 记录当前位置作为闲逛的锚点
        if inst.sg ~= nil then
            inst.sg:GoToState("mounted_idle")
        end
    --elseif inst.components.health:IsDead() then
    --    if inst.sg.currentstate.name ~= "death" then
    --        inst.sg:GoToState("death")
    --    end
    --elseif inst.components.sleeper ~= nil then
    --    inst.components.sleeper:StartTesting()
    --    if inst._ridersleep ~= nil then
    --        local sleeptime = inst._ridersleep.sleeptime + inst._ridersleep.time - GetTime()
    --        if sleeptime > 2 then
    --            inst._ridersleeptask = inst:DoTaskInTime(0, DoRiderSleep, inst._ridersleep.sleepiness, sleeptime)
    --        end
    --        inst._ridersleep = nil
    --    end
    end
end

--物品的具体作用，详细信息
local function fn()
    local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

    --/////////////////////////////////////////////////////////////////////////////////////////
    --//Entity组件是在主客机端都会运行的，这部分组件必须写在网络代码片段的上面，包含以下内容：
    --//Transform：变换组件，控制Prefab的位置、方向、缩放等等。
    --//AnimState：动画组件，控制Prefab的材质(Build)，动画集合(Bank)和动画播放(Animation)。
    --//Phiysics：物理组件，控制Prefab的物理行为，比如速度，碰撞类型等等。
    --//Light：光照组件，添加该组件可使得Prefab成为一个光源。
    --//Network：网络组件，添加与否决定了一个Prefab在主机上生成时，是否会被客户端“看”到。
    --//MapEntity：地图实体组件，使用该组件可以为Prefab在小地图上创建一个图标。
    --//SoundEmitter：声音组件，控制Prefab的声音集合和播放。
    --//添加一个Entity组件的代码是inst.entity:AddXXX()
    --/////////////////////////////////////////////////////////////////////////////////////////

    inst.entity:AddTransform()     --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()     --添加动画状态
    --inst.entity:AddSoundEmitter()  --添加声音组件
    inst.entity:AddDynamicShadow() --动态阴影
    inst.entity:AddMiniMapEntity() --添加小地图图标
    inst.entity:AddNetwork()       --加入服务器



    MakeCharacterPhysics(inst, 100, .5) --使用角色物理，质量100，碰撞半径0.5
    inst.Physics:SetCollisionMask(
        COLLISION.GROUND,
	    --COLLISION.WORLD,
	    COLLISION.OBSTACLES,
	    COLLISION.SMALLOBSTACLES,
	    COLLISION.CHARACTERS,
	    COLLISION.GIANTS
    )

    inst.DynamicShadow:SetSize(6, 2)
    inst.Transform:SetEightFaced()
    --inst.Transform:SetScale(1.5, 1.5, 1.5) --缩放
    inst.AnimState:SetBank("zadkiel")
    inst.AnimState:SetBuild("yoshino_zadkiel")
    inst.AnimState:PlayAnimation("idle_loop", true)
    --inst.MiniMapEntity:SetIcon("map_zadkiel.tex") --添加小地图图标
    --inst.MiniMapEntity:SetEnabled(true)

    inst:AddTag("yoshino_zadkiel")
    inst:AddTag("companion") --是同伴
    --inst:AddTag("summonable")        --可召唤

    inst.entity:SetPristine()        --同步初始化
    if not TheWorld.ismastersim then --主客机判断（在此行以上为主客机共有，这行之后，客机会在if中运行完并停下，只有主机和服务端才能往下走）
        return inst
    end

    inst:AddComponent("planardamage")            --位面伤害
    inst:AddComponent("combat")                  --战斗组件
    inst.components.combat.hiteffectsymbol = "zadkiel_body"  --受击通道
    inst.components.combat:SetDefaultDamage(damage) --默认伤害
    inst.components.combat:SetRetargetFunction(1, Retarget)  --目标刷新
    inst.components.combat:SetKeepTargetFunction(KeepTarget) --持续攻击目标
    inst.components.combat:SetRange(attack_range, hit_range) --设置攻击距离和击中距离

    inst:AddComponent("drownable")              --落水组件
    inst.components.drownable.enabled = false   --不会落水


    inst:AddComponent("inspectable") --可检查组件
    inst:AddComponent("knownlocations") --知晓身处地点

    --inst:AddComponent("leader")         --领头组件
    inst:AddComponent("follower")       --追随者组件
    inst.components.follower.keepdeadleader = true
    inst.components.follower.keepleaderduringminigame = true


    inst:ListenForEvent("newcombattarget", OnNewLeader)
    inst:ListenForEvent("attacked", OnAttacked)

    inst:AddComponent("rideable")
    inst.components.rideable:SetSaddleable(false) --不需要鞍具
    inst.components.rideable.canride = true

    inst:AddComponent("locomotor") -- 运动组件
    inst.components.locomotor.walkspeed = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.SPEED_WALK
    inst.components.locomotor.runspeed = TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.SPEED_RUN

    inst.ApplyBuildOverrides = ApplyBuildOverrides
    inst.ClearBuildOverrides = ClearBuildOverrides

    inst.persists = false

    --inst:ListenForEvent("obediencedelta", OnObedienceDelta)
    inst:ListenForEvent("stopfollowing", ClearOwner)
    inst:ListenForEvent("riderchanged", OnRiderChanged)

    inst:SetBrain(brain)
    inst:SetStateGraph("SGyoshino_zadkiel")

    MakeHauntablePanic(inst)
    return inst
end

return Prefab("yoshino_zadkiel", fn, assets, prefabs)
