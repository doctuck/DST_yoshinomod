
local containers = require "containers"
local params = containers.params

params.yoshinon_container = {
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
                if item.components.perishable then
                    item.components.perishable:StopPerishing()  --暂停腐烂
                end
                item:AddTag("inyoshinon")
                return true
            end
        end
        if item.prefab == "hambat" then
            if item.components.perishable then
                item.components.perishable:StopPerishing()  --暂停腐烂
            end
            item:AddTag("inyoshinon")
            return true
        end


        return false    --其他的都不能放入
    end,
    --excludefromcrafting = true, --从制作栏中排除(不可制作)
}