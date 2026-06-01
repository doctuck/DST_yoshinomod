--|**********************************|
--|***这个文件将包含动作和RPC句柄内容***|
--|**********************************|


--回收冰结傀儡
local REBACK_ZADKIEL =  Action({ mount_valid = false, priority = 99 }) --mount_valid意思是是否可在骑行时使用该动作，priority表示优先级
REBACK_ZADKIEL.id = "REBACK_ZADKIEL"
REBACK_ZADKIEL.strfn = function(act)
    --这里固定只有act一个参数，它是BufferedAction类(这个类可以在bufferedaction.lua里看到具体定义)的一个实体，根据组件动作处理器的不同，act的数据会有变化。
    --总的来说常用于函数操作的有4个数据doer,target,invobject,pos
    --doer就是动作的执行方，target就是动作的目标，
    --invobject就是动作执行时对应的物品，比如说EAT这个动作，invobject就是要吃的东西
    --pos就是动作执行的地点，对地面执行的动作会用到这个数据。
    --这里可以返回动作的执行名称，但存放名称的表必须放在 AddAction(动作ID) 方法之后，否则无法显示甚至崩溃报错
    return "RECYCLE"
end

REBACK_ZADKIEL.fn = function (act)
    local doer = act.doer
    local target = act.target
    if (doer.components.rider and not doer.components.rider:IsRiding()) and --玩家没在骑乘状态
        (target.components.follower and (target.components.follower:GetLeader() == doer))  --自己是该坐骑的召唤者
    then
        target.sg:GoToState("despawn")
        if doer.components.spiritual_energy then
            doer.components.spiritual_energy:DoDelta(TUNING.YOSHINOCONFIG.zadkiel_cost * 0.5)
        end
        if doer.zadkiel then doer.zadkiel = nil end
        return true
    end
    return false
end

AddAction(REBACK_ZADKIEL) --加入动作于服务器
STRINGS.ACTIONS.REBACK_ZADKIEL = {
    RECYCLE = "回收",
}

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.REBACK_ZADKIEL, "give"))        --联机版和单机版都需要写的,第一个参数不能改（最后一个dolongaction参数可在官方data/databundles/scripts/stategraphsSGwilson.lua中查看更多）
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.REBACK_ZADKIEL, "give")) --只有联机版需要写，第一个参数不能改

--系统定义的场景有5个，可以在componentactions.lua中找到，分别使用不同的参数
--SCENE：参数inst, doer, actions, right。这一场景指的是在游戏主界面上对着实体的操作。比如右键点击收获浆果。
--USEITEM：参数inst, doer, target, actions, right。这一场景是选取一件物品，再点击地图上的东西或装备栏的物品，比如给篝火添加燃料 
--POINT：参数inst, doer, pos, actions, right。这一场景指的是对地图上任意一点执行的操作，比如装备传送法杖后，你可以右键点击地板，传送过去。
--EQUIPPED：参数inst, doer, target, actions, right。这一场景指的是装备了一件物品后，可以实施的操作，比如装备斧头后可以砍树。 
--INVENTORY：参数inst, doer, actions, right。这一场景是点击物品栏执行的操作。比如右键点击物品栏里的木甲，就会自动装备到身上。
--ISVALID：参数inst, action, right。这个不是定义的场景，是用于检测动作是否合法的，我们可以忽略它。
AddComponentAction("SCENE", "rideable",  --第一个参数是动作类型， 第二个参数是关联的组件，第三个参数是调用的函数
    function(inst, doer, actions, right)
        --该函数内部都是客机环境
        if inst.prefab == "yoshino_zadkiel" and doer:HasTag("yoshino") and not right then
            --备注：该动作优先级较高，会占用“检查”动作(但不占用强制检查)
            table.insert(actions, ACTIONS.REBACK_ZADKIEL)   --插入到官方的动作执行表中，这样就能显示动作
        end
    end
)

--用于将神威灵装·四番反转
local DETERIORATION = Action({mount_valid = true})
DETERIORATION.id = "DETERIORATION"
DETERIORATION.strfn = function(act)
    return act.target.prefab == "yoshino_elyonban" and "REVERSE" or "HUFU"
end

DETERIORATION.fn = function (act)
    local doer = act.doer
    local obj = act.invobject
    local target = act.target

    --装备中不能反转
    if target.components.equippable and target.components.equippable:IsEquipped() then
        return false
    end

    local item = target:HasTag("yoshino_elyonban") and DebugSpawn("yoshino_elfz") or DebugSpawn("yoshino_elyonban")
    if (target.components.stackable ~= nil and target.components.stackable:StackSize() >= 1) and
        (obj.components.stackable ~= nil and obj.components.stackable:StackSize() >= 1) then --如果是可堆叠物品

        target.components.stackable:Get():Remove()  --移除指定数量，默认为1
        obj.components.stackable:Get(1):Remove()
        doer.components.inventory:GiveItem(item)    --给予反转形态的灵装
        return true
    elseif target.components.stackable == nil and  --如果不可堆叠，则该物品全部移除
        (obj.components.stackable ~= nil and obj.components.stackable:StackSize() >= 1) then

        target:Remove()
        obj.components.stackable:Get(1):Remove()
        doer.components.inventory:GiveItem(item)    --给予反转形态的灵装
        return true
    elseif obj.components.stackable == nil and  --如果不可堆叠，则该物品全部移除
        (target.components.stackable ~= nil and target.components.stackable:StackSize() >= 1) then

        obj:Remove()
        target.components.stackable:Get(1):Remove()
        doer.components.inventory:GiveItem(item)    --给予反转形态的灵装
        return true
    elseif obj.components.stackable == nil and target.components.stackable == nil then
        obj:Remove()
        target:Remove()
        doer.components.inventory:GiveItem(item)    --给予反转形态的灵装
        return true
    else
        print("未知原因导致反转灵装动作失败")
        return false
    end
end

AddAction(DETERIORATION)
STRINGS.ACTIONS.DETERIORATION = {
    REVERSE = "反转",
    HUIFU = "恢复",
}

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DETERIORATION, "castspellmind"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DETERIORATION, "castspellmind"))

AddComponentAction("USEITEM", "yoshino_savemoddata",
    function (inst, doer, target, actions, right)
        --例如：在USEITEM场景中，函数参数inst是手持物品，即要进行动作的物品；target是被进行动作的目标物品，doer是动作的执行者，就是玩家
        if (inst.prefab == "yoshino_anticrystal" or inst.prefab == "yoshino_crystal") and target.prefab == "yoshino_elyonban" then
            table.insert(actions, ACTIONS.DETERIORATION)
        end
    end
)


--[[以下是RPC部分]]
--rpc中，分为AddModRPCHandler和SendModRPCToServer两个部分
--AddModRPCHandler是服务端接收消息的部分，SendModRPCToServer是客户端向服务端发送消息部分
--AddModRPCHandler参数1是mod名称，参数2是动作id，参数3是收到消息后要执行的函数，函数中第一个参数固定是玩家实体，第二个参数是客户端发送过来的数据
--另外还有SendModRPCToClient(CLIENT_MOD_RPC["自定义字符串1"]["自定义字符串2"],player.userid,data)，是服务端向客户端发送消息的方法，搭配的有AddClientModRPCHandler("自定义字符串1","自定义字符串2",fuction(player,data)end)
AddModRPCHandler("yoshinomod", "call_zadkiel", function(inst, data) --服务端受到消息后

    
    local actor = inst
    local zadkiel = nil
    local x, y, z = inst.Transform:GetWorldPosition()   --获取玩家的位置
    local need_spiritual_energy = TUNING.YOSHINOCONFIG.zadkiel_cost

    --判断所需灵力是否足够
    if actor.components.spiritual_energy ~= nil and actor.components.spiritual_energy:GetCurrent() > need_spiritual_energy then
        --判断是否已存在
        if actor.zadkiel == nil then
            zadkiel = SpawnPrefab("yoshino_zadkiel")
            zadkiel.Transform:SetPosition(x + 4, y, z)
            zadkiel.Transform:SetRotation(math.random() * TWOPI)
            zadkiel.sg:GoToState("summon")
            --local zadkielx, zadkiely, zadkielz = zadkiel.Transform:GetWorldPosition()
            --print(zadkiel:GetDisplayName(), "生成成功，在位置：", zadkielx, zadkiely, zadkielz) --日志调试用的
            actor.components.spiritual_energy:DoDelta(-need_spiritual_energy)   --召唤成功后扣除对应灵力

            inst:DoTaskInTime(1,function()  --延迟1秒是为了保证加载成功
                zadkiel.components.follower:SetLeader(actor)
                actor.zadkiel = zadkiel
            end)
            actor.components.talker:Say(STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_ZADKIEL)
        else
            if actor.zadkiel ~= nil and actor.zadkiel:IsValid() then
                actor.zadkiel.Physics:Teleport(x,y,z)
            elseif actor.zadkiel ~= nil and not actor.zadkiel:IsValid() then
                actor.zadkiel = nil
            end
        end
    else
        --灵力不足时触发提示
        actor.components.talker:Say(STRINGS.CHARACTERS.YOSHINO.ANNOUNCE_REIRYOKU.SHORTAGE)
    end
end)