--资源加载
local assets = {
    Asset("ATLAS", "images/inventoryimages/yoshino_elfz.xml"), --物品栏贴图
    Asset("IMAGE", "images/inventoryimages/yoshino_elfz.tex"),
    Asset("ANIM", "anim/yoshino_fanzhuan.zip"),                    --动画
}
--添加预制物的预制物
local prefabs = {}

local function frozenother(owner, data)
    local target = data.target or nil

    --身穿冰铠时, 若灵力足够，则攻击附带 4 冰冻点数
    if target and target.components.freezable then   --只有有freezable组件的prefab才会被冰冻
        local coldness = 4       --(冰冻强度，每个可冰冻的prefab都有冰冻抗性，只有积累的强度超过抗性了才会被冰冻)
        local freezetime = 10    --(冰冻时间：10秒)
        target.components.freezable:AddColdness(coldness, freezetime)
    end
    --如果目标属于暗影阵营或月亮阵营（即 非普通生物）
    if target and (target:HasTag("shadow_aligned") or target:HasTag("lunar_aligned")) and
        (target.components.health and not target.components.health:IsDead())
    then
        target.components.health:DoDelta(-20)
    end
end

local function ownerequip(owner, data)
    --隐藏其他的头部装备
    if data.item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        owner:DoTaskInTime(0, function ()
            owner.AnimState:ClearOverrideSymbol("swap_hat")
            owner.AnimState:ClearOverrideSymbol("headbase")
            owner.AnimState:ClearOverrideSymbol("headbase_hat")
            owner.AnimState:ClearOverrideSymbol("hairpigtails")
            owner.AnimState:OverrideSymbol("swap_hat", "yoshino_fanzhuan", "swap_hat")
            owner.AnimState:OverrideSymbol("headbase", "yoshino_fanzhuan", "headbase")
            owner.AnimState:OverrideSymbol("headbase_hat", "yoshino_fanzhuan", "headbase_hat")
            owner.AnimState:Hide("HAIR_pigtails")       --隐藏马尾图层
        end)
    end
end
local function ownerunequip(owner, data)
    --隐藏其他的头部装备
    if data.eslot == EQUIPSLOTS.HEAD then
        owner:DoTaskInTime(0, function ()
            owner.AnimState:ClearOverrideSymbol("swap_hat")
            owner.AnimState:ClearOverrideSymbol("headbase")
            owner.AnimState:ClearOverrideSymbol("headbase_hat")
            owner.AnimState:ClearOverrideSymbol("hairpigtails")
            owner.AnimState:OverrideSymbol("swap_hat", "yoshino_fanzhuan", "swap_hat")
            owner.AnimState:OverrideSymbol("headbase", "yoshino_fanzhuan", "headbase")
            owner.AnimState:OverrideSymbol("headbase_hat", "yoshino_fanzhuan", "headbase_hat")
            owner.AnimState:Hide("HAIR_pigtails")       --隐藏马尾图层
            owner.AnimState:Show("HAT")                --显示帽子图层
            owner.AnimState:Hide("HAIR_NOHAT")         --隐藏无帽图层
        end)
    end
end

--装备时调用
local function onequip(inst, owner)

    --如果有装备四糸奈，则替换四糸奈的皮肤（尚未实现）
    for k, v in pairs(owner.components.inventory.equipslots) do
        if v.prefab == "yoshinon" then
            owner.components.inventory:Equip(v)
        end
    end

    owner.AnimState:ClearOverrideSymbol("arm_lower") --装备前清空通道
    --owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:ClearOverrideSymbol("arm_upper")
    owner.AnimState:ClearOverrideSymbol("arm_upper_skin")
    owner.AnimState:ClearOverrideSymbol("face")
    owner.AnimState:ClearOverrideSymbol("foot")
    --owner.AnimState:ClearOverrideSymbol("hair")
    --owner.AnimState:ClearOverrideSymbol("hair_hat")
    owner.AnimState:ClearOverrideSymbol("hairpigtails")
    owner.AnimState:ClearOverrideSymbol("hand")
    owner.AnimState:ClearOverrideSymbol("headbase")
    owner.AnimState:ClearOverrideSymbol("headbase_hat")
    owner.AnimState:ClearOverrideSymbol("leg")
    owner.AnimState:ClearOverrideSymbol("skirt")
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:ClearOverrideSymbol("torso")
    owner.AnimState:ClearOverrideSymbol("tail")

    owner.AnimState:Show("HAT")                --显示帽子图层
    owner.AnimState:Hide("HAIR_NOHAT")         --隐藏无帽图层
    owner.AnimState:Hide("HAIR_pigtails")       --隐藏马尾图层

    owner.AnimState:OverrideSymbol("arm_lower", "yoshino_fanzhuan", "arm_lower") --OverrideSymbol(oldsymbol, newbuild, newsymbol)参数1是替换的动画部件(通道)，2是使用的动画(材质包)，3是替换的新部件(通道)
    owner.AnimState:OverrideSymbol("arm_upper", "yoshino_fanzhuan", "arm_upper")
    owner.AnimState:OverrideSymbol("arm_upper_skin", "yoshino_fanzhuan", "arm_upper_skin")
    owner.AnimState:OverrideSymbol("face", "yoshino_fanzhuan", "face")
    owner.AnimState:OverrideSymbol("foot", "yoshino_fanzhuan", "foot")
    owner.AnimState:OverrideSymbol("hand", "yoshino_fanzhuan", "hand")
    owner.AnimState:OverrideSymbol("headbase", "yoshino_fanzhuan", "headbase")
    owner.AnimState:OverrideSymbol("headbase_hat", "yoshino_fanzhuan", "headbase_hat")
    owner.AnimState:OverrideSymbol("leg", "yoshino_fanzhuan", "leg")
    owner.AnimState:OverrideSymbol("skirt", "yoshino_fanzhuan", "skirt")
    owner.AnimState:OverrideSymbol("swap_body", "yoshino_fanzhuan", "swap_body")
    owner.AnimState:OverrideSymbol("swap_hat", "yoshino_fanzhuan", "swap_hat")
    owner.AnimState:OverrideSymbol("torso", "yoshino_fanzhuan", "torso")

    owner.components.combat.damagemultiplier = 1.0    --伤害系数

    owner:ListenForEvent("onhitother", frozenother)
    owner:ListenForEvent("equip", ownerequip)
    owner:ListenForEvent("unequip", ownerunequip)

end

--卸下时调用
local function onunequip(inst, owner)
    local player_build = owner.AnimState:GetBuild() --用作保险，卸下时会使用原本的材质包(含皮肤)，而不是只使用默认材质包


    owner.AnimState:ClearOverrideSymbol("arm_lower") --清空通道
    --owner.AnimState:ClearOverrideSymbol("swap_object")    --该物品不在手部装备栏，卸下时不能影响原有的手部通道
    owner.AnimState:ClearOverrideSymbol("arm_upper")
    owner.AnimState:ClearOverrideSymbol("arm_upper_skin")
    owner.AnimState:ClearOverrideSymbol("face")
    owner.AnimState:ClearOverrideSymbol("foot")
    --owner.AnimState:ClearOverrideSymbol("hair")
    --owner.AnimState:ClearOverrideSymbol("hair_hat")
    owner.AnimState:ClearOverrideSymbol("hairpigtails")
    owner.AnimState:ClearOverrideSymbol("hand")
    owner.AnimState:ClearOverrideSymbol("headbase")
    owner.AnimState:ClearOverrideSymbol("headbase_hat")
    owner.AnimState:ClearOverrideSymbol("leg")
    owner.AnimState:ClearOverrideSymbol("skirt")
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:ClearOverrideSymbol("torso")

    owner.AnimState:Hide("HAT")                --隐藏帽子图层
    owner.AnimState:Show("HAIR_NOHAT")         --显示无帽图层
    owner.AnimState:Show("HAIR_pigtails")      --显示马尾图层

    owner.AnimState:OverrideSymbol("arm_lower", player_build, "arm_lower") --OverrideSymbol(oldsymbol, newbuild, newsymbol)参数1是替换的动画部件(通道)，2是使用的动画(材质包)，3是替换的新部件(通道)
    owner.AnimState:OverrideSymbol("arm_upper", player_build, "arm_upper")
    owner.AnimState:OverrideSymbol("arm_upper_skin", player_build, "arm_upper_skin")
    owner.AnimState:OverrideSymbol("face", player_build, "face")
    owner.AnimState:OverrideSymbol("foot", player_build, "foot")
    owner.AnimState:OverrideSymbol("hand", player_build, "hand")
    owner.AnimState:OverrideSymbol("headbase", player_build, "headbase")
    owner.AnimState:OverrideSymbol("headbase_hat", player_build, "headbase_hat")
    owner.AnimState:OverrideSymbol("leg", player_build, "leg")
    owner.AnimState:OverrideSymbol("skirt", player_build, "skirt")
    --owner.AnimState:OverrideSymbol("swap_body", player_build, "swap_body")
    owner.AnimState:OverrideSymbol("swap_hat", player_build, "swap_hat")
    owner.AnimState:OverrideSymbol("torso", player_build, "torso")

    owner.components.combat.damagemultiplier = TUNING.MOD_YOSHINO.yoshino.DAMAGE_DEAFULT_Ratio  --伤害系数恢复

    owner:RemoveEventCallback("onhitother", frozenother)    --卸下时取消监听
    owner:RemoveEventCallback("equip", ownerequip)          --卸下时取消监听
    owner:RemoveEventCallback("unequip", ownerunequip)         --卸下时取消监听

end

--捡起时（拿在手上时也会调用该函数）
local function onpickup(inst, owner, src_pos)
end
-- 扔下来时
local function ondropped(inst)
end



local function fn()
    local inst = CreateEntity()               --定义 inst变量 指代 创建实体函数

    inst.entity:AddTransform()                --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                --添加动画状态
    inst.entity:AddNetwork()                  --加入服务器

    MakeInventoryPhysics(inst)                --可物理模拟（如果没有这个，则无法进行相关action）
    MakeInventoryFloatable(inst, "small")     --可漂浮

    inst.AnimState:SetBank("yoshino_fanzhuan")  --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_fanzhuan") --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")      --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名

    inst:AddTag("armor")                      --该物品属于护甲
    inst:AddTag("yoshino_elfz")             --添加物品标签
    inst:AddTag("nosteal")                    --不可被偷

    inst.entity:SetPristine()                 --同步初始化

    if not TheWorld.ismastersim then          --主客机判断（在此行以上为主客机共有，这行之后，客机会在if中运行完并停下，只有主机和服务端才能往下走）
        return inst
    end

    inst:AddComponent("inspectable") --该预设物可检查（检查台词写在string常量定义和语音包文件中）

    --加载物品图标
    inst:AddComponent("inventoryitem") --该预设物是可放进背包的物品
    inst.components.inventoryitem.imagename = "yoshino_elfz"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_elfz.xml"
    inst.components.inventoryitem:SetOnPickupFn(onpickup)   --拾起时调用对应函数
    inst.components.inventoryitem:SetOnDroppedFn(ondropped) --掉落时调用对应函数
    inst.components.inventoryitem:SetSinks(false)           --设置true可以落水，掉海里直接消失。

    inst:AddComponent("equippable")                         --该预设物是可装备的物品
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY  --装备在身体部位
    inst.components.equippable:SetOnEquip(onequip)          --装备时使用装备函数
    inst.components.equippable:SetOnUnequip(onunequip)      --装卸时使用拆卸函数
    inst.components.equippable.dapperness = -4 / 60         --每分钟恢复-4理智
    inst.components.equippable.restrictedtag = "yoshino"    --限制仅四糸乃可装备

    --inst:AddComponent("waterproofer")                       --防水
    --inst.components.waterproofer.effectiveness = 1          --取值0~1

    inst:AddComponent("armor")                              --护甲组件
    inst.components.armor:InitIndestructible(0.6)           --80%保护度，且无限耐久
    inst:AddComponent("planardefense")                      --位面防御组件
    inst.components.planardefense:SetBaseDefense(10)        --基础位面防御

    inst:AddComponent("insulator")                          --绝缘
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE)    --隔离240
    inst.components.insulator:SetSummer()   --隔离夏季（隔热效果）

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

return Prefab("yoshino_elfz", fn, assets, prefabs)
