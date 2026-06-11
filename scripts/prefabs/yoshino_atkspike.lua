--资源加载
local assets = {
    Asset("ANIM", "anim/zadkiel_icespike.zip"), --冰刺动画
}

--添加预制物的预制物
local prefabs = {}

local function onhit(inst, attacker, target)
    local fx = SpawnPrefab("shatter")
    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
    -- fx.components.shatterfx:SetLevel(2)

    if attacker and target and not target.components.health:IsDead() then
        if target.components.freezable then
            target.components.freezable:AddColdness(TUNING.MOD_YOSHINO.YOSHINO_ZADKIEL.ADDCOLD_VAL)
            target.components.freezable:SpawnShatterFX()
        end
    end

    --[[if attacker and target.components.combat and target.components.combat:CanTarget(attacker) then
        target.components.combat:SuggestTarget(attacker)
    end]]

    if target and target.components.health:IsDead() then
        attacker:PushEvent("killed", { victim = target, attacker = attacker })
    end
    inst:DoTaskInTime(2, inst.Remove)
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, nil, nil)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank("icespike")
    inst.AnimState:SetBuild("zadkiel_icespike")
    inst.AnimState:PlayAnimation("spike")

    inst.Transform:SetNoFaced() --设置无面朝向

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:ListenForEvent("spawnbyyoshino", function(thisentity, data)
        onhit(inst, inst.owner or data.attacker, data.target or nil)
    end)

    return inst
end

return Prefab("yoshino_atkspike", fn, assets, prefabs)
