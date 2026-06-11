--资源加载
local assets = {
    Asset("IMAGE", "images/inventoryimages/yoshino_fan.tex"), --物品栏贴图
    Asset("ATLAS", "images/inventoryimages/yoshino_fan.xml"),
    Asset("ANIM", "anim/yoshino_fan.zip"),                    --放地上时的动画
    Asset("ANIM", "anim/swap_yoshino_fan.zip"),               --放手上的动画
}

--添加预制物的预制物
local prefabs = {"tornado","yoshino_reiryokuice","deer_ice_flakes"}  --旋风、冰锥、雪花

local FANTARGET_CANT_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "playerghost" }
local FANTARGET_ONEOF_TAGS = { "smolder", "fire", "player" }

local function onequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:OverrideSymbol("swap_object", "swap_yoshino_fan", "swap_fan")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
local function onunequip(inst,owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function OnFanUse(inst, target)
    local x, y, z = target.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 6, nil, FANTARGET_CANT_TAGS, FANTARGET_ONEOF_TAGS)
    for i, v in pairs(ents) do
        --目标有可燃组件，燃烧则灭火
        if v.components.burnable ~= nil then
            v.components.burnable:Extinguish(true, 0)   --灭火会消耗一次使用次数
        end
        --目标有温度组件，则降温
        if v.components.temperature ~= nil then
            v.components.temperature:DoDelta(-10)
        end
    end
end
local function NoHoles(pt)
    return not TheWorld.Map:IsPointNearHole(pt)
end
local function onchannelingfn(inst, target)
    if inst.components.finiteuses:GetUses() > 2 then
        local pos =(target ~= nil and target:GetPosition()) or (inst.components.inventoryitem.owner ~= nil and inst.components.inventoryitem.owner:GetPosition()) or nil
        if pos ~= nil then
            local angle
            if inst.lasttornadoangle == nil then
                angle = math.random() * TWOPI
                inst.lasttornadoangle = angle
            else
                angle = inst.lasttornadoangle + PI
                inst.lasttornadoangle = nil
            end
            --FindWalkableOffset(position,start_angle,radius,attempts,check_los,ignore_walls,customcheckfn,allow_water,allow_boats)
            local offset = FindWalkableOffset(pos, angle, 4, 8, false, true, NoHoles, true, false)
            if offset ~= nil then
                --inst.components.finiteuses:Use(1) --使用扇风动作本就有消耗了

                local tornado = SpawnPrefab("tornado")
                tornado:SetDuration(TUNING.PERDFAN_TORNADO_LIFETIME)
                tornado.WINDSTAFF_CASTER = inst.components.inventoryitem.owner
                tornado.WINDSTAFF_CASTER_ISPLAYER = tornado.WINDSTAFF_CASTER ~= nil and tornado.WINDSTAFF_CASTER:HasTag("player")
                tornado.Transform:SetPosition(pos.x + offset.x * .5, 0, pos.z + offset.z * .5)
                pos.x = pos.x + offset.x
                pos.y = 0
                pos.z = pos.z + offset.z
                tornado.components.knownlocations:RememberLocation("target", pos)
                local ice_fk = SpawnPrefab("deer_ice_flakes")
                ice_fk.entity:SetParent(tornado.entity)
                ice_fk.AnimState:PlayAnimation("idle",true)

                if tornado.WINDSTAFF_CASTER_ISPLAYER then
                    tornado.overridepkname = tornado.WINDSTAFF_CASTER:GetDisplayName()
                    tornado.overridepkpet = true
                end
            end
        end
    end
end


local function onfinish(inst, owner)
    return
end

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
    inst.entity:AddTransform()        --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()        --添加动画状态
    --inst.entity:AddSoundEmitter()     --添加声音组件
    inst.entity:AddNetwork()          --加入服务器

    MakeInventoryPhysics(inst)                --可物理模拟（如果没有这个，则无法进行相关action）
    MakeInventoryFloatable(inst, "small")     --可漂浮

    inst.AnimState:SetBank("yoshino_fan")         --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_fan")        --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")          --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名

    inst:AddTag("weapon")
    inst:AddTag("yoshino_fan")
    inst:AddTag("fan")

    inst.entity:SetPristine()      --同步初始化

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")    --可检查

    inst:AddComponent("inventoryitem")  --可放入物品栏
    inst.components.inventoryitem.imagename = "yoshino_fan"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_fan.xml"
    inst.components.inventoryitem:SetSinks(false)               --设置true可以落水，掉海里直接消失。

    inst:AddComponent("weapon")     --武器组件
    inst.components.weapon:SetDamage(TUNING.MOD_YOSHINO.yoshino_fan.damage)
    inst.components.weapon:SetRange(TUNING.MOD_YOSHINO.yoshino_fan.range)
    inst.components.weapon:SetProjectile("yoshino_reiryokuice")    --攻击时生成冰锥
    --inst.components.weapon:SetOnProjectileLaunched(function()
    --    if inst.components.finiteuses:GetUses() <= 0 then
    --        return
    --    end
    --    inst.components.finiteuses:Use(1)   --每次使用减1
    --end)

    inst:AddComponent("equippable")     --可装备组件
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    --inst.components.equippable.walkspeedmult = 1.2  --装备时的移动速度
    --inst.components.equippable.restrictedtag = "yoshino"   --限制仅四糸乃可装备

    inst:AddComponent("finiteuses")     --耐久组件(次数类)
    inst.components.finiteuses:SetMaxUses(TUNING.MOD_YOSHINO.yoshino_fan.uses) --设置耐久
    inst.components.finiteuses:SetUses(TUNING.MOD_YOSHINO.yoshino_fan.uses) --获得时可以使用的耐久
    inst.components.finiteuses:SetConsumption(ACTIONS.FAN, 1)   --使用扇风动作时消耗 1 耐久
    inst.components.finiteuses:SetIgnoreCombatDurabilityLoss(true)      --忽略战斗损耗
    inst.components.finiteuses:SetOnFinished(onfinish)   --耐久消耗完时执行的函数

    inst:AddComponent("fan")    --风扇组件
    inst.components.fan:SetOnUseFn(OnFanUse)
    inst.components.fan:SetOnChannelingFn(onchannelingfn)
    inst.components.fan:SetOverrideSymbol("swap_fan_yoshino")
    

    inst.OnLoad = function(inst, data)
        inst:DoTaskInTime(0.5, function()   --延迟半秒，确保能获取到玩家
            --载入游戏时，如果上一次退出游戏时装备了该物品，则恢复装备的状态
            local owner = inst.components.inventoryitem.owner
            if owner and inst.components.equippable:IsEquipped() then
                onequip(inst, owner)
            end
        end)
    end
    
    MakeHauntableLaunch(inst) --可被鬼魂作祟并能够弹起来
    return inst
end


return Prefab("yoshino_fan", fn, assets, prefabs)