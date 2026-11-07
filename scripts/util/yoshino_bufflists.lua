--本页buff实际命名格式为"yoshino_buff_"+ key

local buffs = {
	recoverhealth = {				--食用花香煎鱼持续回血
		duration = 60, 				--持续时间(单位：秒)
		frequency = 2.0,			--频率(单位：秒)
		onattachedfn = function(inst, target)	--buff触发时单次执行

		end,
		onextendedfn = function(inst, target)	--重复添加此buff则执行

		end,
		ondetachedfn = function(inst, target)	--buff结束时单次执行

		end,
		ontickfn = function(inst, target)                                                                                     --根据频率，每隔一段时间执行
			if target ~= nil and target:IsValid() and target:HasTag("player") and target.components.health then
				target.components.health:DoDelta(3)
			end
		end
	},
}

return buffs
