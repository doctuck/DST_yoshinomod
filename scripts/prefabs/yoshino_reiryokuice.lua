--资源加载
local assets = {
	Asset("ANIM", "anim/yoshino_reiryokuice.zip"), --冰锥动画
	Asset("ANIM", "anim/yoshino_snowball.zip"), --雪球动画
}
local prefabs = {}

local function onhit(inst, attacker, target)
	local fx = SpawnPrefab("shatter")

	if attacker and target and not target.components.health:IsDead() then
		fx.Transform:SetPosition(target.Transform:GetWorldPosition())
		fx.components.shatterfx:SetLevel(2)
		if target.components.freezable then
			--积累寒冷点数
			target.components.freezable:AddColdness(TUNING.MOD_YOSHINO.YOSHINO_FAN.addcold_val)
			target.components.freezable:SpawnShatterFX()
		end
	else
		fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
		fx.components.shatterfx:SetLevel(2)
	end

	inst:DoTaskInTime(0, inst.Remove)
end

local function fn()
	local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

	MakeProjectilePhysics(inst) --必须改为抛射物的物理而不是物品物理，否则与渲染改动会冲突

	inst.AnimState:SetBank("yoshino_reiryokuice")
	inst.AnimState:SetBuild("yoshino_reiryokuice")
	inst.AnimState:PlayAnimation("icepiton")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround) --修改默认渲染，让其能自行决定角度

	--inst.Transform:SetEightFaced() --设置八面朝向
	inst.Transform:SetNoFaced() --设置无面朝向

	inst.entity:SetPristine()

	--inst:AddTag("FX")
	inst:AddTag("NOCLICK") --不可被点击
	inst:AddTag("projectile") --标识为抛射物

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("projectile")
	inst.components.projectile:SetSpeed(45)
	inst.components.projectile:SetHoming(false)
	inst.components.projectile:SetHitDist(1)         --判定是否命中的最小距离
	inst.components.projectile.range = 30            --射程，超过这个射程会判定为未命中进入OnMiss
	inst.components.projectile:SetOnHitFn(onhit)
	inst.components.projectile:SetOnMissFn(inst.Remove) --未命中时的回调函数
	inst.components.projectile:SetLaunchOffset(Vector3(0, 0, 0))

	return inst
end

local function onlaunch(inst, attacker, targetPos)
	if targetPos == nil or attacker == nil then return end

    local playerpos = attacker:GetPosition()
	local offset_x, offset_y, offset_z
	if inst.components.complexprojectile.launchoffset ~= nil then
		offset_x = inst.components.complexprojectile.launchoffset.x
		offset_y = inst.components.complexprojectile.launchoffset.y
		offset_z = inst.components.complexprojectile.launchoffset.z
	end
    local dx = targetPos.x - playerpos.x -- offset_x
    local dz = targetPos.z - playerpos.z -- offset_z
	if math.abs(dx - offset_x) < math.abs(dx + offset_x) then
		dx = dx - offset_x
	else
		dx = dx + offset_x
	end
    local d = math.sqrt(dx * dx + dz * dz)

    local g = math.abs(inst.components.complexprojectile.gravity)
    local H = 4

    local vy = math.sqrt(2 * g * H)
    local t = 2 * vy / g

    inst.components.complexprojectile.velocity.x = d / t
    inst.components.complexprojectile.velocity.y = vy
    inst.components.complexprojectile.velocity.z = 0
end

local function onupdate(inst)
	local target = inst._target

	if target == nil or not target:IsValid() or target:HasTag("INLIMBO") then
		return false
	end

	inst.Physics:SetMotorVel(inst.components.complexprojectile.velocity:Get())

	local range = target:GetPhysicsRadius(0) + 1	--设定命中的判定检测

	if distsq(inst:GetPosition(), target:GetPosition()) < range * range then
		inst.components.complexprojectile:Hit(target)
		return true
	end

	return false
end

local function snowball_hit(inst, attacker, target)
	local weapon = inst.components.complexprojectile.owningweapon
	if target ~= nil and target:IsValid() then
    	if attacker ~= nil and attacker.components.combat ~= nil and weapon.components.weapon ~= nil then
			if attacker.components.combat.ignorehitrange then
		        attacker.components.combat:DoAttack(target, weapon, inst, weapon.components.weapon.stimuli)
			else
				attacker.components.combat.ignorehitrange = true
				attacker.components.combat:DoAttack(target, weapon, inst, weapon.components.weapon.stimuli)
				attacker.components.combat.ignorehitrange = false
			end
			if target.components.freezable then
				--积累寒冷点数
				target.components.freezable:AddColdness(TUNING.MOD_YOSHINO.YOSHINON.addcold)
				target.components.freezable:SpawnShatterFX()
			end
    	end
	end
	--SpawnPrefab("splash_snow_fx").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:DoTaskInTime(0, inst.Remove)
end


local function snowballfn()
	local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

	MakeProjectilePhysics(inst) --必须改为抛射物的物理而不是物品物理，否则与渲染改动会冲突

	inst.AnimState:SetBank("yoshino_snowball")
	inst.AnimState:SetBuild("yoshino_snowball")
	inst.AnimState:PlayAnimation("throw_loop", true)
	--inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)	--修改默认渲染，让其能自行决定角度
	inst.AnimState:SetScale(0.6, 0.6, 0.6)

	--inst.Transform:SetNoFaced()     --设置无面朝向

	--inst:AddTag("FX")
	inst:AddTag("NOCLICK") --不可被点击
	inst:AddTag("projectile") --标识为抛射物
	inst:AddTag("complexprojectile")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false

	inst:AddComponent("locomotor")

	inst:AddComponent("complexprojectile")
	--inst.components.complexprojectile:SetHorizontalSpeed(30)	--设置初速度
	inst.components.complexprojectile:SetGravity(-50)			--设置重力加速度
	inst.components.complexprojectile:SetLaunchOffset(Vector3(0, 0.6, 0))
	--inst.components.complexprojectile:SetTargetOffset(Vector3(0, 2.5, 0))	--目标身上的偏移
	inst.components.complexprojectile:SetOnHit(snowball_hit)    --命中时的回调
	inst.components.complexprojectile:SetOnLaunch(onlaunch) --攻击前的回调
	inst.components.complexprojectile:SetOnUpdate(onupdate)	--更改默认的命中检测


	return inst
end




return Prefab("yoshino_reiryokuice", fn, assets, prefabs),
	Prefab("yoshino_snowball_project", snowballfn, assets, prefabs)
