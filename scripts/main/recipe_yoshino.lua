--|***************************************|
--|****这个文件包含本mod中的合成台制作配方***|
--|***************************************|

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
    { Ingredient("tentaclespots", 2), Ingredient("bluegem", 1), Ingredient("silk", 6) }, --物品配方（触手皮*2 +蓝宝石*1+蜘蛛丝*6）
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
AddRecipe2("yoshino_fan_replica",      --配方ID
    { Ingredient("feather_robin", 3), Ingredient("twigs", 3) }, --物品配方（红羽毛*3 + 树枝*3 ）
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
        numtogive = 4       --产出数量：4
        --no_deconstruction = true --不可拆解
    },
    { "CHARACTER", "REFINE" }              --配方属于角色页面、精炼材料页面
)

--配方分解(注意：自己写的分解配方，物品名不能和自己写的合成配方ID一致)
--AddDeconstructRecipe("axe", {Ingredient("twigs", 2)}) --分解斧头得到两个树枝
AddDeconstructRecipe("yoshino_fan", {Ingredient("feather_robin", 3), Ingredient("twigs", 3)})   --分解四糸乃的折扇得到完整制作材料