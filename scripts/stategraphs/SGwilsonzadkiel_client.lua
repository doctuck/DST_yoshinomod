
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
    State{
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
    State{
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
    State{
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
    State{
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
    --[[ClientCommonState(
        "dragonfly_taunt",
        {"doing", "busy"},
        {"dragonfly_taunt_pre", "dragonfly_taunt"}
    ),--]]
}

for _, state in ipairs(states) do
    AddStategraphState("wilson_client", state)
end

for _, actionhandler in ipairs(actionhandlers) do
    AddStategraphActionHandler("wilson_client", actionhandler)
end

--AddStategraphPostInit("wilson_client", function(sg)
--
--end)
