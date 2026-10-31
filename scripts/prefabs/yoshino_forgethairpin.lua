local assets = {
    Asset("ANIM", "anim/yoshino_forgethairpin.zip"),
    Asset("IMAGE", "images/inventoryimages/yoshino_forgethairpin.tex"),
    Asset("ATLAS", "images/inventoryimages/yoshino_forgethairpin.xml")
}

local prefabs = {}


local function onequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:OverrideSymbol("swap_hat", inst.prefab, "hairpin")

    if inst.components.fueled ~= nil then
		inst.components.fueled:StartConsuming()
	end
    owner.AnimState:Show("HAT")                --显示帽子图层
end

local function onunequip(inst, owner)
    local player_build = owner.AnimState:GetBuild() --用作保险，让卸下时会使用原本的材质包(含皮肤)，而不是只使用默认材质包
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")                --隐藏帽子图层

    owner.AnimState:OverrideSymbol("swap_hat", player_build, "swap_hat")

    if inst.components.fueled ~= nil then
        inst.components.fueled:StopConsuming()
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()                --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                --添加动画状态
    inst.entity:AddNetwork()                  --加入服务器

    MakeInventoryPhysics(inst)                --可物理模拟（如果没有这个，则无法进行相关action）
    MakeInventoryFloatable(inst, "small", 0.1, 0.70)  --可漂浮

    inst.AnimState:SetBank("yoshino_forgethairpin")  --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_forgethairpin") --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")        --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名

    inst:AddTag("acidrainimmune")		      --酸雨免疫标签
    inst:AddTag("yoshino_forgethairpin")      --添加物品标签

    inst.entity:SetPristine()                 --同步初始化

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable") --该预设物可检查（检查台词写在string常量定义和语音包文件中）

    --加载物品图标
    inst:AddComponent("inventoryitem") --该预设物是可放进背包的物品
    inst.components.inventoryitem.imagename = "yoshino_forgethairpin"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_forgethairpin.xml"
    --inst.components.inventoryitem:SetOnPickupFn(onpickup)   --拾起时调用对应函数
    --inst.components.inventoryitem:SetOnDroppedFn(ondropped) --掉落时调用对应函数
    inst.components.inventoryitem:SetSinks(false)           --设置true可以落水，掉海里直接消失。

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD  --装备在头部
    inst.components.equippable:SetOnEquip(onequip)          --装备时使用装备函数
    inst.components.equippable:SetOnUnequip(onunequip)      --装卸时使用拆卸函数
    inst.components.equippable.dapperness = TUNING.MOD_YOSHINO.YOSHINO_FORGETHAIRPIN.dappernes  --装备时的理智回复

    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.MAGIC
    inst.components.fueled:InitializeFuelLevel(TUNING.MOD_YOSHINO.YOSHINO_FORGETHAIRPIN.duration) --持续时间
    inst.components.fueled:SetDepletedFn(inst.Remove)       --燃料消耗完时移除

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)  --可被燃烧并返还1灰烬
    MakeHauntableLaunch(inst)               --可被鬼魂作祟并能够弹起来
    return inst
end

return Prefab("yoshino_forgethairpin", fn, assets, prefabs)