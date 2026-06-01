GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end }) --GLOBAL相关照抄

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING

GLOBAL.YOSHINO_API = env    --皮肤API

PrefabFiles = {              --预制物（命名绝对不能大写）
    "yoshino",               --四糸乃
    "yoshinon",              --四糸奈
    "yoshino_foods",         --四糸乃的料理
    "yoshino_crystals",      --灵结晶和反灵结晶
    "yoshino_zadkiel",       --天使·冰结傀儡
    "yoshino_atkspike",      --冰结傀儡攻击时的冰刺
    "yoshino_elyonban",      --神威灵装·四番
    "yoshino_elfz",          --神威灵装·四番(反转形态)
    "yoshino_sirvon",        --冰结傀儡·冻铠（简称 "冰铠" ）
    "yoshino_snowshield",    --冰雪护盾
}

Assets = {
    Asset("ANIM", "anim/yoshino.zip"),               --人物动画
    Asset("ANIM", "anim/ghost_yoshino_build.zip"),   --幽灵动画

    Asset("IMAGE", "images/names_gold_yoshino.tex"), --人物英文名字
    Asset("ATLAS", "images/names_gold_yoshino.xml"),

    Asset("IMAGE", "images/names_yoshino.tex"), --人物中文名字
    Asset("ATLAS", "images/names_yoshino.xml"),

    Asset("IMAGE", "images/saveslot_portraits/yoshino.tex"), --存档图片
    Asset("ATLAS", "images/saveslot_portraits/yoshino.xml"),

    Asset("IMAGE", "images/selectscreen_portraits/yoshino.tex"), --选人界面图片
    Asset("ATLAS", "images/selectscreen_portraits/yoshino.xml"),

    Asset("IMAGE", "images/selectscreen_portraits/yoshino_silho.tex"), -- 选人未解锁界面
    Asset("ATLAS", "images/selectscreen_portraits/yoshino_silho.xml"),

    Asset("IMAGE", "images/map_icons/map_yoshino.tex"), --地图图标
    Asset("ATLAS", "images/map_icons/map_yoshino.xml"),

    Asset("IMAGE", "images/avatars/avatar_yoshino.tex"), --人物头像
    Asset("ATLAS", "images/avatars/avatar_yoshino.xml"),

    Asset("IMAGE", "images/avatars/avatar_ghost_yoshino.tex"), --幽灵头像
    Asset("ATLAS", "images/avatars/avatar_ghost_yoshino.xml"),

    Asset("IMAGE", "images/avatars/self_inspect_yoshino.tex"), --自检头像
    Asset("ATLAS", "images/avatars/self_inspect_yoshino.xml"),

    Asset("IMAGE", "images/inventoryimages/yoshinon.tex"), --四糸乃的手偶：四糸奈
    Asset("ATLAS", "images/inventoryimages/yoshinon.xml"),

    Asset("IMAGE", "bigportraits/yoshino_none.tex"), --人物大图（椭圆）
    Asset("ATLAS", "bigportraits/yoshino_none.xml"), --基础默认皮肤

    Asset("IMAGE","bigportraits/yoshino_skin1.tex"), --人物大图（椭圆）
    Asset("ATLAS","bigportraits/yoshino_skin1.xml"), --枫色祈愿皮肤

    Asset("ANIM", "anim/wilsonzadkiel.zip"),   --四糸乃骑乘冰结傀儡时的人物动画
    Asset("ANIM", "anim/yoshino_zadkiel.zip"), --冰结傀儡动画
    Asset("ANIM", "anim/zadkiel_icespike.zip"),--冰刺动画

    Asset("ANIM", "anim/yoshino_badge.zip"),   --四糸乃的新增属性——灵力值
    Asset("ATLAS", "images/inventoryimages/decrease_reiryoku.xml"),
    Asset("IMAGE", "images/inventoryimages/decrease_reiryoku.tex"),

    Asset("ANIM", "anim/yoshino_crystals.zip"), --灵结晶和反灵结晶
    Asset("ATLAS", "images/inventoryimages/yoshino_crystal.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_crystal.tex"),
    --Asset("ATLAS", "images/inventoryimages/yoshino_anticrystal.xml"),
    --Asset("IMAGE", "images/inventoryimages/yoshino_anticrystal.tex"),
--
    Asset("ANIM", "anim/yoshino_ELyonban.zip"),   --神威灵装·四番
    Asset("ATLAS", "images/inventoryimages/yoshino_ELyonban.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_ELyonban.tex"),
    Asset("ANIM", "anim/yoshino_fanzhuan.zip"),   --神威灵装·四番（反转）
    Asset("ATLAS", "images/inventoryimages/yoshino_elfz.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_elfz.tex"),

    Asset("ANIM", "anim/yoshino_sirvon.zip"),   --冰结傀儡·冻铠
    Asset("ATLAS", "images/inventoryimages/yoshino_sirvon.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_sirvon.tex"),

    Asset("ANIM", "anim/yoshino_snowshield.zip"),   --冰雪护盾
    Asset("ATLAS", "images/inventoryimages/yoshino_snowshield.xml"),
    Asset("IMAGE", "images/inventoryimages/yoshino_snowshield.tex"),

    Asset("ANIM", "anim/yoshino_dishes.zip"), --料理
    Asset("ATLAS", "images/inventoryimages/yoshino_milkcoco.xml"),  --牛奶可可
    Asset("IMAGE", "images/inventoryimages/yoshino_milkcoco.tex"),
    Asset("ATLAS", "images/inventoryimages/yoshino_oyakodon.xml"),  --亲子丼
    Asset("IMAGE", "images/inventoryimages/yoshino_oyakodon.tex"),
}

modimport("scripts/main/string_yoshino") --常量加载
modimport("scripts/main/tuning_yoshino") --常量加载


--修复人物大图显示,使用人物默认皮肤
GLOBAL.PREFAB_SKINS["yoshino"] = { "yoshino_none" }

AddMinimapAtlas("images/map_icons/map_yoshino.xml")         --注册小地图图标

AddModCharacter("yoshino", "FEMALE")                        --注册添加角色，性别为女

AddReplicableComponent("spiritual_energy")                  --注册组件副本

modimport("scripts/widgets/yoshino_containers")             --注册和四糸乃有关的容器
modimport("scripts/stategraphs/SGwilsonzadkiel.lua")        --人物状态机更改
modimport("scripts/stategraphs/SGwilsonzadkiel_client.lua") --人物状态机更改
modimport("scripts/stategraphs/SGyoshino_zadkiel.lua")      --导入冰结傀儡的stategraph
modimport("scripts/main/hook_yoshino")                      --hook之类的内容加载，要在合成配方的加载之前
modimport("scripts/main/actions_yoshino")                   --人物的一些动作
modimport("scripts/main/recipe_yoshino")                    --导入四糸乃的相关合成配方

modimport("scripts/util/yoshino_skins.lua")                 --导入皮肤调用器