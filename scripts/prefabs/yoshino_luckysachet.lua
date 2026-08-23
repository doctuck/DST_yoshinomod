
--资源加载
local assets = {
    Asset("ANIM", "anim/yoshino_backpack.zip"),
    Asset("ATLAS", "images/inventoryimages/yoshino_luckbag.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_luckbag.tex"),
    Asset("ANIM", "anim/yoshino_ui_3x6.zip"),
}

--添加预制物的预制物
local prefabs = {}

--装备时调用
local function onequip(inst, owner)

    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:OverrideSymbol("swap_body", "yoshino_backpack", "yoshino_bag")

    if inst.components.container ~= nil then        --开启容器
        inst.components.container:Open(owner)
    end

end

--卸下时调用
local function onunequip(inst, owner)
    local player_build = owner.AnimState:GetBuild() --用作保险，卸下时会使用原本的材质包(含皮肤)，而不是只使用默认材质包

    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:OverrideSymbol("swap_body", player_build, "swap_body")

    if inst.components.container ~= nil then       --关闭容器
        inst.components.container:Close(owner)
    end
end

-- 容器打开时回调
local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end

-- 容器关闭时回调
local function onclose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end


local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()                --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                --添加动画状态
    inst.entity:AddSoundEmitter()             --加入声音组件
    inst.entity:AddNetwork()                  --加入服务器

    MakeInventoryPhysics(inst)                --可物理模拟（如果没有这个，则无法进行相关action）
    MakeInventoryFloatable(inst, "small", 0.1, 0.70)  --可漂浮

    inst.AnimState:SetBank("yoshino_bag")
    inst.AnimState:SetBuild("yoshino_backpack")
    inst.AnimState:PlayAnimation("backpack_idle")
    inst.AnimState:SetScale(0.75, 0.75, 0.75)         --待机倍率

    --inst:AddTag("amulet")               --物品属于护身符
    inst:AddTag("yoshino_luckysachet")  --物品标签
    inst:AddTag("backpack")             --该物品属于背包同类
    inst:AddTag("_container")           --该物品是容器

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")        --物品可检查

    inst:AddComponent("inventoryitem")      --物品可放进背包
    inst.components.inventoryitem.imagename = "yoshino_luckbag"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_luckbag.xml"
    inst.components.inventoryitem:SetSinks(false)               --设置true可以落水，掉海里直接消失。

    inst:AddComponent("equippable")         --该预设物是可装备的物品
    inst.components.equippable.equipslot = EQUIPSLOTS.BACK or EQUIPSLOTS.BACKPACK or EQUIPSLOTS.BODY  --装备在身体部位（兼容其他mod）
    inst.components.equippable:SetOnEquip(onequip)          --装备时使用装备函数
    inst.components.equippable:SetOnUnequip(onunequip)      --装卸时使用拆卸函数
    --inst.components.equippable.restrictedtag = "yoshino"    --限制仅四糸乃可装备

    inst:AddComponent("luckitem")               --幸运物品
    inst.components.luckitem:SetEquippedLuck(TUNING.MOD_YOSHINO.YOSHINO_LUCKYSACHET)    --设置幸运值（在背包中不生效，装备时生效）

    inst:AddComponent("container")             --添加容器组件
    inst.components.container:WidgetSetup("yoshino_luckysachet") --设置容器UI名
    -- 重要注释：WidgetSetup那个UI的名字要和容器预制物的代码名字一样，
    -- 否则就需要在客机部分添加加OnEntityReplicated方法，重新在预制体内注册容器。
    inst.components.container.onopenfn = onopen         --打开时调用函数
    inst.components.container.onclosefn = onclose       --关闭时调用函数

    --方便外部调用的两个函数
    inst.yoshino_luckysachet_equip = onequip
    inst.yoshino_luckysachet_unequip = onunequip


    inst.OnLoad = function(inst, data)
        inst:DoTaskInTime(0.5, function()   --延迟半秒，确保能获取到玩家
            --载入游戏时，如果上一次退出游戏时装备了该物品，则恢复装备的状态
            local owner = inst.components.inventoryitem.owner
            if owner and inst.components.equippable:IsEquipped() then
                onequip(inst, owner)
                if inst.components.container ~= nil then       --关闭容器
                    inst.components.container:Close(owner)
                end
            end
        end)
    end

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)  --可燃烧的
    --MakeSmallPropagator(inst)                       --燃烧可传播
    MakeHauntableLaunch(inst)                       --可被鬼魂作祟

    return inst
end


return Prefab("yoshino_luckysachet", fn, assets, prefabs)