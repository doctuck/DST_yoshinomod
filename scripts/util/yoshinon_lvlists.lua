--这里存放四糸奈各等级的提供的功能实现函数表

local skills = {
	{	--1级
		skillfn = function (inst, owner)
			--初始就是 1 级，此处仅占位
		end
	},
	{	--2级
		skillfn = function (inst, owner)
			if inst.components.container:IsOpen() then	--先关闭，不能开着修改
        		inst.components.container:Close()
    		end
			local items = {}	--将当前容器内的物品暂时存储
    		for i = 1, inst.components.container:GetNumSlots() do
    		    local item = inst.components.container:RemoveItemBySlot(i)
    		    if item ~= nil then
    		        items[i] = item
    		    end
    		end
			if inst.components.container:GetNumSlots() < 6 then
            	inst.components.container:WidgetSetup("yoshinon_container_2")	--正式注册新容器
        	end
    		for i, item in pairs(items) do	--将原来的物品存入新容器
    		    inst.components.container:GiveItem(item, i)
    		end
			inst._yoshinon_level:set(2)
		end
	},
	{	--3级
		skillfn = function (inst, owner)
			if inst.components.weapon == nil then
				inst:AddComponent("weapon")
			end
			inst.components.weapon:SetDamage(TUNING.MOD_YOSHINO.YOSHINON.damage_3)
			inst.components.weapon:SetRange(TUNING.MOD_YOSHINO.YOSHINON.range)
			inst.components.weapon:SetProjectile("yoshino_snowball_project")	--抛出雪球
			--inst.components.weapon:SetProjectileOffset(Vector3(1, 0.6, 0))
			inst.components.weapon:SetOnProjectileLaunched(function(weapon, attacker, target, projectile)
			    if projectile ~= nil and projectile.components.complexprojectile ~= nil and target ~= nil and target:IsValid() then
			        projectile._target = target	--将目标实体保存给抛射物上，便于自己操控
			    end
			end)
		end
	},
	{	--4级
		skillfn = function (inst, owner)
			if inst.components.preserver then
				inst.components.preserver:SetPerishRateMultiplier(-TUNING.MOD_YOSHINO.YOSHINON.fanxian)		--返鲜
			end
		end
	},
	{	--5级
		skillfn = function (inst, owner)
			if inst.components.container:IsOpen() then	--先关闭
        		inst.components.container:Close()
    		end
			local items = {}	--将当前容器内的物品暂时存储
    		for i = 1, inst.components.container:GetNumSlots() do
    		    local item = inst.components.container:RemoveItemBySlot(i)
    		    if item ~= nil then
    		        items[i] = item
    		    end
    		end
			if inst.components.container:GetNumSlots() < 9 then	--防止preload之后执行容器大变小断言失败
    			inst.components.container:WidgetSetup("yoshinon_container_5")	--正式注册新容器
			end
    		for i, item in pairs(items) do	--将原来的物品存入新容器
    		    inst.components.container:GiveItem(item, i)
    		end
			inst._yoshinon_level:set(5)
		end
	},
	{ --6级
		skillfn = function (inst, owner)
			if inst.components.weapon == nil then
				inst:AddComponent("weapon")
			end
			inst.components.weapon:SetDamage(TUNING.MOD_YOSHINO.YOSHINON.damage_6)
		end
	},
	{	--7级
		skillfn = function (inst, owner)
			--if owner and owner:IsValid() and owner.components.hunger ~= nil then
			--	local rate = owner.components.hunger.hungerrate
			--	owner.components.hunger:SetRate(rate * TUNING.MOD_YOSHINO.YOSHINON.hungerrate)
			--end
			--饥饿减缓效果不放在此处实现，麻烦
		end
	},
	{	--8级
		skillfn = function (inst, owner)
			if inst.recoverhealth ~= nil then
				inst.recoverhealth:Cancel()
				inst.recoverhealth = nil
			end

			inst.recoverhealth = inst:DoPeriodicTask(TUNING.MOD_YOSHINO.YOSHINON.hpfre, function ()
				local equipowner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner() or nil
				local equiped = inst.components.equippable and inst.components.equippable:IsEquipped() or false
				if equiped and equipowner and equipowner:IsValid() and equipowner:HasTag("yoshino") then
					equipowner.components.health:DoDelta(TUNING.MOD_YOSHINO.YOSHINON.delhp)
				end
			end)
		end
	},
	{ --9级
		skillfn = function (inst, owner)
			if inst.components.container then
				inst.components.container:EnableInfiniteStackSize(true)	--无限堆叠
			end
		end
	},
	{	--10级
		skillfn = function (inst, owner)
			--解锁技能
			--在动作部分实现，此处仅占位
		end
	}

}

return skills