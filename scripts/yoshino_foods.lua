--这里面定义的是料理配方
local foods =
{
    yoshino_milkcoco = --料理名字：牛奶可可
    {
        test = function(cooker, names, tags)    --入锅测试
            -- 需要带电的羊奶1个, 种子度 >=1, 水果度>=0.5, 不能有不可食用度
            return ((tags.fruit or 0) >= 0.5)
            and ((tags.seed or 0) >= 1)
            and ((names.goatmilk or 0) >=1)
            and not tags.inedible
        end,
        tags = { "fooddrink" }, --标签：饮用类食物
        weight = 5, --食谱权重/食物重量(不知道哪一个)
        priority = 15,  --优先级
        foodtype = FOODTYPE.VEGGIE,    --食物类型，这里设置的是“素食”类型
        perishtime = 8 * TUNING.TOTAL_DAY_TIME,    --腐烂时间 (需要*0.5才是实际时间, 比如这里是8*8*0.5 = 32分钟)
        hunger = 32.5,    --回复的饥饿值
        sanity = 3.2,    --回复的理智值
        health = 10,    --回复的健康值
        cooktime = .5,  --烹饪时间(需要*20才是真正的烹饪时间, 比如这里是0.5*20=10秒)
        floater = { 'small', 0.1, 0.55 }, --漂浮状态设置
        oneatenfn = function(inst, eater)   --吃下后触发的函数
            if eater.components.spiritual_energy ~= nil then    --四糸乃食用回复灵力值
                eater.components.spiritual_energy:DoDelta(5)
            end
            if eater.components.sanity ~= nil and eater:HasTag("yoshino") then --四糸乃食用额外回复理智
                eater.components.sanity:DoDelta(4)
            end
        end,
        card_def = {ingredients = {{"goatmilk", 1}, {"acorn", 1}, {"berries", 2}} },	--食谱配方( 羊奶 x1，桦栗果 x1, 浆果 x2)
    },
    yoshino_oyakodon = --料理名字：亲子丼
    {
        test = function(cooker, names, tags)    --入锅测试
            -- 需要蛋度>=1, 蔬菜度>=0.5, 火鸡腿至少1个, 不能有不可食用度
            return ((tags.veggie or 0) >= 0.5)
            and ((tags.egg or 0) >= 1)
            and ((names.drumstick or 0) >=1)
            and not tags.inedible
        end,
        weight = 5, --食谱权重/食物重量(不知道哪一个)
        priority = 10,  --优先级
        foodtype = FOODTYPE.GOODIES,    --食物类型，这里设置的是“好东西”类型
        perishtime = 30 * TUNING.TOTAL_DAY_TIME,    --腐烂时间 (需要*0.5才是实际时间, 比如这里是30*8*0.5 = 120分钟)
        hunger = 62.5,    --回复的饥饿值
        sanity = 15,    --回复的理智值
        health = 15,    --回复的健康值
        cooktime = .75,  --烹饪时间(需要*20才是真正的烹饪时间, 比如这里是0.75*20=15秒)
        floater = { 'small', 0.1, 0.55 }, --漂浮状态设置
        oneatenfn = function(inst, eater)   --吃下后触发的函数
            if eater.components.spiritual_energy ~= nil then    --四糸乃食用回复灵力值
                eater.components.spiritual_energy:DoDelta(5)
            end
            if eater.components.sanity ~= nil and eater:HasTag("yoshino") then --四糸乃食用额外回复理智
                eater.components.sanity:DoDelta(4)
            end
        end,
        card_def = {ingredients = {{"drumstick", 1}, {"smallmeat", 1}, {"onion", 1},{"bird_egg",1}} },	--食谱配方( 火鸡腿 x1，小肉 x1, 洋葱 x1, 鸟蛋 x1)
    },

}

for k, v in pairs(foods) do
    v.name = k
    v.basename = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.cookbook_atlas = v.cookbook_atlas or ("images/inventoryimages/" .. k .. ".xml") -- 烹饪指南图集
    -- v.cookbook_catogory = "mod" -- 料理在烹饪指南中所处的目录，这一项有官方组件自己判断, 写了也不会生效
    v.cookbook_tex = (v.cookbook_tex or k) .. ".tex"            -- 烹饪指南tex名，不设置则为prefab名
    v.atlasname = "images/inventoryimages/"..v.name..".xml"
    v.imagename ="images/inventoryimages/".. v.name
    v.overridebuild = "yoshino_dishes" or v.name
    v.whethermod = "yoshino_modfood"
end

return foods
