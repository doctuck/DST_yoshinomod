local function Temp_ToggleOffPhysics(inst)
	inst.sg.statemem.isphysicstoggle = true
	inst.Physics:SetCollisionMask(COLLISION.GROUND)
end
local function Temp_ToggleOnPhysics(inst)
	inst.sg.statemem.isphysicstoggle = nil
	inst.Physics:SetCollisionMask(
		COLLISION.WORLD,
		COLLISION.OBSTACLES,
		COLLISION.SMALLOBSTACLES,
		COLLISION.CHARACTERS,
		COLLISION.GIANTS
	)
end

--local ZADKIEL_AOE_MUST_TAGS = { "_combat" }
--local ZADKIEL_AOE_CANT_TAGS = { "INLIMBO", "wall", "companion", "flight", "invisible", "notarget", "noattack" }

local SKILL_CANT_TAGS = { "INLIMBO", "invisible", "playerghost", "companion" } --不会被技能攻击的标签
local hitradius = 1                                                            --命中判定半径

local function TryShadowBlinkHit(inst, v, startpos, dx, dz, len_sq)
	if v == inst or not v:IsValid() then
		return
	end

	local vx, _, vz = v:GetPosition():Get()
	local t = ((vx - startpos.x) * dx + (vz - startpos.z) * dz) / len_sq --计算实体在路径上的归一化投影位置

	if t <= 0 or t >= 1 then	--归一化后，不在范围内的视为未命中
		return
	end

	local projx, projz = startpos.x + t * dx, startpos.z + t * dz

	if (vx - projx) * (vx - projx) + (vz - projz) * (vz - projz) > hitradius ^ 2 then
		return
	end

	if v.components.health ~= nil and not v.components.health:IsDead() then
		if v.components.combat ~= nil then
			v.components.combat:GetAttacked(inst, 0, nil, nil, {planar = TUNING.MOD_YOSHINO.YOSHINON.ten_damage})
		else
			v.components.health:DoDelta(-TUNING.MOD_YOSHINO.YOSHINON.ten_damage, nil, "yoshinon_skill", nil, inst)
		end
	end
	if v:IsValid() and v.components.freezable then
		v.components.freezable:Freeze(5)		--强制冻结5秒
	end
	--如果目标有可工作组件，将其摧毁
	if v:IsValid() and v.components.workable ~= nil and v.components.workable:CanBeWorked() then
		--v.components.workable:WorkedBy_Internal(inst, 10)
		v.components.workable:Destroy(v)
	end
	inst.SoundEmitter:PlaySound("dontstarve/common/break_iceblock")
end

local function DoShadowBlinkEffect(inst, startpos, endpos)
	local dx, dz = endpos.x - startpos.x, endpos.z - startpos.z
	local len_sq = dx * dx + dz * dz
	--位移太小就没意义
	if len_sq < 0.0001 then
		return
	end
	local radius = math.sqrt(len_sq) * 0.5 + 1                                       --搜索半径，多+1是为了包括边缘上的
	local find_x, find_z = (startpos.x + endpos.x) * 0.5, (startpos.z + endpos.z) * 0.5 --搜索点，取本次位移矩形的中心点


	--没开启pvp就将玩家视为安全范围
	if not TheNet:GetPVPEnabled() then
		table.insert(SKILL_CANT_TAGS, "player")
	end

	--先圆形遍历，再精筛
	for _, v in ipairs(TheSim:FindEntities(find_x, 0, find_z, radius, nil, SKILL_CANT_TAGS)) do
		TryShadowBlinkHit(inst, v, startpos, dx, dz, len_sq)
	end
end


local actionhandlers = {}


local states = {
	State {
		name = "mount_zadkiel_run_start",
		tags = { "moving", "running", "canrotate", "autopredict", "noslip" },

		onenter = function(inst)
			inst.sg.mem.footsteps = 0

			inst.components.locomotor:RunForward()
			inst.AnimState:PlayAnimation("run_zadkiel_pre")
			--inst.sg:SetTimeout(0.5)
		end,

		onupdate = function(inst)
			inst.components.locomotor:RunForward()
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("mount_zadkiel_run")
				end
			end),
		},
		--ontimeout = function(inst)
		--    inst.sg:GoToState("mount_zadkiel_run")
		--end,
	},
	State {
		name = "mount_zadkiel_run",
		tags = { "moving", "running", "canrotate", "autopredict", "noslip" },

		onenter = function(inst)
			inst.components.locomotor:RunForward()
			if not inst.AnimState:IsCurrentAnimation("run_zadkiel_loop") then
				inst.AnimState:PlayAnimation("run_zadkiel_loop", true)
			end

			inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
		end,

		onupdate = function(inst)
			inst.components.locomotor:RunForward()
		end,

		ontimeout = function(inst)
			inst.sg:GoToState("mount_zadkiel_run")
		end,
	},
	State {
		name = "mount_zadkiel_run_stop",
		tags = { "canrotate", "idle", "autopredict", "noslip" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("run_zadkiel_pst")
			--inst.sg:SetTimeout(0.5)
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		},
		--ontimeout = function(inst)
		--    inst.sg:GoToState("mounted_idle")
		--end,
	},
	State {
		name = "mount_zadkiel",
		tags = { "doing", "busy", "nomorph", "nopredict" },

		onenter = function(inst)
			inst.sg.statemem.heavy = inst.components.inventory:IsHeavyLifting()

			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation(inst.sg.statemem.heavy and "heavy_mount" or "mount")

			if inst.components.playercontroller ~= nil then
				inst.components.playercontroller:Enable(false)
			end
		end,

		timeline =
		{
			--Heavy lifting
			TimeEvent(12 * FRAMES, function(inst)
				if inst.sg.statemem.heavy then
					inst.SoundEmitter:PlaySound("dontstarve/beefalo/saddle/dismount")
				end
			end),
			--Heavy lifting
			TimeEvent(38 * FRAMES, function(inst)
				if inst.sg.statemem.heavy then
					inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt")
				end
			end),
			--Normal
			TimeEvent(20 * FRAMES, function(inst)
				if not inst.sg.statemem.heavy then
					inst.SoundEmitter:PlaySound("dontstarve/beefalo/saddle/dismount")
					inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt")
				end
			end),
		},

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("mounted_idle")
				end
			end),
		},

		onexit = function(inst)
			if inst.components.playercontroller ~= nil then
				inst.components.playercontroller:Enable(true)
			end
		end,
	},
	State {
		--V2C: This is currently used ONLY for heavy pickup while mounted.
		name = "zadkiel_dodismountaction",
		tags = { "doing", "busy", "nomorph", "dismounting" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("mount_zadkiel_off" or "idle_loop")
		end,

		--timeline =
		--{
		--    TimeEvent(15*FRAMES, function(inst)
		--        inst.SoundEmitter:PlaySound("dontstarve/beefalo/saddle/dismount")
		--    end),
		--},

		events =
		{
			EventHandler("animover", function(inst)
				if not inst:PerformBufferedAction() then
					inst.sg:GoToState("idle")
				end
			end),
		},

		onexit = function(inst)
			--V2C: Exepcted to trigger PICKUP action => heavylifting_mount_start
			if not inst.sg.statemem.keepmount then
				inst.components.rider:ActualDismount()
			end
		end,
	},
	State {
		name = "shadow_blink_pre",
		tags = { "busy", "nointerrupt", "nomorph", "nodangle" },

		onenter = function(inst)
			inst.components.locomotor:Stop()

			local action = inst:GetBufferedAction()
			local dest = action ~= nil and (action:GetActionPoint() or (action.target ~= nil and action.target:GetPosition())) or nil
			if dest == nil then
				inst.sg:GoToState("idle")
				return
			end

			--inst:ClearBufferedAction()
			inst.sg.statemem.startpos = inst:GetPosition()
			inst.sg.statemem.dest = dest

			inst:ForceFacePoint(dest:Get())
			inst.AnimState:PlayAnimation("pickup", false)

			if not inst:PerformBufferedAction() then
        		inst.sg:GoToState("idle")
       			return
    		end
			if inst.components.drownable then
                inst.components.drownable.enabled = false
            end
			if not inst:HasTag("blink_invincible_from_yoshinon") then
				inst:AddTag("blink_invincible_from_yoshinon")
			end
		end,

		onupdate = function(inst)
			if not inst.sg.statemem.moving then
				return
			end

			local x, _, z = inst.Transform:GetWorldPosition()
			local dx, dz = inst.sg.statemem.dest.x - x, inst.sg.statemem.dest.z - z
			local dist_sq = dx * dx + dz * dz
			if dist_sq <= .25
				or (inst.sg.statemem.last_dist_sq ~= nil and dist_sq >= inst.sg.statemem.last_dist_sq)
			then
				inst.sg.statemem.moving = nil
				inst.sg:GoToState("shadow_blink_pst", {
					startpos = inst.sg.statemem.startpos,
					endpos = inst:GetPosition(),
				})
			else
				inst.sg.statemem.last_dist_sq = dist_sq
				inst.Physics:SetMotorVel(20, 0, 0)
			end
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() and inst.AnimState:IsCurrentAnimation("pickup") then
					local startpos, dest = inst.sg.statemem.startpos, inst.sg.statemem.dest
					local dx, dz = dest.x - startpos.x, dest.z - startpos.z
					local len = math.sqrt(dx * dx + dz * dz)
					if len > 0.0001 then
						local rot = math.atan(-dz, dx) * RADIANS
						for dist = 1, len - 0.001, 1 do
							local fx = SpawnPrefab("deerclops_icespike_fx")
							fx:SetFXOwner(inst)
							fx.Transform:SetPosition(startpos.x + dx * dist / len, 0, startpos.z + dz * dist / len)
							fx.Transform:SetRotation(rot)
							fx:RestartFX(false, 1)
						end
					end
					Temp_ToggleOffPhysics(inst)
					inst.sg.statemem.moving = true
					inst:Hide()
					inst.DynamicShadow:Enable(false)
					inst.Physics:SetMotorVel(20, 0, 0)
				end
			end),
		},

		onexit = function(inst)
			inst:RemoveTag("blink_invincible_from_yoshinon")
			if inst.sg.statemem.isphysicstoggle then
				Temp_ToggleOnPhysics(inst)
			end
			inst.Physics:Stop()
			inst:Show()
			inst.DynamicShadow:Enable(true)
		end,
	},

	State {
		name = "shadow_blink_pst",
		tags = { "busy", "nointerrupt", "nomorph", "nodangle" },

		onenter = function(inst, data)
			if data == nil then
				inst.sg:GoToState("idle")
				return
			end

			inst.components.locomotor:Stop()
			if not inst:HasTag("blink_invincible_from_yoshinon") then
				inst:AddTag("blink_invincible_from_yoshinon")
			end
			inst:Show()
			inst.DynamicShadow:Enable(true)
			inst.sg.statemem.startpos = data.startpos
			inst.sg.statemem.endpos = data.endpos
			DoShadowBlinkEffect(inst, inst.sg.statemem.startpos, inst.sg.statemem.endpos)

			inst.AnimState:PlayAnimation("pickup_pst", false)

		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					if inst.components.drownable then
                		inst.components.drownable.enabled = true
            		end
					inst.sg:GoToState("idle")
				end
			end),
		},

		onexit = function(inst)
			inst:RemoveTag("blink_invincible_from_yoshinon")
			inst.Physics:Stop()
			inst:Show()
			inst.DynamicShadow:Enable(true)
		end,
	},

}

for _, state in ipairs(states) do
	AddStategraphState("wilson", state)
end

for _, actionhandler in ipairs(actionhandlers) do
	AddStategraphActionHandler("wilson", actionhandler)
end

AddStategraphPostInit("wilson", function(sg)
	--骑乘冰结傀儡时免疫击飞
	local knockback_fn = sg.events.knockback.fn
	sg.events.knockback.fn = function(inst, data)
		local rider = inst.replica.rider
		local mount = rider and rider:GetMount()
		if not mount or not mount:HasTag("yoshino_zadkiel") then
			return knockback_fn(inst, data)
		end

		local _GoToState = inst.sg.GoToState
		inst.sg.GoToState = function(self, state, ...)
			return _GoToState(self, "hit", ...)
		end

		knockback_fn(inst, data)

		inst.sg.GoToState = _GoToState
	end

	-- zadkiel_mount(如果骑乘目标是冰结傀儡，则进入这边)
	local mount_onenter = sg.states.mount.onenter
	sg.states.mount.onenter = function(inst, ...)
		local zadkiel = inst.components.rider.target_mount and
			inst.components.rider.target_mount:HasTag("yoshino_zadkiel")
		if zadkiel then
			inst.sg:GoToState("mount_zadkiel")
		else
			return mount_onenter(inst, ...)
		end
	end

	--hook使用折扇时的状态
	local oldusefan = sg.states.use_fan.onenter
	sg.states.use_fan.onenter = function(inst, ...)
		local invobject = nil
		if inst.bufferedaction ~= nil then
			invobject = inst.bufferedaction.invobject
			if invobject ~= nil and invobject.components.fan ~= nil and invobject.components.fan:IsChanneling() then
				inst.sg.statemem.item = invobject
				inst.sg.statemem.target = inst.bufferedaction.target or inst.bufferedaction.doer
				inst.sg:AddStateTag("busy")
			end
		end
		inst.components.locomotor:Stop()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:PushAnimation("fan", false)
		local skin_build = invobject ~= nil and invobject:GetSkinBuild() or nil
		local src_symbol = invobject ~= nil and invobject.components.fan ~= nil and
			invobject.components.fan.overridesymbol or "swap_fan"
		if skin_build ~= nil then
			inst.AnimState:OverrideItemSkinSymbol("fan01", skin_build, src_symbol, invobject.GUID, "fan")
		else
			inst.AnimState:OverrideSymbol("fan01", invobject ~= nil and invobject.AnimState:GetBuild() or "fan", src_symbol)
			--else  --原版用法纯傻，不让人换build内容
			--    inst.AnimState:OverrideSymbol( "fan01", "fan", src_symbol )
		end
		inst.components.inventory:ReturnActiveActionItem(invobject)
	end
end)
