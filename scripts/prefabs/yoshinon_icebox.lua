local assets =
{
    Asset("ANIM", "anim/yoshinon_icebox.zip"),
}

local prefabs =
{
    "collapse_small",
}

local function onopen(inst)
    inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
    inst.AnimState:PlayAnimation("close")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.components.container:DropEverything()
    inst.AnimState:PushAnimation("close", false)
    inst.components.container:Close()
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("close", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 0.8)
	MakeSnowCoveredPristine(inst)
	inst:SetDeploySmartRadius(1)			--配方最小占用半径/2

    inst.MiniMapEntity:SetIcon("yoshinon_icebox.tex")

    inst:AddTag("fridge")
    inst:AddTag("structure")
	inst:AddTag("yoshinon_icebox")			--物品识别标签

    inst.AnimState:SetBank("yoshinon_icebox")
    inst.AnimState:SetBuild("yoshinon_icebox")
    inst.AnimState:PlayAnimation("close")
	inst.AnimState:PushAnimation("idle")
	inst.AnimState:SetScale(2, 2, 2)

    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("yoshinon_icebox")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose


    inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetLoot({"gears","gears", "bearger_fur", "cutstone"})

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)


	inst:AddComponent("preserver")                          --添加回鲜组件
	inst.components.preserver:SetPerishRateMultiplier(TUNING.MOD_YOSHINO.YOSHINON_ICEBOX.coldmode / 2)

    inst:ListenForEvent("onbuilt", onbuilt)

    MakeSnowCovered(inst)

    AddHauntableDropItemOrWork(inst)

    return inst
end
--全局函数：function MakePlacer(name, bank, build, anim, onground, snap, metersnap, scale, fixedcameraoffset, facing, postinit_fn, offset, onfailedplacement)
return Prefab("yoshinon_icebox", fn, assets, prefabs),
    MakePlacer("yoshinon_icebox_placer", "yoshinon_icebox", "yoshinon_icebox", "idle")
