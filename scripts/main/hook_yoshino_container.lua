--抄星璃mod的思路，做了些修改，感谢lan佬的指导。
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"
local containers = require("containers")
local unique_id = "yoshino_"

--改槽位上限，否则会崩
AddPrefabPostInit("container_classified", function(inst)
    local old_InitializeSlots = inst.InitializeSlots
    local extra_count = 0
    inst.InitializeSlots = function(inst, numslots)
        assert(inst._slottasks == nil)
        local curslots = #inst._items
        if numslots > curslots then
            for i = curslots + 1, numslots do
                local item = table.remove(inst._itemspool, 1)
                if item == nil then
                    extra_count = extra_count + 1
                    local idx = containers.MAXITEMSLOTS + extra_count
                    item = net_entity( inst.GUID, "container._items[" .. tostring(idx) .. "]", "items[" .. tostring(idx) .. "]dirty")
                end
                table.insert(inst._items, item)
            end
        elseif numslots < curslots then
            for i = curslots, numslots + 1, -1 do
                local item = table.remove(inst._items)
                if item ~= nil then
                    table.insert(inst._itemspool, 1, item)
                end
            end
        end
        return old_InitializeSlots(inst, numslots)
    end
end)


--页面刷新后的显示
local function UpdatePageDisplay(self, container, widget)
    for i = 1, widget.max_page * widget.page_grid_num do
        if math.ceil(i / widget.page_grid_num) == container.cur_page then
            if self.inv and self.inv[i] then
                self.inv[i]:Show()
            end
        else
            if self.inv and self.inv[i] then
                self.inv[i]:Hide()
            end
        end
    end
    if self[unique_id .. "page_text"] then
        self[unique_id .. "page_text"]:SetString(container.cur_page .. "/" .. widget.max_page)
    end
end

-- 创建翻页按钮的函数
local function CreatePageButton(self, container, widget, direction)
    local button = self:AddChild(ImageButton(   -- 参数：atlas, normal, focus, disabled, down, selected, scale, offset
        "images/global_redux.xml",          --按钮采用的图集
        "arrow2_" .. direction .. ".tex",   --正常情况下的按钮
        "arrow2_" .. direction .. ".tex",   --鼠标聚焦时的按钮
        "arrow2_" .. direction .. ".tex",   --无法使用时显示的按钮
        "arrow2_" .. direction .. ".tex",   --按下时的按钮
        "arrow2_" .. direction .. ".tex"    --被选中时的按钮
    ))

    local x_offset = direction == "right" and widget.page_btn_spacing or 0
    button:SetPosition(widget.page_btn_x + x_offset, widget.page_btn_y)
    button:SetScale(widget.page_btn_x_scale, widget.page_btn_y_scale)

    button:SetOnClick(function()        --按钮被点击时触发的函数
        local page_change = direction == "right" and 1 or -1
        container.cur_page = math.clamp(container.cur_page + page_change, 1, widget.max_page)
        UpdatePageDisplay(self, container, widget)
        SendModRPCToServer(GetModRPC(unique_id .. "Page_Button", unique_id .. "container_switch_page"), container.cur_page, container)
    end)

    return button
end


-- 获取物品槽位的函数
local function GetItemSlot(item, container, widget, cur_page)
    if not item or not widget.enable_Page then return nil end

    local free_slot = nil
    for i = 1, container:GetNumSlots() do
        if math.ceil(i / widget.page_grid_num) == cur_page then
            local item_in_slot = container:GetItemInSlot(i)

            if item_in_slot then
                if item_in_slot.prefab == item.prefab and
                    item_in_slot.replica.stackable and
                    not item_in_slot.replica.stackable:IsFull() then
                    return i
                end
            else
                free_slot = free_slot and math.min(free_slot, i) or i
            end
        end
    end
    return free_slot
end




-- 修改 ContainerWidget
AddClassPostConstruct('widgets/containerwidget', function(self, ...)

    --进行右键拖拽功能
    local function StartMukuroDrag(self, mouse_x, mouse_y)
        if not self.yoshino_can_drag then return end

        local widget_x, widget_y = self:GetPosition():Get()
        local offset_x = widget_x - mouse_x
        local offset_y = widget_y - mouse_y

        if self.yoshino_move_handler then
            self.yoshino_move_handler:Remove()
        end
        if self.yoshino_mouse_handler then
            self.yoshino_mouse_handler:Remove()
        end

        self.yoshino_move_handler = TheInput:AddMoveHandler(function(x, y)
            self:SetPosition(x + offset_x, y + offset_y, 0)
        end)

        self.yoshino_mouse_handler = TheInput:AddMouseButtonHandler(function(button, down, x, y)
            --停止拖拽
            if button == MOUSEBUTTON_RIGHT and not down then
                if self.yoshino_move_handler then
                    self.yoshino_move_handler:Remove()
                    self.yoshino_move_handler = nil
                end
                if self.yoshino_mouse_handler then
                    self.yoshino_mouse_handler:Remove()
                    self.yoshino_mouse_handler = nil
                end
                --停止拖拽时保存当前位置
                local pt = self:GetPosition()
                TheSim:SetPersistentString(tostring(self.container.prefab) .. "_pt", tostring(pt.x) .. "," .. tostring(pt.y), false)
            end

        end)

    end



    local old_Open = self.Open
    function self:Open(container, doer, ...)
        if old_Open then
            old_Open(self, container, doer, ...)
        end

        if not container then return end
        local widget = container.replica.container:GetWidget()
        if not widget then return end

        --根据保存记录，重设按钮的位置
        TheSim:GetPersistentString(tostring(self.container.prefab) .. "_pt", function(load_success, str)
            if load_success == true and str ~= nil then
                local pt = string.split(str, ",")
                self:SetPosition(Vector3(tonumber(pt[1]), tonumber(pt[2]), 0))
            end
        end)

		if self.yoshino_resetbtn_handler then
            self.yoshino_resetbtn_handler:Remove()
            self.yoshino_resetbtn_handler = nil
        end

        --按PageUp键恢复容器位置（仅在容器开启时才生效）
        self.yoshino_resetbtn_handler = TheInput:AddKeyHandler(function(key, down)
            if down and key == KEY_PAGEUP then
                if self.yoshino_move_handler then
                    self.yoshino_move_handler:Remove()
                    self.yoshino_move_handler = nil
                end
                if self.yoshino_mouse_handler then
                    self.yoshino_mouse_handler:Remove()
                    self.yoshino_mouse_handler = nil
                end
                self:SetPosition(widget.pos.x, widget.pos.y)
                TheSim:SetPersistentString(tostring(self.container.prefab) .. "_pt", tostring(widget.pos.x) .. "," .. tostring(widget.pos.y), false)
            end
        end)


        self.yoshino_can_drag = widget.enable_drag == true
        if self.yoshino_can_drag then
            --给拖拽目标添加拖拽提示
            self:SetClickable(true)
            if self.bganim then
                self.bganim:SetTooltip("右键拖拽")
            else
                self.yoshino_can_drag = false
            end
        end
        --只有能翻页的容器才使用以下功能
        if widget.enable_Page then
            if not self[unique_id .. "page_btn_enable"] then
                self[unique_id .. "page_btn_enable"] = true
                container.cur_page = container.cur_page or 1

                -- 创建页码文本
                self[unique_id .. "page_text"] = self:AddChild(Text(NUMBERFONT, 35, container.cur_page .. '/' .. widget.max_page))
                self[unique_id .. "page_text"]:SetPosition(widget.page_text_x, widget.page_text_y)

                -- 创建翻页按钮
                self[unique_id .. "page_btn_right"] = CreatePageButton(self, container, widget, "right")
                self[unique_id .. "page_btn_left"] = CreatePageButton(self, container, widget, "left")


                -- 初始化显示
                UpdatePageDisplay(self, container, widget)
            end
        end

    end

    local old_Close = self.Close
    function self:Close()
        -- 清理拖拽相关
        if self.yoshino_move_handler then
            self.yoshino_move_handler:Remove()
            self.yoshino_move_handler = nil
        end
        if self.yoshino_mouse_handler then
            self.yoshino_mouse_handler:Remove()
            self.yoshino_mouse_handler = nil
        end
		if self.yoshino_resetbtn_handler then
            self.yoshino_resetbtn_handler:Remove()
            self.yoshino_resetbtn_handler = nil
        end
        self.yoshino_can_drag = false
        --self:SetClickable(false)

        -- 关闭自定义翻页相关控件
        if self[unique_id .. "page_btn_right"] then
            self[unique_id .. "page_btn_right"]:Kill()
            self[unique_id .. "page_btn_right"] = nil
        end
        if self[unique_id .. "page_btn_left"] then
            self[unique_id .. "page_btn_left"]:Kill()
            self[unique_id .. "page_btn_left"] = nil
        end
        if self[unique_id .. "page_text"] then
            self[unique_id .. "page_text"]:Kill()
            self[unique_id .. "page_text"] = nil
        end


        -- 调用原有关闭逻辑
        if old_Close then
            old_Close(self)
        end
    end

    local old_OnControl = self.OnControl
    function self:OnControl(control, down)
        -- 先让子控件（物品槽等）处理
        if old_OnControl and old_OnControl(self, control, down) then
            return true
        end

        -- 右键按下开始拖拽
        if control == CONTROL_SECONDARY and down then
            if self.yoshino_can_drag then
                local mouse_x, mouse_y = TheInput:GetScreenPosition():Get()
                StartMukuroDrag(self, mouse_x, mouse_y)
                return true
            end
        end

        return false
    end
end)


-- 修改 Container 组件
AddComponentPostInit("container", function(self)
    local old_GetSpecificSlotForItem = self.GetSpecificSlotForItem
    function self:GetSpecificSlotForItem(item, ...)
        if not self.usespecificslotsforitems then
            return old_GetSpecificSlotForItem and old_GetSpecificSlotForItem(self, item, ...)
        end

        local widget = self:GetWidget()

        return GetItemSlot(item, self, widget, self.inst.cur_page or 1) or
            (old_GetSpecificSlotForItem and old_GetSpecificSlotForItem(self, item, ...))
    end
end)

-- 修改 ContainerReplica
AddClassPostConstruct("components/container_replica", function(self, ...)
    local old_GetSpecificSlotForItem = self.GetSpecificSlotForItem

    function self:GetSpecificSlotForItem(item, ...)
        if not self.usespecificslotsforitems then
            return old_GetSpecificSlotForItem and old_GetSpecificSlotForItem(self, item, ...)
        end
        local widget = self:GetWidget()
        return GetItemSlot(item, self, widget, self.inst.cur_page or 1) or
            (old_GetSpecificSlotForItem and old_GetSpecificSlotForItem(self, item, ...))
    end
end)

AddModRPCHandler(unique_id .. "Page_Button", unique_id .. "container_switch_page", function(player, page, container)
    if container and page then
        container.cur_page = page
    end
end)