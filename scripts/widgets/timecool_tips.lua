local Widget = require "widgets/widget"
local Image = require "widgets/image" --引入图像控件
local Text = require "widgets/text"   --加载文本控件

local ShieldTime = Class(Widget, function(self, owner)
    Widget._ctor(self, "ShieldTime")
    --self:SetScale(1, 1) -- 将badge放大为三围大小的n倍

    -- 在widget里添加上图片 属性自定义，用来接收AddChild()添加的图片控件的对象
    self.snowshield_image = self:AddChild(Image("images/inventoryimages/yoshino_snowshield.xml", "yoshino_snowshield.tex"))
    self.snowshield_image:SetScale(0.25, 0.25) -- 设置添加的image控件的缩放大小

    -- 在widget里添加上文本
    -- CODEFONT 字体名，在 fonts.lua 里可以找到，有很多字体可选
    -- 24是字体大小
    -- "" 显示的内容
    -- {0, 0, 0, 0} 文本的颜色，对应rgba，最后a是透明度，1完全不透明，0完全透明
    self.snowshieldtext = self:AddChild(Text(CODEFONT, 20, " 护盾冷却：\n00:00", { 0, 0, 0, 1 }))

end)

function ShieldTime:OnUpdate(time)
    if TheNet:IsServerPaused() then	--服务器暂停时不更新显示
		return
	end
    self.snowshieldtext:SetString("护盾冷却：\n"..time)
end

return ShieldTime
