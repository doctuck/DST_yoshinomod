--////////////////////////////////////////////////////
--//////////////这页用于显示模组物品////////////////////
--////////////////////////////////////////////////////


local Widget = require "widgets/widget"
local TEMPLATES = require "widgets/redux/templates" --加载矩形面板UI
local TEXT = require "widgets/text" --加载文本widget
local Image = require "widgets/image" --加载图片widget

local thismoditem = require("util/yoshino_moditem")

local itemstitle = {    --物品目录
    {index = 1, name = "灵力值", prefabname = "yoshino_reiryoku", imagename = "decrease_reiryoku.tex", atlas = "decrease_reiryoku.xml", x = 0, y = 0, z = 0},
    {index = 2, name = "四糸奈", prefabname = "yoshinon", imagename = "yoshinon_none.tex", atlas = "yoshinon.xml", x = 0, y = 0, z = 0},
    {index = 3, name = "冰结傀儡", prefabname = "yoshino_zadkiel", imagename = "yoshino_zadkiel.tex", atlas = "yoshino_zadkiel.xml", x = 0, y = 0, z = 0},
    {index = 4, name = "神威灵装·四番", prefabname = "yoshino_elyonban", imagename = "yoshino_ELyonban.tex", atlas = "yoshino_ELyonban.xml", x = 0, y = 0, z = 0},
    {index = 5, name = "神威灵装·四番(反转)", prefabname = "yoshino_elfz", imagename = "yoshino_elfz.tex", atlas = "yoshino_elfz.xml", x = 0, y = 0, z = 0},
    {index = 6, name = "冰结傀儡·冻铠", prefabname = "yoshino_sirvon", imagename = "yoshino_sirvon.tex", atlas = "yoshino_sirvon.xml", x = 0, y = 0, z = 0},
    {index = 7, name = "灵结晶", prefabname = "yoshino_crystal", imagename = "yoshino_crystal.tex", atlas = "yoshino_crystal.xml", x = 0, y = 0, z = 0},
    {index = 8, name = "反灵结晶", prefabname = "yoshino_anticrystal", imagename = "yoshino_anticrystal.tex", atlas = "yoshino_anticrystal.xml", x = 0, y = 0, z = 0},
    {index = 9, name = "模组食物", prefabname = "yoshino_foods", imagename = nil, atlas = nil, x = 0, y = 0, z = 0},
    {index = 10, name = "灵力结界(冰雪护盾)", prefabname = "yoshino_snowshield", imagename = "yoshino_snowshield.tex", atlas = "yoshino_snowshield.xml", x = 0, y = 0, z = 0},
    {index = 11, name = "折扇", prefabname = "yoshino_fan", imagename = "yoshino_fan.tex", atlas = "yoshino_fan.xml", x = 0, y = 0, z = 0},
    {index = 12, name = "魔女帽", prefabname = "yoshino_witchhat", imagename = "yoshino_witchhat.tex", atlas = "yoshino_witchhat.xml", x = 0, y = 0, z = 0},
    {index = 13, name = "宽檐帽", prefabname = "yoshino_whitehat", imagename = "yoshino_whitehat.tex", atlas = "yoshino_whitehat.xml", x = 0, y = 0, z = 0},
    {index = 14, name = "幸运香囊", prefabname = "yoshino_luckysachet", imagename = "yoshino_luckbag.tex", atlas = "yoshino_luckbag.xml", x = 0, y = 0, z = 0},
    {index = 15, name = "浅忆", prefabname = "yoshino_forgethairpin", imagename = "yoshino_forgethairpin.tex", atlas = "yoshino_forgethairpin.xml", x = 0, y = 0, z = 0},
	{index = 16, name = "冰爆炸弹", prefabname = "yoshino_icebomb", imagename = "yoshino_icebomb.tex", atlas = "yoshino_icebomb.xml", x = 0, y = 0, z = 0},
	{index = 17, name = "超级巨大四糸奈", prefabname = "yoshinon_icebox", imagename = "yoshinon_icebox.tex", atlas = "yoshinon_icebox.xml", x = 0, y = 0, z = 0},
}


local YoshinoItemdir = Class(Widget, function(self, owner)
    Widget._ctor(self, "YoshinoItemDir")

    self.owner = owner

    self.yoshino_itemdir = self:AddChild(
        TEMPLATES.RectangleWindow(
            TUNING.MOD_YOSHINO.itemscreen.width,
            TUNING.MOD_YOSHINO.itemscreen.height,
            "四糸乃模组物品详情(Item Description)",
            {
                {text = "关闭(Close)", cb = function()
					self:CloseMainContext()
                    self:ClearFocus()
                    self:Hide()
                end, offset = nil},
            },
            nil,nil
        )
    )

    ------------------------------------scroll-----------------------------------------
    -- 初始化每一项的方法
    local function DestItemCtor(content, index)
        local widget = Widget("widget-"..index)

        widget:SetOnGainFocus(function()
            self.dirscroll:OnWidgetFocus(widget)
        end)
        widget.destitem = widget:AddChild(self:InitDestItem())	--每一项里的控件布局

        return widget
    end

    -- 给每一项赋值，添加事件的方法
    local function DestApply(context, widget, data, index)
        widget.destitem:Hide()
        if data then
            widget.destitem.name:SetString(data.name)
            widget.destitem:Show()
            widget.destitem.name._index = data.index

            -- “展开”和“收起”按钮
            widget.destitem.unfoldbtn:SetOnClick(function() self:UnfoldContext(data.prefabname, widget.destitem.name) end)
            widget.destitem.mergebtn:SetOnClick(function() self:FoldContext() end)
        end
    end

    -- 滚动条控件的文本数据源
    self.destitems = itemstitle

    -- 将滚动条添加到self.yoshino_itemdir里去
    self.dirscroll = self.yoshino_itemdir:AddChild(TEMPLATES.ScrollingGrid(self.destitems, {
        num_columns = 1,             -- 有几个滚动条
        num_visible_rows = 8,        -- 滚动条内最多显示多少行
        item_ctor_fn = DestItemCtor, -- 每一项的构造方法
        apply_fn = DestApply,        -- 给每一项赋值，添加事件等
        widget_width = 380,          -- 每一项的宽
        widget_height = 50,          -- 每一项的高
        end_offset = nil,
    }))
    -----------------------------------------------------------------------------------
    self.default_focus = self.dirscroll
end)

--按下展开按钮时显示详情
function YoshinoItemdir:UnfoldContext(itemname, itemtitle)
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
    ))

	local item_data
    for _, v in ipairs(itemstitle) do
        if v.prefabname == itemname then
            item_data = v
            break
        end
    end
    if item_data and item_data.atlas and item_data.imagename then
        local icon = Image("images/inventoryimages/" .. item_data.atlas, item_data.imagename)
        icon:SetSize(50, 50)
        contextpage.backing:InsertWidget(icon)
        icon:SetPosition(-width/2 + 40, height/2 - 35)
    end


    contextpage:SetHAnchor(2)    -- 设置原点x坐标位置，0、1、2分别对应屏幕中、上、下
    contextpage:SetVAnchor(0)    -- 设置原点y坐标位置，0、1、2分别对应屏幕中、上、下
    contextpage:SetPosition(-450, 10)

    -- 副面板正文分页：
    -- 使用单字符分页标记 "※" 拆分
    local CONTEXT_PAGE_SEPARATOR = "※"
    local contextpages = {}
    local context_start = 1
    while true do
        local sep_start, sep_end = string.find(context_text, CONTEXT_PAGE_SEPARATOR, context_start, true)
        if sep_start == nil then
            local page = string.sub(context_text, context_start)
            if page ~= "" then
                contextpages[#contextpages + 1] = page
            end
            break
        end
        local page = string.sub(context_text, context_start, sep_start - 1)
        if page ~= "" then
            contextpages[#contextpages + 1] = page
        end
        context_start = sep_end + 1
    end
    if #contextpages == 0 then
        contextpages = { context_text }
    end


    -- 副面板文本页的构造方法
    local function ContextItemCtor(content, index)
        local widget = Widget("context-"..index)

        widget.contexttext = widget:AddChild(TEXT(CHATFONT, 28, "", {1, 1, 1, 1}))
        widget.contexttext:SetHAlign(1)
        widget.contexttext:SetVAlign(1)
        widget.contexttext:SetRegionSize(width, height)
        widget.contexttext:EnableWordWrap(true)
        widget.contexttext:SetPosition(0, -60)

        return widget
    end

    -- 副面板每一页的赋值方法
    local function ContextApply(context, widget, data, index)
        if data then
            widget.contexttext:SetString(data)
            widget.contexttext:Show()
        else
            widget.contexttext:Hide()
        end
    end

	--副面板滚动条
    contextpage.contextscroll = contextpage:AddChild(TEMPLATES.ScrollingGrid(contextpages, {
        num_columns = 1,
        num_visible_rows = 1,
        item_ctor_fn = ContextItemCtor,
        apply_fn = ContextApply,
        widget_width = width,
        widget_height = height,
        end_offset = 1,
        peek_height = 0,
        scroll_per_click = 1,
    }))
    contextpage.contextscroll:SetPosition(0, 0)

    self:AddChild(contextpage)

    contextpage.contextscroll:SetFocus()

    self.context_widget = contextpage   --挂到父组件的self.context_widget对象上, 方便其他地方使用
end

--主面板关闭按钮可触发
function YoshinoItemdir:CloseMainContext()
	
	--解除滑轮和视角锁定
    TheCamera:SetControllable(true)
	--把副面板一同关闭
    if self.context_widget then
        self.context_widget:Kill()
        self.context_widget = nil
    end
end

--按下收起按钮时关闭此前展开的窗口
function YoshinoItemdir:FoldContext()
    if self.context_widget then
        self.context_widget:Kill()
        self.context_widget = nil
    end
end

function YoshinoItemdir:Kill()

    TheCamera:SetControllable(true)
    self.context_camera_controllable = nil

    YoshinoItemdir._base.Kill(self)
end

-- 定义每一项内的控件布局
function YoshinoItemdir:InitDestItem()
    local dest = Widget("destination")  --构造名为destination的widgets
    local width, height = 380, 50
    dest.backing = dest:AddChild(TEMPLATES.ListItemBackground(width, height, function() end))

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

return YoshinoItemdir