--////////////////////////////////////////////////////
--//////////////这页用于显示模组物品////////////////////
--////这其实是一个屏幕, 应该放到screens文件夹下面////////
--////但我懒得新建, 反正都是继承widgets，就放到一起了////
--////////////////////////////////////////////////////
local Widget = require "widgets/widget"
local TEMPLATES = require "widgets/redux/templates" --加载矩形面板UI
local Screen = require "widgets/screen" --加载屏幕widget
local TEXT = require "widgets/text" --加载文本widget

local thismoditem = require("yoshino_moditem")

local itemstitle = {    --物品目录
    {index = 1, name = "灵力值", prefabname = "yoshino_reiryoku", x = 0, y = 0, z = 0},
    {index = 2, name = "四糸奈", prefabname = "yoshinon", x = 0, y = 0, z = 0},
    {index = 3, name = "冰结傀儡", prefabname = "yoshino_zadkiel", x = 0, y = 0, z = 0},
    {index = 4, name = "神威灵装·四番", prefabname = "yoshino_elyonban", x = 0, y = 0, z = 0},
    {index = 5, name = "神威灵装·四番(反转)", prefabname = "yoshino_elfz", x = 0, y = 0, z = 0},
    {index = 6, name = "冰结傀儡·冻铠", prefabname = "yoshino_sirvon", x = 0, y = 0, z = 0},
    {index = 7, name = "灵结晶", prefabname = "yoshino_crystal", x = 0, y = 0, z = 0},
    {index = 8, name = "反灵结晶", prefabname = "yoshino_anticrystal", x = 0, y = 0, z = 0},
    {index = 9, name = "模组食物", prefabname = "yoshino_foods", x = 0, y = 0, z = 0},
    {index = 10, name = "灵力结界(冰雪护盾)", prefabname = "yoshino_snowshield", x = 0, y = 0, z = 0},
    {index = 11, name = "折扇", prefabname = "yoshino_fan", x = 0, y = 0, z = 0},
    {index = 12, name = "魔女帽(未上线)", prefabname = "yoshino_witchhat", x = 0, y = 0, z = 0},
    {index = 13, name = "白色宽檐帽(未上线)", prefabname = "yoshino_whitehat", x = 0, y = 0, z = 0},
    {index = 14, name = "幸运香囊(未上线)", prefabname = "yoshino_luckysachet", x = 0, y = 0, z = 0},
}

local Itemdir = Class(Screen, function(self, owner)
    Screen._ctor(self, "Itemdir")

    self.owner = owner

    -- TEMPLATES.RectangleWindow() 方法的构造方法参数如下
    -- TEMPLATES.RectangleWindow(sizeX, sizeY, title_text, bottom_buttons, button_spacing, body_text)
    -- sizeX: 宽
    -- sizeY: 高
    -- title_text 面板title
    -- bottom_buttons 底部按钮
    -- button_spacing 按钮间距
    -- body_text 面板的文本
    self.yoshino_itemdir = self:AddChild(
        TEMPLATES.RectangleWindow(
            TUNING.MOD_YOSHINO.itemscreen.width,
            TUNING.MOD_YOSHINO.itemscreen.height,
            "四糸乃模组物品详情(Item Description)",
            {
                {text = "关闭(Close)", cb = function()
                    if self.context_widget then
                        self:FoldContext()
                    end
                    TheFrontEnd:PopScreen(self)
                end, offset = nil}, --cb是按下时触发的函数, offset是偏移
            },
            nil,nil
            --"测试文本"
        )
    )

    ------------------------------------scroll-----------------------------------------
    -- 初始化每一项的方法
    local function DestItemCtor(content, index)
        local widget = Widget("widget-"..index)

        widget:SetOnGainFocus(function()
            self.dirscroll:OnWidgetFocus(widget)
        end)
        -- self:InitDestItem() 每一项里的控件布局
        widget.destitem = widget:AddChild(self:InitDestItem())

        return widget
    end

    -- 给每一项赋值，添加事件的方法
    local function DestApply(context, widget, data, index)
        widget.destitem:Hide()
        if data then
            widget.destitem.name:SetString(data.name)
            --widget.destitem.backing:SetOnClick(function()end)
            widget.destitem:Show()
            widget.destitem.name._index = data.index

            widget.destitem.unfoldbtn:SetOnClick(function() self:UnfoldContext(data.prefabname,widget.destitem.name) end)
            widget.destitem.mergebtn:SetOnClick(function() self:FoldContext() end)
        end
    end

    -- 滚动条控件的文本数据源
    self.destitems = itemstitle

    -- 将滚动条添加到self.yoshino_itemdir里去
    self.dirscroll = self.yoshino_itemdir:AddChild(TEMPLATES.ScrollingGrid(self.destitems, {
        num_columns = 1,             -- 有几个滚动条
        num_visible_rows = 8,        -- 滚动条内最多显示多少行
        item_ctor_fn = DestItemCtor, -- 每一项的构造方法(从self.destitems里遍历，每有一项就调用一次)
        apply_fn = DestApply,        -- 给每一项赋值，添加事件等
        widget_width = 380,          -- 每一项的宽
        widget_height = 50,          -- 每一项的高
        end_offset = nil,
    }))
    -----------------------------------------------------------------------------------

    -- 最后要把滚动条挂到父组件上的 self.default_focus 对象上去
    self.default_focus = self.dirscroll

end)

--按下展开按钮时显示详情
function Itemdir:UnfoldContext(itemname, itemtitle)
    --提醒：本函数创建所有控件均无法被聚焦
    if self.context_widget then --先调用一次, 避免展开多个
        self:FoldContext()
    end

    local contextpage = Widget("yoshinoitem")   --构造名为四糸乃物品的widgets
    local width, height = TUNING.MOD_YOSHINO.itemscreen.textwidth, TUNING.MOD_YOSHINO.itemscreen.textheigth
    -- 从 context 表中获取描述文本
    local context_info = thismoditem[itemname]
    local context_text = context_info and context_info.context or "暂无详细描述"

    contextpage.backing = contextpage:AddChild(TEMPLATES.RectangleWindow(
        width,height,
        itemtitle:GetString() .."详情",
        {},
        nil,nil
        --context_text, --默认配置的自动换行貌似有些小问题，无法输出完整内容
    ))
    contextpage:SetHAnchor(2)    -- 设置原点x坐标位置，0、1、2分别对应屏幕中、左、右
    contextpage:SetVAnchor(0)    -- 设置原点y坐标位置，0、1、2分别对应屏幕中、上、下
    contextpage:SetPosition(-450, 10)   --文本框展开的位置, 左减右加，上加下减
    
    --主显示文本
    contextpage.bodytext = contextpage:AddChild(TEXT(CHATFONT, 28, context_text, {1, 1, 1, 1}))
    contextpage.bodytext:SetHAlign(1)
    contextpage.bodytext:SetVAlign(1)
    contextpage.bodytext:SetRegionSize(width,height) --文本显示范围限制
    contextpage.bodytext:SetPosition(0,-60)
    contextpage.bodytext:EnableWordWrap(true)   --自动换行

    --上一页按钮（不被聚焦意味着无法点击）
    --contextpage.uppagebtn = contextpage:AddChild(TEMPLATES.StandardButton(function() end , "上一页", {60, 40}))
    --contextpage.uppagebtn:SetPosition(-100, -300)

    --下一页按钮（不被聚焦意味着无法点击）
    --contextpage.downpagebtn = contextpage:AddChild(TEMPLATES.StandardButton(function() end , "下一页", {60, 40}))
    --contextpage.downpagebtn:SetPosition(100, -300)

    self.context_widget = contextpage   --挂到父组件的self.context_widget对象上, 方便其他地方使用
end

--按下收起按钮时关闭此前展开的窗口
function Itemdir:FoldContext()
    if self.context_widget then
        self.context_widget:Kill()
        self.context_widget = nil
        return true
    end
end

-- 定义每一项内的控件布局
function Itemdir:InitDestItem()
    local dest = Widget("destination")  --构造名为destination的widgets
    local width, height = 380, 50
    dest.backing = dest:AddChild(TEMPLATES.ListItemBackground(width, height, function() end))
    --dest.backing.move_on_click = true

    -- 标题文本控件
    dest.name = dest:AddChild(TEXT(BODYTEXTFONT, 35, "" ,{0,0,0,1}))
    dest.name:SetColour(255, 255, 255, 1)
    dest.name:SetHAlign(1)
    dest.name:SetVAlign(0)
    dest.name:SetPosition(-85, 0, 0)
    dest.name:SetRegionSize(200, 40)

    -- 展开按钮
    dest.unfoldbtn = dest:AddChild(TEMPLATES.StandardButton(function() end , "展开", {60, 40}))
    dest.unfoldbtn:SetPosition(80, 0)
    --收起按钮
    dest.mergebtn = dest:AddChild(TEMPLATES.StandardButton(function() end , "收起", {60, 40}))
    dest.mergebtn:SetPosition(150, 0)

    -- 将定义好的组件返回
    return dest
end


return Itemdir