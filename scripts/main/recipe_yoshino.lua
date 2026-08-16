--|***************************************|
--|****这个文件包含本mod中的合成台制作配方***|
--|***************************************|

--[[
AddRecipe2(name, ingredients, tech, config, filters)

name -- string 配方名 默认为代码名
ingredients = { -- table 配方需求材料
    Ingredient("log", 1),
    Ingredient("suki_jasmine", 1,"images/inventoryimages/suki_jasmine.xml"), -- 非原版物品需要手动指明贴图路径
    Ingredient(CHARACTER_INGREDIENT.HEALTH, 20) -- 三维消耗只能为5的倍数
}
tech -- 需求科技 必须是TECH表内的值
config = { -- table
    atlas = (atlas and resolvefilepath(atlas)),                         -- 制作栏图标:使用原版图标时可空.
    imagefn = type(image) == "function" and image or nil,               -- 用于变化的图标.
    image = self.imagefn == nil and image or (self.product .. ".tex"),  -- 制作栏图标:使用原版图标时可空.
    builder_tag = builder_tag or nil,                                   -- 配方制作需要角色拥有该标签:可空.        例:"wendy"是仅温蒂显示该配方并可制作.
    station_tag = station_tag or nil,                                   -- 只有具有相应标签的制造站才能显示和制作这个物品.
    product = product or name,                                          -- 实际获得的成品:默认为配方名,当配方名与代码名不同时需求.
    no_deconstruction = no_deconstruction or false,                     -- 为true时该配方无法被魔法拆解.
    canbuild = canbuild or nil,                                         -- function(inst, builder)end用于判断是否被允许制作这个配方,如果返回false,则返回一个建造动作失败的消息.
    actionstr = actionstr or nil,                                       -- 配方下面执行的提示,默认道具为建造,建筑为放置.

    -- 这俩参数只能填"name",需要自定义,不影响原内容
    -- STRINGS.NAMES[string.upper(name)] = "新配方名字"
    -- STRINGS.RECIPE_DESC[string.upper(name)] = "新配方描述"
    nameoverride = nameoverride or nil,                                 -- 制作栏名字,可空,默认为product.
    description = "description" or nil,                                 -- 制作栏描述,可空.默认为product.

    --这部分参数一般来讲用不上,顺手整理一下.
    sg_state= sg_state or buildingstate or nil,                         -- 执行配方时角色的状态或动作,比如说割活木,nil时为dolongaction.
    require_special_event = require_special_event or nil,               -- 需要特殊事件触发,应该是活动限定.
    dropitem = dropitem or false,                                       -- 为true时将成品丢地上.
    allowautopick = allowautopick or false,                             -- 允许拾取产物,不清楚为什么会有这个参数存在,在韦伯制造蜘蛛巢和植物人变异植物配方使用.
    hint_msg = hint_msg or nil,                                         -- 提示该配方在什么地方做或者有什么前提的文本:一般用于科雷年需求,对部分配方单独进行提示
    manufactured = manufactured or nil,                                 -- 该物品需要通过制造站加工而不是通过建造组件,用于万圣节疯狂实验室的各种实验和冬季盛宴的烤箱.

    --非建筑类配方使用.
    nounlock = nounlock or false,                                       -- 为true时第一次成功使用该配方后不永久解锁该配方,常用于移动科技站.
    numtogive = 1,                                                      -- 获得成品数量:可空,默认1.

    --建筑类配方使用.
    placer = prefab.."_placer",                                         -- 放置虚影.
    min_spacing = min_spacing or 3.2,                                   -- 建筑最小建造间距.
    build_distance= build_distance or 1                                 -- 建造时离建造目的地的最大距离.
    build_mode = build_mode or BUILDMODE.LAND,                          -- 建筑放置区域需求:可空,默认为地面.
    testfn = testfn end or nil,                                         -- function(pt, rot)建筑额外的摆放限制.和canbuild差不多,但不会返回消息.
}
filters -- table 制作栏过滤器 默认放入模组栏MODS,具体见官方recipes_filter.lua
--]]--


--四糸奈的合成配方
AddRecipe2("yoshinon",      --配方ID
    { Ingredient("reviver", 1), Ingredient("manrabbit_tail", 8), Ingredient("nightmarefuel", 12) }, --物品配方（告密的心*1，兔绒*8，噩梦燃料*12）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/yoshinon.xml",
        image = "yoshinon.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshinon",    --产物：四糸奈
        no_deconstruction = true --不可拆解
    },
    { "CHARACTER" }              --配方属于角色页面 （模组配方会自动添加进模组制作页面，无需专门分类）
)

--神威灵装·四番的合成配方
AddRecipe2("yoshino_elyonban",      --配方ID
    { Ingredient("tentaclespots", 2), Ingredient("bluegem", 1), Ingredient("silk", 6) }, --物品配方（触手皮*2+蓝宝石*1+蜘蛛丝*6）
    TECH.MAGIC_TWO,              --需要魔法一本(灵子分解器)
    {
        atlas = "images/inventoryimages/yoshino_ELyonban.xml",
        image = "yoshino_ELyonban.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshino_elyonban",    --产物：神威灵装
        no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "ARMOUR", "MAGIC", "CLOTHING", "SUMMER", "RAIN" }              --配方属于角色页面、护甲页面、魔法页面、服装页面、夏季用品、雨具
)

--冰结傀儡·冻铠 的合成配方
AddRecipe2("yoshino_sirvon",      --配方ID
    { Ingredient("purebrilliance", 1), Ingredient("yoshino_crystal", 1 ,"images/inventoryimages/yoshino_crystal.xml"), Ingredient("bluegem", 2), Ingredient("ice", 20) }, --物品配方（纯粹辉煌*1 + 灵结晶*1 + 蓝宝石*2 + 冰块*20）
    TECH.MAGIC_THREE,              --需要魔法二本(暗影操控器)
    {
        atlas = "images/inventoryimages/yoshino_sirvon.xml",
        image = "yoshino_sirvon.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshino_sirvon",    --产物：冰结傀儡·冻铠
        no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "ARMOUR", "MAGIC", "RAIN" }              --配方属于角色页面、护甲页面、魔法页面、雨具
)

--四糸乃的折扇合成配方
AddRecipe2("recipe_yoshino_fan",      --配方ID
    { Ingredient("feather_robin", 10), Ingredient("twigs", 3) }, --物品配方（红羽毛*10+树枝*3）
    TECH.SCIENCE_ONE,       --需要科学一本
    {
        atlas = "images/inventoryimages/yoshino_fan.xml",
        image = "yoshino_fan.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshino_fan",    --产物：四糸乃的折扇
        no_deconstruction = false --可拆解
    },
    { "CHARACTER", "TOOLS", "WEAPONS", "SUMMER" }              --配方属于角色页面、工具、武器、夏季物品
)

--四糸乃的魔女帽合成配方
AddRecipe2("recipe_yoshino_witchhat",      --配方ID
    { Ingredient("manrabbit_tail", 12), Ingredient("livinglog", 3), Ingredient("feather_robin", 1),Ingredient("rope", 4) }, --物品配方（兔绒*12+活木头*3+红羽毛*1+绳子*4）
    TECH.SCIENCE_ONE,       --需要科学一本
    {
        atlas = "images/inventoryimages/yoshino_witchhat.xml",
        image = "yoshino_witchhat.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshino_witchhat",    --产物：四糸乃的魔女帽
        no_deconstruction = false --可拆解
    },
    { "CHARACTER", "CLOTHING", "LIGHT", "WINTER" }              --配方属于角色页面、服装、光源、冬季物品
)

--四糸乃的宽檐帽合成配方
AddRecipe2("recipe_yoshino_whitehat",      --配方ID
    { Ingredient("cutreeds", 4),Ingredient("petals", 2), Ingredient("beefalowool", 6) }, --物品配方（采下的芦苇*4，花瓣*2， 牛毛*6）
    TECH.SCIENCE_ONE,       --需要科学一本
    {
        atlas = "images/inventoryimages/yoshino_whitehat.xml",
        image = "yoshino_whitehat.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "yoshino_whitehat",    --产物：四糸乃的宽檐帽
        no_deconstruction = false --可拆解
    },
    { "CHARACTER", "CLOTHING", "SUMMER" }              --配方属于角色页面、服装、夏季物品
)

--冰的合成配方, 四糸乃专属
CHARACTER_INGREDIENT.REIRYOKU = "decrease_reiryoku"
--local old_IsCharacterIngredient = IsCharacterIngredient   --已移动到hook_yoshino.lua
--function IsCharacterIngredient(ingredienttype)
--	if ingredienttype == CHARACTER_INGREDIENT.REIRYOKU then
--		return true
--	end
--	return old_IsCharacterIngredient(ingredienttype)
--end
AddRecipe2("yoshino_ice",      --配方ID
    { Ingredient("decrease_reiryoku", 16, "images/inventoryimages/decrease_reiryoku.xml")}, --物品配方（灵力16）
    TECH.NONE,              --无需科技等级
    {
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "ice",    --产物：冰
        numtogive = 4,       --产出数量：4
        description = "yoshino_ice",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--/////////////////////////////////
--以下时是宝石转换配方
--蓝转彩虹
AddRecipe2("yoshino_opalpreciousgem",      --配方ID
    { Ingredient("decrease_reiryoku", 42, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("bluegem", 12) }, --物品配方（蓝宝石12，灵力42）
    TECH.NONE,              --无需科技等级
    {
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "opalpreciousgem",    --产物：彩虹宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE", "MAGIC" }              --配方属于角色页面、精炼材料、魔法页面
)
--红转蓝
AddRecipe2("yoshino_bluegem_1",      --配方ID
    { Ingredient("decrease_reiryoku", 10, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("redgem", 1)}, --物品配方（红宝石1，灵力10）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/bluecharge.xml",
        image = "redtoblue.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "bluegem",    --产物：蓝宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--绿转蓝
AddRecipe2("yoshino_bluegem_2",      --配方ID
    { Ingredient("decrease_reiryoku", 10, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("greengem", 1)}, --物品配方（绿宝石1，灵力10）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/bluecharge.xml",
        image = "greentoblue.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "bluegem",    --产物：蓝宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--橙转蓝
AddRecipe2("yoshino_bluegem_3",      --配方ID
    { Ingredient("decrease_reiryoku", 10, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("orangegem", 1)}, --物品配方（橙宝石1，灵力10）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/bluecharge.xml",
        image = "orangetoblue.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "bluegem",    --产物：蓝宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--紫转蓝
AddRecipe2("yoshino_bluegem_4",      --配方ID
    { Ingredient("decrease_reiryoku", 10, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("purplegem", 1)}, --物品配方（紫宝石1，灵力10）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/bluecharge.xml",
        image = "purpletoblue.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "bluegem",    --产物：蓝宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--黄转蓝
AddRecipe2("yoshino_bluegem_5",      --配方ID
    { Ingredient("decrease_reiryoku", 10, "images/inventoryimages/decrease_reiryoku.xml"), Ingredient("yellowgem", 1)}, --物品配方（黄宝石1，灵力10）
    TECH.NONE,              --无需科技等级
    {
        atlas = "images/inventoryimages/bluecharge.xml",
        image = "yellowtoblue.tex",
        builder_tag = "yoshino", --限制建造者为四糸乃
        product = "bluegem",    --产物：蓝宝石
        numtogive = 1,       --产出数量：1
        description = "yoshino_opalpreciousgem",
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)
--/////////////////////////////////

--配方分解(注意：自己写的分解配方，物品名不能和自己写的合成配方ID一致)
--AddDeconstructRecipe("axe", {Ingredient("twigs", 2)}) --分解斧头得到两个树枝
AddDeconstructRecipe("yoshino_fan", {Ingredient("feather_robin", 3), Ingredient("twigs", 3)})   --分解四糸乃的折扇得到完整制作材料
AddDeconstructRecipe("yoshino_witchhat", {Ingredient("manrabbit_tail", 12), Ingredient("livinglog", 3), Ingredient("feather_robin", 1),Ingredient("rope", 4)})   --分解四糸乃的魔女帽得到完整制作材料
AddDeconstructRecipe("yoshino_whitehat", {Ingredient("twigs", 4),Ingredient("petals", 2), Ingredient("beefalowool", 6)})   --分解四糸乃的魔女帽得到完整制作材料