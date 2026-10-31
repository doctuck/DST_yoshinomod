local actionhandlers = {
}

--[[local function ClientCommonState(name, tags, server_states)
    return State({
        name = name,
        tags = tags,
        server_states = server_states,

        onenter = function(inst)
            if inst.components.locomotor then
                inst.components.locomotor:Stop()
            end
            inst.sg:SetTimeout(2)
            inst:PerformPreviewBufferedAction()
        end,

        onupdate = function(inst)
            if inst.sg:ServerStateMatches() then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("idle", true)
        end,
    })
end--]]



local states = {
	State {
		name = "mount_zadkiel_run_start",
		tags = { "moving", "running", "canrotate" },

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
		tags = { "moving", "running", "canrotate" },

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
		tags = { "canrotate", "idle" },

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
		--V2C: This is currently used ONLY for heavy pickup while mounted.
		name = "zadkiel_dodismountaction",
		tags = { "doing", "busy", "nomorph", "dismounting" },
		server_states = { "zadkiel_dodismountaction" },

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
		tags = { "busy" },
		server_states = { "shadow_blink_pre", "shadow_blink_pst" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("pickup")

			local action = inst:GetBufferedAction()
			if action ~= nil then
				inst:PerformPreviewBufferedAction()
				if action:GetActionPoint() ~= nil then
					inst:ForceFacePoint(action:GetActionPoint():Get())
				end
			end
			if not inst:HasTag("blink_invincible_from_yoshinon") then
				inst:AddTag("blink_invincible_from_yoshinon")
			end

			inst.sg:SetTimeout(2)
		end,

		onupdate = function(inst)
			if inst.sg:ServerStateMatches()
				and inst.player_classified.currentstate:value() == hash("shadow_blink_pst")
			then
				inst.sg:GoToState("shadow_blink_pst")
			elseif inst.bufferedaction == nil and not inst.sg:ServerStateMatches() then
				inst.sg:GoToState("idle")
			end
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() and inst.AnimState:IsCurrentAnimation("pickup") then
					inst:Hide()
					inst.DynamicShadow:Enable(false)
				end
			end),
		},

		ontimeout = function(inst)
			inst:ClearBufferedAction()
			inst.sg:GoToState("idle")
		end,

		onexit = function(inst)
			inst:RemoveTag("blink_invincible_from_yoshinon")
			inst:Show()
			inst.DynamicShadow:Enable(true)
		end,
	},

	State {
		name = "shadow_blink_pst",
		tags = { "busy" },
		server_states = { "shadow_blink_pst" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			if not inst:HasTag("blink_invincible_from_yoshinon") then
				inst:AddTag("blink_invincible_from_yoshinon")
			end
			inst:Show()
			inst.DynamicShadow:Enable(true)
			inst.AnimState:PlayAnimation("pickup_pst")
			inst.sg:SetTimeout(2)
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() and inst.AnimState:IsCurrentAnimation("pickup_pst") then
					inst.sg:GoToState("idle")
				end
			end),
		},

		ontimeout = function(inst)
			inst:RemoveTag("blink_invincible_from_yoshinon")
			inst.sg:GoToState("idle")
		end,
	},
}

for _, state in ipairs(states) do
	AddStategraphState("wilson_client", state)
end

for _, actionhandler in ipairs(actionhandlers) do
	AddStategraphActionHandler("wilson_client", actionhandler)
end

--AddStategraphPostInit("wilson_client", function(sg)
--end)
