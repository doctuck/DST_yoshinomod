
--资源加载
local assets = {
    Asset("ATLAS", "images/inventoryimages/yoshino_witchhat.xml"), --物品栏贴图
    Asset("IMAGE", "images/inventoryimages/yoshino_witchhat.tex"),
    Asset("ANIM", "anim/yoshino_witchhat.zip"),                    --动画
}
--添加预制物的预制物
local prefabs = {}

--装备时调用
local function onequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")

    inst.components.equippable.spireng = 1.5 / 60             --每分钟增加 1.5 灵力(通过挂载实现)

    owner.AnimState:Show("HAT")                --显示帽子图层
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")         --隐藏无帽图层
    owner.AnimState:Hide("HAIR")

    owner.AnimState:OverrideSymbol("swap_hat", inst.prefab, "swap_hat")

    if inst.components.fueled ~= nil then
		inst.components.fueled:StartConsuming()
	end
end

--卸下时调用
local function onunequip(inst, owner)
    local player_build = owner.AnimState:GetBuild() --用作保险，卸下时会使用原本的材质包(含皮肤)，而不是只使用默认材质包
    owner.AnimState:ClearOverrideSymbol("swap_hat")

    inst.components.equippable.spireng = 0 / 60             --每分钟不回复灵力(通过挂载实现)

    owner.AnimState:Hide("HAT")                --隐藏帽子图层
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")         --显示无帽图层
    owner.AnimState:Show("HAIR")

    owner.AnimState:OverrideSymbol("swap_hat", player_build, "swap_hat")

    if inst.components.fueled ~= nil then
        inst.components.fueled:StopConsuming()
    end
end

local function fn()
    local inst = CreateEntity()               --定义 inst变量 指代 创建实体函数

    inst.entity:AddTransform()                --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                --添加动画状态
    inst.entity:AddNetwork()                  --加入服务器

    MakeInventoryPhysics(inst)                --可物理模拟（如果没有这个，则无法进行相关action）
    MakeInventoryFloatable(inst, "small", 0.1, 0.70)  --可漂浮

    inst.AnimState:SetBank("yoshino_witchhat")  --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_witchhat") --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")        --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名

    inst:AddTag("warable")                    --该物品属于衣服
    inst:AddTag("yoshino_witchhat")           --添加物品标签
    inst:AddTag("nightvision")                --鼹鼠帽的夜视

    inst.entity:SetPristine()                 --同步初始化

    if not TheWorld.ismastersim then          --主客机判断（在此行以上为主客机共有，这行之后，客机会在if中运行完并停下，只有主机和服务端才能往下走）
        return inst
    end

    inst:AddComponent("inspectable") --该预设物可检查（检查台词写在string常量定义和语音包文件中）

    --加载物品图标
    inst:AddComponent("inventoryitem") --该预设物是可放进背包的物品
    inst.components.inventoryitem.imagename = "yoshino_witchhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_witchhat.xml"
    --inst.components.inventoryitem:SetOnPickupFn(onpickup)   --拾起时调用对应函数
    --inst.components.inventoryitem:SetOnDroppedFn(ondropped) --掉落时调用对应函数
    inst.components.inventoryitem:SetSinks(false)           --设置true可以落水，掉海里直接消失。

    inst:AddComponent("equippable")                         --该预设物是可装备的物品
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD  --装备在头部
    inst.components.equippable:SetOnEquip(onequip)          --装备时使用装备函数
    inst.components.equippable:SetOnUnequip(onunequip)      --装卸时使用拆卸函数
    --inst.components.equippable.restrictedtag = "yoshino"    --限制仅四糸乃可装备

    inst:AddComponent("tradable")                           --可交易的
    inst:AddComponent("fueled")                             --可被补充燃料的
    inst.components.fueled.fueltype = FUELTYPE.USAGE
    inst.components.fueled:InitializeFuelLevel(TUNING.AUTOSAVE_INTERVAL*10) --持续时间：10天
    inst.components.fueled:SetDepletedFn(inst.Remove)       --燃料消耗完时移除

    --inst:AddComponent("armor")                              --护甲组件
    --inst.components.armor:InitIndestructible(0.2)           --20%保护度且无限耐久

    inst:AddComponent("insulator")                          --绝缘
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE)--隔离240
    inst.components.insulator:SetWinter()                   --隔离冬季（保暖效果）

    inst.OnLoad = function(inst, data)
        inst:DoTaskInTime(0.5, function()   --延迟半秒，确保能获取到玩家
            --载入游戏时，如果上一次退出游戏时装备了该物品，则恢复装备的状态
            local owner = inst.components.inventoryitem.owner
            if owner and inst.components.equippable:IsEquipped() then
                onequip(inst, owner)
            end
        end)
    end

    MakeHauntableLaunch(inst)               --可被鬼魂作祟并能够弹起来
    return inst
end

return Prefab("yoshino_witchhat", fn, assets, prefabs)