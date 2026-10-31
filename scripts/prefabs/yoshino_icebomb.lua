--资源加载
local assets = {
    Asset("ANIM", "anim/yoshino_icebomb.zip"),
    Asset("ATLAS", "images/inventoryimages/yoshino_icebomb.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_icebomb.tex"),
    Asset("ANIM", "anim/swap_yoshino_icebomb.zip"),
}

--添加预制物的预制物
local prefabs = {"deer_ice_charge", "reticule", "reticuleaoe", "reticuleaoeping"}

--装备时调用
local function onequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:OverrideSymbol("swap_object", "swap_yoshino_icebomb", "swap_icebomb")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

--卸下时调用
local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function ReticuleTargetFn()
    local pos = Vector3()
    for r = 6.5, 3.5, -.25 do
        pos.x, pos.y, pos.z = ThePlayer.entity:LocalToWorldSpace(r, 0, 0)
        if TheWorld.Map:IsPassableAtPoint(pos:Get()) and not TheWorld.Map:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
end

local function OnHit(inst, attacker, target)

	local BOMB_CANT_TAGS = {"FX", "companion", "wall", "INLIMBO"}
    local x, y, z = inst.Transform:GetWorldPosition()

    if not TheNet:GetPVPEnabled() and table.contains(BOMB_CANT_TAGS, "player") then
        table.insert(BOMB_CANT_TAGS, "player")
	end

    local ents = TheSim:FindEntities(x, y, z, TUNING.MOD_YOSHINO.YOSHINO_ICEBOMB.radius, nil, BOMB_CANT_TAGS)

    local aoefx = SpawnPrefab("deer_ice_charge")    --用巨鹿的冰阵特效
    aoefx.Transform:SetPosition(x, y, z)
    aoefx.AnimState:SetScale(1.5,1.5,1.5)          --放大倍率
    aoefx.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround) --设置方向地面定向，将特效贴地
    aoefx.AnimState:PlayAnimation("blast")
    aoefx:DoTaskInTime(1.2, aoefx.Remove)

    for _, ent in pairs(ents) do
        --二次筛选
        if ent:IsValid() and ent ~= attacker then
            --对目标造成伤害
            if ent.components.health ~= nil and ent.components.combat ~= nil then
                ent.components.combat:GetAttacked(attacker, TUNING.MOD_YOSHINO.YOSHINO_ICEBOMB.defaultdamage, inst)
            end

            -- 强制冻结
            if ent.components.freezable ~= nil then
                ent.components.freezable:Freeze(TUNING.MOD_YOSHINO.YOSHINO_ICEBOMB.freezetime)
            end

			-- 增加湿度
            if ent.components.moisture ~= nil then
                ent.components.moisture:DoDelta(4)
            end

            -- 强制停止移动一段时间(冻结本身就自带禁锢，但部分生物有冻结抗性)
            if ent.components.locomotor ~= nil then
                ent.components.locomotor:SetExternalSpeedMultiplier(ent, "yoshino_icebomb", 0)    --设置移动速度 * 0（由于是乘算，所以会停止）
                ent.components.locomotor:Stop()
                ent:DoTaskInTime(TUNING.MOD_YOSHINO.YOSHINO_ICEBOMB.stoptime, function()
                    if ent:IsValid() and ent.components.locomotor ~= nil then
                        ent.components.locomotor:RemoveExternalSpeedMultiplier(ent, "yoshino_icebomb")
                    end
                end)
            end

            -- 灭火
            if ent.components.burnable ~= nil then
                if ent.components.burnable:IsBurning() or ent.components.burnable:IsSmoldering() then
                    ent.components.burnable:Extinguish(true, 0)
                end
            end

			-- 降温
			if ent.components.temperature ~= nil then
				local currenttemp = ent.components.temperature:GetCurrent()
				local maxtemp, mintemp = ent.components.temperature.maxtemp, ent.components.temperature.mintemp
                ent.components.temperature:SetTemperature(math.max(math.min(currenttemp - 10, maxtemp), mintemp))
            end
    	end
    end

	-- 补充一半的土壤水分
    if TheWorld.components.farming_manager ~= nil then
        TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, 0, z, 50)
    end

    inst:Remove()
end


--被抛出时
local function OnThrown(inst, attacker)
    inst:AddTag("NOCLICK")
    inst.persists = false
    inst.components.inventoryitem.pushlandedevents = false
    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/firesupressor_shoot")
end


local function fn()
    local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

    inst.entity:AddTransform()        --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()        --添加动画状态
    inst.entity:AddSoundEmitter()     --添加声音组件
    inst.entity:AddNetwork()          --加入服务器

    MakeInventoryPhysics(inst)                --使用物品物理
    MakeInventoryFloatable(inst, "small")     --可漂浮

    inst.AnimState:SetBank("yoshino_icebomb")         --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_icebomb")        --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")          --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名
    inst.AnimState:SetScale(0.75, 0.75, 0.75)

    inst:AddTag("yoshino_icebomb")
    inst:AddTag("projectile")
    inst:AddTag("weapon")
    inst:AddTag("watersource")
    inst:AddTag("complexprojectile")

    inst:AddComponent("reticule")
    inst.components.reticule.twinstickcheckscheme = true
    inst.components.reticule.twinstickmode = 1
    inst.components.reticule.twinstickrange = 8
    inst.components.reticule.targetfn = ReticuleTargetFn
    inst.components.reticule.ease = true

    inst.entity:SetPristine()      --同步初始化

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")    --可检查

    inst:AddComponent("inventoryitem")  --可放入物品栏
    inst.components.inventoryitem.imagename = "yoshino_icebomb"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshino_icebomb.xml"
    inst.components.inventoryitem:SetSinks(true)		--落水直接消失

    inst:AddComponent("equippable")     --可装备
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.equipstack = true        --可堆叠装备

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM   --最大堆叠40个

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(10, 13)

    inst:AddComponent("complexprojectile")
    inst.components.complexprojectile:SetHorizontalSpeed(15)
    inst.components.complexprojectile:SetGravity(-35)
    inst.components.complexprojectile:SetLaunchOffset(Vector3(0.25, 1, 0))
    inst.components.complexprojectile:SetOnLaunch(OnThrown)
    inst.components.complexprojectile:SetOnHit(OnHit)


    --MakeHauntableLaunch(inst) --可被鬼魂作祟并能够弹起来
    return inst
end

return Prefab("yoshino_icebomb", fn, assets, prefabs)