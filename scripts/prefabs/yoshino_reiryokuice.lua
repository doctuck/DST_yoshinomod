--资源加载
local assets = {
    Asset("ANIM", "anim/yoshino_reiryokuice.zip"),     --冰锥动画
}
local prefabs = {}

local function onhit(inst, attacker, target)
    local fx = SpawnPrefab("shatter")
    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
    fx.components.shatterfx:SetLevel(2)

    if attacker and target and not target.components.health:IsDead() then
        if target.components.freezable then
            --毕竟是冰锥，当然要能积累寒冷点数
            target.components.freezable:AddColdness(TUNING.MOD_YOSHINO.yoshino_fan.addcold_val)
            target.components.freezable:SpawnShatterFX()
        end
    end

    inst:DoTaskInTime(0, inst.Remove)
end


local function fn()
    local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, nil, nil)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank("yoshino_reiryokuice")
    inst.AnimState:SetBuild("yoshino_reiryokuice")
    inst.AnimState:PlayAnimation("icepiton")

    inst.Transform:SetEightFaced() --设置八面朝向

    inst.entity:SetPristine()

    --inst:AddTag("FX")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(45)
    inst.components.projectile:SetOnHitFn(onhit)
    inst.components.projectile:SetLaunchOffset(Vector3(0.5, 0, 0))

    return inst
end

return Prefab("yoshino_reiryokuice", fn, assets, prefabs)