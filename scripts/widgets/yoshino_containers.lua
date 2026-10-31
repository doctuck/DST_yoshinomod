
local containers = require "containers"
local params = containers.params

--四糸奈的小口袋
params.yoshinon_container_1 = {
    widget = {
        slotpos = {
            Vector3(-40, 40, 0),
            Vector3(40, 40, 0),
            Vector3(-40, -40, 0),
            Vector3(40, -40, 0)
        },
        slotbg= {nil,nil,nil,nil},  --分别设置格子的背景图片,此处置空表示使用原版的
        animbank = "ui_chest_2x2",  --容器的背景动画
        animbuild = "ui_chest_2x2", --容器的背景动画素材
        pos = Vector3(0, 72, 0) --容器的绝对位置
    },
    --usespecificslotsforitems = true,        --为物品使用特定的槽位
    acceptsstacks = true,                   -- 允许物品堆叠
    type = "hand_inv",                      -- 容器的类型，除了几个特别的，其余类型和自定义类型都决定了params.xxx.widget.pos的位置以玩家左上角为中心，hand_inv类型决定容器位置以手部物品左上角为中心
    --openlimit = 1,                          -- 限制整个世界里只允许有几个当前类型的容器被打开
    itemtestfn = function(inst, item, slot) -- 容器里可以装的物品的条件(inst是容器组件本身,item是放入容器的物品,slot是容器物品栏里的物品序号)
    --注：此函数内部属于服务器范围
        --Perishable
        if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then  --没有新鲜度的不能放入
            return false
        end
        --Edible
        for k, v in pairs(GLOBAL.FOODTYPE) do
            if item:HasTag("edible_"..v) and not (item:HasTag("yoshino_crystal") or item:HasTag("yoshino_anticrystal")) then   --能吃的都可以放入
                --if item.components.perishable then
                --    item.components.perishable:StopPerishing()  --暂停腐烂
                --end
                --item:AddTag("inyoshinon")
                return true
            end
        end
        if item.prefab == "hambat" then		--火腿棒没有可使用标签，需要特殊判定
            --if item.components.perishable then
            --    item.components.perishable:StopPerishing()  --暂停腐烂
            --end
            --item:AddTag("inyoshinon")
            return true
        end


        return false    --其他的都不能放入
    end,
    --excludefromcrafting = true, --从制作栏中排除(不可制作)
}
--四糸奈的小口袋（2级版本）
params.yoshinon_container_2 = {
    widget = {
        slotpos = {
            Vector3(-165, 75, 0),
            Vector3(-85, 75, 0),
			Vector3(-165, 0, 0),
			Vector3(-85, 0, 0),
            Vector3(-165, -75, 0),
            Vector3(-85, -75, 0)
        },
        slotbg= {},  --分别设置格子的背景图片,此处置空表示使用原版的
        animbank = "ui_icepack_2x3",  --容器的背景动画
        animbuild = "ui_icepack_2x3", --容器的背景动画素材
        pos = Vector3(100, 85, 0) --容器的绝对位置
    },
    --usespecificslotsforitems = true,        --为物品使用特定的槽位
    acceptsstacks = true,                   -- 允许物品堆叠
    type = "hand_inv",                      -- 容器的类型，除了几个特别的，其余类型和自定义类型都决定了params.xxx.widget.pos的位置以玩家左上角为中心，hand_inv类型决定容器位置以手部物品左上角为中心
    --openlimit = 1,                          -- 限制整个世界里只允许有几个当前类型的容器被打开
    itemtestfn = function(inst, item, slot) -- 容器里可以装的物品的条件(inst是容器组件本身,item是放入容器的物品,slot是容器物品栏里的物品序号)
    --注：此函数内部属于服务器范围
        --Perishable
        if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then  --没有新鲜度的不能放入
            return false
        end
        --Edible
        for k, v in pairs(GLOBAL.FOODTYPE) do
            if item:HasTag("edible_"..v) and not (item:HasTag("yoshino_crystal") or item:HasTag("yoshino_anticrystal")) then   --能吃的都可以放入（灵结晶除外）
                return true
            end
        end
        if item.prefab == "hambat" then		--火腿棒没有可使用标签，需要特殊判定
            return true
        end


        return false    --其他的都不能放入
    end,
    --excludefromcrafting = true, --从制作栏中排除(不可制作)
}

params.yoshinon_container_5 = {	--这是四糸奈5级时开放的容器
    widget = {
        slotpos = {},
        slotbg= {},  --分别设置格子的背景图片,此处置空表示使用原版的
        animbank = "ui_chest_3x3",  --容器的背景动画
        animbuild = "ui_chest_3x3", --容器的背景动画素材
        pos = Vector3(0, 85, 0) --容器的绝对位置
    },
    acceptsstacks = true,                   -- 允许物品堆叠
    type = "hand_inv",                      -- 容器的类型，除了几个特别的，其余类型和自定义类型都决定了params.xxx.widget.pos的位置以玩家左上角为中心，hand_inv类型决定容器位置以手部物品左上角为中心
    --openlimit = 1,                          -- 限制整个世界里只允许有几个当前类型的容器被打开
    itemtestfn = function(inst, item, slot) -- 容器里可以装的物品的条件(inst是容器组件本身,item是放入容器的物品,slot是容器物品栏里的物品序号)
    --注：此函数内部属于服务器范围
        --Perishable
        if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then  --没有新鲜度的不能放入
            return false
        end
        --Edible
        for k, v in pairs(GLOBAL.FOODTYPE) do
            if item:HasTag("edible_"..v) and not (item:HasTag("yoshino_crystal") or item:HasTag("yoshino_anticrystal")) then   --能吃的都可以放入（灵结晶除外）
                return true
            end
        end
        if item.prefab == "hambat" then		--火腿棒没有可使用标签，需要特殊判定
            return true
        end

        return false    --其他的都不能放入
    end,
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.yoshinon_container_5.widget.slotpos, Vector3(80 * x - 80, 80 * y - 80, 0))
    end
end



--幸运香囊
params.yoshino_luckysachet = {
    widget = {
        slotpos = {},
        animbank = "yoshino_ui_3x6",  --容器的背景动画
        animbuild = "yoshino_ui_3x6", --容器的背景动画素材
        pos = Vector3(-10, -60, 0) --容器的绝对位置
    },
    acceptsstacks = true,   -- 允许物品堆叠
    issidewidget = true,    -- 确定该容器在边缘而不是玩家附近
    type = "pack",          -- 容器的类型，除了几个特别的，其余类型和自定义类型都决定了params.xxx.widget.pos的位置以玩家左上角为中心，hand_inv类型决定容器位置以手部物品左上角为中心
    openlimit = 1,          -- 限制整个世界里只允许有几个当前类型的容器被打开
    itemtestfn = function(inst, item, slot) -- 容器里可以装的物品的条件(inst是容器组件本身,item是放入容器的物品,slot是容器物品栏里的物品序号)
    --注：此函数内部属于服务器范围
        return not (item:HasTag("irreplaceable") or item:HasTag("_container"))  --不能放其他容器，也不能放诅咒饰品、启迪碎片、圣殿钥石等独特物品（备注：具有“irreplaceable”标签的物品，无法被任何方式摧毁，无法打包，也不会被除玩家以外的任何生物捡起。）
    end,
}
for y = 0, 5 do
    table.insert(params.yoshino_luckysachet.widget.slotpos, Vector3(-215, -76 * y + 180, 0))
    table.insert(params.yoshino_luckysachet.widget.slotpos, Vector3(-215 + 75, -76 * y + 180, 0))
    table.insert(params.yoshino_luckysachet.widget.slotpos, Vector3(-215 + 150, -76 * y + 180, 0))
end


params.yoshinon_icebox = {
	widget = {
		slotpos = {},
        animbank = "ui_chester_upgraded_3x4",
        animbuild = "ui_chester_upgraded_3x4",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
        enable_Page = true, --可翻页
        max_page = 5,   --最大5页
        page_grid_num = 12,     -- 每页12格
        page_text_x = 0, --文字
        page_text_y = -185,
        page_btn_spacing = 100,	--两个按钮之间的间距
        page_btn_x = -50, --按钮
        page_btn_y = -190,
        page_btn_x_scale = 0.7,
        page_btn_y_scale = 0.7,
        --enable_drag = true,     --判断是否可以被拖拽
    },
	acceptsstacks = true,   -- 允许物品堆叠
    type = "chest",
	itemtestfn = function(inst, item, slot)
	    if item:HasTag("icebox_valid") then
	        return true
	    end

	    --Perishable
	    if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then
	        return false
	    end

		if item:HasTag("smallcreature") then
			return false
		end

	    --Edible
	    for k, v in pairs(FOODTYPE) do
	        if item:HasTag("edible_"..v) then
	            return true
	        end
	    end

	    return false
	end
}
for page = 1, params.yoshinon_icebox.widget.max_page do
	for y = 2.5, -0.5, -1 do
	    table.insert(params.yoshinon_icebox.widget.slotpos, Vector3(-75, 75 * y - 75, 0))
	    table.insert(params.yoshinon_icebox.widget.slotpos, Vector3(  0, 75 * y - 75, 0))
	    table.insert(params.yoshinon_icebox.widget.slotpos, Vector3( 75, 75 * y - 75, 0))
	end
end