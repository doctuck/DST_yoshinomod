--资源加载
local assets = {
    Asset("IMAGE", "images/inventoryimages/yoshinon.tex"), --物品栏贴图
    Asset("ATLAS", "images/inventoryimages/yoshinon.xml"),
    Asset("ANIM", "anim/yoshinon.zip"),                    --放地上时的动画
    Asset("ANIM", "anim/yoshinon_skin1.zip"),           --四糸奈的皮肤
    Asset("ANIM", "anim/yoshinon_skin2.zip"),
}
--添加预制物的预制物
local prefabs = {"yoshino_snowball_project"}

local skill_table = require("util/yoshinon_lvlists")		--导入四糸奈各等级功能列表

local function check_upgrade(inst, data)
	if inst.components.yoshinon_upgrade == nil then
		return
	end
	local level = inst.components.yoshinon_upgrade:GetLevel()

	--执行表中的函数进行附加升级效果
	if type(data) ~= "table" and data == true then
		for i = 1, level do
			if skill_table[i].skillfn ~= nil then
				skill_table[i].skillfn(inst)
			end
		end
	else
		if skill_table[level].skillfn ~= nil then
			skill_table[level].skillfn(inst)
		end
	end
end


local function onownereat(inst, data)
	if data ~= nil and data.food ~= nil and data.food.components.edible then
		--如果吃的是好东西类料理则经验加二
		if data.food.components.edible.foodtype == FOODTYPE.GOODIES then
			inst.components.yoshinon_upgrade:Upexp(2)
		end
	end
end

local function onownersleep(inst, data)
	if inst.ownersleep_task ~= nil then
		inst.ownersleep_task:Cancel()
		inst.ownersleep_task = nil
	end
	if data.state then	--只有睡眠才创建周期任务(每3秒+2经验)
		inst.ownersleep_task = inst:DoPeriodicTask(1.5,function ()
			inst.components.yoshinon_upgrade:Upexp()
		end)
	end
end

local function onkillother(inst, data)
	if data ~= nil and data.target ~= nil then
		--击杀的是巨兽则经验+20
		if data.target:HasTag("epic") then
			inst.components.yoshinon_upgrade:Upexp(20)
		end
	end
end

local function onownerfish(inst, data)
	if data ~= nil and data.target ~= nil then
		--钓到的鱼：小孔雀鱼、花朵金枪鱼、炽热太阳鱼、落叶比目鱼、冰鲷鱼、花锦鲤、金锦鲤、小饵鱼
		local canup = {"oceanfish_small_1", "oceanfish_small_7", "oceanfish_small_8", "oceanfish_small_6", "oceanfish_medium_8", "oceanfish_medium_6", "oceanfish_medium_7", "oceanfish_small_3"}
		if table.contains(canup, data.target.prefab) then
			inst.components.yoshinon_upgrade:Upexp(10)
		else
			inst.components.yoshinon_upgrade:Upexp()
		end
	end
end

--装备时调用
local function onequip(inst, owner)

    for k, v in pairs(owner.components.inventory.equipslots) do
        if v.prefab == "yoshino_sirvon" then
            owner.components.inventory:GiveItem(owner.components.inventory:Unequip(v.components.equippable.equipslot))
        end
    end

    --[["swap_body"是交换身体位置,（通常是护甲、背包, 不是躯干）
    "swap_object"是交换手持物品, （不是手而是手中的东西）
    "hand"是手部,
    "swap_hat"是交换头部帽子,
    "swap_body_tall"是类似披风的位置（和独奏乐器同一图层）
    "arm_lower"下手臂,
    "arm_upper"上手臂,
    "hairpigtails"辫子,
    "leg"腿,
    "torso"躯干,
    "torso_pelvis"骨盆部位--]]

    owner.AnimState:ClearOverrideSymbol("swap_object")         --装备前要清空一下手持物品通道
    if inst.yoshinon_skinner then
        owner.AnimState:OverrideSymbol("hand", inst.yoshinon_skinner, "hand") --OverrideSymbol(oldsymbol, newbuild, newsymbol)参数1是替换的动画部件(通道)，2是使用的动画(材质包)，3是替换的新部件(通道)
    else
        owner.AnimState:OverrideSymbol("hand", "yoshinon", "hand")
    end
    owner.AnimState:Show("ARM_carry")                          --展示第三只手
    owner.AnimState:Hide("ARM_normal")                         --隐藏第二只手

	inst.components.equippable.spireng = -6 / 60            --装备时每分钟扣除 6 灵力
    if not owner:HasTag("yoshino") then
        inst.components.equippable.dapperness = 6 / 60  --每分钟恢复6理智
    elseif owner:HasTag("yoshino") then                 --四糸乃装备四糸奈时
        inst.components.equippable.dapperness = 24 / 60 --每分钟恢复24理智
        inst.Light:Enable(true)                         --开启光源
        if inst.components.container ~= nil then        --开启容器
            inst.components.container:Open(owner)
        end
    end

	--四糸奈7级给四糸乃降低饥饿速度
	if inst.components.yoshinon_upgrade and owner:HasTag("yoshino") then
		local level = inst.components.yoshinon_upgrade:GetLevel()
		if owner.components.hunger ~= nil and level >= 7 then
        	owner.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.MOD_YOSHINO.YOSHINON.hungerrate, "yoshinon_skill")
    	end
	end


end

--卸下时调用
local function onunequip(inst, owner)
    local player_build = owner.AnimState:GetBuild() --用作保险，卸下时会使用原本的材质包(含皮肤)，而不是只能使用默认材质包

    inst.components.equippable.spireng = 0          --卸下时不扣除灵力(通过挂载实现)

    owner.AnimState:ClearOverrideSymbol("hand")
    owner.AnimState:OverrideSymbol("hand", player_build, "hand")
    owner.AnimState:Show("ARM_normal")             --展示第二只手
    owner.AnimState:Hide("ARM_carry")              --隐藏第三只手
    inst.components.equippable.dapperness = 6 / 60 --卸下时常态
    inst.Light:Enable(false)                       --关闭光源
    if inst.components.container ~= nil then       --关闭容器
        inst.components.container:Close(owner)
    end
	if owner.components.hunger ~= nil then
        owner.components.hunger.burnratemodifiers:RemoveModifier(inst, "yoshinon_skill")
    end
end

--捡起时（拿在手上时也会调用该函数）
local function OnPickup(inst, owner, src_pos)
    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end
-- 扔下来时
local function OnDropped(inst)
    inst.Light:Enable(false)                       --关闭光源
    inst.components.equippable.dapperness = 0 / 60 --每分钟不再理智
end

-- 容器打开时回调
local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end

-- 容器关闭时回调
local function onclose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end


--物品的具体作用，详细信息
local function fn()
    local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

    --/////////////////////////////////////////////////////////////////////////////////////////
    --//Entity组件是在主客机端都会运行的，这部分组件必须写在网络代码片段的上面，包含以下内容：
    --//Transform：变换组件，控制Prefab的位置、方向、缩放等等。
    --//AnimState：动画组件，控制Prefab的材质(Build)，动画集合(Bank)和动画播放(Animation)。
    --//Phiysics：物理组件，控制Prefab的物理行为，比如速度，碰撞类型等等。
    --//Light：光照组件，添加该组件可使得Prefab成为一个光源。
    --//Network：网络组件，添加与否决定了一个Prefab在主机上生成时，是否会被客户端“看”到。
    --//MapEntity：地图实体组件，使用该组件可以为Prefab在小地图上创建一个图标。
    --//SoundEmitter：声音组件，控制Prefab的声音集合和播放。
    --//添加一个Entity组件的代码是inst.entity:AddXXX()
    --/////////////////////////////////////////////////////////////////////////////////////////

    inst.entity:AddTransform()                                            --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                                            --添加动画状态
    inst.entity:AddSoundEmitter()                                         --添加声音组件
    inst.entity:AddNetwork()                                              --加入服务器

    local swap_data = { bank = "yoshinon", anim = "idle" }                --漂浮使用的动画
    MakeInventoryPhysics(inst)                                            --使用物品物理
    MakeInventoryFloatable(inst, "small", 0.2, 0.80, nil, nil, swap_data) --可漂浮

    inst.AnimState:SetBank("yoshinon")                                    --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshinon")                                   --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle")                                  --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名
    inst.AnimState:SetScale(1.2, 1.2, 1.2)                                --放大倍率

	--inst:AddTag("companion")				--伙伴
    inst:AddTag("amulet")       			--该物品属于护身符
    inst:AddTag("yoshinon")     			--添加物品标签
    inst:AddTag("nosteal")      			--不可被偷
    inst:AddTag("sticky_weapon")			--不脱手的武器标签
    inst:AddTag("nopunch")      			--不视为空手
    --inst:AddTag("backpack")                --该物品属于背包同类
    --inst:AddTag("fridge")                  --该物品属于冰箱同类

    inst.entity:AddLight()                               --添加光源组件
    inst.Light:SetFalloff(1)                             --光源衰减，取值(0.05~1)，衰减越高，光线传播距离越短小
    inst.Light:SetIntensity(0.8)                         --光源强度，取值(0~1)
    inst.Light:SetRadius(1.8)                            --光源半径,0.6个单位=1码
    inst.Light:Enable(false)                             --初始设置为关闭
    inst.Light:SetColour(180 / 255, 195 / 255, 50 / 255) --光源颜色

	inst._yoshinon_level = net_byte(inst.GUID, "inst._yoshinon_level","levelDirty")		--只能给容器变化使用，其他等级设置会导致断言失败最终崩溃
	inst._yoshinon_cd = net_bool(inst.GUID, "inst._yoshinon_cd", "yoshinonCddirty")		--用于 10 级时的技能冷却

    inst.entity:SetPristine()                            --同步初始化

    if not TheWorld.ismastersim then                     --主客机判断（在此行以上为主客机共有，这行之后，客机会在if中运行完并停下，只有主机和服务端才能往下走）
        inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("yoshinon_container_1")
			inst:ListenForEvent("levelDirty", function ()	--用这个事件确保晚于服务器widgetsetup执行，否则会断言失败导致崩溃
				local level = inst.replica.yoshinon_upgrade:GetLevel()
				if level >= 5 then
					inst.replica.container:WidgetSetup("yoshinon_container_5")	--设置的名字必须与服务器的同名，且必须服务器先设置，再客户端设置
				elseif level >= 2 then
					inst.replica.container:WidgetSetup("yoshinon_container_2")
				end
			end)
        end
        return inst
    end

    inst:AddComponent("inspectable") --该预设物可检查

    --加载物品图标
    inst:AddComponent("inventoryitem") --该预设物是可放进背包的物品
    inst.components.inventoryitem.imagename = "yoshinon_none"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoshinon.xml"
	inst.components.inventoryitem.keepondeath = true			--死亡不掉落
    inst.components.inventoryitem:SetOnPickupFn(OnPickup)       --拾起时调用对应函数
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)     --掉落时调用对应函数
    inst.components.inventoryitem:SetSinks(false)               --设置true可以落水，掉海里直接消失。
    inst.components.inventoryitem:SetOnPutInInventoryFn(
        function(owner)
            if owner and owner.components.talker and not owner:HasTag("yoshino") then
                owner.components.talker:Say(STRINGS.CHARACTERS.GENERIC.ANNOUNCE_PICK_YOSHINON)
            end
        end
    )


    inst:AddComponent("preserver")                          --添加回鲜组件
    inst.components.preserver:SetPerishRateMultiplier(0)     --回鲜倍率(-1~1) 1表示不回鲜,0表示永鲜,负数表示反鲜（比如设置为0.25，则放在其中的食物腐烂速度只有平时的1/4）

    inst:AddComponent("equippable")                         --该预设物是可装备的物品
    inst.components.equippable.equipslot = EQUIPSLOTS.HANDS --装备在手部
    inst.components.equippable:SetOnEquip(onequip)          --装备时使用装备函数
    inst.components.equippable:SetOnUnequip(onunequip)      --装卸时使用拆卸函数


    inst:AddComponent("waterproofer")                       --四糸奈是防水的
    inst.components.waterproofer.effectiveness = 0          --但是无法让四糸乃防水（取值0~1）


	inst:AddComponent("yoshinon_upgrade")					--四糸奈的升级组件
	inst.components.yoshinon_upgrade:InitializeLevel(TUNING.MOD_YOSHINO.YOSHINON.maxlevel)	--初始化最大等级，并默认初始等级为 1 级

	inst:ListenForEvent("yoshinon_upgrade", check_upgrade)	--监听到升级事件
	inst:ListenForEvent("yoshino_rpc_eat", onownereat)		--监听到四糸乃吃东西时发来的事件
	inst:ListenForEvent("yoshino_rpc_hitother", onkillother)--监听四糸乃击杀其他生物事件
	inst:ListenForEvent("yoshino_rpc_sleep", onownersleep)	--监听到四糸乃进入睡眠时发来的事件
	inst:ListenForEvent("yoshino_rpc_fishrod", onownerfish)	--监听四糸乃钓鱼事件
	inst:ListenForEvent("yoshino_rpc_build", function (inst, data)	--监听到四糸乃制作物品时发来的事件
		inst.components.yoshinon_upgrade:Upexp(2)
	end)

    inst:AddComponent("container")                              --添加容器组件
    -- 重要注释：WidgetSetup那个UI的名字要和容器预制物的代码名字一样，
    -- 否则就需要在客机部分添加OnEntityReplicated这段，重新在预制体内注册容器。
	inst.components.container:WidgetSetup("yoshinon_container_1") --设置容器名
    inst.components.container.onopenfn = onopen         --打开时调用函数
    inst.components.container.onclosefn = onclose       --关闭时调用函数
    inst.components.container.restrictedtag = "yoshino" --限制仅四糸乃可以打开（拥有"yoshino"标签的可以打开）


	inst:AddComponent("cooldown")						--冷却组件
	inst.components.cooldown.startchargingfn = function(inst)
	    inst._yoshinon_cd:set(true)			--标记开始冷却
	end
	inst.components.cooldown.onchargedfn = function(inst)
	    inst._yoshinon_cd:set(false)		--标记结束冷却
	end

    inst.yoshinonequip = onequip
    inst.yoshinonunequip = onunequip


	inst.OnSave = function(inst, data)
    	data.level = inst.components.yoshinon_upgrade:GetLevel()
	end
	inst.OnPreLoad = function(inst, data)
    	if TheWorld.ismastersim and inst.components.container ~= nil then
    	    if data ~= nil and data.level ~= nil then
    			local prefab = data.level >= 5 and "yoshinon_container_5"
    			    or data.level >= 2 and "yoshinon_container_2"
    			    or "yoshinon_container_1"
    			inst.components.container:WidgetSetup(prefab)
			end
    	end
	end

    inst.OnLoad = function(inst, data)
        inst:DoTaskInTime(0.5, function()   --延迟半秒，确保能获取到玩家
            --载入游戏时，如果上一次退出游戏时装备了该物品，则恢复装备的状态
            local owner = inst.components.inventoryitem.owner
            if owner and inst.components.equippable:IsEquipped() then
                onequip(inst, owner)
            end
			--重新检查已经升级的技能
			check_upgrade(inst, true)
        end)
    end

    MakeHauntableLaunch(inst) --可被鬼魂作祟并能够弹起来
    return inst
end

return Prefab("yoshinon", fn, assets, prefabs)
