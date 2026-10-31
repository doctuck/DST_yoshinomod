--四糸奈升级组件

local function FBNC_Sequence(x)
	local num1 =  ((1 + math.sqrt(5)) / 2) ^ x
	local num2 = ((1 - math.sqrt(5)) / 2) ^ x
	local fnum = 1/math.sqrt(5) * (num1 - num2)
	local y = fnum * 100
	return y
end


local function onmaxlevel(self, max)
	self.inst.replica.yoshinon_upgrade:SetMax(max)
end
local function oncurrent(self, current)
	self.inst.replica.yoshinon_upgrade:SetCurrent(current)
end
local function onlvexp(self, lvexp)
	self.inst.replica.yoshinon_upgrade:Setlvexp(lvexp)
end
local function onneedexp(self, needexp)
	self.inst.replica.yoshinon_upgrade:Setneedexp(needexp)
end


local Yoshinon_Upgrade = Class(function (self, inst)
        self.inst = inst
        self.maxlevel = 10				--最大默认等级
		self.current = 1				--初始等级或当前等级
		self.lvexp = 0					--当前等级下已经获取的经验
		self.needexp = 100				--距离下一次升级所需经验

    end,
    nil,
    {
		maxlevel = onmaxlevel,
		current = oncurrent,
		lvexp = onlvexp,
		needexp = onneedexp
	}
)

function Yoshinon_Upgrade:SetMax(amount)
	self.maxlevel = math.max(1, math.abs(amount))
end

function Yoshinon_Upgrade:GetMax()
	return self.maxlevel
end

function Yoshinon_Upgrade:InitializeLevel(amount)
	self.maxlevel = math.max(1, math.abs(amount))
	self.current = 1
	self.lvexp = 0
end

--计算升到下一级所需经验
---@param level number
---@return number
function Yoshinon_Upgrade:KnowNeedEXP(level)
	local modeconfig = TUNING.YOSHINOCONFIG.yoshinon_lv_mode	--读取模组配置页设置的难度等级
	local we_need = 100
	if modeconfig == 1 then
		we_need = FBNC_Sequence(level + 1)
	elseif modeconfig == -1 then
		we_need = 100
	else
		we_need = level * 100
	end
	return we_need
end

---@param amount number|nil
function Yoshinon_Upgrade:Upexp(amount)
	local num = amount ~= nil and amount or 1
	self.lvexp = self.lvexp + num

	if self.lvexp >= self.needexp and self.current < self.maxlevel then
		self.current = self.current + 1
		self.needexp = self:KnowNeedEXP(self.current)
		self.lvexp = 0		--将当前经验清空
		self.inst:PushEvent("yoshinon_upgrade")		--升级时发送事件使四糸奈能力更新
	end
end

function Yoshinon_Upgrade:GetLevel()
	return self.current
end


function Yoshinon_Upgrade:SetCurrent(amount, clear)
	self.current = math.min(self.maxlevel, math.max(1, amount))
	self.needexp = self:KnowNeedEXP(self.current)
	if clear then
		self.lvexp = 0
	end
	self.inst:PushEvent("yoshinon_upgrade", true)
end



function Yoshinon_Upgrade:OnSave()
	return {
		max = self.maxlevel,
		current = self.current,
		lvexp = self.lvexp,
	}
end
function Yoshinon_Upgrade:OnLoad(data)
	if data ~= nil then
		self.maxlevel = data.max
		self.current = data.current
		self.lvexp = data.lvexp
		self.needexp = self:KnowNeedEXP(self.current)
	end
end

return Yoshinon_Upgrade