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
    image = "yoshinon_none.tex",
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
    fan_storm = GetModConfigData("fan_storm"),
    spiritual_energy_rate = GetModConfigData("spiritual_energy_rate") or 10,
    yoshinon_lv_mode = GetModConfigData("yoshinon_lv_mode"),
	yoshinon_cooldown = GetModConfigData("yoshinon_cooldown"),
	yoshinon_huge = GetModConfigData("yoshinon_huge"),
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
            accumulate = TUNING.YOSHINOCONFIG.spiritual_energy_rate/60 or 1/6,  --每分钟基础恢复速度
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
    itemscreen = {
        width = 400,        --界面的宽
        height = 500,       --界面的高
        pos = {0,0,0},      --界面相对位置
        textwidth = 400,    --文本详情页的宽
        textheigth = 600,   --文本详情页的高
    },
    YOSHINON = {            --四糸奈
		maxlevel = 10,		--最大等级
		damage_3 = 10,		--3级时开放攻击能力，设定的攻击力
		addcold = 0.4,		--抛出的雪球积累的寒冷点数
		fanxian = 0.4,		--4级的回鲜效率
		damage_6 = 32,		--6级时攻击力上升
		range = 6,			--同上，但本行是攻击范围
		hungerrate = 0.5,	--7级时使四糸乃饥饿速率降低的比例
		hpfre = 30,			--回血频率
		delhp = 5,			--使四糸乃恢复的生命值
		cooltime = TUNING.YOSHINOCONFIG.yoshinon_cooldown or 10,		--四糸奈10级技能的冷却时间
		cost_reiryoku = 4,	--四糸奈10级技能消耗的灵力
		ten_damage = 34,	--四糸奈10级技能的伤害
    },
    YOSHINO_FAN = {
        uses = 10,          --折扇的使用耐久
        damage = 24,         --折扇的攻击力
        range = 8,          --折扇的攻击范围和命中范围
        addcold_val = 0.2,   --攻击附带寒冷值
        repairprefab = {    --可修复折扇的物品及单次修复百分比
            feather_canary = 0.2,
            feather_crow = 0.2,
            feather_robin_winter = 0.2,
            goose_feather = 0.4,
            malbatross_feather = 0.4,
            feather_robin = 0.3,
        }
    },
    YOSHINO_ZADKIEL = {
        SEARCH_RANGE = 10,  --冰洁傀儡仇恨搜索范围
        SPEED_RUN = 12,     --跑步速度
        SPEED_WALK = 6,     --步行速度
        DAMAGE_DEAFULT = 82,--默认基础伤害
        PLANAR_DEAFULT = 51,--默认位面伤害
        ATK_RANGE = 8,      --攻击范围(进入此范围内则可以准备攻击)
        HIT_RANGE = 8,      --击中范围(进入此范围才能真正打中)
        ADDCOLD_VAL = 0.4,  --攻击时附带0.4 寒冷值
    },
    YOSHINO_LUCKYSACHET = 1, --幸运香囊提供的幸运值
    ANTICRYSTAL_DROP = 0.15, --反灵结晶掉落概率
    CRYSTALS_DELTA = 100,    --灵/反灵 结晶食用后恢复的灵力
    WHITEHAT = {
        drop = 0.25,         --宽檐帽蓝图的掉落概率
        fuel = TUNING.AUTOSAVE_INTERVAL*8,  --耐久
    },
    YOSHINO_FORGETHAIRPIN = {        --必忘我发夹
        duration = TUNING.TOTAL_DAY_TIME*2,   --耐久时长
        dappernes = 3.5/60,         --装备时的理智回复
        repairprefab = {        --可修复此装备的物品及单次可修复耐久
            forgetmelots = 0.13,
            forgetmelots_dried = 0.09
        }
    },
	YOSHINO_ICEBOMB = {		--冰雹炸弹
		radius = 3,		--爆炸半径
		defaultdamage = 50,	--爆炸伤害
		freezetime = 3,		--冻结时长
		stoptime = 2.8,		--强制停止移动的时间
	},
	YOSHINON_ICEBOX = {
		drop = 1,
		coldmode = TUNING.YOSHINOCONFIG.yoshinon_huge,
	}
}