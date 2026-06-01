GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end }) --GLOBAL相关照抄

-- 选人界面三围显示
TUNING.YOSHINO_HEALTH = 150
TUNING.YOSHINO_HUNGER = 120
TUNING.YOSHINO_SANITY = 120

--选人界面初始物品显示
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.YOSHINO = { "yoshinon" }
--加载自设初始物品
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["yoshinon"] = {
    atlas = "images/inventoryimages/yoshinon.xml",
    image = "yoshinon.tex",
}

--获取配置文件配置数据
GLOBAL.TUNING.YOSHINOCONFIG = {
    call_zadkiel_key = GetModConfigData("call_zadkiel_key"),
    max_spiritual_energy = GetModConfigData("max_spiritual_energy") or 100,
    zadkiel_cost = GetModConfigData("zadkiel_cost"),
    zadkiel_ride_cost = GetModConfigData("zadkiel_ride_cost"),
    shield_cooldown = GetModConfigData("shield_cooldown"),
    shield_cost = GetModConfigData("shield_cost"),
    space_shake = GetModConfigData("space_shake"),
    addcold_cost = GetModConfigData("addcold_cost"),
}

--配置仅可在本mod中使用的全局常量
TUNING.MOD_YOSHINO = {
    yoshino = {
        DAMAGE_DEAFULT_Ratio = 0.8, --基础伤害倍率
    },
    badge = {
        animzipname = "yoshino_badge",  --能量槽使用的动画文件包
        badgeid = "reiryoku",    --能量槽的识别id
        spiritual_energy = { --四糸乃的灵力所使用的组件
            max = TUNING.YOSHINOCONFIG.max_spiritual_energy,  --根据配置调整最大上限
            accumulate = 10/60,  --默认每分钟基础恢复
            ros = 4/60,     --下雨或下雪时每分钟额外恢复
            fullmoon = 2/60,    --满月每分钟额外恢复
            sea = 1.2/60,       --海上每分钟额外恢复
            coldfirerate = 3.4/60, --冷火旁每分钟额外恢复
            coldlight = 3.4/60, --极光旁每分钟额外恢复
            winter = 6.7/60,    --冬季每分钟额外恢复
        },
        pos ={ -125, 35, 0 },       --相对位置x,y,z(屏幕上只有x和y,所以z要为0)
        color = { 0 / 255, 128 / 255, 250 / 255, 1 }, --颜色和透明度
    },
    YOSHINO_ZADKIEL = {
        SEARCH_RANGE = 10,  --冰洁傀儡仇恨搜索范围
        SPEED_RUN = 14,     --跑步速度
        SPEED_WALK = 6,     --步行速度
        DAMAGE_DEAFULT = 82,--默认基础伤害
        PLANAR_DEAFULT = 51,--默认位面伤害
        ATK_RANGE = 8,     --攻击范围(进入此范围内则可以准备攻击)
        HIT_RANGE = 8,      --击中范围(进入此范围才能真正打中)
        ADDCOLD_VAL = 0.4,  --攻击时附带0.4 寒冷值
    },
    ANTICRYSTAL_DROP = 0.15, --反灵结晶掉落概率
    CRYSTALS_DELTA = 100,    --灵/反灵 结晶食用后恢复的灵力
}