require("stategraphs/commonstates")

local actionhandlers =
{
    --ActionHandler(ACTIONS.PICKUP, "doshortaction"),
    --ActionHandler(ACTIONS.EAT, "eat"),
    --ActionHandler(ACTIONS.CHOP, "chop"),
    --ActionHandler(ACTIONS.PICKUP, "pickup"),
}

local function go_to_idle(inst)
    inst.sg:GoToState("idle")
end

local events=
{
    --CommonHandlers.OnStep(),
    CommonHandlers.OnLocomote(true,false),  --能跑，取消走的功能
    --CommonHandlers.OnSleepEx(),
    --CommonHandlers.OnWakeEx(),
    --CommonHandlers.OnFreeze(),
	--CommonHandlers.OnElectrocute(),
	--EventHandler("doattack", function(inst, data)
	--		inst.sg:GoToState("attack", data.target)
	--end),
	--EventHandler("attacked", function(inst, data)
	--end),
}

local states=
{
    State{
        name = "idle",
        tags = {"idle", "canrotate"},

        onenter = function(inst, pushanim)
            inst.components.locomotor:StopMoving()
            if not inst.AnimState:IsCurrentAnimation("idle_loop") then
                inst.AnimState:PlayAnimation("idle_loop", true)
            end
            inst.sg:SetTimeout(6)   --由于RPC那边设置了延迟两秒后，执行setleader，因此这里超时必须大于 2 秒
        end,

        --timeline = {},

        ontimeout = function(inst)
            --inst.sg:GoToState("idle")
            inst:DoTaskInTime(0,
                function()
                    if inst.components.follower and inst.components.follower:GetLeader() == nil then
                        inst.sg:GoToState("despawn")
                    else
                        inst.sg:GoToState("idle")
                    end
                end
            )
        end
    },
    State{
        name = "beg", --背东西
        tags = {"canrotate"},

        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("idle_loop")
        end,

        timeline=
        {
            TimeEvent(6*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/beefalo/beg") end),
        },

        events=
        {
            EventHandler("animqueueover",  go_to_idle),
        },
    },

    State{
        name = "run_start",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_pre")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("run")
            end),
        },
    },

    State{
        name = "run",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("run_loop" , true)
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
        end,

        --timeline = {},

        ontimeout = function(inst)
            inst.sg:GoToState("run")
        end,
    },

    State{
        name = "run_stop",
        tags = { "idle" },

        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("run_pst")
        end,

        events =
        {
            EventHandler("animover", go_to_idle),
        },
    },
    State { --此状态为消失
        name = "despawn",
        tags = { "busy", "nointerrupt", "dead" },

        onenter = function(inst, pushanim)
            inst.components.locomotor:StopMoving()
            --inst.Physics:Stop()
            inst.AnimState:PlayAnimation("despawn", false) --播放消失动画
            RemovePhysicsColliders(inst)                   -- 移除物理碰撞器
        end,
        events = {
            EventHandler("animover", function (inst)
                if inst.components.follower.leadrer then inst.components.follower.leadrer:PushEvent("remove_zadkiel") end
                inst:DoTaskInTime(0, inst.Remove)
            end)
        },
        --onexit = function(inst)
        --    inst:DoTaskInTime(0, inst.Remove)
        --end,
    },
    State {
        name = "summon", --此状态为召唤
        tags = { "busy", "idle" },
        onenter = function(inst, pushanim)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("summon", false)
            --inst.AnimState:PushAnimation("zadkiel",false)
            --inst.AnimState:SetDeltaTimeMultiplier(0.6) --设置动画播放的倍速
        end,
        --timeline = {
        --    TimeEvent(3 * FRAMES, function(inst)
        --        inst.AnimState:SetMultColour(1, 1, 1, 1)
        --    end),
        --},
        events = {
            EventHandler("animover", go_to_idle)
        }
    },
}



CommonStates.AddVoidFallStates(states)

CommonStates.AddIpecacPoopState(states)


return StateGraph("yoshino_zadkiel", states, events, "idle", actionhandlers)

