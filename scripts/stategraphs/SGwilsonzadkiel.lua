
local actionhandlers = {
}

local ZADKIEL_AOE_MUST_TAGS = { "_combat" }
local ZADKIEL_AOE_CANT_TAGS = { "INLIMBO", "wall", "companion", "flight", "invisible", "notarget", "noattack" }

local states = {
    State{
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
    State{
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
    State{
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
    State{
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
    State{
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
        local zadkiel = inst.components.rider.target_mount and inst.components.rider.target_mount:HasTag("yoshino_zadkiel")
        if zadkiel then
            inst.sg:GoToState("mount_zadkiel")
        else
            return mount_onenter(inst, ...)
        end
    end

end)
