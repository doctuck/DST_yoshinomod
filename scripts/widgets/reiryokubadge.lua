local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"
local modbadge = TUNING.MOD_YOSHINO.badge

local ReiryokuBadge = Class(Badge, function(self, owner)
	Badge._ctor(self, nil, owner, modbadge.color, nil, nil, nil, true)	--第二个参数是所需的基础动画，第五个参数对应状态图标的动画包,第六个参数对应状态图的光晕,第七个参数对应是否清空背景(默认不清空),第八个参数意为暂停时不更新(默认true)
	self.topperanim = self.underNumber:AddChild(UIAnim())
	self.topperanim:GetAnimState():SetBank(modbadge.animzipname)
	self.topperanim:GetAnimState():SetBuild(modbadge.animzipname) --导入自己的动画包
	self.topperanim:GetAnimState():PlayAnimation("anim")	--动画中计量变动的动画
	self.topperanim:GetAnimState():SetMultColour(modbadge.color[1], modbadge.color[2], modbadge.color[3], modbadge.color[4])
	self.topperanim:SetScale(1, -1, 1)
	self.topperanim:SetClickable(false)
	self.topperanim:GetAnimState():AnimateWhilePaused(false)
	self.topperanim:GetAnimState():SetPercent("anim", 1)

	if self.circleframe ~= nil then
		self.circleframe:GetAnimState():Hide("frame")
	else
		self.anim:GetAnimState():Hide("frame")
	end

	self.circleframe2 = self.underNumber:AddChild(UIAnim())
	self.circleframe2:GetAnimState():SetBank(modbadge.animzipname)
	self.circleframe2:GetAnimState():SetBuild(modbadge.animzipname)
	self.circleframe2:GetAnimState():PlayAnimation("frame")		--运行自己动画包里的边框动画(其实就一图片)
	self.circleframe2:GetAnimState():AnimateWhilePaused(false)

	self.sanityarrow = self.underNumber:AddChild(UIAnim())
	self.sanityarrow:GetAnimState():SetBank("sanity_arrow")		--状态指针
	self.sanityarrow:GetAnimState():SetBuild("sanity_arrow")
	self.sanityarrow:GetAnimState():PlayAnimation("neutral")	--运行箭头动画(初始为无指针)
	self.sanityarrow:SetClickable(false)
	self.sanityarrow:GetAnimState():AnimateWhilePaused(false)

	self.meter_maxnum = modbadge.spiritual_energy.max

	--self.backing = self.underNumber:AddChild(UIAnim())
	self.backing:GetAnimState():SetBank(modbadge.animzipname)
	self.backing:GetAnimState():SetBuild(modbadge.animzipname)
	self.backing:GetAnimState():PlayAnimation("bg")
	--self.backing:GetAnimState():SetMultColour(0, 0, 0, 0)

	self:SetStage(1)
	self:StartUpdating()

	self:SetPercent(0, modbadge.spiritual_energy.max)

	self:Show()
end)

function ReiryokuBadge:SetPercent(val, max, penaltypercent)	--val is 0~1
	val = val or 0
	max = max or self.meter_maxnum
	Badge.SetPercent(self, val, max)
	penaltypercent = penaltypercent or 0
	self.topperanim:GetAnimState():SetPercent("anim", 1 - penaltypercent)
end

function ReiryokuBadge:SetStage(stage)
	self.circleframe2:GetAnimState():PlayAnimation("s" .. tostring(stage))
end

function ReiryokuBadge:OnUpdate(dt)
	if TheNet:IsServerPaused() then	--服务器暂停时不更新
		return
	end
	local anim = "neutral"
	--指示器动画的变化
	if not self.owner.replica.inventory:EquipHasTag("yoshinon") or TheWorld.state.israining or TheWorld.state.issnowing then
		anim ="arrow_loop_increase"
	end
	if self.owner.replica.rider and self.owner.replica.rider:GetMount()~= nil and self.owner.replica.rider:GetMount():HasTag("yoshino_zadkiel") then
		anim = "arrow_loop_decrease"
	end
	if self.arrowdir ~= anim then
        self.arrowdir = anim
        self.sanityarrow:GetAnimState():PlayAnimation(anim, true)
    end
end

return ReiryokuBadge
