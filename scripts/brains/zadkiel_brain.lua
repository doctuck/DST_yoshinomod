require "behaviours/follow"     --跟随行为节点
require "behaviours/doaction"   --做动作行为节点
require "behaviours/wander"     --徘徊行为节点
require "behaviours/faceentity" --盯着你行为节点

local MIN_FOLLOW_DIST = 0
local MAX_FOLLOW_DIST = 10
local TARGET_FOLLOW_DIST = 4

local function ShouldGotoLeader(inst)
    if not inst.goto_leader then
        return false
    end
    local leader = inst.components.follower.leader
    if not (leader and leader:IsValid()) then
        inst.goto_leader = false
        return false
    end
    return true
end

local function GetLeaderPos(inst)
    local leader = inst.components.follower.leader
    if leader and leader:IsValid() then
        return leader:GetPosition()
    else
        return inst:GetPosition()
    end
end

local function GetLeader(inst)
    return inst.components.follower ~= nil and inst.components.follower.leader or nil
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower ~= nil and inst.components.follower.leader == target
end

local ZadkielBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function ZadkielBrain:OnInitializationComplete()
    self.inst.components.knownlocations:RememberLocation("spawnpoint", self.inst:GetPosition(), true)
end

function ZadkielBrain:OnStart()
    local inst = self.inst
    -- GotoLeader
    local GotoLeader = WhileNode(
        function()
            return ShouldGotoLeader(inst)
        end,
        "GotoLeader",
        --Sequence：次序节点（与门，所有成功才成功，一直运行，遇到失败）
            --从左到右执行子节点
            --一旦有节点返回失败，则父节点返回失败
            --所有节点返回成功，父节点才返回成功
        SequenceNode{
            ActionNode(function() inst.components.combat:SetTarget(nil) end),
            ParallelNodeAny{
                WaitNode(4), -- TIMEOUT
                SequenceNode{
                    Leash(inst, GetLeaderPos, 0, 2, false), --走向领头的位置
                    ActionNode(function() inst.components.locomotor:Stop() end),    --走到后停下
                    WaitNode(0.5),  --等待0.5秒，退出该次序节点
                },
            },
            ActionNode(function() inst.goto_leader = false end),
        }
    )

    local root = PriorityNode(
    {
        GotoLeader, --行为：走向领头
        Follow(inst, function() return inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),--行为：跟随
        FaceEntity(self.inst, GetLeader, KeepFaceTargetFn), --行为：面向目标
        
    },
    .25) --这里的数字是脑子每0.25秒检索一次bt，也就是脑袋的灵敏度
    self.bt = BT(self.inst, root)   --封装到行为树
end


return ZadkielBrain
