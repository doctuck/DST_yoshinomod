return {
    ACTIONFAIL = --动作失败台词
    {
        ACTIVATE = --激活某东西
        {
            LOCKED_GATE = "需要...钥匙", --远古大门缺少钥匙
            HOSTBUSY = "等有时间再来吧", --主机繁忙
            EMPTY_CATCOONDEN = "里面没有东西", --洗劫浣猫的空心树桩失败
            MANNEQUIN_EQUIPSWAPFAILED = "它不适合穿这个", --给假人穿戴不适合的装备时
            PILLOWFIGHT_NO_HANDPILLOW = "唔...想丢枕头玩", --玩枕头大战但是手里没有枕头(兔人之年活动)
        },
        ATTUNE = --不舒服
        {
            NOHEALTH = "好痛...", --制造肉雕像、告密的心等各种原因导致血量大幅减少
        },
        BATHBOMB = --沐浴球相关的
        {
            GLASSED = "盖满了玻璃...", --想把沐浴球扔到结晶状态的温泉上时
            ALREADY_BOMBED = "有人已经这么做了。", --想把沐浴球扔到沸腾中的温泉上时
        },
        BUILD = --构建
        {
            MOUNTED = "我需要先下来。", --骑乘状态构建失败
            HASPET = "我只能有一个...", --雇佣宠物失败(已经有一个宠物了)
            TICOON = "不能再交更多这类朋友了", --构建大虎失败(浣猫之年, 只能雇佣一只大虎)
            BUSY_STATION = "再等等吧...", --(暂无注释)
        },
        CHANGEIN = --换装
        {
            GENERIC = "现在不能换衣服", --换装失败
            BURNING = "好像...最近都换不了衣服了", --换装失败-着火了
            INUSE = "四糸乃会耐心等待", --衣橱有人占用
        },
        COMPARE_WEIGHABLE = --称重
        {
            FISH_TOO_SMALL = "它太小了", --称的物体太小
            OVERSIZEDVEGGIES_TOO_SMALL = "它还不够重", --没达到重量要求
        },
        CONSTRUCT = --建筑相关
        {
            INUSE = "再等等吧...", --建筑正在被使用
            NOTALLOWED = "这位置不对", --建筑不允许放置
            EMPTY = "什么都没有", --没有东西用来建造
            MISMATCH = "四糸乃没做好...", --升级套件错误（好像用不到）
            NOTREADY = "再等等吧...", --建筑正在搭建的过程中
        },
        COOK = --烹饪
        {
            GENERIC = "这个...怎么使用来着?", --烹饪开锅失败
            INUSE = "好香的味道", --烹饪开锅失败, 因为其他人正在使用
            TOOFAR = "太远了, 够不着", --距离太远导致开锅失败
        },
        DEPLOY =
        {
            HERMITCRAB_RELOCATE = "晚一点再尝试", --(暂无注释)
        },
        DISMANTLE =
        {
            COOKING = "我不能这么做",		--(暂无注释)
            INUSE = "再等等吧...",		--(暂无注释)
            NOTEMPTY = "先清洗一下",		--(暂无注释)
        },
        DRAW =
        {
            NOIMAGE = "有参照物我会画得更好...",	--画图缺乏图像
        },
        FILL_OCEAN = --给水壶装海水时
        {
            UNSUITABLE_FOR_PLANTS = "植物们似乎不喜欢这种水", --水壶一般情况下似乎也没法装海水
        },
        FISH_OCEAN = --海里钓鱼
        {
            TOODEEP = "这根钓竿不适合在深海钓鱼", --用非海钓竿在深海钓鱼时
        },
        OCEAN_FISHING_POND = --池塘钓鱼
        {
            WRONGGEAR = "这根钓竿不适合在池塘钓鱼", --用非淡水钓竿在池塘钓鱼时
        },
        GIVE = --给予
        {
            GENERIC = "我做不到...",		--给予动作失败(比如把胡萝卜给兔洞过多时)
            DEAD = "它想要的不是这个",		--给予(目标死亡)
            SLEEPING = "不可以打扰正在睡觉的人",		--给予(目标睡觉)
            BUSY = "不可以打扰别人的工作",		--给予(目标正忙)
            ABIGAILHEART = "你不要么...",		--给阿比盖尔 救赎之心 失败
            GHOSTHEART = "好像没有作用...",		--给鬼魂 救赎之心 失败
            NOTGEM = "真的...可以吗",		--给的不是宝石
            WRONGGEM = "也许应该换一颗",		--给错了宝石
            NOTSTAFF = "拿错了...",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "它需要一个蘑菇。",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "它需要一块特别的木头。",		--蘑菇农场需要活木
            SLOTFULL = "没有空间...",		--已经放了材料后, 再给雕像桌子再给一个材料
            FOODFULL = "它还没有吃掉我们上次供奉的祭品...",     --(暂无注释)
            NOTDISH = "那恐怕不好...",          --(暂无注释)
            DUPLICATE = "已经有人先做过了",		--给雕刻桌已经学习过的图纸
            NOTSCULPTABLE = "我觉得不对...",		--给陶艺圆盘的东西不对
            CANTSHADOWREVIVE = "它还没准备好",		--中庭仍在CD
            WRONGSHADOWFORM = "这些骨头看起来好可怕...",  --乱搭骨架
            NOMOON = "这里好像不能这么做",		--在洞穴里试图消耗月岩雕像使用天体传送门
			PIGKINGGAME_MESSY = "这里有些窄。",		--猪王旁边有建筑, 不能开始抢元宝
			PIGKINGGAME_DANGER = "四糸奈：危险还没结束, 不能再玩了, 四糸乃。",		--危险, 不能开始抢元宝
			PIGKINGGAME_TOOLATE = "太晚了, 我想回去睡觉。",		--不是白天, 不能开始抢元宝
            NOGENERATORSKILL = "我不会这个",  --没有发电机技能
            MUSHROOMFARM_NOMOONALLOWED = "这些蘑菇似乎不愿意被种在这儿",    --蘑菇农场处于不适合种植蘑菇阶段
            CARNIVALGAME_INVALID_ITEM = "它需要的不是这个", --鸦年华游戏, 给予无效物品(鸦年华)
            CARNIVALGAME_ALREADY_PLAYING = "我需要等一会再玩", --鸦年华游戏已经开始了, 别人正在游玩(鸦年华)
            TERRARIUM_COOLDOWN = "要等树长大", --给礼物树挂东西(冬季盛宴)
            QUEENBUSY = "她很忙, 我还是不要打扰了...", --猴子女王正在忙碌, 无法给予香蕉
        },
        GIVE_TACKLESKETCH = --给予广告(广告的功能和稀有蓝图差不多)
        {
            DUPLICATE = "我看过这个", --给予重复的广告
        },
        GIVETOPLAYER = --给予玩家物品
        {
            FULL = "你放不下了",        --被给予的玩家物品栏满了
            DEAD = "它用不到这个",      --给死去的玩家物品
            SLEEPING = "等睡醒再过来吧",	--给于正在睡觉的玩家物品
            BUSY = "等有时间再来吧",		--给于正在忙碌的玩家物品
        },
        GIVEALLTOPLAYER = --给予玩家一组物品
        {
            FULL = "你放不下了",        --被给予的玩家物品栏满了
            DEAD = "它用不到这个",      --给死去的玩家物品
            SLEEPING = "等睡醒再过来吧",	--给于正在睡觉的玩家物品
            BUSY = "等有时间再来吧",		--给于正在忙碌的玩家物品
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "我该走了...",		--(暂无注释)
        },
        HEAL =
        {
            NOT_MERM = "这似乎是给鱼人准备的",		--(暂无注释)
        },
        HITCHUP = --栓牛
        {
            NEEDBEEF = "如果我有一头牛做朋友的话...", --没有牛
            NEEDBEEF_CLOSER = "要让皮弗娄牛伙伴更近一些", --牛离得太远了
            BEEF_HITCHED = "皮弗娄牛已经栓好了", --已经栓好了, 不用再重复
            INMOOD = "它很活跃, 或许应该等它安静了再来。", --牛在抵抗, 不想被栓住
        },
        LOWER_SAIL_FAIL = --降帆失败
        {
            "嘿咻...哎呀! ",
            "加油",
            "四糸奈, 我们再来一次吧! ",
        },
        MARK =
        {
            ALREADY_MARKED = "应该..可以的! ",
            NOT_PARTICIPANT = "四糸乃...没关系的! ",
        },
        MOUNT = --骑乘
        {
            TARGETINCOMBAT = "它很生气, 我该怎么做才好", --牛生气了, 无法骑乘 （或者坐骑牛处于战斗状态且没有装备战鞍）
            INUSE = "有人在上面", --已经有人在骑乘（两个玩家一般情况下无法骑乘同一头皮弗娄牛）
            SLEEPING = "嘘..它在睡觉呢~", --皮弗娄牛睡觉中, 无法骑乘
        },
        OPEN_CRAFTING = --打开制作栏
        {
            PROFESSIONALCHEF = "四糸乃和四糸奈还在学习厨艺", --打开沃利的制作栏(不清楚指的是哪个)
            SHADOWMAGIC = "灵力不行吗...", --打开暗影魔法栏失败
        },
        PICK = --挑挑拣拣
        {
            NOTHING_INSIDE = "它是空的",
            STUCK = "它卡住了",
        },
        PICKUP = --拾取
        {
            RESTRICTION = "不...我不想要那个...",		--捡起错误的武器(熔炉)
			INUSE = "有人抢在了我前面。",		--捡起已经打开的容器(熔炉)
            NOTMINE_YOTC =
            {
                "它……似乎不太喜欢我。",		--(暂无注释)
                "不是我的我不能要。",		--(暂无注释)
            },
            FULL_OF_CURSES = "我不太想靠近这件物品", --没捡起受诅咒物品
        },
        PLANTREGISTRY_RESEARCH_FAIL = --植物登记失败
        {
            GENERIC = "我不用学这个",
            FERTILIZER = "四糸奈, 我不想知道这个",
        },
        POUR_WATER = --把水倒掉
        {
            OUT_OF_WATER = "没水了", --水壶没水
        },
        POUR_WATER_GROUNDTILE = --水倒在地板上
        {
            OUT_OF_WATER = "没水了",
        },
        REPAIR = --修复
        {
            WRONGPIECE = "拼错了...",		--化石骨架拼接错误
        },
        REPLATE = --填充
        {
            MISMATCH = "这道菜不应装在这个容器里。", 		--换盘子换错了 比如用碗换碟子(暴食)
            SAMEDISH = "我已经把它装盘了。", 		--换盘子已经换了(暴食)
        },
        ROW_FAIL = --划浆方式错误
        {
            BAD_TIMING0 = "唔...动作不对",
            BAD_TIMING1 = "四糸奈, 可以帮我吗...",
            BAD_TIMING2 = "我们为什么不飞呢",
        },
        RUMMAGE = --翻找
        {
			GENERIC = "这个箱子暂时不能打开",   --打开箱子失败
			INUSE = "这个箱子暂时不能打开",		--打开箱子 正在使用
            NOTMASTERCHEF = "它不属于我。",
            NOTAMERM = "它们不高兴了",          --鱼人部落附近随机刷新的箱子
            NOTSOULJARHANDLER = "可怕的箱子...",  --翻沃托克斯箱子时
            RESTRICTED = "我做不到...",  --没有权限
        },
        SADDLE = --上鞍
        {
            TARGETINCOMBAT = "它需要冷静一下",		--给战斗状态的牛上鞍
        },
        SHAVE = --剃牛毛
        {
			AWAKEBEEFALO = "晚上来更好",		--给醒着的牛刮毛
			GENERIC = "或许过一段时间再来就可以了",		--刮牛毛失败
			NOBITS = "还是, 不要了吧...",		--给没毛的牛刮毛
            SOMEONEELSESBEEFALO = "或许有人可以做到这件事", --给其他玩家的牛刮毛失败
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "我要去找几只胡萝卜鼠...",		--(暂无注释)
        },
        STORE =--存东西
        {
			GENERIC = "装不下了。",		--存放东西失败
			NOTALLOWED = "好孩子不能这么做",		--容器限制导致东西放不进去
			INUSE = "我可以在你之后用那个吗?",		--别人正在用箱子
            NOTMASTERCHEF = "它不属于我。",  --沃利存东西的?
            NOTSOULJARHANDLER = "它存不了我手里的东西", --沃托克斯箱子
            RESTRICTED = "我做不到...",  --没有权限
        },
        TEACH =--学习蓝图
        {
            --Recipes/Teacher
            KNOWN = "我已经掌握了这个知识...",		--学习已经知道的蓝图
            CANTLEARN = "这份知识太深奥了...",		--学习无法学习的蓝图
            WRONGWORLD = "那是...不被允许的...",		--学习另外一个世界的地图
            --Likely trying to read messagebottle treasure map in caves
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "这里太黑了...我看不清",	--尝试在洞穴中读漂流瓶里的信
            -- Likely trying to read stash map  in world without stash(可能是尝试在没有储物箱的世界中读取储物箱地图)
            STASH_MAP_NOT_FOUND = "我找不到“X标记点”, 也可能没有..?",
        },
        UNLOCK = --开锁
        {
            WRONGKEY = "我做不到...",
        },
        USEITEMON =     --对物品使用另一物品
        {
            --GENERIC = "I can't use this on that!",

            --construction is PREFABNAME_REASON
            --BEEF_BELL_INVALID_TARGET = "I couldn't possibly!",
            --BEEF_BELL_ALREADY_USED = "This beefalo already belongs to someone else.",
            --BEEF_BELL_HAS_BEEF_ALREADY = "I don't need a whole herd.",

			--NOT_MINE = "This belongs to someone else.",

			CANNOT_FIX_DRONE = "它坏掉得太彻底了, 四糸乃修不好它...",      --试图对黄莺使用陀螺传导核心
        },
        USEKLAUSSACKKEY = --使用钥匙开赃物袋
        {
        	WRONGKEY = "打不开。",		--开赃物袋使用错误的钥匙
        	KLAUS = "这不能尝试...",		--克劳斯钥匙
            QUAGMIRE_WRONGKEY = "应该还有别的钥匙", --(暂无注释)
        },
        WRAPBUNDLE = --使用打包纸
        {
            EMPTY = "四糸奈：空气不能打包",		--打包纸是空的
        },
        WRITE =
        {
            GENERIC = "我...我做不到。",		--写字失败
            INUSE = "等过一会再来吧",		--写字 正在使用中
        },
        CARVEPUMPKIN = --雕刻南瓜
        {
            INUSE = "四糸乃也想试试...", --被占用时
            BURNING = "这个是烤南瓜吗...", --被火烧着时
        },
        DECORATESNOWMAN = --装饰雪人
        {
            INUSE = "四糸乃也想玩", --被占用时
            HASHAT = "已经有一顶帽子在上面了", --已经被装饰过了
            STACKEDTOOHIGH = "它太高了! ", --堆得太高, 放不上去
            MELTING = "它快融化了...", --快融化了, 无法放装饰
        },
    },
    ANNOUNCE_CANNOT_BUILD =     --无法制作
	{
		NO_INGREDIENTS = "我缺少一些必要组件", --缺少材料
		NO_TECH = "我需要学习更多", --没有对应科技
		NO_STATION = "我现在不能做这个", --没有停下来(人物要停下来才能制作东西)
	},
    ACTIONFAIL_GENERIC = "我做不到", --动作失败的通用语音
	ANNOUNCE_BOAT_LEAK = "船漏水了",		--船漏水
	ANNOUNCE_BOAT_SINK = "要落到海里去了",		--船即将沉没
	ANNOUNCE_DIG_DISEASE_WARNING = "...",		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "这颗植物是不是生病了?",		--（植物生病）
    ANNOUNCE_MOUNT_LOWHEALTH = "牛先生, 你还好吗?",		--牛血量过低
	ANNOUNCE_BEES = "是蜜蜂! 快跑! ",		--被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "哎呀! 疼! ",		--被回旋镖打中
	ANNOUNCE_CHARLIE = "是谁?! ",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "疼! ",		--被查理攻击
	ANNOUNCE_COLD = "感觉似乎还可以。",		--过冷
	ANNOUNCE_HOT = "好热！",		--过热
	ANNOUNCE_CRAFTING_FAIL = "我缺少必要的材料。",  --缺少素材制作失败
	ANNOUNCE_DEERCLOPS = "不好了。",		--boss来袭
	ANNOUNCE_CAVEIN = "我们要被压碎了...",		--要地震了???
    ANNOUNCE_PREFALLINVOID = "", --跌落虚空(都摔虚空了还想要什么语音)

    ANNOUNCE_ANTLION_SINKHOLE =     --蚁狮地震
	{
		"发生怎么了?",
		"脚下的地面正在崩溃。",
		"难道这里也有空间震吗...",
	},
	ANNOUNCE_ANTLION_TRIBUTE =	--给蚁狮上供
	{
        "一个礼物...",
        "这个, 送给你...",
        "请不要生气...",
	},
    ANNOUNCE_SACREDCHEST_YES = "它接受了我的物品, 开心。",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "四糸奈, 我们再试一次吧! ",		--远古宝箱给予物品错误
    ANNOUNCE_DUSK = "天快要黑了...",		--进入黄昏
    ANNOUNCE_EAT =
	{
		GENERIC = "好吃! ",		--吃东西
		PAINFUL = "这个不是吃的。",		--吃到会扣除生命值的食物
		SPOILED = "唔, 好难吃...",		--吃腐烂食物
		STALE = "不新鲜了吗?",		--吃黄色即将变红的食物
		INVALID = "四糸奈：别给四糸乃吃那个! ",		--拒吃
        YUCKY = "我不太好...",		--吃红色快要腐烂的食物
        PREPARED = "很好吃的食物"   --吃到带有"好东西"标签的食物(似乎只有沃利能够触发这句语音)
    },
    ANNOUNCE_ENCUMBERED =   --搬运雕像、可疑的大理石等重物
    {
        "我可以做到! ",
        "四糸乃没关系的...",
        "只要, 再坚持一会, 就好了...",
        "...呼...",
        "四糸乃可以忍耐。",
        "四糸奈：你忍心让四糸乃搬这个吗?",
        "我...没事...",
        "别担心...我能行...",
        "...",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"我想回去...",		--中庭击杀boss后即将刷新
		"有什么要失控了",		--中庭震动
		"这里有些不安全",		--中庭击杀boss后即将刷新
	},

    ANNOUNCE_RUINS_RESET = "它们回来了...",		--地下重置
    ANNOUNCE_SNARED = "不...不能害怕",		--被远古织影者的骨笼困住
    ANNOUNCE_SNARED_IVY = "四糸奈：哈! 花园的问题有点大",       --刺针旋花的缠绕根须困住
    ANNOUNCE_REPELLED = "那是随意领域?不对...",		--织影者保护状态
	ANNOUNCE_ENTER_DARK = "好黑! ",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "太好了, 我又能看见东西了! ",		--进入光源
	ANNOUNCE_HOUNDS = "猎犬要来了",		--猎犬将至
	ANNOUNCE_WORMS = "有东西在动...",		--蠕虫袭击
    ANNOUNCE_WORMS_BOSS = "有很大的东西在地下", --巨大洞穴蠕虫袭击
    ANNOUNCE_ACIDBATS = "你听到了吗, 蝙蝠来了", --洞穴世界酸雨时, 蝙蝠袭击
	ANNOUNCE_HUNGRY = "我想吃点东西...",		--饥饿度较低(原语句：我感到无尽的空虚。)
	ANNOUNCE_HUNT_BEAST_NEARBY = "我感觉附近有野兽。",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "脚印, 消失了...",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "脚印消失了...",		--大猎物丢失踪迹
    ANNOUNCE_HUNT_START_FORK = "继续下去可能有危险", --脚印分支, 说明是座狼或钢羊分支
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "太好了四糸奈, 我们成功了! ",   --座狼或钢羊战斗胜利
    ANNOUNCE_HUNT_WRONG_FORK = "好像有什么在看着我...",  --差点发现座狼或钢羊
    ANNOUNCE_HUNT_AVOID_FORK = "呼, 还好...", --脚印分支, 普通分支
	ANNOUNCE_INV_FULL = "我带不了更多东西了。",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "哈呼~早上好...",		--从催眠中醒来
	--ANNOUNCE_LOWRESEARCH = "学到了东西",		--(这条似乎已经是废案)
	ANNOUNCE_MOSQUITOS = "要被蚊子咬了",		--被蚊子咬
    ANNOUNCE_NOWARDROBEONFIRE = "着火了",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "没有时间拆礼物了, 周围有危险。",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "也许我应该先下来……",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "我不能睡, 可能会死的。",		--危险, 不能睡觉
	ANNOUNCE_NODAYSLEEP = "真的要在白天睡觉吗?",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "我还不累。",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "我想吃点东西再睡。",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "着火了, 睡不了",		--营帐着火无法睡觉
    ANNOUNCE_NODANGERSIESTA = "我不能睡, 可能会死的。",		--危险, 不能午睡
	ANNOUNCE_NONIGHTSIESTA = "这里, 也可以休息...",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "这里可以休息一下...",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "我想吃点东西再睡。",		--饱度不足无法午睡
	ANNOUNCE_PECKED = "小家伙, 不要再咬了",		--被小高鸟啄
	ANNOUNCE_QUAKE = "空间震?有其他精灵来了吗",		--地震
	ANNOUNCE_RESEARCH = "我现在掌握了更多关于这个世界的知识。",  --(暂无注释)
	ANNOUNCE_SHELTER = "谢谢你, 大树先生。",		--下雨天躲树下
	ANNOUNCE_THORNS = "咿呀! 疼! ",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "好烫! ",		--扑灭刚点燃的物品
	ANNOUNCE_TORCH_OUT = "火把烧完了",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "炉子没火了",		--暗影香炉燃尽
	ANNOUNCE_FAN_OUT = "风停了",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "这个指南针, 是不是坏了",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "四糸乃做坏事了...",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "我觉得还没完成",		--(暂无注释)
	ANNOUNCE_WORMHOLE = "又跳跃世界了",		--跳虫洞出来时
	--ANNOUNCE_TOWNPORTALTELEPORT = "",      --豪华传送
	ANNOUNCE_CANFIX = "我想学着修好这面墙",		--发现墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "我会更加努力",		--获得成就(似乎是没被调用的废案)
	ANNOUNCE_ACCOMPLISHMENT_DONE = "有一天, 这个也会被忘记的。",	--检查已获得成就(似乎是没被调用的废案)
	ANNOUNCE_INSUFFICIENTFERTILIZER = "它需要多一点肥料。",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "欸?我的手有点滑...抱歉!",		--工具脱手滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "闪电...好可怕(QAQ)",		--规避闪电
	ANNOUNCE_TOADESCAPING = "我不想继续伤害它",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "它回家了...",		--蟾蜍逃走了
	ANNOUNCE_DAMP = "沾到水了",		--潮湿（1级）
	ANNOUNCE_WET = "身上湿漉漉的",		--潮湿（2级）
	ANNOUNCE_WETTER = "再这样下去, 会感冒的...",		--潮湿（3级）
	ANNOUNCE_SOAKED = "如果能激活灵装...或许就不会湿了....",		--潮湿（4级）
	ANNOUNCE_WASHED_ASHORE = "好险...",		--被冲上岸(落水后到岸上)
    ANNOUNCE_DESPAWN = "要去哪里...",		--使用月岩雕像换人
	ANNOUNCE_BECOMEGHOST = "下次...会更勇敢的...",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "我听到了同伴的声音...",		--队友死亡掉san
	ANNOUNCE_PETRIFED_TREES = "是什么在动...树?",		--石化树发出动静时
	ANNOUNCE_KLAUS_ENRAGE = "四糸奈：抱歉啦, 下次还来~",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "它的枷锁解开了。",		--克劳斯-未上锁的（克劳斯即将复活进入二阶段）
	ANNOUNCE_KLAUS_CALLFORHELP = "有更多坏人来了",		--克劳斯召唤小偷
    ANNOUNCE_MOONALTAR_MINE = --在月岛挖掘天体祭坛的三个零件
	{
		GLASS_MED = "里面有东西。",		--开始挖掘月岛的特殊月岩矿(天体祭坛底座)
		GLASS_LOW = "快挖出来了",		--即将挖掘出
		GLASS_REVEAL = "呼, 成功了",	--挖掘结束
		IDOL_MED = "里面有东西。",		--开始挖掘月岛的特殊月岩矿(天体祭坛雕像)
		IDOL_LOW = "快挖出来了",		--即将挖掘出
		IDOL_REVEAL = "呼, 成功了",		--挖掘结束
		SEED_MED = "里面有东西。",		--开始挖掘月岛的特殊月岩矿(天体祭坛宝球)
		SEED_LOW = "快挖出来了",		--即将挖掘出
		SEED_REVEAL = "呼, 成功了",		--挖掘结束
	},

    --hallowed nights(万圣夜活动)
    ANNOUNCE_SPOOKED = "呀! ! ",		--被吓到(万圣夜活动)
	ANNOUNCE_BRAVERY_POTION = "我很勇敢! ",		--喝下恐惧实验产出的药剂(疯狂科学家实验室)
	ANNOUNCE_MOONPOTION_FAILED = "四糸乃没做好",		--月亮实验失败(疯狂科学家实验室)

    --winter's feast(冬季盛宴)
    ANNOUNCE_EATING_NOT_FEASTING = "我有些想加入...",		--周围有人在吃冬季盛宴食物, 但自己没在吃
	ANNOUNCE_WINTERS_FEAST_BUFF = "很温暖",		--吃冬季盛宴食物获得buff
	ANNOUNCE_IS_FEASTING = "有些不真实...",		--吃冬季盛宴食物时
    ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "结束是为了下一次的到来",		--冬季盛宴食物buff结束

    ----lavaarena event(熔炉模式)
    ANNOUNCE_REVIVING_CORPSE = "活过来, 拜托了...",		--复活玩家尸体(熔炉)
    ANNOUNCE_REVIVED_OTHER_CORPSE = "活过来, 拜托了...",		--复活其他尸体(熔炉)
    ANNOUNCE_REVIVED_FROM_CORPSE = "谢...谢你...",		--被复活(熔炉)

    ANNOUNCE_FLARE_SEEN = "来自谁的信号?",		--(暂无注释)
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "四糸奈：麻烦要来了。",		--(暂无注释)

    --quagmire event(暴食模式)
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "这些不能做吃的。",       --(暂无注释)
    QUAGMIRE_ANNOUNCE_MEALBURNT = "好像有点烧焦了...",      --(暂无注释)
    QUAGMIRE_ANNOUNCE_LOSE = "四糸奈, 我们失败了",          --(暂无注释)
    QUAGMIRE_ANNOUNCE_WIN = "该走了",                      --(暂无注释)

    ANNOUNCE_ROYALTY = {"很好看的帽子",},          --对持有锋王冠的玩家
    ANNOUNCE_ROYALTY_JOKER = {"你看起来很开心",},  --对持有蜂王冠(小丑皮肤)的玩家

    --吃厨师沃利给的食物获得对应buff
    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "我的灵力可以带电了",          --获得电附魔的攻击buff
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "四糸乃可以做到! (攻击力上升)",--攻击力提升的buff
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "暂时不会感到痛了。",          --获得伤害减免的buff
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "工作更轻松了",                --获得工作效率提高的buff
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "我的灵装也可以防水",          --清空潮湿度并获得保持一段时间干燥的buff
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "四糸乃现在很精神",            --获得免疫催眠的buff
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "我的灵力不再有电",            --电附魔buff消失
    ANNOUNCE_DETACH_BUFF_ATTACK            = "攻击力恢复了...这样就好",     --攻击提升的buff消失
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "请...不要弄疼我\n(伤害减免的buff消失)",  --伤害减免的buff消失
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "四糸乃有点累了",              --工作效率提高的buff消失
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "还是穿上灵装吧",              --干燥buff消失
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "我有点困了",                  --免疫催眠的buff消失

    --钓鱼时的语音
	ANNOUNCE_OCEANFISHING_LINESNAP = "啊...鱼溜走了...",        --鱼咬钩但是线断了
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "线太松了。",		--鱼咬钩后试图逃脱
	ANNOUNCE_OCEANFISHING_GOTAWAY = "今天不吃鱼了...",		       --因为钓鱼技术导致鱼咬钩后依然逃脱
	ANNOUNCE_OCEANFISHING_BADCAST = "四糸奈, 我们再来一次吧! ",		--海钓投竿失败
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =          --等待鱼上钩
	{
		"钓鱼很好玩, 下次再来吧! ",
		"四糸乃会耐心等待",
		"四糸奈：哦~不肯咬钩吗",
		"四糸奈：肯定有更有趣的捕鱼方法。",
	},

    --称重结果
    ANNOUNCE_WEIGHT = "重量：{weight}",		--不够重
	ANNOUNCE_WEIGHT_HEAVY  = "重量: {weight}\n四糸乃的力气不太够",		--足够重

    ANNOUNCE_WINCH_CLAW_MISS = "啊...就差一点...",		--夹夹绞盘没夹上来东西
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "底下好像没有东西",		--夹夹绞盘对空处释放

    --ANNOUNCE_READ_BOOK = --读书相关(以后有想法了再添加)
    --{
    --},

    ANNOUNCE_WEAK_RAT = "这只胡萝卜鼠看起来不太健康...", --(胡萝卜鼠之年)
    ANNOUNCE_CARRAT_START_RACE = "比赛开始了, 加油! ", --比赛开始(胡萝卜鼠之年)

    ANNOUNCE_POCKETWATCH_PORTAL = "摔了个屁股敦...", --被旺达使用裂缝表传送出来后

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "这是新的知识",            --(暂无注释)
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "我学过这个",              --(暂无注释)
    ANNOUNCE_ARCHIVE_NO_POWER = "它需要更多能量, 灵力可以吗?",  --(暂无注释)

    ANNOUNCE_PLANT_RESEARCHED = --植物成长阶段, 首次观察到此阶段
    {
        "我学到了更多关于这种植物的知识",
    },
    ANNOUNCE_PLANT_RANDOMSEED = "不知道会长成什么",
    ANNOUNCE_FERTILIZER_RESEARCHED = "这里面的知识...好深奥",

    ANNOUNCE_FIRENETTLE_TOXIN = --被火荨麻击中后, 持续一段时间升温
	{
		"好像被火烧着了一样...",
		"感觉身体里有点热",
	},
    ANNOUNCE_FIRENETTLE_TOXIN_DONE = "我下次会注意避开火荨麻的", --被火荨麻击中一段时间后, 效果结束

    ANNOUNCE_TALK_TO_PLANTS =	--与植物对话
	{
        "要好好长大",
        "长势很好",
		"你好呀, 我来找你聊天了",
        "四糸奈：吼呀~真幸运啊, 每天都有我们来陪你说话",
        "今天, 我遇见了......",
	},
    ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "躲猫猫, 想玩...",  --(浣猫之年, 躲猫猫游戏)
    --(躲猫猫的其他语句懒得写了)

    --盒中泰拉
    ANNOUNCE_EYEOFTERROR_ARRIVE = "呜哇~!\n四糸奈: 那是什么?小心",  --激活盒中泰拉, 恐怖之眼或双子魔眼出现在身旁时
    ANNOUNCE_EYEOFTERROR_FLYBACK = "它又回来了! ",  --恐怖之眼或双子魔眼再次回来时
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "那颗眼睛离开了",  --恐怖之眼或双子魔眼离开时

    --海盗猴相关(虽然该mod人物免疫猴子诅咒)
    ANNOUNCE_CANT_ESCAPE_CURSE = "糟糕...",    --(暂无注释)
    ANNOUNCE_MONKEY_CURSE_1 = "好像有什么不好的事情要发生了",     --身上诅咒饰品较多时
    ANNOUNCE_MONKEY_CURSE_CHANGE = "变身魔法?但不是七罪...",  --变成芜猴时
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "变回来了! ",  --从芜猴变回来时
    ANNOUNCE_PIRATES_ARRIVE = "海上的号角声...",     --听到海盗猴的号角声

    ANNOUNCE_OFF_SCRIPT = "剧本是这样的吗...",

    ANNOUNCE_COZY_SLEEP = "睡得很安心",  --舒适的睡眠过后

    ANNOUNCE_TOOL_TOOWEAK = "我需要找一件更好的工具。",  --使用工具错误, 比如没使用多用斧稿挖掘绝望石柱
    ANNOUNCE_WEAPON_TOOWEAK = "我想要更强大的力量, 保护的力量! ",     --使用武器错误, 需要更强的武器

	ANNOUNCE_LUNAR_RIFT_MAX = "那是月光吗?",	--月亮裂隙循环, 裂隙即将生成
    ANNOUNCE_SHADOW_RIFT_MAX = "那些光...四糸乃有点害怕",	--暗影裂隙循环,裂隙即将生成
	
	ANNOUNCE_SCRAPBOOK_FULL = "图鉴填满了",	--图鉴填满了
	ANNOUNCE_CHAIR_ON_FIRE = "烧着了...",	--(暂无注释)

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "这雨是酸的, 要找地方躲避。",     --下酸雨

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "深海还是太危险了",  --将水獭窝的海带船划出浅海区域
    ANNOUNCE_OTTERBOAT_DENBROKEN = "糟糕, 我好像又做错事了...",  --拆除水獭窝导致海带船漏水

    --ANNOUNCE_GATHER_MERM = ""   --沃特点击高级食堂海带盘可以召集鱼人, 并触发此语音

    ANNOUNCE_EXIT_GELBLOB = "黏黏的...好难受...",     --被恶液吐出来
    ANNOUNCE_SHADOWTHRALL_STEALTH = "哎呀! 疼! ",     --被隐形的墨荒(狞笑)偷袭
    ANNOUNCE_RABBITKING_AGGRESSIVE = "地下有什么在愤怒地挖掘",    --暴戾兔王出现
    ANNOUNCE_RABBITKING_PASSIVE = "地下有什么要出来了",   --和善兔王出现
    ANNOUNCE_RABBITKING_LUCKY = "好特别的小兔子(*￣▽￣*)ブ",  --机缘兔子出现
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "抓到你了(p≧w≦q)",   --抓到机缘兔子
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "这位置不对",   --放置兔洞的位置不对
    ANNOUNCE_LUNARGUARDIAN_INCOMING = "它又回来了! ",         --天体仇灵从天而降入场的时候
    ANNOUNCE_FLOATER_HELD = "还好准备了这个, 呼...",     --落水后使用个人漂浮装置浮起来
    ANNOUNCE_FLOATER_LETGO = "我撑不住了...",    --漂浮起来后, 放弃挣扎
    ANNOUNCE_FLOAT_SWIM_TIRED = "好累...(QAQ)",   --依靠个人漂浮装置游泳, 累了歇息
    ANNOUNCE_LUNARHAIL_BIRD_SOUNDS = "小鸟们好可怜...",   --听到下月雹雨的声音
    ANNOUNCE_LUNARHAIL_BIRD_CORPSES = "它们再也不能飞了...",   --下月雹雨(玻璃雨), 鸟儿死亡
    ANOUNCE_MUTATED_BIRD_ATTACK = "要小心那些鸟! ",     --亮喙鸟袭击
    ANNOUNCE_VAULT_TELEPORTER_DOES_NOTHING = "似乎现在还无法传送",    --圣殿路标无法通行
	ANNOUNCE_LIGHTSOUT_SHADOWHAND = "那边有一只可怕的手(QAQ)",    --暗影之手偷火(待确认)
    
    --和温蒂野餐盒有关的, 但不知道具体是什么
    --ANNOUNCE_ELIXIR_BOOSTED = "It's like a BOO-ster Shot.",
    --ANNOUNCE_ELIXIR_GHOSTVISION = "I feel fright headed.",
    --ANNOUNCE_ELIXIR_PLAYER_SPEED = "I think I could lift a horse.",
    --ANNOUNCE_ELIXIR_TOO_SUPER = "This one seems a little strong.",

    BATTLECRY =     --战斗时
	{
		GENERIC = "我不会再害怕了! ",		--战斗
		PIG = "对...对不起! ",		--战斗 猪人
		PREY = "我不是故意伤害你的",		--战斗(猎物或者小动物)
		SPIDER = "我准备好战斗了! ",		--战斗 蜘蛛
		SPIDER_WARRIOR = "四糸乃会勇敢的! ",		--战斗 蜘蛛战士
		DEER = "对...对不起! ",		--战斗 无眼鹿
	},
    COMBAT_QUIT =   --退出战斗
	{
		GENERIC = "我不想伤害你",		--攻击目标被卡住, 无法攻击
		PIG = "刚才, 对不起...",		--退出战斗-猪人
		PREY = "我不能这么做",		--退出战斗 猎物??大象?
		SPIDER = "再见! ",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "再见! ",		--退出战斗 蜘蛛战士
	},

    ANNOUNCE_NO_YOSHINON_RAGDOLL = "四糸奈, 你在哪里...",   --失去四糸奈手偶
    ANNOUNCE_PICK_YOSHINON = "四糸奈, 你回来啦~! ",    --捡回四糸奈
    ANNOUNCE_ZADKIEL = "zadkiel--!",    --召唤冰结傀儡时
    ANNOUNCE_REIRYOKU =
    {
       FULL = "灵力……太多了……", --灵力充沛
       SHORTAGE = "灵力不够！", --灵力不足
    },

    DESCRIBE =      --检查描述
    {
        --yoshino
        YOSHINON = "四糸奈是我的英雄...我的朋友...",		--四糸奈手偶(检查四糸奈时四糸乃说的话（特殊语音）)
        YOSHINO_ELYONBAN = "我的灵装，它可以保护我",        --四糸乃的初始灵装
        YOSHINO_ELFZ = "四糸奈：别担心, 四糸乃，我会帮你.",  --四糸乃的反转体灵装
        YOSHINO_SIRVON = "冰结傀儡·冻铠",          --四糸乃的特殊灵装——冰铠的特殊语音
        YOSHINO_MILKCOCO = "一杯牛奶可可, 不过用的是羊奶, 好喝!~",  --牛奶可可(四糸乃模组的新增料理)
        YOSHINO_OYAKODON = "能见到这份料理真难得~",     --亲子丼(四糸乃模组的新增料理)
        YOSHINO_CRYSTAL = "灵力的来源, 它已经被过滤净化",       --灵结晶
        YOSHINO_ANTICRYSTAL = "灵力的来源,但这颗...它对人的侵蚀伤害很大",   --反灵结晶
        YOSHINO_ZADKIEL = "天使·冰结傀儡",
    

        MULTIPLAYER_PORTAL = "一座大门, 它并不能让我回去",    --绚丽之门
        MULTIPLAYER_PORTAL_MOONROCK = "好像……更漂亮了!",   --天体传送门
        MOONROCKIDOL = "这个东西是用来供奉的",  --月岩雕像
        CONSTRUCTION_PLANS = "要开始建造传送门了吗",  --传送门用具

        ANTLION ={   --蚁狮
            GENERIC = "我是不是应该给它什么",    --常态
            VERYHAPPY = "它看起来挺开心",     --交易后开心
            UNHAPPY = "它看起很生气",      --生气的蚁狮
        },
        ANTLIONTRINKET = "有个大家伙需要这个",    --沙滩玩具
        SANDSPIKE = "被刺到会很疼的(QAQ)",     --沙刺
        SANDBLOCK = "一座沙子堆成的堡垒",      --沙堡
        GLASSSPIKE = "它很锋利",        --玻璃尖刺
        GLASSBLOCK = "玻璃做的城堡",     --玻璃城堡
        ABIGAIL_FLOWER = {    --阿比盖尔之花
            GENERIC ="很漂亮的花",      --常态
			LEVEL1 = "她能听到我们说话吗?",      --1级
			LEVEL2 = "她的能量变强了",        --2级
			LEVEL3 = "真有精神啊(*￣▽￣*)",     --3级
			--deprecated(旧版已废弃)
            --LONG = "看到那东西时, 我的灵魂受伤了。",
            --MEDIUM = "这让我毛骨悚然。",
            --SOON = "那朵花有情况! ",
            --HAUNTED_POCKET = "我该放下它。",
            --HAUNTED_GROUND = "我会查明它到底做了些什么。",
        },
		ABIGAIL =   --阿比盖尔
		{
            LEVEL1 =
            {
                "幽灵小姐有一个可爱的小蝴蝶结。",
                "幽灵小姐有一个可爱的小蝴蝶结。",
            },
            LEVEL2 =
            {
                "幽灵小姐有一个可爱的小蝴蝶结。",
                "幽灵小姐有一个可爱的小蝴蝶结。",
            },
            LEVEL3 =
            {
                "幽灵小姐有一个可爱的小蝴蝶结。",
                "幽灵小姐有一个可爱的小蝴蝶结。",
            },
        },
        BALLOONS_EMPTY = "各种颜色的气球",		--一堆气球   制造描述:"要是有更简单的方法该多好。"
        BALLOON = "一个气球",		--气球
		BALLOONPARTY = "这个世界也有派对吗?",   --派对气球
		BALLOONSPEED = {  --迅捷气球
            DEFLATED = "气球泄气了",      --泄气的
            GENERIC = "这个气球能让我跑得更快",       --常态默认
        },
		BALLOONVEST = "吱吱吱的声音好好玩",     --充气背心
		BALLOONHAT = "很可爱的帽子, 但是会弄乱我的头发",     --气球帽

        BERNIE_INACTIVE = {   --伯尼 制造描述:"这个疯狂的世界总有你熟悉的人。"
            BROKEN = "小熊, 坏掉了",		-- 损坏
            GENERIC = "一只小熊玩偶, 好像有着复杂的故事",		--常态默认
        },
        BERNIE_ACTIVE = "小熊……动起来了! ",		--活跃状态的伯尼
        BERNIE_BIG = "小熊玩偶长大了! ",		-- 大形态的伯尼

        BOOK_BIRDS = "书里包含了非常多的鸟类",		-- 物品名:"世界鸟类大全" 制造描述:"涵盖1000个物种：习性、栖息地及叫声。"
        BOOK_TENTACLES = "为什么要读这本书?",		-- 物品名:"触手的召唤" 制造描述:"让我们来了解一下地下的朋友们! "
        BOOK_GARDENING = "这本书可以学习园艺知识",		-- 物品名:"应用园艺学" 制造描述:"讲述培育和照料植物的相关知识。"
        BOOK_SLEEP = "想起了妈妈...",		-- 物品名:"睡前故事" 制造描述:"送你入梦的睡前故事。"
        BOOK_BRIMSTONE = "这个书名...",		-- 物品名:"末日将至! " 制造描述:"世界将在火焰和灾难中终结! "
        BOOK_FISH = "学习钓鱼的技巧",     -- 物品名:"钓鱼者生存指南" 制造描述："让捕鱼变得简单! "
        BOOK_FIRE = "和火焰有关的魔法吗?",      -- 物品名:"意念控火术详解" 制造描述:"使用这些简单的技巧来化解任何火爆的场面。"
        BOOK_WEB = "这是...和蜘蛛有关的书...",		-- 物品名:"克服蛛形纲恐惧症" 制造描述:"要在对方的网络里行走过一里路才能算真正了解一个人。"
        BOOK_TEMPERATURE = "我的灵力也能做到降温",		-- 物品名:"控温学" 制造描述:"通过这些简单的步骤完全控制你的个人气候。"
        BOOK_LIGHT = "它拥有照亮周围的魔法",		-- 物品名:"永恒之光" 制造描述:"阅读后能启迪出智慧的光芒。"
        BOOK_RAIN = "记得我刚来时也下了雨",		-- 物品名:"实用求雨仪式" 制造描述:"留着防备雨天, 你来决定哪天是雨天。"
        BOOK_MOON = "连月相也能改变的魔法",		-- 物品名:"月之魔典" 制造描述:"召唤月亮的力量。"
        BOOK_BEES = "这本书可以学到如何养小蜜蜂",		-- 物品名:"养蜂笔记" 制造描述:"学习养蜂的基本知识。"
        BOOK_HORTICULTURE_UPGRADED = "更深奥的园艺知识",		-- 物品名:"园艺学扩展版" 制造描述:"专家分析如何进行高级农作物护理。"
        BOOK_RESEARCH_STATION = "好深奥",		-- 物品名:"万物百科" 制造描述:"万事万物从A到Z的完整指南。"
        BOOK_LIGHT_UPGRADED = "更全面的一本书",		-- 物品名:"永恒之光之复兴" 制造描述:"全本比之前的简本散发出更闪耀的光芒。"

        FIREPEN = "一支可以喷出火的笔",		-- 物品名:"火焰笔"
        
        PLAYER =    --四糸乃检查不认识的玩家
        {
            GENERIC = "你还好吗, %s?",		-- 检查其他不认识的玩家, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s救了大家",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放火不好",		-- 检查放火的玩家
        },
        YOSHINO =    --四糸乃检查自己
        {
            GENERIC = "你是……另一个我?!",		-- 检查另一个自己, 通用描述
            ATTACKER = "请不要伤害我…",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "另一个我，你救了大家",		-- 检查复活自身或其他玩家的玩家
            GHOST = "另一个我…也许我可以帮助你…",		-- 检查变成幽灵的另一个自己
            FIRESTARTER = "另一个我…放火不好",		-- 检查放火的另一个自己
        },
        WILSON =    --检查威尔逊
        {
            GENERIC = "你好, %s先生",		-- 检查威尔逊, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s先生…你的科学是这样的吗?",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s先生用科学救人了",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s先生或许留下了复活他自己的科学……",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s先生…你在做什么实验吗",		-- 检查放火的玩家
        },
        WOLFGANG =     --检查沃尔夫刚
        {
            GENERIC = "喜欢锻炼的%s大叔",		-- 检查沃尔夫刚, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "请不要伤害我……",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s大叔拥有神奇的力量",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s大叔回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "我不和他学习",		-- 检查放火的玩家
        },
        WAXWELL =     --检查麦斯威尔
        {
            GENERIC = "%s……谁?",		-- 检查麦斯威尔, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "有人告诉我%s已经疯了",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s先生的魔法可以救人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s先生或许并不喜欢这样",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s先生放的火",		-- 检查放火的玩家
        },
        WX78 =      --检查WX-78
        {
            GENERIC = "识别名上写着:\"%s\"",		-- 检查WX-78, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s的指令变得残暴",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s的科学救了人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "机器人也有灵魂",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放的火",		-- 检查放火的玩家
        },
        WILLOW =    --检查薇洛
        {
            GENERIC = "你好, %s小姐……",		-- 检查薇洛, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s小姐的火焰在蔓延",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s小姐的火很温暖",		-- 检查复活自身或其他玩家的玩家
            GHOST = "或许有办法能帮助%s小姐回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "火焰让%s小姐上瘾了",		-- 检查放火的玩家
        },
        WENDY =     --检查温蒂
        {
            GENERIC = "%s小姐, 你好呀",		-- 检查温蒂, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s小姐…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s小姐很善良",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s小姐和阿比盖尔重聚了",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放火不好",		-- 检查放火的玩家
        },
        WOODIE =    --检查伍迪
        {
            GENERIC = "你看起来很乐观, %s先生",		-- 检查伍迪, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s先生…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s先生是最棒的伐木工",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s先生回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s先生知道火焰的危害, 但……",		-- 检查放火的玩家
            BEAVER = "%s先生变成的海狸",   --检查海狸人形态的伍迪
            BEAVERGHOST = "%s先生?",
            MOOSE = "%s先生变成的鹿人",      --检查鹿形态的伍迪
            MOOSEGHOST = "%s先生?",
            GOOSE = "%s先生变成的鹅",       --检查鹅形态的伍迪
            GOOSEGHOST = "%s先生?",
        },
        WICKERBOTTOM =      --检查薇克巴顿
        {
            GENERIC = "%s阿姨的脸色让我不得不安静",		-- 检查薇克巴顿, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "是不是看了邪恶的书才这样做的?",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s阿姨用书里的知识救了人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "这在书里应该被称为\"幽灵\"",		-- 检查变成幽灵的玩家
            FIRESTARTER = "她在放火",		-- 检查放火的玩家
        },
        WES =       ---检查韦斯
        {
            GENERIC = "可怜的%s",		-- 检查韦斯, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s变成了无声的杀人犯",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "是%s救人的手法很厉害",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放火不好",		-- 检查放火的玩家
        },
        WEBBER =    --检查韦伯
        {
            GENERIC = "他让我有点害怕",		-- 检查韦伯, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s和他的蜘蛛同伴站在一起了",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s是大好人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "我不知道%s是否想回到这个世界",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放火不好",		-- 检查放火的玩家
        },
        WATHGRITHR =    --检查薇格弗德
        {
            GENERIC = "艺术家%s",		-- 检查薇格弗德, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s混淆了艺术与现实",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "救治的艺术",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s的表演需要真实的火焰?",		-- 检查放火的玩家
        },
        WINONA =    --检查薇诺娜
        {
            GENERIC = "勤劳的%s大姐",		-- 检查薇诺娜, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s大姐…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s大姐懂得救人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s放火做什么?",		-- 检查放火的玩家
        },
        WORTOX =    --检查沃拓克斯
        {
            GENERIC = "%s让我有点害怕",		-- 检查沃拓克斯, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s…这才是你的真面目吗",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s是善良的",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s想必早料到这一天, 他应该有所准备…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s放了地狱之火",		-- 检查放火的玩家
        },
        WORMWOOD =      --检查沃姆伍德
        {
            GENERIC = "你好吗, %s?",		-- 检查沃姆伍德, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s…你为什么要这么做",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s有神奇的魔法可以救人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "玩火自焚?应该是这么念的吧…",		-- 检查放火的玩家
        },
        WARLY =     --检查沃利
        {
            GENERIC = "%s叔叔的食物很好吃",		-- 检查沃利, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "菜刀不是用来做这个的",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s叔叔的美食救了大家",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s叔叔一定想回来继续探索美食",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s叔叔的厨房失火了",		-- 检查放火的玩家
        },
        WURT =      --检查沃特
        {
            GENERIC = "你好吗, %s?",		-- 检查沃特, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s杀了人",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s救了我们",		-- 检查复活自身或其他玩家的玩家
            GHOST = "%s想回到这个世界",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s, 放火不好",		-- 检查放火的玩家
        },
        WALTER =    --检查沃尔特
        {
            GENERIC = "你好吗, %s",		-- 检查沃尔特, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s…这不是你的冒险",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s有丰富的冒险知识, 包括救治",		-- 检查复活自身或其他玩家的玩家
            GHOST = "这也是冒险的一环吗?",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s…放火不好",		-- 检查放火的玩家
        },
        WANDA =     --检查旺达
        {
            GENERIC = "你好吗, %s奶奶?",		-- 检查旺达, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s奶奶裁去他人的时间",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s奶奶给他人夺回了时间",		-- 检查复活自身或其他玩家的玩家
            GHOST = "她走到了时间的尽头",		-- 检查变成幽灵的玩家
            FIRESTARTER = "时间上的火焰",		-- 检查放火的玩家
        },
        WONKEY =    --检查芜猴
        {
            GENERIC = "%s是由谁变成的呢?",		-- 检查芜猴, 通用描述
            ATTACKER = "请不要伤害我……",		-- 检查攻击者(攻击者攻击过四糸乃或其他玩家)
            MURDERER = "%s吃人",		-- 检查击杀者(该玩家杀过四糸乃或其他玩家)
            REVIVER = "%s救了人",		-- 检查复活自身或其他玩家的玩家
            GHOST = "一定有办法能帮助%s回到这个世界…",		-- 检查变成幽灵的玩家
            FIRESTARTER = "%s在放火烧山",		-- 检查放火的玩家
        },

        BELL = "叮呤呤。",   --远古铃铛

        GLOMMER = {   --格罗姆
            GENERIC = "毛茸茸的奇怪小家伙",     --常态
            SLEEPING = "它睡着了",      --睡着的
        },
        GLOMMERFLOWER = {     --格罗姆之花
            GENERIC = "花瓣在散发着光",       --常态
            DEAD = "这朵花枯萎了",      --枯萎
        },
        GLOMMERWINGS = "奇怪小家伙的翅膀...",      --格罗姆翅膀
        GLOMMERFUEL = "又黏又臭",     --格罗姆粘液
        STATUEGLOMMER = {    --格罗姆雕像
            GENERIC = "和奇怪小家伙长的很像",       --完整状态
            EMPTY = "对不起...",     --只剩底座
        },

        LAVA_POND_ROCK = "很热的岩浆石",   --岩浆池旁边的小石子(显示为岩石但不可挖掘只在岩浆池边上出现)
        WEBBERSKULL = "蜘蛛长相的骨头",     --韦伯的头骨(韦伯没解锁时摧毁蜘蛛巢有5%的概率出现，世界唯一)

        WORMLIGHT = "亮亮的果子!",     --发光浆果
		WORMLIGHT_LESSER = "有点干瘪了...",       --小发光浆果
		WORM =      --洞穴蠕虫
		{
		    PLANT = "是那种亮亮的果子！",       --检查神秘的发光浆果
		    DIRT = "地下有什么要出来了",        --检查洞穴蠕虫潜藏的土堆
		    WORM = "好大的虫子！(⚲^⚲)",         --检查洞穴蠕虫
		},
        WORMLIGHT_PLANT = "亮亮的果子!这回是安全的吗……",      --检查神秘的发光浆果(但是没有洞穴蠕虫)
		
        MOLE = {      --鼹鼠
			HELD = "一只地鼠, 它饿不饿? ",      --检查物品栏的鼹鼠(可用Alt+鼠标左键强制检查)
			UNDERGROUND = "正在找食物的地鼠",   --检查隆起的土堆
			ABOVEGROUND = "这是活的，不能玩打地鼠游戏",     --检查鼹鼠丘里的鼹鼠(被抓之前)
		},
		MOLEHILL = "一个地洞，里面藏着谁",    --检查鼹鼠丘
		MOLEHAT = "这就是生物科技吗",   --鼹鼠帽

        EEL = "可以做成好吃的",   --死鳗鱼
		EEL_COOKED = "烤鱼，好香！",   --熟鳗鱼
        UNAGI = "把鳗鱼做得更精致了！",     --鳗鱼料理

        EYETURRET = "眼睛转呀转",    --眼球塔(放置在地上)
		EYETURRET_ITEM = "它可以保护我吗？",      --眼球塔(物品栏)
        MINOTAURHORN = "很硬的角",    --守护者之角
		MINOTAURCHEST = "好华丽的箱子",    --大号华丽宝箱(守护者之角箱子)
        THULECITE = "这个对我有帮助吗？",       --铥矿
        THULECITE_PIECES = "这是一种矿物碎片",      --铥矿碎片
		POND_ALGAE = "一株水藻",       --水藻
		GREENSTAFF = "这根法杖可以拆掉很多东西",        --拆解魔杖
		GIFT = "一份礼物，给谁的呢?",       --礼物
        GIFTWRAP = "有了这个就可以包装礼物了",    --礼物包装
		POTTEDFERN = "栽种着蕨类植物的盆栽",    --蕨类盆栽
		CAVE_FERN = "潮湿的地方很容易长这类植物。",		-- 物品名:"蕨类植物"
        SUCCULENT_POTTED = "栽种着多肉植物的盆栽",     --多肉盆栽
		SUCCULENT_PLANT = "一株多肉植物",      --多肉植物(地上)
		SUCCULENT_PICKED = "我可以把它种近盆栽里当装饰",     --多肉植物(物品栏)
		SENTRYWARD = "名字是……\"月眼守卫\"……?",        --月眼守卫
        TOWNPORTAL =    --懒人传送塔
        {
			GENERIC = "用沙子把我送到别的地方",     --静止状态
			ACTIVE = "这个装置准备好了",        --激活可使用
		},
        TOWNPORTALTALISMAN =    --沙之石
        {
			GENERIC = "这个石头的味道好难闻.",     --静止状态
			ACTIVE = "它准备好把我送到别的地方了",      --激活可使用
		},
        --WETPAPER = "I hope it dries off soon.",   --(翻译为潮湿的纸,但是游戏中无法用代码直接生成出来)
        WETPOUCH = "这个包裹湿漉漉的",      --潮湿的包裹

        MOONROCK_PIECES = "和化石有点不一样...",   --月亮石碎块(其实就是月台周围砸碎无掉落的碎片)
        MOONBASE =      --月亮石(月台)
        {
            GENERIC = "它中间有个洞",   --常态未损坏
            BROKEN = "它坏掉了",    --损坏的
            STAFFED = "这样……就插好了~",    --放置了唤星者魔杖的月台
            WRONGSTAFF = "什么都没发生",    --放错魔杖的月台
            MOONSTAFF = "黄色的宝石变成了彩虹色的, 好神奇! ",     --放置着唤月者魔杖的月台
        },
        MOONDIAL =      --月晷
        {
			GENERIC = "水中倒映着月亮",       --白天常态
			NIGHT_NEW = "月牙一样的新月",     --新月
			NIGHT_WAX = "月亮要变圆了",     --由新月向满月
			NIGHT_FULL = "今晚是月圆",       --月圆
			NIGHT_WANE = "月亮正在往月牙变化",      --满月至新月
			CAVE = "这里看不到月亮",      --洞穴中查看月晷
			GLASSED = "四糸奈……这月亮是不是在看我……",        --月亮风暴
        },

		ARMORSKELETON = "这盔甲好可怕(QAQ)",       --骨头盔甲
		SKELETONHAT = "这头盔好可怕(QAQ)",      --骨头头盔

        ARMORRUINS = "这件盔甲能保护我，我的灵装也可以。",      --铥矿甲
		RUINS_BAT = "我一定要拿这个武器吗？",       --铥矿棒
		RUINSHAT = "很华丽的皇冠",      --铥矿皇冠
		NIGHTMARE_TIMEPIECE =       --铥矿徽章
		{
            CALM = "现在很安静",        --平静
            WARN = "四糸奈，我总觉得有些不安...",       --警告
            WAXING = "不安感越来越强",        --警告，暴动正在逐渐增强
            STEADY = "...",      --暴动很平稳
            WANING = "呼...哈呼...",    --暴动正在减弱
            DAWN = "终于...结束了",     --黎明
            NOMAGIC = "在这里好像不会变化",       --洞穴外
		},

		BISHOP = "长得好奇怪",		-- 物品名:"发条主教"
        BISHOP_NIGHTMARE = "它...应该不会突然动起来吧...",       --损坏的发条主教
        ROOK = "战车？还是城堡？",		-- 物品名:"发条战车"
		ROOK_NIGHTMARE = "好可怕",      --损坏的发条战车
        KNIGHT = "长得好奇怪",		-- 物品名:"发条骑士"
		KNIGHT_NIGHTMARE = "它坏掉了",        --损坏的发条骑士
		MINOTAUR = "大家伙并不开心",        --远古守护者
		SPIDER_DROPPER = "啊——！白色的蜘蛛！",      --穴居悬蛛
        SLURPER = "救命！四糸奈！",     --啜食者
		SLURPER_PELT = "这些毛可以保暖吗？",        --啜食者皮毛
		NIGHTMARELIGHT = "灯...阴森森的...",    --梦魇灯座

		NIGHTSTICK = "这柄锤子有电",      --晨星锤
        PURPLEGEM = "紫色的宝石, 很漂亮~",		--紫宝石
        YELLOWGEM = "黄色的宝石, 很漂亮~",     --黄宝石
		GREENGEM = "绿色的宝石, 好漂亮~",      --绿宝石
        ORANGEGEM = "橙色的宝石, 很漂亮~",     --橙宝石
        REDGEM = "红色的宝石, 像火焰一样",		--红宝石
		BLUEGEM = "蓝色的宝石，冰凉凉的很舒服~",		-- 蓝宝石
        OPALPRECIOUSGEM = "彩虹色的宝石，很特别很漂亮~",   --彩虹宝石
		MULTITOOL_AXE_PICKAXE = "很实用",           --多用斧镐
		ORANGESTAFF = "有了它就可以不用走路了?",     --懒人魔杖
		YELLOWAMULET = "它在发着光",                --魔光护符
		GREENAMULET = "带着它可以节省资源，好神奇!", --建造护符
        BLUEAMULET = "它和我的灵力特性相近",		-- 寒冰护符
		ORANGEAMULET = "这个会自动捡东西！",         --懒人护符
		ARMORSLURPER = "为什么带上它就不饿呢? ",     --饥饿腰带
        YELLOWSTAFF = "上面插着黄色的宝石",         --唤星者魔杖
        OPALSTAFF = "上面插着彩虹色的宝石",         --唤月者魔杖
        STAFFLIGHT = "暖洋洋的~不能靠近",           --矮星
        STAFFCOLDLIGHT = "冰凉凉的~不能靠太近",     --极光

        TELEBASE =      --传送焦点
		{
			VALID = "已经准备好了",     --激活
			GEMS = "似乎需要一些紫色的宝石",--未激活
		},
        GEMSOCKET =     --宝石底座
		{
			VALID = "已经安装好了",     --激活
			GEMS = "我应该放颗紫色的宝石上去",   --未激活
		},

        ANCIENT_ALTAR = "这好像是很久以前的东西了",--远古伪科学站
        ANCIENT_ALTAR_BROKEN = "太旧了，坏掉了",    --破损的远古伪科学站
        ANCIENT_STATUE = "这是...曾经的雕像",    --远古雕像

        LICHEN = "苔藓",        --苔藓(地上)
		CUTLICHEN = "苔藓",     --苔藓(物品栏)
		CAVE_BANANA = "香蕉",        --香蕉
		CAVE_BANANA_COOKED = "烤熟的香蕉",      --熟香蕉
		CAVE_BANANA_TREE = "香蕉树",      --香蕉树
		CAVE_BANANA_BURNT = "烧焦的香蕉树",		-- 物品名:"烧焦的洞穴香蕉树"
		ROCKY = "四糸奈，你看那块石头，有钳子！",     --石虾

        COMPASS =   --指南针
		{
			GENERIC="我学过怎么看指南针了！(骄傲.jpg)",
			N = "这边是北",
			S = "这边是南",
			E = "这边是东",
			W = "这边是西",
			NE = "这边是东北方向",
			SE = "这边是东南方向",
			NW = "这边是西北方向",
			SW = "这边是西南方向",
		},
        HOUNDSTOOTH = "尖尖的！",   --犬牙
        BAT = "啊！真可怕!(QAQ)",   --蝙蝠
        BATBAT = "四糸奈，你说我拿着两个是不是可以飞？",    --蝙蝠棒
        BATWING = "蝙蝠的翅膀...",   --蝙蝠翅膀
        BATWING_COOKED = "煮熟了我也不是很想吃...",    --熟蝙蝠翅膀
        BATCAVE = "我还是不要打扰了",   --蝙蝠洞
        BEDROLL_FURRY = "暖暖的，很舒服(*￣▽￣*)",     --毛皮铺盖
        BUNNYMAN = "大兔子。",      --兔人
        FLOWER_CAVE = "亮闪闪的花",       --荧光花
        LIGHTBULB = "会发光的果子",     --荧光果
        GUANO = "一坨便便...",      --鸟粪
        LANTERN = "灯笼能驱赶黑暗",        --提灯
        SLEEPBOMB = "我想小憩一会",                --睡袋
        MUSHROOMHAT = "蘑菇制成的帽子",  --蘑菇帽
        MUSHROOM_LIGHT =    --蘑菇灯
        {
            ON = "它的灯光很柔和",    --放入燃料开启
            OFF = "它不亮了",   --未激活
            BURNT = "灯盏在燃烧，需要灭火",   --燃烧状态
        },
        MUSHROOM_LIGHT2 =   --菌伞灯
        {
            ON = "有色彩的灯光",    --亮的
            OFF = "灯灭了",   --不亮的
            BURNT = "灯盏在燃烧，需要灭火", --燃烧中
        },
        MUSHROOMBOMB = "四糸奈：会爆炸的蘑菇！",    --爆炸蘑菇
        SHROOM_SKIN = "脏兮兮的皮！",              --蘑菇皮
        TOADSTOOL_CAP = --蟾蜍菇
        {
            EMPTY = "这里只剩一个洞",   --空状态
            INGROUND = "有东西出现了！",  --毒菌蟾蜍在地里
            GENERIC = "我应该离这朵蘑菇远一点", --常态默认
        },
        TOADSTOOL = --毒菌蟾蜍
        {
            GENERIC = "好可怕(QAQ)",   --常态默认
            RAGE = "它生气了",  --暴怒
        },
        MUSHROOMSPROUT =    --孢子帽(毒菌蟾蜍的技能之一)
        {
            GENERIC = "这是...它的能力",   --常态默认
            BURNT = "我应该熄灭火吗? (四糸奈: 先离远点吧)", --燃烧状态
        },

        MUSHTREE_TALL =     --蓝磨菇树
        {
            GENERIC = "蓝蘑菇长成的树",   --常态默认
            BLOOM = "蘑菇树在散落孢子",     --产孢子
            ACIDCOVERED = "酸雨过后，味道很难闻",      --淋了酸雨
        },
        MUSHTREE_MEDIUM =     --红磨菇树
        {
            GENERIC = "红蘑菇长成的树",   --常态默认
            BLOOM = "蘑菇树在散落孢子",     --产孢子
            ACIDCOVERED = "酸雨过后，味道很难闻",      --淋了酸雨
        },
        MUSHTREE_SMALL =     --绿磨菇树
        {
            GENERIC = "绿蘑菇长成的树",   --常态默认
            BLOOM = "蘑菇树在散落孢子",     --产孢子
            ACIDCOVERED = "酸雨过后，味道很难闻",      --淋了酸雨
        },
        MUSHTREE_TALL_WEBBED =     --蛛网蓝蘑菇树
        {
            GENERIC = "这株蘑菇树布满了蜘蛛网",   --常态默认
            ACIDCOVERED = "酸雨过后，味道很难闻",      --淋了酸雨
        },
        SPORE_TALL =     --蓝磨菇孢子
        {
            GENERIC = "四处飘荡的孢子",   --常态默认
            HELD = "我想把它带回去种",    --物品栏内
        },
        SPORE_MEDIUM =     --红磨菇孢子
        {
            GENERIC = "四处飘荡的孢子",   --常态默认
            HELD = "我想把它带回去种",    --物品栏内
        },
        SPORE_SMALL =     --绿磨菇孢子
        {
            GENERIC = "四处飘荡的孢子",   --常态默认
            HELD = "我想把它带回去种",    --物品栏内
        },
        MUSHTREE_MOON = "这颗蘑菇树的孢子会爆炸",    --月亮蘑菇树
        SPORE_MOON = "它会爆炸，要离远一点",     --月亮蘑菇孢子

        MANRABBIT_TAIL = "很软乎的毛，我不想知道来源...",     --兔绒
        RABBITHOUSE =   --兔屋
        {
            GENERIC = "看起来好像胡萝卜~",   --常态默认
            BURNT = "房子烧起来了...",   --燃烧状态
        },

        SNURTLE = "小蜗牛慢慢跑",  --蜗牛龟
        SLURTLE = "和蜗牛一样",   --蛞蝓龟
        SLURTLE_SHELLPIECES = "细碎的碎片",     --外壳碎片
        SLURTLEHAT = "很坚实的头盔，我不想带这个...",     --背壳头盔
        ARMORSNURTLESHELL = "像蜗牛一样躲起来！", --蜗牛护甲
        SLURTLEHOLE = "黏乎乎的石头窝。",   --蛞蝓龟窝
        SLURTLESLIME = "四糸奈，要不你帮我拿着它吧",   --蛞蝓龟黏液

        SPIDER_HIDER = "四糸奈：只在洞穴里才会出现的蜘蛛",        --洞穴蜘蛛
        SPIDER_SPITTER = "四糸奈：这种蜘蛛很危险",        --喷吐蜘蛛
        SPIDERHOLE = "里面全是蜘蛛",    --布满蛛网的蛛网岩
        SPIDERHOLE_ROCK = "这里以前有很多蜘蛛",   --没有蛛网的蛛网岩

        STALAGMITE = "一块像笋一样成长的大石头",        --石笋
        STALAGMITE_TALL = "石头柱子",  --石笋柱

        TURF_CARPETFLOOR = "一些地皮。",		-- 物品名:"地毯地板" 制造描述:"超级柔软。闻着就像皮弗娄牛。"
        TURF_CHECKERFLOOR = "一些地皮。",		-- 物品名:"棋盘地板" 制造描述:"精心制作成棋盘状的大理石地砖。"
        TURF_DIRT = "一些地皮。",		-- 物品名:"泥土地皮" 最底层的地皮，可以把其他地皮放置其上
        TURF_FOREST = "一些地皮。",		-- 物品名:"森林地皮" 制造描述:"一块森林地皮。"
        TURF_GRASS = "一些地皮。",		-- 物品名:"长草地皮" 制造描述:"一片草地。"
        TURF_MARSH = "一些地皮。",		-- 物品名:"沼泽地皮" 制造描述:"沼泽在哪，家就在哪！"
        TURF_METEOR = "一些地皮。",		-- 物品名:"月球环形山地皮" 制造描述:"月球表面的月坑。"
        TURF_PEBBLEBEACH = "一些地皮。",		-- 物品名:"岩石海滩地皮" 制造描述:"一块鹅卵石海滩地皮。"
        TURF_ROAD = "一些地皮。",		-- 物品名:"卵石路" 制造描述:"修建你自己的道路，通往任何地方。"
        TURF_ROCKY = "一些地皮。",		-- 物品名:"岩石地皮" 制造描述:"一块石头地皮。"
        TURF_SAVANNA = "一些地皮。",		-- 物品名:"热带草原地皮" 制造描述:"一块热带草原地皮。"
        TURF_WOODFLOOR = "一些地皮。",		-- 物品名:"木地板" 制造描述:"优质复合地板。"
		TURF_CAVE="一些地皮。",		-- 物品名:"鸟粪地皮" 制造描述:"洞穴地面冰冷的岩石。"
		TURF_FUNGUS="一些地皮。",		-- 物品名:"真菌地皮" 制造描述:"一块长满了真菌的洞穴地皮。"(蓝)
		TURF_SINKHOLE="一些地皮。",		-- 物品名:"黏滑地皮" 制造描述:"一块潮湿、沾满泥巴的草地地皮。"
		TURF_UNDERROCK="一些地皮。",		-- 物品名:"洞穴岩石地皮" 制造描述:"一块乱石嶙峋的洞穴地皮。"
		TURF_MUD="一些地皮。",		-- 物品名:"泥泞地皮" 制造描述:"一块泥地地皮。"
		TURF_DECIDUOUS = "一些地皮。",		-- 物品名:"落叶林地皮" 制造描述:"一块落叶林地皮。"
		TURF_SANDY = "一些地皮。",		--(暂无注释)
		TURF_BADLANDS = "一些地皮。",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品。"
		TURF_DESERTDIRT = "一些地皮。",		-- 物品名:"沙漠地皮" 制造描述:"一片干燥的沙子。"
		TURF_FUNGUS_GREEN = "一些地皮。",		-- 物品名:"菌类地皮" 制造描述:"一块爬满绿菌的洞穴地皮。"(绿)
		TURF_FUNGUS_RED = "一些地皮。",		-- 物品名:"菌类地皮" 制造描述:"一块爬满红菌的洞穴地皮。"(红)
		TURF_FUNGUS_MOON = "一些地皮。",		-- 物品名:"变异菌类地皮" 制造描述:"一块长满了变异真菌的洞穴地皮。"
		TURF_ARCHIVE = "一些地皮。",		-- 物品名:"远古石刻" 制造描述:"解封档案馆中的远古石器。"
        TURF_VAULT = "一些地皮。", 		-- 物品名:"远古圣殿石刻" 制造描述:"圣殿中的远古石刻。"
        TURF_VENT = "一些地皮。", 		-- 物品名:"洞穴喷气孔地皮" 制造描述:"一块乱石嶙峋的冒烟洞穴地皮。"
		TURF_DRAGONFLY = "一些地皮。", 		-- 物品名:"龙鳞地板" 制造描述:"消除火灾蔓延速度。"
        TURF_BEARD_RUG = "一些地皮。", 		-- 物品名:"胡须地毯" 制造描述:"有些人就是喜欢行为艺术。"
        TURF_SHELLBEACH = "一些地皮。", 		-- 物品名:"贝壳海滩地皮" 制造描述:"一块贝壳海岸。"
		TURF_RUINSBRICK = "一些地皮。", 		-- 物品名:"远古地面" 制造描述:"远古石制地面，装饰的魔法技艺早已失传。"
		TURF_RUINSBRICK_GLOW = "一些地皮。", 		-- 物品名:"仿远古地面" 制造描述:"远古石制地面的复刻。"
		TURF_RUINSTILES = "一些地皮。",		-- 物品名:"远古瓷砖" 制造描述:"瓷砖地面，装饰的魔法技艺早已失传。"
		TURF_RUINSTILES_GLOW = "一些地皮。",		-- 物品名:"仿远古瓷砖" 制造描述:"远古瓷砖地面的复刻。"
		TURF_RUINSTRIM = "一些地皮。",		-- 物品名:"远古砖雕" 制造描述:"砖石地面，装饰的魔法技艺早已失传。"
		TURF_RUINSTRIM_GLOW = "一些地皮。",		-- 物品名:"仿远古砖雕" 制造描述:"远古砖石地面的复刻。"
        TURF_MONKEY_GROUND = "一些地皮。",		-- 物品名:"月亮码头海滩地皮" 制造描述:"一片沙地，散发着淡淡的香蕉香。"
        TURF_CARPETFLOOR2 = "一些地皮。",		-- 物品名:"茂盛地毯" 制造描述:"超级超级软。"
        TURF_MOSAIC_GREY = "一些地皮。",		-- 物品名:"灰色马赛克地板" 制造描述:"优雅的碎石。灰色。"
        TURF_MOSAIC_RED = "一些地皮。",		-- 物品名:"红色马赛克地板" 制造描述:"优雅的碎石。红色。"
        TURF_MOSAIC_BLUE = "一些地皮。",		-- 物品名:"蓝色马赛克地板" 制造描述:"优雅的碎石。蓝色。"
		TURF_COTL_GOLD = "黄金地皮。",		-- 物品名:"黄金地板" 制造描述:"为新的黄金时代奠定基础。"
		TURF_COTL_BRICK = "砖地板。",		-- 物品名:"砖地板" 制造描述:"单独的砖块聚集在一起用于更大的目的。"

		POWCAKE = "一块超~长保质期的蛋糕，可惜不好吃。",		--粉末蛋糕

        CAVE_ENTRANCE = "岩石把洞口堵住了",		--被堵住的洞穴
        CAVE_ENTRANCE_RUINS = "那下面有什么？",		--被堵住的陷洞
       	CAVE_ENTRANCE_OPEN =		--打开了的洞口
        {
            GENERIC = "我现在不想进去",		--洞穴服务器异常
            OPEN = "真的要进入地下吗",		--洞穴世界开放中
            FULL = "人太多了",		--洞穴世界服务器满员了
        },
        CAVE_EXIT =		--楼梯
        {
            GENERIC = "还要继续在地下待一会吗...",		--地上世界服务器异常(洞口堵住了)
            OPEN = "这下面又黑又恐怖，想回去了……",		--楼梯开放中
            FULL = "外面人太多了……我们在这里等吧。",		--地上世界服务器满员了
        },
        --MAXWELLPHONOGRAPH = "音乐原来是从那来的。",--麦斯威尔的留声机(单机版独有，联机版名称仅为“留声机”)
        --ADVENTURE_PORTAL = "我不想再一次上当了。",--麦斯威尔之门(单机版独有，可进入冒险模式)

        BOOMERANG = "它会自己飞回来的",   --回旋镖
		PIGGUARD = "猪先生脾气不太好",      --猪人守卫
		AMULET = "戴着它我感觉很安全。",		--重生护符
		ANIMAL_TRACK = "四糸乃发现脚印！",		--动物足迹
		ARMORGRASS = "用草藤编织的护甲",		--草甲
		ARMORMARBLE = "好重！",		--大理石甲
		ARMORWOOD = "木头包裹的盔甲，我在历史书上见过",		--木甲
		ARMOR_SANITY = "穿这个让我感觉灵力变得紊乱",		--暗夜甲
        ASH =		--灰烬
		{
			GENERIC = "被火烧完剩下的残渣",       --常态默认
			--REMAINS_GLOMMERFLOWER = "格罗姆花的灰烬",   --特殊的灰烬，单机独有
			--REMAINS_EYE_BONE = "眼骨的灰烬",   --特殊的灰烬，单机独有
			--REMAINS_THINGIE = "烧尽前曾是某样东西",   --特殊的灰烬，单机独有
		},
        AXE = "一柄小斧头",	-- 物品名:"斧头" 制造描述:"砍倒树木！"
		BABYBEEFALO =   --小皮弗娄牛
		{
			GENERIC = "小牛喜欢玩耍",		-- 物品名:"小皮弗娄牛"常态默认
		    SLEEPING = "嘘...小牛在睡觉",		-- 物品名:"小皮弗娄牛"->睡着了
        },
        BUNDLE = "捆绑得很扎实",		-- 物品名:"捆绑物资"
        BUNDLEWRAP = "捆绑起来方便携带",		-- 物品名:"捆绑包装" 制造描述:"打包你的东西的部分和袋子。"
		BACKPACK = "一个小背包，能装更多可爱的东西",		-- 物品名:"背包" 制造描述:"携带更多物品。"
		BACONEGGS = "作为早餐很营养",		-- 物品名:"培根煎蛋"
		BANDAGE = "四糸奈，可以帮我在伤口上涂点蜂蜜吗?",		-- 物品名:"蜂蜜药膏" 制造描述:"愈合小伤口。"
		BASALT = "这块石头我挖不了",		-- 物品名:"玄武岩"
		BEARDHAIR = "好脏好脏...",		-- 物品名:"胡须"
		BEARGER = "好大的熊",		-- 物品名:"熊獾"
		BEARGERVEST = "用大熊的皮做成背心，冬天穿着很暖。",		-- 物品名:"熊皮背心" 制造描述:"熊皮背心。"
		ICEPACK = "这个背包里面好冷",		-- 物品名:"保鲜背包" 制造描述:"容量虽小，但能保持东西新鲜。"
		BEARGER_FUR = "做冬季衣服的材料",		-- 物品名:"熊皮" 制造描述:"毛皮再生。"
		BEDROLL_STRAW = "凉凉的草席，夏天睡着很舒服",		-- 物品名:"草席卷" 制造描述:"一觉睡到天亮。"
        BEEQUEEN = "蜜蜂们的国王",		-- 物品名:"蜂王"
		BEEQUEENHIVE = 		-- 物品名:"蜂蜜地块"
		{
			GENERIC = "蜜蜂把它们甜美的标记留在土地上。", 		-- 常态默认
			GROWING = "她暂时...不会构成危险...",		-- 正在生长
		},
        BEEQUEENHIVEGROWN = "满满的蜂蜜，甜甜的。",		-- 物品名:"巨大蜂窝"
        BEEGUARD = "这种蜜蜂很擅长战斗",		-- 物品名:"嗡嗡蜜蜂"
        HIVEHAT = "一顶有特殊作用的帽子",		-- 物品名:"蜂王冠"
        MINISIGN =		-- 物品名:"小木牌"
        {
            GENERIC = "小木牌",		-- 常态默认
            UNDRAWN = "木牌上面没有字",		-- 没有画画
        },
        MINISIGN_ITEM = "这块木牌可以用来写字画画",		-- 物品名:"小木牌" 制造描述:"用羽毛笔在这些上面画画。"
		BEE =		-- 物品名:"蜜蜂"
		{
			GENERIC = "要小心蜜蜂的尾针",		-- 常态默认
			HELD = "它想出去采蜜",		-- 放在物品栏
		},
		BEEBOX =		-- 物品名:"蜂箱" 制造描述:"贮存你自己的蜜蜂。"
		{
			READY = "蜂蜜存满了",		-- 准备好采收的，满的
			FULLHONEY = "蜂蜜存满了",		-- 蜂蜜满了
			GENERIC = "小蜜蜂们的新家",		-- 常态默认
			NOHONEY = "小蜜蜂们累了",		-- 没有蜂蜜
			SOMEHONEY = "再等一段时间吧...",		-- 有一些蜂蜜
			BURNT = "蜂箱被烧没了...",		-- 烧焦的
		},
        MUSHROOM_FARM =		-- 物品名:"蘑菇农场" 制造描述:"种蘑菇。"
		{
			STUFFED = "完全充满了生机...",		-- 塞满了
			LOTS = "尽管困难重重...它还是茁壮成长...",		-- 很多
			SOME = "生命的开始...",		-- 有一些
			EMPTY = "我需要找点孢子开始种蘑菇",		-- 空的
			ROTTEN = "为什么腐烂不能种蘑菇...",		-- 腐烂的--需要活木
			BURNT = "烧成这样好可惜",		-- 烧焦的
			SNOWCOVERED = "雪铺满了",		-- 被雪覆盖
		},
		BEEFALO =		-- 皮弗娄牛
		{
            FOLLOWER = "牛牛跟着我一起走",		-- 追随状态
			GENERIC = "牛",		-- 常态默认
			NAKED = "被拔了毛的牛牛",		-- 牛毛被刮干净了
			SLEEPING = "牛牛在睡梦中会梦见什么呢...",		-- 睡着了
            --Domesticated states:
            DOMESTICATED = "它现在和我是朋友",		-- 驯化牛
            ORNERY = "它可以和我一起战斗",		-- 战斗牛
            RIDER = "我们可以一起到远方冒险。",		-- 骑行牛
            PUDGY = "你是不是吃得太胖了?",		-- 胖牛
            MYPARTNER = "我们是朋友",		-- 牛伙伴
            DEAD = "它的生命结束了...",		-- 牛死亡
            DEAD_MYPARTNER = "还是把它吃了吧",		-- 牛伙伴死亡
		},
        BEEFALOHAT = "四糸奈,我这样戴起来有没有像牛一点?",		-- 物品名:"牛角帽" 制造描述:"成为牛群中的一员！连气味也变得一样。"
		BEEFALOWOOL = "牛牛身上的毛, 很暖",		-- 物品名:"牛毛"
		BEEHAT = "养蜂人们必备的装备",		-- 物品名:"养蜂帽" 制造描述:"防止被愤怒的蜜蜂蜇伤。"
        BEESWAX = "蜡块有着蜂蜜的香气",		-- 物品名:"蜂蜡" 制造描述:"一种有用的防腐蜂蜡。"
		BEEHIVE = "小蜜蜂们的家",		-- 物品名:"蜂窝"
		BEEMINE = "蜜蜂也可以保护我",		-- 物品名:"蜜蜂地雷" 制造描述:"变成武器的蜜蜂。会出什么问题？"
		--BEEMINE_MAXWELL = "里面暴怒的生物无比怀念往昔的自由。",		-- 物品名:"麦斯威尔的蚊子陷阱"->单机 麦斯威尔的蚊子陷阱
		BERRIES = "这些浆果有点酸。",		-- 物品名:"浆果"
		BERRIES_COOKED = "烤得有点干",		-- 物品名:"烤浆果"
        BERRIES_JUICY = "这些浆果虽然有点酸, 但汁水很多",		-- 物品名:"多汁浆果"
        BERRIES_JUICY_COOKED = "烤得有点干, 汁水都没了",		-- 物品名:"烤多汁浆果"
		BERRYBUSH =		-- 物品名:"浆果丛"
		{
			BARREN = "荒芜了。",
			WITHERED = "太高温了。",		-- 枯萎了
			GENERIC = "上面长满了浆果",		-- 常态默认
			PICKED = "浆果已经被采完了",		-- 被采完了
			BURNING = "烧着了...",		-- 正在燃烧
		},
		BERRYBUSH_JUICY =		-- 物品名:"多汁浆果丛"
		{
			BARREN = "荒芜了。",
			WITHERED = "太高温了。",		--枯萎了
			GENERIC = "上面长满了浆果",		--默认
			PICKED = "浆果已经被采完了",		--被采完了
			BURNING = "烧着了...",		--正在燃烧
		},
        BIRDCAGE =	-- 物品名:"鸟笼" 制造描述:"为你的鸟类朋友提供一个幸福的家。"
		{
			GENERIC = "囚禁小鸟的牢笼。",		-- 默认
			OCCUPIED = "对不起, 但我需要你",		-- 鸟笼放了鸟
			SLEEPING = "它睡着了，很安静",		-- 睡着了
			HUNGRY = "小鸟饿了。",		-- 有点饿了
			STARVING = "不能再让小鸟饿下去了...",		-- 挨饿
			DEAD = "安息...",		-- 死了
			SKELETON = "那...曾经是一只鸟。",		-- 只剩鸟骨头了
		},
        BIRDTRAP = "捉小鸟的陷阱",		-- 物品名:"捕鸟陷阱" 制造描述:"捕捉会飞的动物。"
		BIRD_EGG = "鸟蛋",		-- 物品名:"鸟蛋"
		BIRD_EGG_COOKED = "煎熟的蛋",		-- 物品名:"煎蛋"
		BLOWDART_FIRE = "可以发射附着火焰的箭矢",		-- 物品名:"火焰吹箭" 制造描述:"向你的敌人喷火。"
		BLOWDART_SLEEP = "可以发射令人睡着的箭矢",		-- 物品名:"催眠吹箭" 制造描述:"催眠你的敌人。"
		BLOWDART_PIPE = "可以发射箭矢",		-- 物品名:"吹箭" 制造描述:"向你的敌人喷射利齿。"
		BLOWDART_YELLOW = "可以发射附着雷电的箭矢",		-- 物品名:"雷电吹箭" 制造描述:"朝你的敌人放闪电。"
		BLUEPRINT = 		-- 物品名:"蓝图"
		{ 
            COMMON = "一份知识",		-- 普通蓝图
            RARE = "这份知识很珍贵",		-- 稀有蓝图
        },
        SKETCH = "四糸奈，我想尝试造出这里画的东西,\n冰块可以做吗...",		-- 物品名:"{item}雕塑草图"
		COOKINGRECIPECARD =		-- 食谱卡
		{
			GENERIC = "一份食谱,可以教我做好吃的",
		},
        BLUE_CAP = "蓝蘑菇",		-- 物品名:"采摘的蓝蘑菇"
		BLUE_CAP_COOKED = "煮熟的蓝蘑菇",		-- 物品名:"烤蓝蘑菇"
		BLUE_MUSHROOM =		-- 物品名:"蓝蘑菇"
		{
			GENERIC = "蓝蘑菇",		-- 常态默认
			INGROUND = "地里长着蓝蘑菇",		-- 在地里面
			PICKED = "采掉了...",		-- 被采完了
		},
		BOARDS = "几块木板",		-- 物品名:"木板" 制造描述:"更平直的木头。"
		BONESHARD = "这是骨头的碎片",		-- 物品名:"骨头碎片"
		BONESTEW = "熬煮的营养肉汤",		-- 物品名:"炖肉汤"
		BUGNET = "有了这个就可以捕捉萤火虫了",		-- 物品名:"捕虫网" 制造描述:"抓虫子用的。"
		BUSHHAT = "躲猫猫时很好用",		-- 物品名:"灌木丛帽" 制造描述:"很好的伪装！"
		BUTTER = "小块黄油",		-- 物品名:"黄油"
		BUTTERFLY =		-- 物品名:"蝴蝶"
		{
			GENERIC = "漂亮的小蝴蝶",		-- 常态默认
			HELD = "想带它去花朵更多的地方",		-- 在物品栏中
		},
		BUTTERFLYMUFFIN = "这道菜叫\"蝴蝶松饼\"",		-- 物品名:"蝴蝶松饼"
		BUTTERFLYWINGS = "蝴蝶的翅膀...",		-- 物品名:"蝴蝶翅膀"
		BUZZARD = "四糸奈: 秃鹫, 一种鸟类",		-- 物品名:"秃鹫"
		--SHADOWDIGGER = "",		-- 物品名:"暗影挖掘者" 已经归到了暗影仆人里面,代码为"shadowworker"
        --SHADOWDANCER = "Some things you can never unsee...",  --暗影舞者 (貌似已废弃)
        CACTUS = 	-- 物品名:"仙人掌"
		{
			GENERIC = "要小心，会扎手",		-- 常态默认
			PICKED = "被采走了...",		-- 被采完了
		},
		CACTUS_MEAT_COOKED = "烤熟的仙人掌肉",		-- 物品名:"烤仙人掌肉"
		CACTUS_MEAT = "仙人掌肉, 不知道味道怎么样",		-- 物品名:"仙人掌肉"
		CACTUS_FLOWER = "仙人掌开花, 很稀有的美景",		-- 物品名:"仙人掌花"
		COLDFIRE =		-- 物品名:"吸热营火" 制造描述:"这火是越烤越冷的冰火。"
		{
			EMBERS = "又要回到黑暗了吗...",		-- 即将熄灭
			GENERIC = "这团火焰为什么是冷的呢...",		-- 常态默认
			HIGH = "很耀眼的火光",		-- 高
			LOW = "火有点小了",		-- 低
			NORMAL = "蓝色的火光",		-- 普通
			OUT = "只剩下来过的痕迹",		-- 熄灭后
		},
		CAMPFIRE =		-- 物品名:"营火" 
		{
			EMBERS = "又要回到黑暗了吗... ",		-- 即将熄灭
			GENERIC = "有火光在, 四糸乃不用怕黑了...",		-- 常态默认
			HIGH = "很耀眼的火光",		-- 高
			LOW = "火光变小了",		-- 低
			NORMAL = "明亮的火光",		-- 普通
			OUT = "只剩下来过的痕迹",		-- 熄灭后
		},
		CANE = "方便行走的手杖",		-- 物品名:"步行手杖" 制造描述:"泰然自若地快步走。
        CATCOON = "像浣熊更像小猫",		-- 物品名:"浣猫"
		CATCOONDEN = 		-- 物品名:"空心树桩"
		{
			GENERIC = "我想躲在里面",		-- 常态默认
			EMPTY = "里面没有什么东西",		-- 空的
		},
		CATCOONHAT = "好可爱的帽子。",		-- 物品名:"猫帽" 制造描述:"适合那些重视温暖甚于朋友的人。"
		COONTAIL = "小猫的尾巴在这, 也就是说...",		-- 物品名:"猫尾"
		CARTOGRAPHYDESK =		-- 物品名:"制图桌" 制造描述:"准确地告诉别人你去过哪里。"
		{
			GENERIC = "把去过的地方记录下来吧",		-- 常态默认
			BURNING = "怎么烧起来了...",		-- 正在燃烧
			BURNT = "已经不能用了...",		-- 烧焦的
		},
		CHARCOAL = "木炭, 可以用来生火做饭",		-- 物品名:"木炭"

        CHESSPIECE_PAWN = "兵卒样式的雕塑",		-- 物品名:"卒子雕塑"
        CHESSPIECE_ROOK =		-- 物品名:"战车雕塑"
        {
            GENERIC = "车样式的雕塑",		-- 常态默认
            STRUGGLE = "棋子在抖动。",		-- 三基佬棋子晃动
        },
        CHESSPIECE_KNIGHT =		-- 物品名:"骑士雕塑"
        {
            GENERIC = "马样式的雕塑",		-- 常态默认
            STRUGGLE = "棋子在抖动。",		-- 三基佬棋子晃动
        },
        CHESSPIECE_BISHOP =		-- 物品名:"主教雕塑"
        {
            GENERIC = "国际象棋的象样式的雕塑",		-- 常态默认
            STRUGGLE = "棋子在抖动。",		-- 三基佬棋子晃动
        },
        CHESSPIECE_MUSE = "国际象棋的皇后棋子的雕塑。",		-- 物品名:"女王雕塑"
        CHESSPIECE_FORMAL = "国际象棋的国王棋子的雕塑。",		-- 物品名:"国王雕塑"
        CHESSPIECE_HORNUCOPIA = "象征着丰收",		-- 物品名:"丰饶角雕塑"
        CHESSPIECE_PIPE = "烟斗形状的泡泡枪玩具雕像",		-- 物品名:"泡泡烟斗雕塑"
        CHESSPIECE_DEERCLOPS = "是那头巨鹿怪物的雕像！",		-- 物品名:"独眼巨鹿雕塑"
        CHESSPIECE_MOON = "看起来像真的月亮一样美。",		-- 物品名:"“月亮” 雕塑"
        CHESSPIECE_BUTTERFLY = "和它本身很像。",		-- 物品名:"月蛾雕塑"
        CHESSPIECE_BEARGER = "是大熊的雕像。",		-- 物品名:"熊獾雕塑"
        CHESSPIECE_MOOSEGOOSE =		-- 物品名:"麋鹿鹅雕塑" 制造描述:"一石二鸟"
        {
            "大鹅的雕像",
        },
        CHESSPIECE_DRAGONFLY = "啊，这让我想起一些不好的事情",		-- 物品名:"龙蝇雕塑"
		CHESSPIECE_MINOTAUR = "和它本身很像。",		-- 物品名:"远古守护者雕塑"
        CHESSPIECE_ANCHOR = "船锚的雕塑",		-- 物品名:"锚雕塑"
        CHESSPIECE_CARRAT = "和它本身很像。",		-- 物品名:"胡萝卜鼠雕塑"
        CHESSPIECE_MALBATROSS = "和它本身很像。",		-- 物品名:"邪天翁雕塑"
        CHESSPIECE_CRABKING = "和它本身很像。",		-- 物品名:"帝王蟹雕塑"
        CHESSPIECE_TOADSTOOL = "和它本身很像。",		-- 物品名:"毒菌蟾蜍雕塑"
        CHESSPIECE_STALKER = "和它本身很像。",		-- 物品名:"远古织影者雕塑"
        CHESSPIECE_KLAUS = "和它本身很像。",		-- 物品名:"克劳斯雕塑"
        CHESSPIECE_BEEQUEEN = "和它本身很像。",		-- 物品名:"蜂王雕塑"
        CHESSPIECE_ANTLION = "和它本身很像。",		-- 物品名:"蚁狮雕塑"
        CHESSPIECE_BEEFALO = "和它本身很像。",		-- 物品名:"皮弗娄牛雕塑"
		CHESSPIECE_KITCOON = "好多小猫堆高高!",		-- 物品名:"浣猫崽雕塑"
		CHESSPIECE_CATCOON = "和它本身很像。",		-- 物品名:"浣猫雕塑"
        CHESSPIECE_MANRABBIT = "和它本身很像。",		-- 物品名:"兔人雕塑"
        CHESSPIECE_GUARDIANPHASE3 = "和它本身很像。",		-- 物品名:"天体英雄雕塑"
        CHESSPIECE_EYEOFTERROR = "和它本身很像。",		-- 物品名:"恐怖之眼雕塑"
        CHESSPIECE_TWINSOFTERROR = "和它本身很像。",		-- 物品名:"双子魔眼雕塑"
        CHESSPIECE_DAYWALKER = "和它本身很像。",		-- 物品名:"梦魇疯猪雕塑"
        CHESSPIECE_DAYWALKER2 = "和它本身很像。",		-- 物品名:"拾荒疯猪雕塑"
        CHESSPIECE_DEERCLOPS_MUTATED = "和它本身很像。",		-- 物品名:"晶体独眼巨鹿雕塑"
        CHESSPIECE_WARG_MUTATED = "和它本身很像。",		-- 物品名:"附身座狼雕塑"
        CHESSPIECE_BEARGER_MUTATED = "和它本身很像。",		-- 物品名:"装甲熊獾雕塑"
        CHESSPIECE_SHARKBOI = "和它本身很像。",		-- 物品名:"大霜鲨雕塑"
        CHESSPIECE_WORMBOSS = "和它本身很像。",		-- 物品名:"巨大洞穴蠕虫雕塑"
        CHESSPIECE_YOTS = "和它本身很像。",		-- 物品名:"镀金洞穴蠕虫雕塑"
        CHESSPIECE_WAGBOSS_ROBOT = "和它本身很像。",		-- 物品名:"战争瓦器人雕塑"
        CHESSPIECE_WAGBOSS_LUNAR = "和它本身很像。",		-- 物品名:"天体后裔雕塑"
        CHESSJUNK1 = "它,应该不会突然动起来吧...",		-- 物品名:"损坏的发条装置(主教&骑士)"
        CHESSJUNK2 = "它,应该不会突然动起来吧...",		-- 物品名:"损坏的发条装置(骑士&战车)"
        CHESSJUNK3 = "它,应该不会突然动起来吧...",		-- 物品名:"损坏的发条装置(主教&战车)"

        CHESTER = "有点像猪笼草, 可以装点东西进去",		-- 物品名:"切斯特"
		CHESTER_EYEBONE =		-- 物品名:"眼骨"
		{
			GENERIC = "它的眼睛会动! ",		-- 常态默认(眼睛睁开时)
			WAITING = "眼睛闭上了",		-- 阖眼状态
		},
		COOKEDMEAT = "烤熟的会不会有点硬?",		-- 物品名:"烤大肉"
		COOKEDMONSTERMEAT = "四糸奈: 这种肉熟了也不能吃吧...",		-- 物品名:"烤怪物肉"
		COOKEDSMALLMEAT = "一小块烤肉, 足够了",		-- 物品名:"烤小肉"
		COOKPOT =		-- 物品名:"烹饪锅" 制造描述:"制作更好的食物。"
		{
			COOKING_LONG = "刚放进去呢...",		-- 饭还需要很久
			COOKING_SHORT = "再等一小会就好啦~",		-- 饭快做好了
			DONE = "食物出炉了。",		-- 完成了
			EMPTY = "该做饭了",		--空的
			BURNT = "烧焦了。",		-- 烧焦的
		},
		CORN = "软糯糯的玉米",		-- 物品名:"玉米"
		CORN_COOKED = "玉米爆炸成了爆米花",		-- 物品名:"爆米花"
		CORN_SEEDS = "玉米种子",		-- 物品名:"玉米种子"
		CARROT = "一根胡萝卜~",		-- 物品名:"胡萝卜"
		CARROT_COOKED = "烤熟的胡萝卜。",		-- 物品名:"烤胡萝卜"
		CARROT_PLANTED = "地里有根胡萝卜",		-- 物品名:"胡萝卜" (地里)
		CARROT_SEEDS = "胡萝卜正在长大",		-- 物品名:"胡萝卜种子"
        WATERMELON_SEEDS = "西瓜子, 也可以种",		-- 物品名:"西瓜种子"
        CANARY =		-- 物品名:"金丝雀"
		{
			GENERIC = "金灿灿的颜色",		-- 常态默认
			HELD = "听说金丝雀难以养活",		-- 物品栏中
		},
        CANARY_POISONED = "它中毒了",		-- 金丝雀（中毒）

        CRITTERLAB = "里面好像藏着小动物",		-- 物品名:"岩石巢穴"
        CRITTER_GLOMLING = "毛茸茸的奇怪小家伙",		-- 物品名:"小格罗姆"
        CRITTER_DRAGONLING = "我不喜欢长大后的它",		-- 物品名:"小龙蝇"
		CRITTER_LAMB = "它的毛并不柔软",		-- 物品名:"小钢羊"
        CRITTER_PUPPY = "小狗狗~",		-- 物品名:"小座狼"
        CRITTER_KITTEN = "小猫咪~",		-- 物品名:"小浣猫"
        CRITTER_PERDLING = "可爱的小鸡",		-- 物品名:"小火鸡"
		CRITTER_LUNARMOTHLING = "它来自月亮, 很美",		-- 物品名:"小蛾子"

        CROW =		-- 物品名:"乌鸦"
		{
			GENERIC = "乌鸦",		-- 常态默认
			HELD = "一只乌鸦",		-- 物品栏里
		},
		CUTGRASS = "一些草",		-- 物品名:"采下的草"
		CUTREEDS = "一些芦苇",		-- 物品名:"采下的芦苇"
		CUTSTONE = "可以用来盖房子",		-- 物品名:"石砖" 制造描述:"切成正方形的石头。"
		--DEADLYFEAST = "这，不错的最后一餐。",		-- 物品名:"致命的盛宴"->致命盛宴 单机
		DEER =		-- 物品名:"无眼鹿"
		{
			GENERIC = "毛太长了遮住了它的眼睛",		-- 常态默认(无角的)
			ANTLER = "这头鹿怎么只有独角? ",		-- 长角的
		},
        DEER_ANTLER = "某只鹿的角",		-- 物品名:"鹿角"
        DEER_GEMMED = "它们被拴住了",		-- 物品名:"无眼鹿"(有宝石的)
		DEERCLOPS = "它很暴躁, 为什么? ",		-- 物品名:"独眼巨鹿"
		DEERCLOPS_EYEBALL = "一颗眼球, 我不是很想带在身上",		-- 物品名:"独眼巨鹿眼球"
		EYEBRELLAHAT =	"画着眼睛的伞, 我有点害怕",		-- 物品名:"眼球伞" 制造描述:"面向天空的眼球让你保持干燥。"
		--DEPLETED_GRASS =		-- 物品名:"草"(单机版冒险模式资源枯竭限定)
		--{
		--	GENERIC = "一丛草的遗迹。",		-- 常态默认
		--},
        GOGGLESHAT = "新奇的护目镜",		-- 物品名:"时髦的护目镜" 制造描述:"你可以瞪大眼睛看装饰性护目镜。"
        DESERTHAT = "有了这个就不怕沙子进眼睛了",		-- 物品名:"沙漠护目镜" 制造描述:"从你的眼睛里把沙子揉出来。"
        ANTLIONHAT = "它能让园林绿化工作变得轻松很多",		-- 物品名:"刮地皮头盔" 制造描述:"“旧地不去，新地不来。”"
		--DEVTOOL = "It smells of bacon!",		-- 物品名:"开发工具"(单机独有)  
		--DEVTOOL_NODEV = "I'm not strong enough to wield it.",

        DIRTPILE = "这里有些可疑",		-- 物品名:"可疑的土堆"
		DRAGONFLY = "它的内心在燃烧。",		-- 物品名:"龙蝇"
		ARMORDRAGONFLY = "用鳞片制作的护甲",		-- 物品名:"鳞甲" 制造描述:"脾气火爆的盔甲。"
		DRAGON_SCALES = "承载痛苦的鳞片。",		-- 物品名:"鳞片"
        DRAGONFLYCHEST =	-- 物品名:"龙鳞宝箱" 制造描述:"一种结实且防火的容器。"
		{
			GENERIC = "能防火的大箱子",		-- 常态默认
            UPGRADED_STACKSIZE = "现在它能装更多东西了",		-- 用弹性空间制造器升级后
		},
        DRAGONFLYFURNACE = 		-- 物品名:"龙鳞火炉" 制造描述:"给自己建造一个苍蝇暖炉。"
		{
			HAMMERED = "还能修好吗...",		-- 被锤了(疑似已废弃)
			GENERIC = "很热的火炉", --no gems		-- 常态默认(现在的检查语音)
			NORMAL = "有点烫了", --one gem		-- 普通(疑似已废弃)
			HIGH = "火烧得好大", --two gems		-- 高(疑似已废弃)
		},
        HUTCH = "它跟着我, 是想做朋友吗? ",		-- 物品名:"哈奇"
        HUTCH_FISHBOWL =		-- 物品名:"星空"
        {
            GENERIC = "里面有一条小鱼",		-- 鱼活着
            WAITING = "小鱼死了...",		-- 鱼死亡
        },
		--LAVASPIT = 		-- 物品名:"龙蝇唾液"(单机巨人国DLC)
		--{
		--	HOT = "它在喷火。",
		--	COOL = "它凉下来了，气味很古怪。",
		--},
		LAVA_POND = "小心不要掉进去",		-- 物品名:"岩浆池"
		LAVAE = "小心不要碰到这种虫子",		-- 物品名:"岩浆虫"
		LAVAE_COCOON = "被冻死的虫卵",		-- 物品名:"冷冻虫卵"
		LAVAE_PET = 		-- 物品名:"超级可爱岩浆虫"
		{
			STARVING = "它快饿死了",		-- 饥饿值≤25
			HUNGRY = "它饿了",		-- 25<饥饿值≤50
			CONTENT = "它好像有点饿了",		-- 50<饥饿值≤75
			GENERIC = "一只快乐的岩浆虫",		-- 75<饥饿值常态默认
		},
        LAVAE_EGG = 		-- 物品名:"岩浆虫卵"
		{
			GENERIC = "值得拿你的未来冒险吗？",		-- 常态默认
		},
		LAVAE_EGG_CRACKED = 		-- 物品名:"岩浆虫卵"(孵化中)
		{
			COLD = "这颗蛋需要保暖",		-- 过冷
			COMFY = "会孵化出什么呢",		-- 常态默认
		},
		LAVAE_TOOTH = "一颗牙齿,也是信物",		-- 物品名:"岩浆虫尖牙"

        DRAGONFRUIT = "火龙果",		-- 物品名:"火龙果"
		DRAGONFRUIT_COOKED = "烤熟的火龙果",		-- 物品名:"烤火龙果"
		DRAGONFRUIT_SEEDS = "火龙果种子。",		-- 物品名:"火龙果种子"
		DRAGONPIE = "好吃的火龙果派。",		-- 物品名:"火龙果派"
		DRUMSTICK = "鸟腿",		-- 物品名:"鸟腿"
		DRUMSTICK_COOKED = "烤熟的鸟腿",		-- 物品名:"炸鸟腿"
		DUG_BERRYBUSH = "找个地方重新种下吧",		-- 采下的浆果丛
		DUG_BERRYBUSH_JUICY = "找个地方重新种下吧",		-- 采下的多汁浆果丛
		DUG_GRASS = "换个地方再种",		-- 挖掘的草丛
		DUG_MARSH_BUSH = "长满尖刺的灌木丛",		-- 物品名:"尖刺灌木"(物品栏中)
		DUG_SAPLING = "一株小树苗,可惜它无法长成大树",		-- 物品名:"树苗"
		DURIAN = "榴莲",		-- 物品名:"榴莲"
		DURIAN_COOKED = "烤熟的榴莲, 味道太难闻",		-- 物品名:"超臭榴莲"
		DURIAN_SEEDS = "榴莲的种子",		-- 物品名:"榴莲种子"
		EARMUFFSHAT = "四糸奈, 我戴上去像不像小兔子? ",		-- 物品名:"兔耳罩" 制造描述:"毛茸茸的保暖物品。"
		EGGPLANT = "茄子",		-- 物品名:"茄子"
		EGGPLANT_COOKED = "烤熟的茄子",		-- 物品名:"烤茄子"
		EGGPLANT_SEEDS = "茄子种子。",		-- 物品名:"茄子种子"

        --TURNIP = " ",		--大萝卜(暴食)
        --TURNIP_COOKED = " ",		--烤大萝卜(暴食)
        --TURNIP_SEEDS = " ",		--大萝卜种子(圆形种子)(暴食)
        GARLIC = "大蒜",		--大蒜
        GARLIC_COOKED = "大蒜也可以烤?",		--烤大蒜
        GARLIC_SEEDS = "大蒜的种子",		--大蒜种子(种子荚)
        ONION = "洋葱",		--洋葱
        ONION_COOKED = "烤熟的洋葱",		--烤洋葱
        ONION_SEEDS = "洋葱种子",		--洋葱种子(尖形种子)
        POTATO = "土豆",		--土豆
        POTATO_COOKED = "烤土豆",		--烤土豆
        POTATO_SEEDS = "土豆种子",		--土豆种子(毛茸茸的种子)
        TOMATO = "番茄",		--番茄
        TOMATO_COOKED = "熟番茄",		--烤番茄
        TOMATO_SEEDS = "番茄的种子",		--番茄种子(带刺的种子)
        ASPARAGUS = "芦笋", 		--芦笋
        ASPARAGUS_COOKED = "熟的芦笋",		--烤芦笋
        ASPARAGUS_SEEDS = "芦笋的种子",		--芦笋种子(筒状种子)
        PEPPER = "辣椒",		--辣椒
        PEPPER_COOKED = "辣椒也可以烤?",		--烤辣椒
        PEPPER_SEEDS = "辣椒种子",		--辣椒种子(块状种子)

        ENDTABLE = 		-- 物品名:"茶几" 制造描述:"一张装饰桌。"
		{
			BURNT = "啊...被烧完了...",		-- 烧焦的
			GENERIC = "桌上有一盆花",		-- 常态默认(插着花瓣时)
			EMPTY = "我可以做点插花放进去",		-- 花瓶里什么都没有
			WILTED = "啊...枯萎了...",		-- 茶几花瓶里的光源枯萎了(因为插花不会枯萎)
			FRESHLIGHT = "现在...在发光",		-- 新的发光的(比如插入发光浆果)
			OLDLIGHT = "我救不了它, 只能换新的",		-- 发光的即将枯萎
		},
		DECIDUOUSTREE = 		-- 物品名:"桦栗树"
		{
			BURNING = "它在熊熊燃烧。",		-- 正在燃烧
			BURNT = "油尽灯枯。",		-- 烧焦的
			CHOPPED = "我需要它的木头, 对不起。",		-- 被砍了
			POISON = "超级阴森可怖！",		-- 毒化的
			GENERIC = "桦栗树上桦栗果, 桦栗树下...",		-- 常态默认
		},
		ACORN = "桦栗果",		-- 物品名:"桦栗果"
        ACORN_SAPLING = "一棵树很快就会长出来。",		-- 物品名:"桦栗树树苗"
		ACORN_COOKED = "烤熟的桦栗果,脆脆的",		-- 物品名:"烤桦栗果"
		BIRCHNUTDRAKE = "从哪里来的?!",		-- 物品名:"桦栗果精"
		EVERGREEN =		-- 物品名:"常青树"->
		{
			BURNING = "它在熊熊燃烧。",		-- 正在燃烧
			BURNT = "油尽灯枯。",		-- 烧焦的
			CHOPPED = "我需要它的木头, 对不起。",		-- 被砍了
			GENERIC = "四季常青的树木",		-- 常态默认
		},
        EVERGREEN_SPARSE =		-- 物品名:"粗壮常青树"
		{
			BURNING = "它在熊熊燃烧。",		-- 正在燃烧
			BURNT = "油尽灯枯。",		-- 烧焦的
			CHOPPED = "我需要它的木头, 对不起。",		-- 被砍了
			GENERIC = "四季常青的大树",		-- 常态默认
		},
		TWIGGYTREE = 		-- 物品名:"多枝树"
		{
			BURNING = "它在熊熊燃烧。",		-- 正在燃烧
			BURNT = "油尽灯枯。",		-- 烧焦的
			CHOPPED = "它被砍倒了",		-- 被砍了
			GENERIC = "它的树枝好多呀...",			-- 常态默认
			DISEASED = "它不再留恋这个世界...",		-- 生病了(机制已移除)
		},
		TWIGGY_NUT_SAPLING = "一株树苗长成一棵新的树",		-- 物品名:"多枝树苗"
        TWIGGY_OLD = "它的树枝好多呀...",		-- 物品名:"多枝树"(年老状态)
		TWIGGY_NUT = "是果子也是种子",		-- 物品名:"多枝树种"(多枝树果)
		EYEPLANT = "它们对主人言听必从。",		-- 物品名:"眼球草"
		INSPECTSELF = "我没缺胳膊少腿吧？",		-- 检查自己
		--FARMPLOT =		-- 农场布景(疑似废弃)
		--{
		--	GENERIC = "我该种什么种子？",
		--	GROWING = "枝繁叶茂的卷须盘绕在泥土上。",
		--	NEEDSFERTILIZER = "这块土地冰凉而没有生机。",
		--	BURNT = "这块土地已经被烧毁，失去了生命力。",
		--},
        FEATHERHAT = "这顶帽子上有许多漂亮的羽毛",		-- 物品名:"羽毛帽" 制造描述:"头上的装饰。"
        FEATHER_CROW = "黑色的羽毛",		-- 物品名:"黑色羽毛"
		FEATHER_ROBIN = "红雀的羽毛。",		-- 物品名:"红色羽毛"
		FEATHER_ROBIN_WINTER = "雪雀的洁白羽毛",		-- 物品名:"蔚蓝羽毛"
		FEATHER_CANARY = "金丝雀的羽毛",		-- 物品名:"黄色羽毛"
		FEATHERPENCIL = "一支可以写字的笔",		-- 物品名:"羽毛笔" 制造描述:"是的，羽毛是必须的。"
        COOKBOOK = "把我做过的料理记录下来, 以后就不会忘记了",		-- 物品名:"烹饪指南" 制造描述:"查看你收集的食谱"
		--FEM_PUPPET = "我想知道她干了什么。",		-- 没找到, 但根据台词, 貌似是查理?
		FIREFLIES =		-- 物品名:"萤火虫"
		{
			GENERIC = "黑暗中的微光。",		-- 常态默认
			HELD = "从我的口袋洒向外界的微光。",		-- 物品栏里
		},
		FIREPIT =		-- 物品名:"火坑" 制造描述:"一种更安全、更高效的营火。"
		{
			EMBERS = "又要回到黑暗了吗...",		-- 即将熄灭
			GENERIC = "防止暗影怪靠近的火焰。",		-- 常态默认
			HIGH = "这团火焰热烈地燃烧着！",		-- 高
			LOW = "火有点小了",		-- 低
			NORMAL = "它给人安慰。",		-- 普通
			OUT = "我还可以把它点燃",		-- 熄灭后
		},
		COLDFIREPIT =		-- 物品名:"吸热火坑" 制造描述:"燃烧效率更高，但仍然越烤越冷。"
		{
			EMBERS = "又要回到黑暗了吗...",		-- 即将熄灭
			GENERIC = "这团火焰为什么是冷的呢...",		-- 常态默认
			HIGH = "很耀眼的火光",		-- 高
			LOW = "火有点小了",		-- 火焰低
			NORMAL = "蓝色的火光",		-- 普通
			OUT = "可以重新点燃",		-- 熄灭后
		},
		FIRESTAFF = "一根火魔杖",		-- 物品名:"火魔杖" 制造描述:"利用火焰的力量！"
        ICESTAFF = "有冰冻效果的魔杖。",		-- 物品名:"冰魔杖" 制造描述:"把敌人冰冻在原地。"
		FIRESUPPRESSOR = 		-- 物品名:"雪球发射器" 制造描述:"拯救植物，扑灭火焰，可添加燃料。"
		{	
			ON = "这个可以打雪仗吗",		-- 开启
			OFF = "先让它关着吧",		-- 关闭
			LOWFUEL = "燃料快用完了",		-- 燃料不足
		},
		FISH = "一条鱼, 烤熟应该很好吃",		-- 物品名:"鱼"
		FISHINGROD = "出发! 钓鱼去啦~",		-- 物品名:"钓竿" 制造描述:"去钓鱼。为了鱼。"
		FISHSTICKS = "炸鱼排",		-- 物品名:"炸鱼排"
		FISHTACOS = "把鱼裹在里面的料理",		-- 物品名:"鱼肉玉米卷"
		FISH_COOKED = "烤得好香",		-- 物品名:"烤鱼"
		FLINT = "一个刀刃状的小石头。",		-- 物品名:"燧石"
		FLOWER = 		-- 物品名:"花"-
		{
            GENERIC = "一朵漂亮的花.",		-- 常态默认(一般的花)
            ROSE = "一朵玫瑰",		-- 玫瑰
        },
        FLOWER_WITHERED = "花朵枯萎了",		-- 物品名:"枯萎的花"
		FLOWERHAT = "一顶花环",		-- 物品名:"花环" 制造描述:"放松神经的东西。"
		FLOWER_EVIL = "这朵花让我有些害怕",		-- 物品名:"邪恶花"
		FOLIAGE = "蕨叶",		-- 物品名:"蕨叶"
		FOOTBALLHAT = "我不会玩橄榄球",		-- 物品名:"橄榄球头盔" 制造描述:"保护你的脑壳。"
        FOSSIL_PIECE = "一些化石的碎片",		-- 物品名:"化石碎片"
        FOSSIL_STALKER =		-- 物品名:"奇异的骨架"
        {
			GENERIC = "我想把它放回去",		-- 常态默认
			FUNNY = "这个要怎么拼",		-- 还没拼好
			COMPLETE = "拼好了, 四糸奈你看！",		-- 搭建完成
        },
        STALKER = "它...不会复活吧...",		-- 物品名:"复活的骨架"
        STALKER_ATRIUM = "请...离我远一点! ",		-- 物品名:"远古织影者"
        STALKER_MINION = "太多了! ",		-- 物品名:"编织暗影" (远古织影者召唤的小怪)
        THURIBLE = "这香炉的气味闻起来有些不太好",		-- 物品名:"暗影香炉"
        ATRIUM_OVERGROWTH = "上面记录着的是什么? ",		-- 物品名:"远古方尖碑"
		FROG =		-- 物品名:"青蛙"
		{
			DEAD = "青蛙死了",		-- 死了
			GENERIC = "一只青蛙",		-- 常态默认
			SLEEPING = "他睡着了。",		-- 睡着了
		},
		FROGGLEBUNWICH = "原来蛙腿也可以做料理",		-- 物品名:"蛙腿三明治"
		FROGLEGS = "它是青蛙身上断掉的。",		-- 物品名:"蛙腿"
		FROGLEGS_COOKED = "烤熟的蛙腿...",		-- 物品名:"烤蛙腿"
		FRUITMEDLEY = "装在杯子里，酸酸甜甜的。",		-- 物品名:"水果圣代"
		FURTUFT = "大熊先生的换毛期", 		-- 物品名:"毛丛"
		GEARS = "一个齿轮",		-- 物品名:"齿轮"
		GHOST = "幽...幽灵——!!!",		-- 物品名:"幽灵"
		GOLDENAXE = "金色的斧子",		-- 物品名:"黄金斧头" 制造描述:"砍树也要有格调！"
		GOLDENPICKAXE = "金色的镐子",		-- 物品名:"黄金鹤嘴锄" 制造描述:"像大Boss一样砸碎岩石。"
		GOLDENPITCHFORK = "金色的草叉",		-- 物品名:"黄金干草叉" 制造描述:"重新布置整个世界。"
		GOLDENSHOVEL = "金色的铲子",		-- 物品名:"黄金铲子" 制造描述:"挖掘作用相同，但使用寿命更长。"
		GOLDNUGGET = "金子, 它很珍贵。",		-- 物品名:"金块"
		GRASS =		-- 物品名:"草"
		{
			BARREN = "它需要施肥。",		-- 
			WITHERED = "它无法承受这样的高温。",		-- 枯萎了
			BURNING = "闻起来怪怪的。",		-- 正在燃烧
			GENERIC = "这只是一丛草。",		-- 默认
			PICKED = "已经被采收过了",		-- 被采完了
			DISEASED = "生病了",		-- 生病了(机制已移除)
			DISEASING = "生病中...",		-- 生病中(机制已移除)
		},
		GRASSGEKKO = 			-- 物品名:"草壁虎"
		{
			GENERIC = "跑起来就会掉落很多草~",			-- 常态默认
			DISEASED = "生病了",		-- 生病了(机制已移除)
		},
		GREEN_CAP = "绿色的蘑菇, 煮熟才能吃...",		-- 物品名:"采摘的绿蘑菇"
		GREEN_CAP_COOKED = "烤熟的绿蘑菇,",		-- 物品名:"烤绿蘑菇"
		GREEN_MUSHROOM =		-- 物品名:"绿蘑菇"
		{
			GENERIC = "绿色的蘑菇",		-- 常态默认
			INGROUND = "如果可以的话，我也想藏起来。",		-- 在地里面
			PICKED = "采掉了...",		-- 被采完了
		},
		GUNPOWDER = "小心爆炸",		-- 物品名:"火药" 制造描述:"一把火药。"
		HAMBAT = "为什么要用食物战斗呢...",		-- 物品名:"火腿棒" 制造描述:"舍不得火腿套不着狼。"
		HAMMER = "一把好用的小锤子",		-- 物品名:"锤子" 制造描述:"敲碎各种东西。"
		HEALINGSALVE = "涂一涂, 痛痛飞走~",		-- 物品名:"治疗药膏" 制造描述:"对割伤和擦伤进行消毒杀菌。"
		HEATROCK =		-- 物品名:"暖石" 制造描述:"储存热能供旅行途中使用。"
		{
			FROZEN = "冰冰凉凉的, 但也许我用不到",		-- 冰冻
			COLD = "一块有些冰凉的石头。",		-- 冷了
			GENERIC = "它安静地待在那里",		-- 常态默认
			WARM = "暖暖的石头, 抱在怀里",		-- 温暖
			HOT = "热得发亮",		-- 热了
		},
		HOMESIGN =		-- 物品名:"路牌" 制造描述:"在世界中留下你的标记。"
		{
			GENERIC = "留一个标记吧, 这样就不会迷路",		-- 常态默认
            UNWRITTEN = "我应该写点什么呢...",		-- 没有写字
			BURNT = "烧坏了...看不清原来写了什么",		-- 烧焦的
		},
		ARROWSIGN_POST =		-- 物品名:"指路标志" 制造描述:"对这个世界指指点点。或许只是打下手势。"
		{
			GENERIC = "留一个标记吧, 这样就不会迷路",		-- 常态默认
            UNWRITTEN = "我应该写点什么上去",		-- 没有写字
			BURNT = "烧坏了...看不清原来写了什么",		-- 烧焦的
		},
		--ARROWSIGN_PANEL =		-- 物品名:"指路标志"(疑似废弃)
		--{
		--	GENERIC = "我做了个标记，不过是暂时的。",		-- 物品名:"指路标志"常态默认
        --    UNWRITTEN = "它一脸茫然，很快便会透露秘密。",		-- 物品名:"指路标志"->没有写字
		--	BURNT = "烧坏了...看不清原来写了什么",		-- 物品名:"指路标志"->烧焦的
		--},
		HONEY = "蜂蜜! 甜甜的~",		-- 物品名:"蜂蜜"
		HONEYCOMB = "一整块蜂蜜",		-- 物品名:"蜜脾"
		HONEYHAM = "香喷喷的火腿淋上一层甜甜的蜜酱, 好吃！",		-- 物品名:"蜜汁火腿"
		HONEYNUGGETS = "好香的味道",		-- 物品名:"蜜汁卤肉"
		HORN = "牛角",		-- 物品名:"牛角"
		HOUND = "很凶的坏狗狗",		-- 物品名:"猎犬"
		HOUNDCORPSE =		-- 物品名:"猎犬尸体"(启蒙区域)
		{
			GENERIC = "它死了...",		-- 常态默认
			BURNING = "尸体烧起来了...",		-- 正在燃烧
			REVIVING = "是谁做的? ",		-- 猎犬尸体复活(启蒙区域)
		},
		HOUNDBONE = "有点害怕...",		-- 物品名:"犬骨"
		HOUNDMOUND = "坏狗狗的家",		-- 物品名:"猎犬丘"
        FIREHOUND = "很凶很暴躁的狗",		-- 物品名:"红色猎犬"
		ICEHOUND = "很凶的坏狗狗",		-- 物品名:"蓝色猎犬"
		ICEBOX = "想多放些冰淇淋到冰箱里",		-- 物品名:"冰箱" 制造描述:"延缓食物变质。"
		ICEHAT = "压在头上好重...",		-- 物品名:"冰帽" 制造描述:"用科学技术合成的冰帽。"
		INSANITYROCK =		-- 物品名:"方尖碑"(高理智版)
		{
			ACTIVE = "唔...是幻觉吗? ",		-- 激活了(升起)
			INACTIVE = "一块小石头, 尖尖的",		-- 没有激活(降下)
		},
		JAMMYPRESERVES = "一点果酱。",		-- 物品名:"果酱"
		KABOBS = "被树枝串起来的烤肉",		-- 物品名:"肉串"
		KILLERBEE =		-- 物品名:"杀人蜂"
		{
			GENERIC = "它不是蜜蜂",		-- 常态默认
			HELD = "希望它不会跑出来",		-- 物品栏里
		},
		KOALEFANT_SUMMER = "一只孤独的考拉象。",		-- 物品名:"考拉象"
		KOALEFANT_WINTER = "它抵抗着残酷的天气。",		-- 物品名:"考拉象"(冬)
		KRAMPUS = "从地狱来的小偷",		-- 物品名:"坎普斯"
		KRAMPUS_SACK = "小偷的包裹",		-- 物品名:"坎普斯背包"
		LEIF = "你在守护着森林吗? ",		-- 物品名:"树精守卫"
		LEIF_SPARSE = "你在守护着森林吗?",		-- 物品名:"树精守卫"(粗壮)
		LIGHTER  = "打火机",		-- 物品名:"薇洛的打火机" 制造描述:"火焰在雨中彻夜燃烧。"
		LIGHTNING_ROD =			-- 物品名:"避雷针" 制造描述:"防雷劈。"
		{
			CHARGED = "它上面存储了很多很多的电能",		-- 已充电
			GENERIC = "避雷针, 可以把雷电引到地下去",		-- 常态默认
		},
		LIGHTNINGGOAT = 		-- 物品名:"伏特羊"
		{
			GENERIC = "羊先生累不累..?",		-- 常态默认
			CHARGED = "充满了电流...羊先生没事吧...",		-- 充电的
		},
		LIGHTNINGGOATHORN = "羊角",		-- 物品名:"伏特羊角"
		GOATMILK = "羊奶里为什么会有电..?",		-- 物品名:"带电的羊奶"
		LITTLE_WALRUS = "小家伙没有那么强的攻击性。",		-- 物品名:"小海象"
		LIVINGLOG = "这块木头上有一张脸...好可怕! ",		-- 物品名:"活木头" 制造描述:"用你的身体来代替\n你该干的活吧。"
		LOG =		-- 物品名:"木头"
		{
			BURNING = "一根燃烧着的木头。",		-- 正在燃烧
			GENERIC = "木头, 可以用来建造",		-- 常态默认
		},
		LUCY = "它和四糸奈不一样。",		-- 物品名:"露西斧"
		LUREPLANT = "食人花",		-- 物品名:"食人花"
		LUREPLANTBULB = "食人花的种子",		-- 物品名:"食人花种子"
		--MALE_PUPPET = "",		-- 物品名:"木头"(单机版独有)

		MANDRAKE_ACTIVE = "一二一, 一二一！",		-- 物品名:"曼德拉草"(活动形态)
		MANDRAKE_PLANTED = "听说曼德拉草要在晚上才能采摘。",		-- 物品名:"曼德拉草"(植物形态)
		COOKEDMANDRAKE = "烤熟的珍贵食材",		-- 物品名:"熟曼德拉草"
		MANDRAKE = "唔...可怜的曼德拉草！",		-- 物品名:"曼德拉草"(死亡的)
        MANDRAKESOUP = "抱歉, 最后还是做成了汤",		-- 物品名:"曼德拉草汤"
        MANDRAKE_COOKED = "现在它只是食物了。",		-- (暂无注释)

        MAPSCROLL = "一张空白地图",		-- 物品名:"地图" 制造描述:"向别人展示你看到什么！"
        MARBLE = "我记得这种石头叫大理石",		-- 物品名:"大理石"
        MARBLEBEAN = "大理石也能种...? 好神奇! ",		-- 物品名:"大理石豌豆" 制造描述:"种植一片大理石森林。"
        MARBLEBEAN_SAPLING = "真的种下去了...会长大吗..? ",		-- 物品名:"大理石芽"(被刚种下去的大理石豌豆)
        MARBLESHRUB = "长大可开采的大理石",		-- 物品名:"大理石灌木"
        MARBLEPILLAR = "大理石堆砌而成的柱子",		-- 物品名:"大理石柱"
        MARBLETREE = "大理石, 但为什么是树的模样? ",		-- 物品名:"大理石树"
        MARSH_BUSH =		-- 物品名:"尖刺灌木"
        {
			BURNT = "烧焦的",		-- 烧焦的
            BURNING = "就连刺木也会燃烧。",		-- 正在燃烧
            GENERIC = "摘它会刺到我, 很痛。",		-- 常态默认
            PICKED = "被采摘过了",		-- 被采完了
        },
        BURNT_MARSH_BUSH = "它被烧毁了。",		-- 物品名:"尖刺灌木"
        MARSH_PLANT = "我认不出这是什么植物",		-- 物品名:"植物"(池塘边不知名的植物)
        MARSH_TREE =		-- 物品名:"针刺树"
        {
            BURNING = "它在燃烧。",		-- 正在燃烧
            BURNT = "烧焦了。",		-- 烧焦的
            CHOPPED = "它的针叶没能保护它。",		-- 被砍了
            GENERIC = "一棵长满尖刺的树。",		-- 常态默认
        },
        --MAXWELL = "他让我觉得有一种奇怪的亲切感。",		-- 物品名:"麦斯威尔"->单机 麦斯威尔
        --MAXWELLHEAD = "他确实对戏剧有品味。",		-- 物品名:"麦斯威尔的头"->单机 麦斯威尔的头
        --MAXWELLLIGHT = "多么奇妙的光芒。",		-- 物品名:"麦斯威尔灯"->单机 麦斯威尔的灯
        --MAXWELLLOCK = "看起来充满魔力。",		-- 物品名:"梦魇锁"->单机 麦斯威尔的噩梦锁
        --MAXWELLTHRONE = "跟我期望的不太一样。",		-- 物品名:"梦魇王座"->单机 麦斯威尔的噩梦王座
        MEAT = "一块肉",		-- 物品名:"肉"
        MEATBALLS = "一份肉丸。",		-- 物品名:"肉丸"
        MEATRACK =		-- 物品名:"晾肉架" 制造描述:"晾肉的架子。"
        {
            DONE = "肉晾好了。",		-- 完成了
            DRYING = "它在干燥的风中晃来晃去。",		--正在风干
            DRYINGINRAIN = "雨水让它没那么容易晾干。",		-- 雨天风干
            GENERIC = "我可以把肉挂在这里。",		-- 常态默认
            BURNT = "被烧坏的架子不能晾晒了",		-- 烧焦的
            DONE_NOTMEAT = "晾好了。",		-- 非肉类晾晒完成(比如海带)
            DRYING_NOTMEAT = "它在干燥的风中晃来晃去。",		-- 非肉类晾晒中(比如海带)
            DRYINGINRAIN_NOTMEAT = "雨水让它没那么容易晾干。",		-- 非肉类雨天晾晒(比如海带)
        },
        MEAT_DRIED = "肉晾干了，很美味。",		-- 物品名:"风干肉"
        MERM = "可怕的沼泽怪物！",		-- 物品名:"鱼人"
        MERMHEAD =		-- 物品名:"鱼人头"
        {
            GENERIC = "好臭...",		-- 常态默认
            BURNT = "烧坏了, 臭味还在...",		-- 烧焦的
        },
        MERMHOUSE =		-- 物品名:"漏雨的小屋"
        {
            GENERIC = "一间漏雨的小屋",		-- 常态默认
            BURNT = "现在更加报废了...",		-- 烧焦的
        },
        MINERHAT = "一定可以照明的帽子",		-- 物品名:"矿工帽" 制造描述:"用你脑袋上的灯照亮夜晚。"
        MONKEY = "在洞穴居住了很久的猴子",		-- 物品名:"穴居猴"
        MONKEYBARREL = "四糸奈, 你听见什么声音了吗？",		-- 物品名:"穴居猴桶"
        MONSTERLASAGNA = "看起来有点可疑...应该不能吃",		-- 物品名:"怪物千层饼"
        FLOWERSALAD = "仙人掌花做成的料理",		-- 物品名:"花沙拉"
        ICECREAM = "哇! 冰冰凉凉的, 好吃的冰淇淋!",		-- 物品名:"冰淇淋"
        WATERMELONICLE = "西瓜棒冰, 很凉爽",		-- 物品名:"西瓜冰棍"
        TRAILMIX = "干果小零食",		-- 物品名:"什锦干果"
        HOTCHILI = "这么多辣椒...真的能吃吗..?",		-- 物品名:"辣椒炖肉"
        GUACAMOLE = "一想到这份料理的食材, 我就有点不想吃...",		-- 物品名:"鳄梨酱"
        MONSTERMEAT = "只有极度饥饿时才不得已吃下这块肉",		-- 物品名:"怪物肉"
        MONSTERMEAT_DRIED = "肉晾干了, 但我还是不太想吃",		-- 物品名:"怪物肉干"
        MOOSE = "麋鹿鹅...是鹿还是鹅? 也许都不是",		-- 物品名:"麋鹿鹅"
        MOOSE_NESTING_GROUND = "春天时, 鹅妈妈就会回到这里",		-- 物品名:"麋鹿鹅筑巢地"
        MOOSEEGG = "好大的蛋",		-- 物品名:"麋鹿鹅蛋"
        MOSSLING = "麋鹿鹅宝宝, 但是好凶!",		-- 物品名:"麋鹿鹅幼崽"
        FEATHERFAN = "它可以扇起不小的风。",		-- 物品名:"羽毛扇" 制造描述:"超柔软、超大的扇子。"
        MINIFAN = "跑起来就会转的小风车",		-- 物品名:"旋转的风扇" 制造描述:"你得跑起来，才能带来风！"
        GOOSE_FEATHER = "麋鹿鹅的绒毛",		-- 物品名:"麋鹿鹅羽毛"
        STAFF_TORNADO = "制造一点坏天气。",		-- 物品名:"天气风向标" 制造描述:"把你的敌人吹走。"
        MOSQUITO =		-- 物品名:"蚊子"
        {
            GENERIC = "好讨厌的蚊子...",		-- 常态默认
            HELD = "我当初为什么要抓它来着? ",		-- 物品栏里
        },
        MOSQUITOSACK = "从蚊子身上掉落下来的血囊",		-- 物品名:"蚊子血囊"
        MOUND =		-- 物品名:"坟墓"
        {
            DUG = "幽、幽灵逃出来了... ",		-- 被挖了
            GENERIC = "坟墓...有点害怕",		-- 常态默认
        },
        NIGHTLIGHT = "它燃烧着令我有点害怕的光",		-- 物品名:"暗夜灯" 制造描述:"用你的噩梦点亮夜晚。"
        NIGHTMAREFUEL = "像是一种能量的残渣",		-- 物品名:"噩梦燃料" 制造描述:"傻子和疯子使用的邪恶残渣。"
        NIGHTSWORD = "使用这把武器时, 我感觉灵力变得紊乱了",		-- 物品名:"暗夜剑" 制造描述:"造成噩梦般的伤害。"
        NITRE = "一种矿物",		-- 物品名:"硝石"
        ONEMANBAND = "美九姐或许会演奏这个",		-- 物品名:"独奏乐器" 制造描述:"疯子音乐家也有粉丝。"
        OASISLAKE =		-- 物品名:"湖泊"
		{
			GENERIC = "一处美丽的湖泊",		-- 常态默认
			EMPTY = "沙漠中的绿洲, 还是太难存在了吗...",		-- 干涸
		},
        PANDORASCHEST = "很华丽的箱子,里面会有什么呢?",		-- 物品名:"华丽箱子"
        PANFLUTE = "吹响这个排箫, 似乎有种魔法会出现",		-- 物品名:"排箫" 制造描述:"抚慰凶猛野兽的音乐。"
        PAPYRUS = "一张纸, 我可以用来写点东西",		-- 物品名:"莎草纸" 制造描述:"用于书写。"
        WAXPAPER = "感觉很...怀旧。",		-- 物品名:"蜡纸" 制造描述:"用于打包东西。"
        PENGUIN = "走起路来摇摇晃晃的",		-- 物品名:"企鸥"
        PERD = "唔...它偷吃了太多的浆果",		-- 物品名:"火鸡"
        PEROGIES = "小巧可爱的营养饺子。",		-- 物品名:"波兰水饺"
        PETALS = "这些花瓣很漂亮",		-- 物品名:"花瓣"
        PETALS_EVIL = "这些花瓣...它的气息会让人头晕",		-- 物品名:"恶魔花瓣/深色花瓣"
        PHLEGM = "那只不幸的野兽肯定是生病了。",		-- 物品名:"脓鼻涕"
        PICKAXE = "可以用来采矿",		-- 物品名:"鹤嘴锄" 制造描述:"凿碎岩石。"
        PIGGYBACK = "唔...我真要背着这个到处走吗?",		-- 物品名:"猪皮包" 制造描述:"能装许多东西，但会减慢你的速度。"
        PIGHEAD =		-- 物品名:"猪头"
        {
            GENERIC = "它...做错什么了吗..?",		-- 常态默认
            BURNT = "它被烧焦了。",		-- 烧焦的
        },
        PIGHOUSE =		-- 物品名:"猪屋" 制造描述:"可以住一只猪。"
        {
            FULL = "已经住不下了",		-- 满了
            GENERIC = "这些屋子应该很舒适。",		-- 常态默认
            LIGHTSOUT = "房屋里会有人吗..?",		-- 关灯了
            BURNT = "烧坏了",		-- 烧焦的
        },
        PIGKING = "猪猪们的头领",		-- 物品名:"猪王"
        PIGMAN =		-- 物品名:"猪人"
        {
            DEAD = "它很安详",		-- 死了
            FOLLOWER = "它想和我做朋友吗",		-- 追随者
            GENERIC = "你好呀, 猪先生",		-- 常态默认
            GUARD = "附近有什么让它害怕?",		-- 警戒
            WEREPIG = "我现在要离它远一点",		-- 疯猪
        },
        PIGSKIN = "曾经是一只猪身上的皮。",		-- 物品名:"猪皮"
        PIGTENT = "猪先生们的临时住所",		-- 物品名:"猪帐篷"(疑似废案)
        PIGTORCH = "它驱散了黑暗。",		-- 物品名:"猪火炬"
        PINECONE = "松果, 脆脆的",		-- 物品名:"松果"
        PINECONE_SAPLING = "一棵树很快就会长出来。",		-- 物品名:"常青树苗"
        LUMPY_SAPLING = "一棵树很快就会长出来。",		-- 物品名:"有疙瘩的树苗"
        PITCHFORK = "除草时会用到的工具..",		-- 物品名:"干草叉" 制造描述:"铲地用具。"
        PLANTMEAT = "有点像肉, 但真的是吗?",		-- 物品名:"叶肉"
        PLANTMEAT_COOKED = "烹饪过后的味道好多了",		-- 物品名:"烤叶肉"
        --PLANT_NORMAL =		-- 物品名:"农作物"(此处为单机版)
        --{
        --    GENERIC = "一株可食用的植物。",		-- 常态默认
        --    GROWING = "继续生长吧。我会等着的。",		-- 正在生长
        --    READY = "可以收获了。",		-- 成熟了
        --    WITHERED = "它的生命被抽空了。",		-- 枯萎了
        --},
        POMEGRANATE = "这是...石榴",		-- 物品名:"石榴"
        POMEGRANATE_COOKED = "一粒一粒的多汁果肉躺在里面",		-- 物品名:"切片熟石榴"
        POMEGRANATE_SEEDS = "石榴的种子",		-- 物品名:"石榴种子"
        POND = "一片小池塘",		-- 物品名:"池塘"
        POOP = "唔噫...好脏!",		-- 物品名:"粪肥"
        FERTILIZER = "一桶肥料。",		-- 物品名:"便便桶" 制造描述:"少拉点在手上，多拉点在庄稼上。"
        PUMPKIN = "南瓜",		-- 物品名:"南瓜"
        PUMPKINCOOKIE = "好吃的南瓜饼",		-- 物品名:"南瓜饼"
        PUMPKIN_COOKED = "烤熟的南瓜",		-- 物品名:"烤南瓜"
        PUMPKIN_LANTERN = "想起万圣节的时候, 大家一起雕南瓜",		-- 物品名:"南瓜灯" 制造描述:"长着鬼脸的照明用具。"
        PUMPKIN_SEEDS = "南瓜的种子",		-- 物品名:"南瓜种子"
        PURPLEAMULET = "带上这个我会控制不住自己的",		-- 物品名:"梦魇护符" 制造描述:"引起精神错乱。"

        RABBIT =		-- 物品名:"兔子"
        {
            GENERIC = "可爱的小兔子",		-- 常态默认
            HELD = "它在我的怀里很安全。",		-- 物品栏里
        },
        RABBITHOLE =		-- 物品名:"兔洞"
        {
            GENERIC = "兔子的窝",		-- 常态默认
            SPRING = "兔子的窝塌了",		-- 春天 or 潮湿 塌陷
        },
        RAINOMETER =		-- 物品名:"雨量计" 制造描述:"观测降雨机率。"
        {
            GENERIC = "它能测出是否有雨, 对我很有帮助",		-- 常态默认
            BURNT = "被烧坏掉了",		-- ->烧焦的
        },
        RAINCOAT = "下雨天穿着雨衣就可以出门玩了",		-- 物品名:"雨衣" 制造描述:"让你保持干燥的防水外套。"
        RAINHAT = "下雨天戴上这顶帽子可以挡住一点雨",		-- 物品名:"雨帽" 制造描述:"手感柔软，防雨必备。"
        RATATOUILLE = "一大锅烩蔬菜, 看上去很好吃的说。",		-- 物品名:"蔬菜杂烩"
        RAZOR = "可以给牛先生清理毛发",		-- 物品名:"剃刀" 制造描述:"剃掉你脏脏的山羊胡子。"
        RED_CAP = "红色的蘑菇",		-- 物品名:"采摘的红蘑菇"
        RED_CAP_COOKED = "烤熟的红蘑菇可以吃",		-- 物品名:"烤红蘑菇"
        RED_MUSHROOM =		-- 物品名:"红蘑菇"
        {
            GENERIC = "白天才能见到它, 好神奇",		-- 常态默认
            INGROUND = "地里长着红蘑菇",		-- 在地里面
            PICKED = "...被采掉了",		-- 被采完了
        },
        REEDS =		-- 物品名:"芦苇"
        {
            BURNING = "芦苇丛冒着大火",		-- 正在燃烧
            GENERIC = "一簇芦苇。",		-- 常态默认
            PICKED = "它们已经被剥落了。",		-- 被采完了
        },
        RELIC = "远古世界的遗物。",		-- 物品名:"遗物"
        RUINS_RUBBLE = "一堆破碎的梦。",		-- 物品名:"损毁的废墟"
        RUBBLE = "破碎的石块。",		-- 物品名:"碎石"
        RESEARCHLAB =		-- 物品名:"科学机器" 制造描述:"解锁新的合成配方！"
        {
            GENERIC = "有了它可以做更多东西",		-- 常态默认
            BURNT = "烧坏了",		-- 烧焦的
        },
        RESEARCHLAB2 =		-- 物品名:"炼金引擎" 制造描述:"解锁更多合成配方！"
        {
            GENERIC = "我需要从这个机器上学习一些科学",		-- 常态默认
            BURNT = "烧坏了",		-- 烧焦的 
        },
        RESEARCHLAB3 =		-- 物品名:"暗影操控器" 制造描述:"这还是科学吗？"
        {
            GENERIC = "好像做出来的不太对",		-- 常态默认
            BURNT = "烧坏了",		-- 烧焦的
        },
        RESEARCHLAB4 =		-- 物品名:"灵子分解器" 制造描述:"增强高礼帽的魔力。"
        {
            GENERIC = "一台神奇的工具, 好像用的是魔法",		-- 常态默认
            BURNT = "烧坏了",		-- 烧焦的
        },
        RESURRECTIONSTATUE =		-- 物品名:"肉块雕像" 制造描述:"以肉的力量让你重生。"
        {
            GENERIC = "听说这个可以让我忘记疼痛",		-- 常态默认
            BURNT = "烧坏了, 没关系的",		-- 烧焦的
        },
        RESURRECTIONSTONE = "我不确定是不是应该去碰那个",		-- 物品名:"试金石"
        ROBIN =		-- 物品名:"红雀"
        {
            GENERIC = "红色的, 是小团雀..?",		-- 常态默认
            HELD = "放在怀里不会让它受伤的",		-- 物品栏里
        },
        ROBIN_WINTER =		-- 物品名:"雪雀"
        {
            GENERIC = "冰蓝色的羽翼, 很美丽的小鸟",		-- 常态默认
            HELD = "放在怀里不会让它受伤的",		-- 物品栏里
        },
        --ROBOT_PUPPET = "",		-- (暂无注释)
        --ROCK_LIGHT =		-- 物品名:"熔岩坑"(单机版,废案)
        --{
        --    GENERIC = "那个坑洞里有一团火。",		-- 常态默认
        --    OUT = "岩浆失去了燃烧的意愿...",		-- 完整
        --    LOW = "阴影来袭。",		-- 工作量≤4
        --    NORMAL = "熔岩着火了。",		-- 工作量≤2
        --},
        CAVEIN_BOULDER =		-- 物品名:"落石"
        {
            GENERIC = "或许可以让冰结傀儡帮我搬走",		-- 常态默认
            RAISED = "我够不着",		-- 够不着
        },
        ROCK = "一块大石头",		-- 物品名:"岩石"(硝矿)
        PETRIFIED_TREE = "树形状的石头",		-- 物品名:"石化树"
        ROCK_PETRIFIED_TREE = "树形状的石头",		-- 物品名:"石化树"
        ROCK_PETRIFIED_TREE_OLD = "树形状的石头",		-- 物品名:"石化树"
        ROCK_ICE =		-- 物品名:"迷你冰川"
        {
            GENERIC = "一大块冰。",		-- 常态默认
            MELTED = "冰凉的融冰。",		-- 融化了
        },
        ROCK_ICE_MELTED = "冰凉的融冰。",		-- 物品名:"融化的迷你冰川"
        ICE = "它不是我做的",		-- 物品名:"冰"
        ROCKS = "一些小石头。",		-- 物品名:"石头"
        
        ROPE = "紧密编成的草绳，非常有用。",		-- 物品名:"绳子" 制造描述:"紧密编成的草绳，非常有用。"
        ROTTENEGG = "不能吃",		-- 物品名:"腐烂鸟蛋"
        ROYAL_JELLY = "四糸乃知道, 蜂王浆很有营养",		-- 物品名:"蜂王浆"
        JELLYBEAN = "一罐七彩糖豆零食",		-- 物品名:"彩虹糖豆"
        SADDLE_BASIC = "鞍",		-- 物品名:"鞍具" 制造描述:"你坐在动物身上。仅仅是理论上。"
        SADDLE_RACE = "更闪亮的鞍",		-- 物品名:"闪亮鞍具" 制造描述:"抵消掉完成目标所花费的时间。或许。"
        SADDLE_WAR = "更适合战斗的鞍具",		-- 物品名:"战争鞍具" 制造描述:"战场首领的王位。"
        SADDLEHORN = "更温和的取鞍具方法",		-- 物品名:"鞍角" 制造描述:"把鞍具撬开。"
        SALTLICK = "野兽们渴望它。",		-- 物品名:"舔盐块" 制造描述:"好好喂养你家的牲畜。"
        BRUSH = "刷一刷, 毛毛顺",		-- 物品名:"刷子" 制造描述:"减缓皮弗娄牛毛发的生长速度。"
		SANITYROCK =		-- 物品名:"方尖碑"(低理智版)
		{
			ACTIVE = "一座尖碑耸立",		-- 激活了(升起)
			INACTIVE = "四糸乃很清醒, 这里没有东西",		-- 没有激活(降下)
		},
		SAPLING =		-- 物品名:"树苗"
		{
			BURNING = "烧起来了, 要、要赶紧灭火...",		-- 正在燃烧
			WITHERED = "温度太高了, 难以忍受",		-- 枯萎了
			GENERIC = "它在努力生长。",		-- 常态默认
			PICKED = "也许下次吧，小树苗。",		-- 被采完了
			--DISEASED = "它不再留恋这个世界...",		-- 物品名:"树苗"->生病了(已废弃的机制)
			--DISEASING = "它在悬崖上...",		-- 物品名:"树苗"->正在生病(已废弃的机制)
		},
   		SCARECROW = 		-- 物品名:"友善的稻草人" 制造描述:"模仿最新的秋季时尚。"
   		{
			GENERIC = "稻草人",		-- 常态默认
			BURNING = "要、要赶紧灭火",		-- 正在燃烧
			BURNT = "乌鸦还会被它吓到吗..?",		-- 烧焦的
   		},
   		SCULPTINGTABLE =		-- 物品名:"陶轮" 制造描述:"大理石在你手里将像黏土一样！"
   		{
			EMPTY = "那看起来...很...有趣...",		-- 空的，什么也没放
			BLOCK = "四糸奈, 准备好了",		-- 放了大理石上去
			SCULPTURE = "四糸奈...我...做得好不好看...",		-- 雕像做好了
			BURNT = "它烧坏了...",		-- 烧焦的
   		},
        SCULPTURE_KNIGHTHEAD = "奇怪的大理石碎块...",		-- 物品名:"可疑的大理石"(发条骑士)
		SCULPTURE_KNIGHTBODY = 		-- 物品名:"大理石雕像"(发条骑士)
		{
			COVERED = "它有一些奇怪。",		-- 未开采时
			UNCOVERED = "它缺了一点东西",		-- 开采后
			FINISHED = "它又是个整体了。幸运。",		-- 三基佬雕像修好了
			READY = "它想要出去...",		-- 准备好的 满的
		},
        SCULPTURE_BISHOPHEAD = "奇怪的大理石碎块...",		-- 物品名:"可疑的大理石"(发条主教)
		SCULPTURE_BISHOPBODY =  		-- 物品名:"大理石雕像"(发条主教)
		{
			COVERED = "它有一些奇怪。",		-- 未开采时
			UNCOVERED = "它缺了一点东西",		-- 开采后
			FINISHED = "它又是个整体了。幸运。",		-- 三基佬雕像修好了
			READY = "它想要出去...",		-- 准备好的 满的
		},
        SCULPTURE_ROOKNOSE = "奇怪的大理石碎块...",		-- 物品名:"可疑的大理石"(发条战车)
		SCULPTURE_ROOKBODY =  		-- 物品名:"大理石雕像"(发条战车)
		{
			COVERED = "它有一些奇怪。",		-- 未开采时
			UNCOVERED = "它缺了一点东西",		-- 开采后
			FINISHED = "它又是个整体了。幸运。",		-- 三基佬雕像修好了
			READY = "它想要出去...",		-- 准备好的 满的
		},
        GARGOYLE_HOUND = "是什么让它变成了这样...",		-- 物品名:"可疑的月岩"(猎犬外形)
        GARGOYLE_WEREPIG = "是什么让它变成了这样...",		-- 物品名:"可疑的月岩"(狂暴猪人外形)
		SEEDS = "一颗种子",		-- 物品名:"种子"
		SEEDS_COOKED = "烤熟的种子可以吃",		-- 物品名:"烤种子"
		SEWING_KIT = "妈妈以前用针线包缝补过四糸奈...",		-- 物品名:"针线包" 制造描述:"缝补受损的衣物。"
		SEWING_TAPE = "胶带, 可以贴一些东西",		-- 物品名:"可靠的胶布" 制造描述:"缝补受损的衣物。"
		SHOVEL = "一把铲子",		-- 物品名:"铲子" 制造描述:"挖掘各种各样的东西。"
		SILK = "蜘蛛丝",		-- 物品名:"蜘蛛丝"
		SKELETON = "是、是骷髅...",		-- 物品名:"骷髅"
		SCORCHED_SKELETON = "被火烧干净了...",		-- 物品名:"易碎骷髅"
		--SKULLCHEST = "那里面应该有我的死亡警告。",		-- 物品名:"骷髅箱"(单机)
		SMALLBIRD =		-- 物品名:"小鸟"(比小高脚鸟更幼小的小高脚鸟)
		{
			GENERIC = "小家伙，你好。",		-- 常态默认
			HUNGRY = "你饿了吗",		-- 有点饿了
			STARVING = "我知道你饿了, 我也是...",		-- 挨饿
			SLEEPING = "看来睡得很安心",		-- 睡着了
		},
		SMALLMEAT = "一小块肉",		-- 物品名:"小肉"
		SMALLMEAT_DRIED = "肉晾干了，很美味。",		-- 物品名:"小风干肉"
		SPAT = "它的毛全是钢丝做成的?",		-- 物品名:"钢羊"
		SPEAR = "一根木棍上绑着尖石头",		-- 物品名:"长矛" 制造描述:"使用尖的那一端。"
		SPEAR_WATHGRITHR = "更厉害的长矛",		-- 物品名:"战斗长矛" 制造描述:"黄金使它更锋利。"
		WATHGRITHRHAT = "戴上它就会有强大的勇气",		-- 物品名:"战斗头盔" 制造描述:"独角兽是你的保护神。"
		SPIDER =		-- 物品名:"蜘蛛"
		{
			DEAD = "还好...",		-- 死了
			GENERIC = "是...蜘蛛!",		-- 常态默认
			SLEEPING = "蜘蛛睡着了, 我要快点离开",		-- 睡着了
		},
		SPIDERDEN = "蜘蛛的巢穴",		-- 物品名:"蜘蛛巢"
		SPIDEREGGSACK = "这里面还有很多正在孵化的蜘蛛",		-- 物品名:"蜘蛛卵" 制造描述:"跟你的朋友寻求点帮助。"
		SPIDERGLAND = "这是...从蜘蛛身上掉下来的..?",		-- 物品名:"蜘蛛腺"
        SPIDERHAT = "我一定要戴上它吗..?",		-- 物品名:"蜘蛛帽" 制造描述:"蜘蛛们会喊你\"妈妈\"。"
		SPIDERQUEEN = "蜘蛛们的女王",		-- 物品名:"蜘蛛女王"
		SPIDER_WARRIOR =		-- 物品名:"蜘蛛战士"
		{
			DEAD = "死...死了么...",		-- 死了
			GENERIC = "喜欢战斗的蜘蛛",		-- 常态默认
			SLEEPING = "我要小心一些。",		-- 睡着了
		},
		SPOILED_FOOD = "腐烂了...好臭!",		-- 物品名:"腐烂物"
        STAGEHAND =		-- 物品名:"舞台之手"
        {
			AWAKE = "它! 它动起来了!",		-- 活动
			HIDING = "一..一张茶几?",		-- 隐藏
        },
        STATUE_MARBLE = 		-- 物品名:"大理石雕像"
        {
            GENERIC = "灰白的雕像",		-- 卒子样式
            TYPE1 = "灰白的雕像",		-- 悲剧样式
            TYPE2 = "灰白的雕像",		-- 喜剧样式
            TYPE3 = "灰白的雕像", --bird bath type statue		-- 花瓶样式
        },
		STATUEHARP = "灰白的大理石雕像",		-- 物品名:"竖琴雕像"
		STATUEMAXWELL = "这座雕像上的人...",		-- 物品名:"麦斯威尔雕像"
		STEELWOOL = "这个不能提供温暖。",		-- 物品名:"钢丝绵"
		STINGER = "锋利的尖刺",		-- 物品名:"蜂刺"
		STRAWHAT = "一顶草帽, 戴上很凉快~",		-- 物品名:"草帽" 制造描述:"帮助你保持清凉干爽。"
		STUFFEDEGGPLANT = "酿茄子",		-- 物品名:"酿茄子"
		SWEATERVEST = "据说很时尚...我不能理解",		-- 物品名:"犬牙背心" 制造描述:"粗糙，但挺时尚。"
		REFLECTIVEVEST = "夏天出门穿上它会很凉快",		-- 物品名:"清凉夏装" 制造描述:"穿上这件时尚的背心，让你神清气爽。"
		HAWAIIANSHIRT = "很适合夏天穿着",		-- 物品名:"花衬衫" 制造描述:"适合夏日穿着，或在周五便装日穿着。"
		TAFFY = "甜甜的糖果",		-- 物品名:"太妃糖"
		TALLBIRD = "它的脚好长!",		-- 物品名:"高脚鸟"
		TALLBIRDEGG = "一颗大鸟蛋",		-- 物品名:"高脚鸟蛋"
		TALLBIRDEGG_COOKED = "特别的煎蛋",		-- 物品名:"煎高脚鸟蛋"
		TALLBIRDEGG_CRACKED =		-- 物品名:"孵化中的高脚鸟蛋"
		{
			COLD = "它是不是有点着凉..?",		-- 冷了
			GENERIC = "小小的脆弱生命，正在挣扎着迎向光明。",		-- 常态默认
			HOT = "它承受不了这样的高温。",		-- 热了
			LONG = "我会耐心等待的",		-- 还需要很久
			SHORT = "就快出来了。",		-- 很快了
		},
		TALLBIRDNEST =		-- 物品名:"高脚鸟巢"
		{
			GENERIC = "这个蛋代表了一个新生命。",		-- 常态默认
			PICKED = "巢是空的。",		-- 被采完了
		},
		TEENBIRD =		-- 物品名:"小高脚鸟"
		{
			GENERIC = "我该养着它吗?",		-- 常态默认
			HUNGRY = "你饿了吗",		-- 有点饿了
			STARVING = "看来是饿坏了...",		-- 挨饿(快饿死了)
			SLEEPING = "休息吧。",		-- 睡着了
		},
		--TELEPORTATO_BASE =		-- 物品名:"木制装置"(单机版的内容)
		--{
		--	ACTIVE = "我确信下一个地方会更可怕！",		-- 物品名:"木制装置"->激活了
		--	GENERIC = "它不会带来什么好事。",		-- 物品名:"木制装置"常态默认
		--	LOCKED = "它仍然是上锁关闭的状态。",		-- 物品名:"木制装置"->锁住了
		--	PARTIAL = "它是建了一半，还是毁了一半？",		-- 物品名:"木制装置"->已经有部分了
		--},
		--TELEPORTATO_BOX = "它包含着至关重要的火花。",		-- 物品名:"盒状零件"(单机版的内容)
		--TELEPORTATO_CRANK = "它看起来很复杂。",		-- 物品名:"曲柄零件"(单机版的内容)
		--TELEPORTATO_POTATO = "多么丑陋的产物！",		-- 物品名:"金属土豆状零件"(单机版的内容)
		--TELEPORTATO_RING = "它没有锋利的边缘。",		-- 物品名:"环状零件"(单机版的内容)
		TELESTAFF = "它会把我送去哪?",		-- 物品名:"传送魔杖" 制造描述:"穿越空间的法杖！时间要另外收费。"
		TENT = 		-- 物品名:"帐篷" 制造描述:"回复精神值，但要花费时间并导致饥饿。"
		{
			GENERIC = "简单的帐篷, 有野营的气氛了~",		-- 常态默认
			BURNT = "它烧坏了...",		-- 烧焦的
		},
		SIESTAHUT = 		-- 物品名:"遮阳篷" 制造描述:"躲避烈日，回复精神值。"
		{
			GENERIC = "可以躲躲太阳, 不要晒黑了",		-- 常态默认
			BURNT = "它烧坏了...",		-- 烧焦的
		},
		TENTACLE = "唔噫-!从哪里来的?!",		-- 物品名:"触手"
		TENTACLESPIKE = "它很锋利",		-- 物品名:"触手尖刺"
		TENTACLESPOTS = "一块韧性很高的皮",		-- 物品名:"触手皮"
		TENTACLE_PILLAR = "它比地上的那个更大...",		-- 物品名:"大触手"
        TENTACLE_PILLAR_HOLE = "下面有什么...?",		-- 物品名:"硕大的泥坑"
		TENTACLE_PILLAR_ARM = "好、好多...呜呜...",		-- 物品名:"小触手"
		--TENTACLE_GARDEN = "这东西是不同的。",		-- 物品名:"大触手"(单机版)
		TOPHAT = "魔术师帽子",		-- 物品名:"高礼帽" 制造描述:"最经典的帽子款式。"
		TORCH = "举着火把就不会怕黑了",		-- 物品名:"火炬" 制造描述:"可携带的光源。"
		TRANSISTOR = "这是一块电子零件",		-- 物品名:"电子元件" 制造描述:"科学至上！滋滋滋！"
		TRAP = "这、这样能抓到吗?",		-- 物品名:"陷阱" 制造描述:"捕捉小型生物。"
		TRAP_TEETH = "它很尖锐",		-- 物品名:"犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		--TRAP_TEETH_MAXWELL = "猝不及防的死亡。",		-- 物品名:"麦斯威尔的犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		TREASURECHEST = 		-- 物品名:"箱子" 制造描述:"一种结实的容器。"
		{
			GENERIC = "四糸奈不想进去",		-- 常态默认
			BURNT = "箱子烧坏了...",		-- 烧焦的
		},
		TREASURECHEST_TRAP = "会有宝物吗?",		-- 物品名:"宝箱"
		SACRED_CHEST = 		-- 物品名:"远古宝箱"
		{
			GENERIC = "有宝物在里面",		-- 常态默认
			LOCKED = "要怎么解开呢..?",		-- 锁住了
		},
		--TREECLUMP = "这是故意放的吗？",		-- 物品名:"远古宝箱"
		TRINKET_1 = "连弹珠也热得融化了...", --Melted Marbles		-- 物品名:"熔化的弹珠"
		TRINKET_2 = "玩具笛子", --Fake Kazoo		-- 物品名:"假卡祖笛"
		TRINKET_3 = "绳结", --Gord's Knot		-- 物品名:"戈尔迪之结"
		TRINKET_4 = "地精爷爷玩具", --Gnome		-- 物品名:"地精爷爷"
		TRINKET_5 = "玩具火箭", --Toy Rocketship		-- 物品名:"迷你火箭"
		TRINKET_6 = "已经失去效果的电线", --Frazzled Wires		-- 物品名:"烂电线"
		TRINKET_7 = "只是一个简单的游戏。", --Ball and Cup		-- 物品名:"杯子和球"
		TRINKET_8 = "我希望可以洗个澡。", --Rubber Bung		-- 物品名:"硬化橡胶塞"
		TRINKET_9 = "不是从我的衣服掉下的", --Mismatched Buttons		-- 物品名:"不搭的纽扣"
		TRINKET_10 = "我不应该拿着这个东西", --Dentures		-- 物品名:"二手假牙"
		TRINKET_11 = "小机器人~", --Lying Robot		-- 物品名:"机器人玩偶"
		TRINKET_12 = "不再那么黏滑了, 对吧?", --Dessicated Tentacle		-- 物品名:"干瘪的触手"
		TRINKET_13 = "地精奶奶玩具", --Gnomette		-- 物品名:"地精奶奶"
		TRINKET_14 = "它漏水了, 不能再用了", --Leaky Teacup		-- 物品名:"漏水的茶杯"
		TRINKET_15 = "白色的棋子", --Pawn		-- 物品名:"白色主教"
		TRINKET_16 = "黑色的棋子", --Pawn		-- 物品名:"黑色主教"
		TRINKET_17 = "谁的叉子", --Bent Spork		-- 物品名:"弯曲的叉子"
		TRINKET_18 = "放在地上推着玩~", --Trojan Horse		-- 物品名:"玩具木马"
		TRINKET_19 = "它转不起来", --Unbalanced Top		-- 物品名:"失衡陀螺"
		TRINKET_20 = "或许别人更需要这个", --Backscratcher		-- 物品名:"痒痒挠"
		TRINKET_21 = "坏了, 但应该还能用..?", --Egg Beater		-- 物品名:"破搅拌器"
		TRINKET_22 = "用纱线做衣服", --Frayed Yarn		-- 物品名:"磨损的纱线"
		TRINKET_23 = "我不需要它。", --Shoehorn		-- 物品名:"鞋拔子"
		TRINKET_24 = "带着它会更加幸运吗..?", --Lucky Cat Jar		-- 物品名:"幸运猫扎尔"
		TRINKET_25 = "只是一个玩具, 味道很重", --Air Unfreshener		-- 物品名:"臭气制造器"
		TRINKET_26 = "有点像土豆做的...欸~真的是吗?", --Potato Cup		-- 物品名:"土豆杯"
		TRINKET_27 = "晾衣服用的", --Coat Hanger		-- 物品名:"钢丝衣架"
		TRINKET_28 = "白色的棋子", --Rook		-- 物品名:"白色战车"
        TRINKET_29 = "黑色的棋子", --Rook		-- 物品名:"黑色战车"
        TRINKET_30 = "白色的棋子", --Knight		-- 物品名:"白色骑士"
        TRINKET_31 = "黑色的棋子", --Knight		-- 物品名:"黑色骑士"
        TRINKET_32 = "这是什么玩具?", --Cubic Zirconia Ball		-- 物品名:"立方氧化锆球"
        TRINKET_33 = "我不想带着它", --Spider Ring		-- 物品名:"蜘蛛指环"
        TRINKET_34 = "手...(被吓到了)", --Monkey Paw		-- 物品名:"猴爪"
        TRINKET_35 = "装药的瓶子", --Empty Elixir		-- 物品名:"空的长生不老药"
        TRINKET_36 = "想给四糸奈戴上这个试一下,一定很好玩~", --Faux fangs		-- 物品名:"人造尖牙"
        TRINKET_37 = "断裂的木桩", --Broken Stake		-- 物品名:"断桩"
        TRINKET_38 = "可以看到很远的地方", -- Binoculars Griftlands trinket		-- 物品名:"双筒望远镜"
        TRINKET_39 = "只有一只...另一只在哪里呢..?", -- Lone Glove Griftlands trinket		-- 物品名:"单只手套"
        TRINKET_40 = "蜗牛样式的秤", -- Snail Scale Griftlands trinket		-- 物品名:"蜗牛秤"
        TRINKET_41 = "这个是装什么的..?", -- Goop Canister Hot Lava trinket		-- 物品名:"黏液罐"
        TRINKET_42 = "玩具眼睛蛇", -- Toy Cobra Hot Lava trinket		-- 物品名:"玩具眼镜蛇"
        TRINKET_43= "鳄鱼玩具", -- Crocodile Toy Hot Lava trinket		-- 物品名:"鳄鱼玩具"
        TRINKET_44 = "总有一天会被修好的", -- Broken Terrarium ONI trinket		-- 物品名:"破碎的玻璃罐"
        TRINKET_45 = "果然...收不到任何信号,和那里一样...", -- Odd Radio ONI trinket		-- 物品名:"奇怪的收音机"
        TRINKET_46 = "可以吹干湿漉漉的头发, 可惜坏掉了...", -- Hairdryer ONI trinket		-- 物品名:"损坏的吹风机"
        LOST_TOY_1  = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"遗失的玻璃球"
        LOST_TOY_2  = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"多愁善感的卡祖笛"
        LOST_TOY_7  = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"珍视的抽线陀螺"
        LOST_TOY_10 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"缺少的牙齿"
        LOST_TOY_11 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"珍贵的玩具机器人"
        LOST_TOY_14 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"妈妈最爱的茶杯"
        LOST_TOY_18 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"宝贵的玩具木马"
        LOST_TOY_19 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"最爱的陀螺"
        LOST_TOY_42 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"装错的玩具眼镜蛇"
        LOST_TOY_43 = "手、手...直接传过去了?! 四糸奈救命-!",		-- 物品名:"宠爱的鳄鱼玩具"
        HALLOWEENCANDY_1 = "是苹果糖",		-- 物品名:"糖果苹果"
        HALLOWEENCANDY_2 = "是玉米糖",		-- 物品名:"糖果玉米"
        HALLOWEENCANDY_3 = "一块玉米",		-- 物品名:"不太甜的玉米"
        HALLOWEENCANDY_4 = "好可怕的糖果...",		-- 物品名:"粘液蜘蛛"
        HALLOWEENCANDY_5 = "浣猫图案的糖纸",		-- 物品名:"浣猫糖果"
        HALLOWEENCANDY_6 = "这不是葡萄干",		-- 物品名:"\"葡萄干\""
        HALLOWEENCANDY_7 = "葡萄干",		-- 物品名:"葡萄干"
        HALLOWEENCANDY_8 = "这很...有趣...",		-- 物品名:"鬼魂棒棒糖"
        HALLOWEENCANDY_9 = "我的心情有些复杂",		-- 物品名:"果冻虫"
        HALLOWEENCANDY_10 = "为什么是这个颜色..?",		-- 物品名:"触手棒棒糖"
        HALLOWEENCANDY_11 = "这真的是巧克力吗..四糸乃不知道",		-- 物品名:"巧克力猪"
        HALLOWEENCANDY_12 = "好可怕的糖果...", --ONI meal lice candy		-- 物品名:"糖果虱"
        HALLOWEENCANDY_13 = "有点硬,但总会吃完的。", --Griftlands themed candy		-- 物品名:"无敌硬糖"
        HALLOWEENCANDY_14 = "这应该不是糖果吧...", --Hot Lava pepper candy		-- 物品名:"熔岩椒"
        CANDYBAG = "在万圣节可以用来装很多很多糖果~",		-- 物品名:"糖果袋" 制造描述:"只带万圣夜好吃的东西。"
		HALLOWEEN_ORNAMENT_1 = "可以把它挂在某个地方。",		-- 物品名:"幽灵装饰"
		HALLOWEEN_ORNAMENT_2 = "可以把它挂在某个地方。",		-- 物品名:"蝙蝠装饰"
		HALLOWEEN_ORNAMENT_3 = "可以把它挂在某个地方。", 		-- 物品名:"蜘蛛装饰"
		HALLOWEEN_ORNAMENT_4 = "可以把它挂在某个地方。",		-- 物品名:"触手装饰"
		HALLOWEEN_ORNAMENT_5 = "可以把它挂在某个地方。",		-- 物品名:"悬垂蜘蛛装饰"
		HALLOWEEN_ORNAMENT_6 = "可以把它挂在某个地方。", 		-- 物品名:"乌鸦装饰"
		HALLOWEENPOTION_DRINKS_WEAK = "有点小, 是不是失败了...",		-- 乐观/精神病实验产出药液(能找到检查语句但代码对应不上)
		HALLOWEENPOTION_DRINKS_POTENT = "我真的要喝这个吗...",		-- 乐观/精神病实验产出药液(能找到检查语句但代码对应不上)
        HALLOWEENPOTION_BRAVERY = "有了它，很多东西就显得不那么恐怖了。",		-- 恐惧实验产出药液
		HALLOWEENPOTION_MOON = "充满魔法的一瓶药水",		-- 物品名:"月亮精华液"
		HALLOWEENPOTION_FIRE_FX = "可以像烟花一样燃烧", 		-- 硫化实验产出药液
		MADSCIENCE_LAB = "里面充满疯狂。",		-- 物品名:"疯狂科学家实验室" 制造描述:"疯狂实验无极限。唯独神智有极限。"
		LIVINGTREE_ROOT = "瓶里培育的树根", 		-- 物品名:"完全正常的树根"
		LIVINGTREE_SAPLING = "瓶里培育的树苗",		-- 物品名:"完全正常的树苗"
        DRAGONHEADHAT = "一套衣服的前端部分",		-- 物品名:"幸运兽脑袋" 制造描述:"野兽装束的前端。"
        DRAGONBODYHAT = "一套衣服的中间部分",		-- 物品名:"幸运兽躯体" 制造描述:"野兽装束的中间部分。"
        DRAGONTAILHAT = "一套衣服的最后部分",		-- 物品名:"幸运兽尾巴" 制造描述:"野兽装束的尾端。"
        PERDSHRINE =		-- 物品名:"火鸡神龛" 制造描述:"供奉庄严之火鸡。"
        {
            GENERIC = "这只火鸡喜欢金子。",		-- 常态默认(已供奉)
            EMPTY = "需要放点什么进去",		-- 未供奉
            BURNT = "烧坏了...",		-- 烧焦的
        },
        REDLANTERN = "一盏红灯笼, 带着逛祭典应该会很棒",		-- 物品名:"红灯笼" 制造描述:"照亮你的路的幸运灯笼。"
        LUCKY_GOLDNUGGET = "我很幸运",		-- 物品名:"幸运金块"
        FIRECRACKERS = "新春到了吗..?",		-- 物品名:"红鞭炮" 制造描述:"用重击来庆祝！"
        PERDFAN = "有点像火鸡的尾巴...噗",		-- 物品名:"幸运扇" 制造描述:"额外的运气，超级多。"
        REDPOUCH = "里面有什么？",		-- 物品名:"红袋子"
        WARGSHRINE = 		-- 物品名:"座狼神龛" 制造描述:"供奉陶土之座狼。"
        {
            GENERIC = "我现在应该做什么?",		-- 常态默认(已供奉)
            EMPTY = "需要放点什么进去",		-- 未供奉
            BURNT = "烧坏了...",		-- 烧焦的
        },
        CLAYWARG = 		-- 物品名:"黏土座狼"
        {
        	GENERIC = "它活、活...活过来了!",		-- 活动状态
        	STATUE = "它的眼里毫无生气。",		-- 雕像状态
        },
        CLAYHOUND = 		-- 物品名:"黏土猎犬"
        {
        	GENERIC = "它活、活...活过来了!",		-- 活动状态
        	STATUE = "它的眼里毫无生气。",		-- 雕像状态
        },
        HOUNDWHISTLE = "吹一吹吗?\n四糸奈: 对的, 吹吧",		-- 物品名:"幸运哨子" 制造描述:"对野猎犬吹哨。"
        CHESSPIECE_CLAYHOUND = "猎犬的雕像",		-- 物品名:"猎犬雕塑"
        CHESSPIECE_CLAYWARG = "狼的雕像",		-- 物品名:"座狼雕塑"
		PIGSHRINE =		-- 物品名:"猪神龛" 制造描述:"供奉富饶之猪人。"
		{
            GENERIC = "我接下来该怎么做?",		-- 已供奉
            EMPTY = "需要放点什么进去",		-- 未供奉
            BURNT = "烧坏了...",		-- 烧焦的
		},
		PIG_TOKEN = "这个是做什么用的?",		-- 物品名:"金腰带"
		PIG_COIN = "好像可以作为一种信物",		-- 物品名:"猪鼻铸币"
		YOTP_FOOD1 = "好丰盛!",		-- 物品名:"贡品烤肉" 制造描述:"向猪王敬肉。"
		YOTP_FOOD2 = "我不想吃它。",		-- 物品名:"八宝泥馅饼" 制造描述:"那里隐藏着什么？"
		YOTP_FOOD3 = "就...试一口?",		-- 物品名:"鱼头串" 制造描述:"棍子上的荣华富贵。"
		--PIGELITE1 = "暴风雨在他体内肆虐着。", --BLUE		-- 物品名:"韦德"(疑似废案)
		--PIGELITE2 = "怒不可遏。", --RED		-- 物品名:"伊格内修斯"(疑似废案)
		--PIGELITE3 = "他的整个职业生涯都以暴力为基础。", --WHITE		-- 物品名:"德米特里"(疑似废案)
		--PIGELITE4 = "石化。", --GREEN		-- 物品名:"索耶"(疑似废案)
		PIGELITEFIGHTER1 = "它看起来很厉害", --BLUE		-- 物品名:"韦德"(精英猪)
		PIGELITEFIGHTER2 = "它看起来很厉害", --RED		-- 物品名:"伊格内修斯"(精英猪)
		PIGELITEFIGHTER3 = "它看起来很厉害", --WHITE		-- 物品名:"德米特里"(精英猪)
		PIGELITEFIGHTER4 = "它看起来很厉害", --GREEN		-- 物品名:"索耶"(精英猪)
		CARRAT_GHOSTRACER = "那是...影子?",		-- 物品名:"查理的胡萝卜鼠"
        YOTC_CARRAT_RACE_START = "比赛的起点, 我们一定会赢的",		-- 物品名:"起点" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT = "做个记号~",		-- 物品名:"检查点" 制造描述:"通往光荣之路上的一站。"
        YOTC_CARRAT_RACE_FINISH =		-- 物品名:"终点线" 制造描述:"你走投无路了。"
        {
            GENERIC = "别担心, 终点很近了。",		-- 常态默认
            BURNT = "终点没了, 比赛还能继续吗..?",		-- 烧焦的
            I_WON = "我...我们赢了..?! 太好了...呼~",		-- 自己赢了
            SOMEONE_ELSE_WON = "恭喜你, {winner}。",		-- 其他人赢了
        },
		YOTC_CARRAT_RACE_START_ITEM = "为比赛确定一个起点吧",		-- 物品名:"起点套装" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "把比赛分成多个阶段",		-- 物品名:"检查点套装" 制造描述:"通往光荣之路上的一站。"
		YOTC_CARRAT_RACE_FINISH_ITEM = "是时候完成这个赛道了...",		-- 物品名:"终点线套装" 制造描述:"你走投无路了。"
		YOTC_SEEDPACKET = "里面装了一些种子",		-- 物品名:"种子包" 制造描述:"一包普通的混合种子。"
		YOTC_SEEDPACKET_RARE = "里面装了一些种子",		-- 物品名:"高级种子包" 制造描述:"一包高质量的种子。"
		MINIBOATLANTERN = "可以放在海上, 或许也是一种河灯",		-- 物品名:"漂浮灯笼" 制造描述:"闪着暖暖的光亮。"
        YOTC_CARRATSHRINE =		-- 物品名:"胡萝卜鼠神龛" 制造描述:"供奉灵巧之胡萝卜鼠。"
        {
            GENERIC = "我接下来该怎么做?",		-- 已供奉
            EMPTY = "需要放点什么进去",		-- 未供奉
            BURNT = "烧坏了...",		-- 烧焦的
        },
        YOTC_CARRAT_GYM_DIRECTION = 		-- 物品名:"方向健身房"
        {
            GENERIC = "为训练指明方向。",		-- 常态默认
            RAT = "小家伙加油",		-- 训练时
            BURNT = "现在我们暂时不能训练了...",		-- 烧焦的
        },
        YOTC_CARRAT_GYM_SPEED = 		-- 物品名:"速度健身房"
        {
            GENERIC = "我需要提高胡萝卜鼠的速度。",		-- 常态默认
            RAT = "小家伙加油",		-- 训练时
            BURNT = "现在我们暂时不能训练了...",		-- 烧焦的
        },
        YOTC_CARRAT_GYM_REACTION = 		-- 物品名:"反应健身房"
        {
            GENERIC = "增强胡萝卜鼠的反应力",		-- 常态默认
            RAT = "小家伙加油",		-- 训练时
            BURNT = "现在我们暂时不能训练了...",		-- 烧焦的
        },
        YOTC_CARRAT_GYM_STAMINA = 		-- 物品名:"耐力健身房"
        {
            GENERIC = "或许我也需要提高耐力...",		-- 常态默认
            RAT = "小家伙加油",		-- 训练时
            BURNT = "现在我们暂时不能训练了...",		-- 烧焦的
        }, 
        YOTC_CARRAT_GYM_DIRECTION_ITEM = "提高胡萝卜鼠的方向感。",		-- 物品名:"方向健身房套装" 制造描述:"提高你的胡萝卜鼠的方向感。"
        YOTC_CARRAT_GYM_SPEED_ITEM = "增加胡萝卜鼠的速度。",		-- 物品名:"速度健身房套装" 制造描述:"增加你的胡萝卜鼠的速度。"
        YOTC_CARRAT_GYM_STAMINA_ITEM = "增强胡萝卜鼠的耐力。",		-- 物品名:"耐力健身房套装" 制造描述:"增强你的胡萝卜鼠的耐力。"
        YOTC_CARRAT_GYM_REACTION_ITEM = "加快胡萝卜鼠的反应时间。",		-- 物品名:"反应健身房套装" 制造描述:"加快你的胡萝卜鼠的反应时间。"
        YOTC_CARRAT_SCALE_ITEM = "用来看看胡萝卜鼠努力的成果",           		-- 物品名:"胡萝卜鼠秤套装" 制造描述:"看看你的胡萝卜鼠的情况。"
        YOTC_CARRAT_SCALE = 		-- 物品名:"胡萝卜鼠秤" 制造描述:"灵巧机敏，富含胡萝卜素。"
        {
            GENERIC = "见证一下我的小家伙的成长",		-- 常态默认
            CARRAT = "看来我们还要继续努力一段时间",		-- 普通上秤展示
            CARRAT_GOOD = "哇!真棒!",		-- 高指标上秤展示
            BURNT = "没、没关系的, 就算没有这个我也知道小家伙的努力",		-- 烧焦的
        },                
		--BISHOP_CHARGE_HIT = "哎哟...",		-- (暂无注释)
		TRUNKVEST_SUMMER = "好看且透气",		-- 物品名:"透气背心" 制造描述:"暖和，但算不上非常暖和。"
		TRUNKVEST_WINTER = "穿在身上一定很暖~",		-- 物品名:"松软背心" 制造描述:"足以抵御冬季暴雪的保暖背心。"
		TRUNK_COOKED = "现在看上去更糟了。",		-- 物品名:"象鼻排"
		TRUNK_SUMMER = "唔...我一定要拿着这个吗..?",		-- 物品名:"象鼻"
		TRUNK_WINTER = "现在看上去更糟了。",		-- 物品名:"冬象鼻"
		TUMBLEWEED = "里面会有什么宝藏呢..?",		-- 物品名:"风滚草"
		TURKEYDINNER = "火鸡大餐!~",		-- 物品名:"火鸡大餐"
		TWIGS = "捡来的树枝",		-- 物品名:"树枝"
		UMBRELLA = "可以遮阳也可以挡雨",		-- 物品名:"雨伞" 制造描述:"遮阳挡雨！"
		GRASS_UMBRELLA = "很漂亮的一把伞",		-- 物品名:"花伞" 制造描述:"漂亮轻便的保护伞。"
		--UNIMPLEMENTED = "还没有完结，就像生命一样。",		-- 未实现
		WAFFLES = "华夫饼很好吃。",		-- 物品名:"华夫饼"
		WALL_HAY = 		-- 物品名:"草墙"
		{	
			GENERIC = "一面用草搭起来的墙",		-- 常态默认
			BURNT = "烧坏了就不能保护了吧..?",		-- 烧焦的
		},
		WALL_HAY_ITEM = "把干草堆高高",		-- 物品名:"草墙"(物品栏) 制造描述:"草墙墙体。不太结实。"
		WALL_STONE = "更坚固的墙",		-- 物品名:"石墙"
		WALL_STONE_ITEM = "一块又一块砖头,搭成厚厚的墙",		-- 物品名:"石墙"(物品栏) 制造描述:"石墙墙体。"
		WALL_RUINS = "这个地方很久以前的墙",		-- 物品名:"铥矿墙"
		WALL_RUINS_ITEM = "以前的工艺很厉害...",		-- 物品名:"铥矿墙"(物品栏) 制造描述:"这些墙可以承受相当多的打击。"
		WALL_WOOD = 		-- 物品名:"木墙"
		{
			GENERIC = "一面用木板搭起来的墙",		-- 常态默认
			BURNT = "被烧过后就不能保护了...",		-- 烧焦的
		},
		WALL_WOOD_ITEM = "捆起来的木头。",		-- 物品名:"木墙"(物品栏) 制造描述:"木墙墙体。"
		WALL_MOONROCK = "月亮...轻声许下保护的承诺。",		-- 物品名:"月岩墙"
		WALL_MOONROCK_ITEM = "用这片大陆以外的岩石堆砌结实的墙",		-- 物品名:"月岩墙"(物品栏) 制造描述:"月球疯子之墙。"
		FENCE = "木栅栏",		-- 物品名:"木栅栏"
        FENCE_ITEM = "我们可以用它来建造一个栅栏。",		-- 物品名:"木栅栏"(物品栏) 制造描述:"木栅栏部分。"
        FENCE_GATE = "很常见的木门",		-- 物品名:"木门"
        FENCE_GATE_ITEM = "我们可以用它来建造一个门。",		-- 物品名:"木门"(物品栏) 制造描述:"木栅栏的门。"
		WALRUS = "海象",		-- 物品名:"海象"
		WALRUSHAT = "暖呼呼的帽子",		-- 物品名:"贝雷帽"
		WALRUS_CAMP =		-- 物品名:"海象营地"
		{
			EMPTY = "如果它们不在这，那它们会在哪里？",		-- 空的
			GENERIC = "海象先生和它的孩子住在这里",		-- 常态默认
		},
		WALRUS_TUSK = "一颗海象的牙齿",		-- 物品名:"海象牙"
		WARDROBE = 		-- 物品名:"衣柜" 制造描述:"随心变换面容。"
		{
			GENERIC = "一个用来放衣服的柜子",		-- 常态默认
            BURNING = "还好我的衣服在其他柜子...",		-- 正在燃烧
			BURNT = "什么都没有了...",		-- 烧焦的
		},
		WARG = "坏狼",		-- 物品名:"座狼"
		WASPHIVE = "这个蜂窝还是不要靠近好了...",		-- 物品名:"杀人蜂蜂窝"
		WATERBALLOON = "可以打水仗吗..?。",		-- 物品名:"水球" 制造描述:"球体灭火。"
		WATERMELON = "清凉的西瓜",		-- 物品名:"西瓜"
		WATERMELON_COOKED = "现在它成了熟西瓜了。",		-- 物品名:"烤西瓜"
		WATERMELONHAT = "为什么要把西瓜戴在头上?\n四糸奈:不知道",		-- 物品名:"西瓜帽" 制造描述:"提神醒脑，但感觉黏黏的。"
		WAXWELLJOURNAL = "这本书有让我不舒服的气息",		-- 物品名:"暗影秘典" 制造描述:"这将让你大吃一惊。"
		WETGOOP = "啊...看来我还是不太会做料理...",		-- 物品名:"潮湿黏糊"(失败料理)
        WHIP = "我...我有点害怕拿着它...",		-- 物品名:"三尾猫鞭" 制造描述:"提出有建设性的反馈意见。"
		WINTERHAT = "冬天一定要戴的帽子,暖暖的~",		-- 物品名:"冬帽" 制造描述:"保持脑袋温暖。"
		WINTEROMETER = 		-- 物品名:"温度测量仪" 制造描述:"测量环境气温。"
		{
			GENERIC = "一支温度计",		-- 常态默认
			BURNT = "只要不是天气把它烧坏的就行...",		-- 烧焦的
		},
        WINTER_TREE =		-- 物品名:"冬季盛宴树"
        {
            BURNT = "明明我很喜欢来着...",		-- 烧焦的
            BURNING = "糟糕, 要赶紧灭火",		-- 正在燃烧
            CANDECORATE = "我应该说\"圣诞快乐\"?",		-- 长大后
            YOUNG = "小树正在长大",		-- 生长中
        },
		WINTER_TREESTAND = 		-- 物品名:"盛宴树盆" 制造描述:"种植并装饰一棵冬季圣诞树！"
		{
			GENERIC = "我们可以种一棵圣诞树在里面",		-- 常态默认
            BURNT = "烧坏了...",		-- 烧焦的
		},
        WINTER_ORNAMENT = "一个小玩具..?",		-- 物品名:"圣诞小玩意"
        WINTER_ORNAMENTLIGHT = "这个灯可以挂在圣诞树上",		-- 物品名:"圣诞灯"
        WINTER_ORNAMENTBOSS = "回忆起一个欢乐的时候。",		-- 物品名:"华丽的装饰"
		WINTER_ORNAMENTFORGE = "似乎对这片大陆的人们有特别的意义",		-- 物品名:"熔炉装饰"
		WINTER_ORNAMENTGORGE = "很好看。",		-- 物品名:"暴食装饰"
        WINTER_FOOD1 = "这个真的可以吃吗...我记得刚才会动来着...", --gingerbread cookie		-- 物品名:"小姜饼"
        WINTER_FOOD2 = "好吃的节日饼干", --sugar cookie		-- 物品名:"糖曲奇饼"
        WINTER_FOOD3 = "拐杖形状的糖果", --candy cane		-- 物品名:"拐杖糖"
        WINTER_FOOD4 = "这个颜色, 好像不能吃了", --fruitcake		-- 物品名:"永远的水果蛋糕"
        WINTER_FOOD5 = "巧克力原木蛋糕, 果然和木头好像哦~", --yule log cake		-- 物品名:"巧克力原木蛋糕"
        WINTER_FOOD6 = "是布丁!不过李子在哪里?", --plum pudding		-- 物品名:"李子布丁"
        WINTER_FOOD7 = "我不可以喝酒...诶~只是苹果汁?", --apple cider		-- 物品名:"苹果酒"
        WINTER_FOOD8 = "热可可洋溢着舒适和满足的芬芳。", --hot cocoa		-- 物品名:"热可可"
        WINTER_FOOD9 = "是蛋还是酒?", --eggnog		-- 物品名:"美味的蛋酒"
		WINTERSFEASTOVEN =		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰。"
		{
			GENERIC = "这个炉子有魔法吗?",		-- 常态默认
			COOKING = "再等一小会就好啦~",		-- 烹饪中
			ALMOST_DONE_COOKING = "好像差不多了...",		-- 即将烹饪完毕
			DISH_READY = "食物出炉了。",		-- 烹饪结束
		},
		BERRYSAUCE = "浆果酱,但是好像有些不太一样...",		-- 物品名:"快乐浆果酱"
		BIBINGKA = "这个面包的口感非常神奇。",		-- 物品名:"比宾卡米糕"
		CABBAGEROLLS = "白菜卷,但是好像有些不太一样...",		-- 物品名:"白菜卷"
		FESTIVEFISH = "鱼料理,但是好像有些不太一样...",		-- 物品名:"节庆鱼料理"
		GRAVY = "真的只是肉汁吗..?",		-- 物品名:"好肉汁"
		LATKES = "油炸土豆饼,但是好像有些不太一样...",		-- 物品名:"土豆饼"
		LUTEFISK = "碱渍鱼, 我不太喜欢...",		-- 物品名:"苏打鱼"
		MULLEDDRINK = "我不用喝酒真是太好了...",		-- 物品名:"香料潘趣酒"
		PANETTONE = "这确实是面包,但是好像有些不太一样...",		-- 物品名:"托尼甜面包"
		PAVLOVA = "蛋白奶油蛋糕,但是好像有些不太一样...",		-- 物品名:"巴甫洛娃蛋糕"
		PICKLEDHERRING = "它并不臭,但这真的是鱼吗..?",		-- 物品名:"腌鲱鱼"
		POLISHCOOKIE = "几块饼干,但是好像有些不太一样...",		-- 物品名:"波兰饼干"
		PUMPKINPIE = "南瓜派,但是好像有些不太一样...",		-- 物品名:"南瓜派"
		ROASTTURKEY = "烤火鸡,但是好像有些不太一样...",		-- 物品名:"烤火鸡"
		STUFFING = "一想到原料是那些,我就有些害怕...",		-- 物品名:"烤火鸡面包馅"
		SWEETPOTATO = "这片大陆似乎并没有大米,可是这...",		-- 物品名:"红薯焗饭"
		TAMALES = "现在不是吃这个的时候",		-- 物品名:"塔马利"
		TOURTIERE = "肉馅饼,馅料很足,但有些不真实...",		-- 物品名:"饕餮馅饼"
		TABLE_WINTERS_FEAST = 		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧。"
		{
			GENERIC = "聚会的桌子。",		-- 常态默认
			HAS_FOOD = "丰盛得有些不真实...",		-- 有冬季盛宴食物在桌上
			WRONG_TYPE = "为什么不能放上去..?",		-- 放置非冬季盛宴食物在桌上
			BURNT = "桌子被烧坏了...",		-- 烧焦的
		},
		GINGERBREADWARG = "身披节庆外衣的坏狼。", 		-- 物品名:"姜饼座狼"
		GINGERBREADHOUSE = "一座能吃的小房子?我有点舍不得。", 		-- 物品名:"姜饼猪屋"
		GINGERBREADPIG = "慢一点,四糸乃有点跑不动了...",		-- 物品名:"姜饼猪"
		CRUMBS = "是从小家伙身上掉下来的",		-- 物品名:"饼干屑"
		WINTERSFEASTFUEL = "很漂亮的一个小球",		-- 物品名:"节日欢愉"

        KLAUS = "它从哪里来?",		-- 物品名:"克劳斯"
        KLAUS_SACK = "一个包裹,里面会有什么呢?",		-- 物品名:"赃物袋"
		KLAUSSACKKEY = "这个可以当作钥匙",		-- 物品名:"麋鹿茸"
		WORMHOLE =		-- 物品名:"虫洞"
		{
			GENERIC = "像个长在地上的软枕头。",		-- 常态默认(虫洞闭合)
			OPEN = "它会带我去哪里?",		-- 打开
		},
		--WORMHOLE_LIMITED = "它很快就会放弃。",		-- 物品名:"生病的虫洞"->一次性虫洞
		--ACCOMPLISHMENT_SHRINE = "我向来不太关心隐喻。",        		-- 物品名:"奖杯" 单机 制造描述:"证明你作为一个人的价值。"
		LIVINGTREE = "好奇怪的树",		-- 物品名:"完全正常的树"
		REVIVER = "鬼魂朋友复活了，好可怕。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
		SHADOWHEART = "我能感受到...好冷...好悲伤...",		-- 物品名:"暗影心房"
        ATRIUM_RUBBLE = 		-- 物品名:"远古壁画"
        {
			LINE_1 = "人们受到饥荒和悲伤的打击。",		-- 第一行
			LINE_2 = "这上面已经看不清了。",		-- 第二行
			LINE_3 = "有黑暗的东西悄悄逼近这座城市和城里的人。",		-- 第三行
			LINE_4 = "人们发生了难以想象的变化。",		-- 第四行
			LINE_5 = "最后，城市里充满了生机。",		-- 第五行
		},
        ATRIUM_STATUE = "一个受折磨的灵魂。",		-- 物品名:"远古雕像"
        ATRIUM_LIGHT = 		-- 物品名:"远古灯柱"
        {
			ON = "是什么让它亮起来的?",		-- 激活
			OFF = "现在熄灭了。",		-- 熄灭
		},
        ATRIUM_GATE =		-- 物品名:"远古大门"
        {
			ON = "启动了",		-- 开启
			OFF = "或许可以修一修",		-- 关闭
			CHARGING = "它正在吸收能量",		-- 充能中
			DESTABILIZING = "它要爆炸了吗?!",		-- 不稳定
			COOLDOWN = "它正在做准备",		-- 冷却中
        },
        ATRIUM_KEY = "用来开启某处大门的钥匙",		-- 物品名:"远古钥匙"
		LIFEINJECTOR = "四糸乃不想打针",		-- 物品名:"强心针" 制造描述:"提高下你那日渐衰退的最大健康值吧。"
		SKELETON_PLAYER =		-- 物品名:"骷髅"(由玩家产生的骷髅)
		{
			MALE = "可怜的 %s, 在这片大陆我需要更小心一些",		-- 男性
			FEMALE = "可怜的 %s, 在这片大陆我需要更小心一些",		-- 女性
			ROBOT = "可怜的 %s, 在这片大陆我需要更小心一些",		-- 机器人
			DEFAULT = "可怜的 %s, 在这片大陆我需要更小心一些",		-- 常态默认(物品栏?)
		},
		ROCK_MOON = "来自月亮的陨石",		-- 物品名:"岩石"(月岩矿)
		MOONROCKNUGGET = "从来自月亮的陨石上敲下的石头",		-- 物品名:"月岩"
		MOONROCKCRATER = "缺了一角, 刚好可以放宝石~",		-- 物品名:"带孔月岩" 制造描述:"用于划定地盘的岩石。"
		MOONROCKSEED = "这就像一个口袋版的月亮。",		-- 物品名:"天体宝球"
        REDMOONEYE = "看起来像个眼睛",		-- 物品名:"红色月眼"
        PURPLEMOONEYE = "看起来像个眼睛",		-- 物品名:"紫色月眼"
        GREENMOONEYE = "看起来像个眼睛",		-- 物品名:"绿色月眼"
        ORANGEMOONEYE = "看起来像个眼睛",		-- 物品名:"橙色月眼"
        YELLOWMOONEYE = "看起来像个眼睛",		-- 物品名:"黄色月眼"
        BLUEMOONEYE = "看起来像个眼睛",		-- 物品名:"蓝色月眼"
        --BOARRIOR = "请……请不要伤害我……",		-- 物品名:"大熔炉猪战士"(熔炉模式)
        --BOARON = "请……请不要伤害我……",		-- 物品名:"战猪"(熔炉模式)
        --PEGHOOK = "请……请不要伤害我……",		-- 物品名:"蝎子"(熔炉模式)
        --TRAILS = "请……请不要伤害我……",		-- 物品名:"野猪猩"(熔炉模式)
        --TURTILLUS = "请……请不要伤害我……",		-- 物品名:"坦克龟"(熔炉模式)
        --SNAPPER = "请……请不要伤害我……",		-- 物品名:"鳄鱼指挥官"(熔炉模式)
		--RHINODRILL = "请……请不要伤害我……",		-- 物品名:"后扣帽犀牛兄弟"(熔炉模式)
		--BEETLETAUR = "请……请不要伤害我……",		-- 物品名:"地狱独眼巨猪"(熔炉模式)
        --LAVAARENA_PORTAL = 		-- 物品名:"熔炉传送门"(代码是lavaarena_spawner,因此对不上)
        --{
        --    ON = "祝你度过愉快的一天。",		-- 开启
        --    GENERIC = "我不敢奢望它能送我回家。",		-- 常态默认
        --},
        --HEALINGSTAFF = "我能让我的盟友复活。",		-- 物品名:"生命魔杖"(熔炉模式)
        --FIREBALLSTAFF = "召唤死亡从天而降。",		-- 物品名:"地狱魔杖"(熔炉模式)
        --HAMMER_MJOLNIR = "多么残暴的工具。",		-- 物品名:"锻锤"(熔炉模式)
        --SPEAR_GUNGNIR = "用来切割和挥砍...",		-- 物品名:"尖齿矛"(熔炉模式)
        --BLOWDART_LAVA = "刺穿我敌人的心脏...",		-- 物品名:"吹箭"(熔炉模式)
        --BLOWDART_LAVA2 = "燃烧加刺穿！",		-- 物品名:"熔化吹箭"(熔炉模式)
        --WEBBER_SPIDER_MINION = "韦伯似乎以它们为骄傲。",		-- 物品名:"蜘蛛宝宝"(熔炉模式)
        --BOOK_FOSSIL = "文字中蕴含着力量。",		-- 物品名:"石化之书"(熔炉模式)
		--SPEAR_LANCE = "多么残暴的武器...",		-- 物品名:"螺旋矛"(熔炉模式)
		--BOOK_ELEMENTAL = "我可不想要这种力量。",		-- 物品名:"召唤之书"(熔炉模式)
        --QUAGMIRE_ALTAR = 		-- 物品名:"饕餮祭坛"(暴食模式)
        --{
        --	GENERIC = "它想吃些好吃的",		-- 常态默认
        --	FULL = "它暂时不想再吃更多了",		-- 满了
    	--},
		--QUAGMIRE_SUGARWOODTREE = 		-- 物品名:"糖木树"(暴食模式)
		--{
		--	GENERIC = "它有一种病态的美。",		-- 常态默认
		--	STUMP = "桩桩件件，总有终结的时候。",		-- 只剩树桩了
		--	TAPPED_EMPTY = "犹如匕首穿过心脏，树木的心脏。",		-- 糖木树空了
		--	TAPPED_READY = "现在我可以收了它啦。",		-- 糖木树好了
		--	TAPPED_BUGS = "它们全都白白献身了。",		-- 糖木树上有蚂蚁
		--	--WOUNDED = "它的生命危在旦夕。",		-- 糖木树生病了(已移除的机制)
		--},
		--QUAGMIRE_SPOTSPICE_SHRUB = 
		--{
		--	GENERIC = "我估计它是可以吃的。",		-- 物品名:"带斑点的小灌木"(暴食模式)->常态默认
		--	PICKED = "能拿的我们都拿完了。",		-- 物品名:"带斑点的小灌木"->被采完了
		--},
		--QUAGMIRE_SALT_RACK =
		--{
		--	READY = "没有盐。",		-- 物品名:"盐架"(暴食模式)->准备好的 满的
		--	GENERIC = "还没有盐。",		-- 物品名:"盐架"常态默认
		--},
		--QUAGMIRE_SAFE = 
		--{
		--	GENERIC = "我们往里面瞧一眼吧...",		-- 物品名:"保险箱"(暴食模式)->常态默认
		--	LOCKED = "锁住了，就像我的心一样。",		-- 物品名:"保险箱"->锁住了
		--},
		--QUAGMIRE_MUSHROOMSTUMP =
		--{
		--	GENERIC = "它们在死神创造的树桩上茁壮成长。",		-- 物品名:"蘑菇"(暴食模式)->常态默认
		--	PICKED = "万物都会消亡，就连菌类也不例外。",		-- 物品名:"蘑菇"->被采完了
		--},
        --QUAGMIRE_RUBBLE_HOUSE =
        --{
        --    "死神来过这里。",		-- 物品名:"残破的房子"(暴食模式)
        --    "这是一座鬼城。",		-- 物品名:"残破的房子"
        --    "这个房子发生过悲剧。",		-- 物品名:"残破的房子"
        --QUAGMIRE_SWAMPIGELDER =
        --{
        --    GENERIC = "你好吗，先生？",		-- 物品名:"沼泽猪长老"(暴食模式)->常态默认
        --    SLEEPING = "他正在为长睡不醒做准备呢。",		-- 物品名:"沼泽猪长老"->睡着了
        --},
        --QUAGMIRE_FOOD =		-- (暴食模式)
        --{
        --	GENERIC = "我们应当把它献祭给野兽。",		-- 物品名: 
        --    MISMATCH = "它不是野兽想要的。",		-- 物品名: 
        --    MATCH = "对此，野兽会感到满意的。",		-- 物品名: 
        --    MATCH_BUT_SNACK = "这会满足野兽的，但不会长久。",		-- 物品名: 
        --},
        --QUAGMIRE_PARK_GATE =
        --{
        --    GENERIC = "现在我可以进入公园了。",		-- 物品名:"铁门"(暴食模式)->常态默认
        --    LOCKED = "我要有钥匙才能进入。",		-- 物品名:"铁门"->锁住了
        --},
        --QUAGMIRE_PIGEON =
        --{
        --    DEAD = "冷冰冰，死翘翘。",		-- 物品名:"鸽子"(暴食模式)->死了 制造描述:"这是一只完整的活鸽。"
        --    GENERIC = "要不要把你做成馅饼呀，小鸟？",		-- 物品名:"鸽子"常态默认 制造描述:"这是一只完整的活鸽。"
        --    SLEEPING = "它正在为长睡不醒做准备呢。",		-- 物品名:"鸽子"->睡着了 制造描述:"这是一只完整的活鸽。"
        --},
        WINONA_CATAPULT = 		-- 物品名:"薇诺娜的投石机" 制造描述:"向敌人投掷大石块"
        {
        	GENERIC = "我只在书上见过这个",		-- 常态默认
        	OFF = "现在是关闭状态",		-- 关闭
        	BURNING = "糟糕,要赶紧灭火",		-- 正在燃烧
        	BURNT = "烧坏了...",		-- 烧焦的
        },
        WINONA_SPOTLIGHT = 		-- 物品名:"薇诺娜的聚光灯" 制造描述:"白天夜里都发光"
        {
        	GENERIC = "聚光灯下永远都是最亮的",		-- 常态默认
        	OFF = "现在是关闭状态",		-- 关闭
        	BURNING = "糟糕,要赶紧灭火",		-- 正在燃烧
        	BURNT = "烧坏了...",		-- 烧焦的
        },
        WINONA_BATTERY_LOW = 		-- 物品名:"薇诺娜的发电机" 制造描述:"要确保电力供应充足"
        {
        	GENERIC = "一台发电机",		-- 常态默认
        	LOWPOWER = "好像快没电了",		-- 电量低于1/6
        	OFF = "现在是关闭状态",		-- 关闭(没电了)
        	BURNING = "糟糕,要赶紧灭火",		-- 正在燃烧
        	BURNT = "烧坏了...",		-- 烧焦的
        },
        WINONA_BATTERY_HIGH = 		-- 物品名:"薇诺娜的宝石发电机" 制造描述:"这玩意烧宝石，所以肯定不会差。"
        {
        	GENERIC = "用宝石作为燃料吗..?",		-- 常态默认
        	LOWPOWER = "好像快没电了",		-- 快没电了
        	OFF = "现在是关闭状态,可能需要一些宝石才能启动",		-- 关闭(没电了)
        	BURNING = "糟糕,要赶紧灭火",		-- 正在燃烧
        	BURNT = "烧坏了...",		-- 烧焦的
        },
        COMPOSTWRAP = "可以洒在菜园里",		-- 物品名:"肥料包" 制造描述:"\"草本\"的疗法。"
        ARMOR_BRAMBLE = "这样我就不会痛了吗...。",		-- 物品名:"荆棘外壳" 制造描述:"让大自然告诉你什么叫\"滚开\"。"
        TRAP_BRAMBLE = "抱歉..., 我不是故意布置陷阱的",		-- 物品名:"荆棘陷阱" 制造描述:"都有机会中招的干\n扰陷阱。"
        BOATFRAGMENT03 = "剩下的只有残骸。",		-- 物品名:"船碎片"(样式1)
        BOATFRAGMENT04 = "剩下的只有残骸。",		-- 物品名:"船碎片"(样式2)
        BOATFRAGMENT05 = "剩下的只有残骸。",		-- 物品名:"船碎片"(样式3)
		BOAT_LEAK = "糟糕,船进水了,要赶紧补上。",		-- 物品名:"漏洞"
        MAST = "船桅杆,用来挂船帆",		-- 物品名:"桅杆" 制造描述:"乘风破浪会有时。"
        SEASTACK = "小心不要撞到它。",		-- 物品名:"海蚀柱"
        FISHINGNET = "用网可以捕捉到好多好多的鱼",		-- 物品名:"渔网" 制造描述:"就是一张网。"
        ANTCHOVIES = "有点特别的鱼",		-- 物品名:"蚁头凤尾鱼"(游戏中发现此鱼地面贴图丢失,怀疑是废案)
        STEERINGWHEEL = "掌控船的方向",		-- 物品名:"方向舵" 制造描述:"航海必备道具。"
        ANCHOR = "让船在海中稳定",		-- 物品名:"锚" 制造描述:"船用刹车"
        BOATPATCH = "快用这个补丁把船的漏洞补上吧",		-- 物品名:"船补丁" 制造描述:"打补丁永远不晚。"
        DRIFTWOOD_TREE = 		-- 物品名:"浮木"
        {
            BURNING = "苍白的树正在燃烧,或许我应该先灭火",		-- 正在燃烧
            BURNT = "被烧干净了...",		-- 烧焦的
            CHOPPED = "已经被砍过了...",		-- 被砍了
            GENERIC = "已泛白的枯树。",		-- 常态默认
        },
        DRIFTWOOD_LOG = "轻得能在海上浮起来",		-- 物品名:"浮木桩"
        MOON_TREE = 		-- 物品名:"月树"
        {
            BURNING = "它正在燃烧,或许我应该先灭火",		-- 正在燃烧
            BURNT = "被烧干净了...",		-- 烧焦的
            CHOPPED = "已经被砍完了...",		-- 被砍了
            GENERIC = "闪耀着月光的树。",		-- 常态默认
        },
		MOON_TREE_BLOSSOM = "从月亮树上掉下来的花。",		-- 物品名:"月树花"
        MOONBUTTERFLY = 
        {
        	GENERIC = "好美的蛾",		-- 物品名:"月蛾"常态默认
        	HELD = "我希望可以帮助你活久一点",		-- 物品栏内
        },
		MOONBUTTERFLYWINGS = "一切都会走到尽头。",		-- 物品名:"月蛾翅膀"
        MOONBUTTERFLY_SAPLING = "尽管困难重重...它还是茁壮成长...",		-- 物品名:"月树苗"
        ROCK_AVOCADO_FRUIT = "结在树上，但是看着像一块石头。",		-- 物品名:"石果"
        ROCK_AVOCADO_FRUIT_RIPE = "现在我可以吃了。",		-- 物品名:"成熟石果"
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "做熟了也许好吃点。",		-- 物品名:"熟石果"
        ROCK_AVOCADO_FRUIT_SPROUT = "发芽了...!",		-- 物品名:"发芽的石果"
        ROCK_AVOCADO_BUSH = 		-- 物品名:"石果灌木丛"
        {
        	BARREN = "它再也结不出果了。",		-- 坏掉了
			WITHERED = "我跟它的感受是一样的。",		-- 枯萎了
			GENERIC = "结果了。",		-- 常态默认
			PICKED = "没什么东西给我。",		-- 被采完了
			--DISEASED = "它腐化了，被污染了。",		-- 生病了(已移除的机制)
            --DISEASING = "里面充斥着邪恶。",		-- 正在生病(已移除的机制)
			BURNING = "它正在燃烧,或许我应该先灭火",		-- 正在燃烧
		},
        DEAD_SEA_BONES = "似乎海洋里埋藏着很多秘密",		-- 物品名:"海骨"
        HOTSPRING = 		-- 物品名:"温泉"
        {
        	GENERIC = "是天然的温泉!",		-- 常态默认
        	BOMBED = "好像过热了",		-- 沸腾
        	GLASS = "盖满了玻璃...",		-- 结晶
			EMPTY = "这里干涸了...",		-- 干涸
        },
        MOONGLASS = "很锋利的碎片",		-- 物品名:"月亮碎片"
        MOONGLASS_ROCK = "晶莹剔透的玻璃",		-- 物品名:"月光玻璃"
        BATHBOMB = "虽然是沐浴球, 但似乎有其他作用",		-- 物品名:"沐浴球" 制造描述:"春天里来百花香？这点子把地都炸碎了"
        TRAP_STARFISH =		-- 物品名:"海星"
        {
            GENERIC = "是一个海星。",		-- 常态默认
            CLOSED = "它吞下了一些东西",		-- 闭合
        },
        DUG_TRAP_STARFISH = "海星会帮助我",		-- 物品名:"海星陷阱"
        SPIDER_MOON = 		-- 物品名:"破碎蜘蛛"
        {
        	GENERIC = "又是蜘蛛..呜...",		-- 常态默认
        	SLEEPING = "趁现在小心经过",		-- 睡着了
        	DEAD = "再见。",		-- 死了
        },
        MOONSPIDERDEN = "里面藏着可怕的生物。",		-- 物品名:"破碎蜘蛛洞"
		FRUITDRAGON =		-- 物品名:"沙拉蝾螈"
		{
			GENERIC = "它不生气时很可爱",		-- 常态默认
			RIPE = "它变得通红",		-- 成熟
			SLEEPING = "它睡得很安稳。",		-- 睡着了
		},
        PUFFIN =		-- 物品名:"海鹦鹉"
        {
            GENERIC = "它是海鹦鹉",		-- 物品名:"海鹦鹉"常态默认
            HELD = "我会照顾你的",		-- 物品栏
            SLEEPING = "它睡着了。",		-- 睡着了
        },
		MOONGLASSAXE = "这个真的能砍树吗..?",		-- 物品名:"月光玻璃斧" 制造描述:"脆弱而有效。"
		GLASSCUTTER = "很脆弱,但也很锋利",		-- 物品名:"玻璃刀" 制造描述:"尖端武器。"
        ICEBERG =		-- 物品名:"迷你冰山"
        {
            GENERIC = "呼~好险, 我的船差点就撞上了。",		-- 常态默认
            MELTED = "融化了一点。",		-- 融化了
        },
        ICEBERG_MELTED = "融化了一点。",		-- 物品名:"融化的迷你冰山"
        MINIFLARE = "告诉别人自己的位置",		-- 物品名:"信号弹" 制造描述:"为你信任的朋友照亮前路。"
		MOON_FISSURE =  		-- 物品名:"天体裂隙"
		{
			GENERIC = "我看到光了!", 		-- 发光了
			NOLIGHT = "裂隙中有什么..?",		-- 无光
		},
        MOON_ALTAR =		-- 天体祭坛
        {
            MOON_ALTAR_WIP = "好像还缺点什么",		-- 仅安装了一部分
            GENERIC = "组装完成啦~!",		-- 安装好的
        },
        MOON_ALTAR_IDOL = "我们会把你重新装好。",		-- 物品名:"天体祭坛雕像"
        MOON_ALTAR_GLASS = "它想找到丢失的部分。",		-- 物品名:"天体祭坛底座"
        MOON_ALTAR_SEED = "它想得到某种能量。",		-- 物品名:"天体祭坛宝球"
        MOON_ALTAR_ROCK_IDOL = "感觉里面有东西...",		-- 物品名:"吸引人的结构"(未凿开的天体祭坛雕像)
        MOON_ALTAR_ROCK_GLASS = "感觉里面有东西...",		-- 物品名:"吸引人的结构"(未凿开的天体祭坛底座)
        MOON_ALTAR_ROCK_SEED = "感觉里面有东西...",		-- 物品名:"吸引人的结构"(未凿开的天体祭坛宝球)
        MOON_ALTAR_CROWN = "它有属于它的地方",		-- 物品名:"未激活天体贡品"
        MOON_ALTAR_COSMIC = "感觉它在等什么事情发生。",		-- 物品名:"天体贡品"
        SEAFARING_PROTOTYPER =		-- 物品名:"智囊团" 制造描述:"海上科学。"
        {
            GENERIC = "学习和出海有关的知识",		-- 常态默认
            BURNT = "它烧坏了,已经不能使用了...",		-- 烧焦的
        },
        BOAT_ITEM = "造一艘小船",		-- 物品名:"船套装" 制造描述:"让大海成为你的领地。"
        STEERINGWHEEL_ITEM = "可以做方向舵...",		-- 物品名:"方向舵套装" 制造描述:"航海必备道具。"
        ANCHOR_ITEM = "船锚用品。",		-- 物品名:"锚套装" 制造描述:"船用刹车"
        MAST_ITEM = "造桅杆用的。",		-- 物品名:"桅杆套装" 制造描述:"乘风破浪会有时。"
        MUTATEDHOUND = 		-- 物品名:"恐怖猎犬"
        {
        	DEAD = "它真正离开了这个世界",		-- 死了
        	GENERIC = "为、为什么还要起来?",		-- 常态默认
        	SLEEPING = "不要醒过来。",		-- 睡着了
        },
        MUTATED_PENGUIN = 		-- 物品名:"月岩企鸥"->
        {
			DEAD = "它真正离开了这个世界",		-- 死了
			GENERIC = "让它活着才是折磨它。",		-- 常态默认
			SLEEPING = "不要醒过来。",		-- 睡着了
		},
        CARRAT = 		-- 物品名:"胡萝卜鼠" 制造描述:"灵巧机敏，富含胡萝卜素。"
        {
        	DEAD = "我很难过...",		-- 死了
        	GENERIC = "一蹦一跳的",		-- 常态默认
        	HELD = "我想带它去个好玩的地方",		-- 物品栏
        	SLEEPING = "嘘...它睡着了",		-- 睡着了
        },
		BULLKELP_PLANT = 		-- 物品名:"公牛海带"
        {
            GENERIC = "有一些海带在海面上",		-- 常态默认
            PICKED = "被采完了",		-- 被采完了
        },
		BULLKELP_ROOT = "我们把它种一下，它会开心点。",		-- 物品名:"公牛海带茎"
        KELPHAT = "真的要把这个带头上吗..?我不要。",		-- 物品名:"海花环" 制造描述:"让人神经焦虑的东西。"
		KELP = "煮一下就能吃了",		-- 物品名:"海带叶"
		KELP_COOKED = "煮熟的海带,有海洋的味道",		-- 物品名:"熟海带叶"
		KELP_DRIED = "晒干的海带",		-- 物品名:"干海带叶"
		GESTALT = "他们似乎想讲故事。",		-- 物品名:"虚影"
		COOKIECUTTER = "请不要破坏我的船",		-- 物品名:"饼干切割机"
		COOKIECUTTERSHELL = "一些外壳",		-- 物品名:"饼干切割机壳"
		COOKIECUTTERHAT = "在海上可以当作安全帽使用",		-- 物品名:"饼干切割机帽子" 制造描述:"穿着必须犀利。"
		SALTSTACK =		-- 物品名:"盐堆"
		{
			GENERIC = "大自然的盐会像这样出现在海面上吗?",		-- 常态默认
			MINED_OUT = "被彻底摧毁了。",		-- 检查盐堆底座(已弃用)
			GROWING = "盐晶开始堆积",		-- 正在生长
		},
		SALTROCK = "这些和盐的味道一样",		-- 物品名:"盐晶"
		SALTBOX = "我知道这个, 可以用来保存食物",		-- 物品名:"盐盒" 制造描述:"用盐来储存食物。"
		TACKLESTATION = "我们来钓鱼吧",		-- 物品名:"钓具容器" 制造描述:"传统的用饵钓鱼。"
		TACKLESKETCH = "这张广告介绍了一些钓鱼技巧",		-- 物品名:"{item}广告"
        MALBATROSS = "好可怕的鸟！",		-- 物品名:"邪天翁"
        MALBATROSS_FEATHER = "凋落的羽毛",		-- 物品名:"邪天翁羽毛"
        MALBATROSS_BEAK = "真可怕。",		-- 物品名:"邪天翁喙"
        MAST_MALBATROSS_ITEM = "没事的，我可以处理好。",		-- 物品名:"飞翼风帆套装" 制造描述:"像海鸟一样航向深蓝。"
        MAST_MALBATROSS = "船的速度好快",		-- 物品名:"飞翼风帆" 制造描述:"像海鸟一样航向深蓝。"
		MALBATROSS_FEATHERED_WEAVE = "精心编织而成的帆布",		-- 物品名:"羽毛帆布" 制造描述:"精美的羽毛布料。"
        GNARWAIL =		-- 物品名:"一角鲸"
        {
            GENERIC = "那是什么...大鲸鱼?!",		-- 常态默认
            BROKENHORN = "它的角不见了...",		-- 角被摧毁
            FOLLOWER = "你想跟着我吗?",		-- 跟随中(角还在)
            BROKENHORN_FOLLOWER = "你失去了对自己很重要的东西，对不对?",		-- 跟随中(角被摧毁)
        },
        GNARWAIL_HORN = "很硬很尖锐",		-- 物品名:"一角鲸的角"
        --WALKINGPLANK = "那样就太简单了。",		-- 物品名:"跳板"(已更新为"船")
        OAR = "我脑海中响起一首童谣",		-- 物品名:"桨" 制造描述:"划，划，划小船。"
		OAR_DRIFTWOOD = "更好用的船桨",		-- 物品名:"浮木桨" 制造描述:"小桨要用浮木造？"
		OCEANFISHINGROD = "在海中钓鱼的专业工具",		-- 物品名:"海钓竿" 制造描述:"像职业选手一样钓鱼吧。"
		OCEANFISHINGBOBBER_NONE = "先挂上鱼钩才能钓鱼",		-- 物品名:"鱼钩"

        OCEANFISHINGBOBBER_BALL = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"木球浮标" 制造描述:"经典设计，初学者和职业钓手两相宜。"
        OCEANFISHINGBOBBER_OVAL = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"硬物浮标" 制造描述:"在经典浮标的基础上融入了时尚设计。"
		OCEANFISHINGBOBBER_CROW = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"黑羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"红羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN_WINTER = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"蔚蓝羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_CANARY = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"黄羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_GOOSE = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"鹅羽浮标" 制造描述:"高级羽绒浮标。"
		OCEANFISHINGBOBBER_MALBATROSS = "我需要耐心观察, 等它沉下去的同时……收竿!",		-- 物品名:"邪天翁羽浮标" 制造描述:"高级巨鸟浮标。"
		OCEANFISHINGLURE_SPINNER_RED = "更适合在早上使用的鱼饵",		-- 物品名:"日出旋转亮片" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPINNER_GREEN = "更适合在黄昏使用的鱼饵",		-- 物品名:"黄昏旋转亮片" 制造描述:"低光照环境里效果最好。"
		OCEANFISHINGLURE_SPINNER_BLUE = "更适合在晚上使用的鱼饵",		-- 物品名:"夜间旋转亮片" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_SPOON_RED = "更适合在早上使用的鱼饵。",		-- 物品名:"日出匙型假饵" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPOON_GREEN = "更适合在黄昏使用的鱼饵",		-- 物品名:"黄昏匙型假饵" 制造描述:"在夕阳中继续垂钓。"
		OCEANFISHINGLURE_SPOON_BLUE = "更适合在晚上使用的鱼饵",		-- 物品名:"夜间匙型假饵" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_HERMIT_RAIN = "雨天也要出去钓鱼吗?我不太懂。",		-- 物品名:"雨天鱼饵" 制造描述:"留着雨天用。"
		OCEANFISHINGLURE_HERMIT_SNOW = "下雪了就不用钓鱼了吧",		-- 物品名:"雪天鱼饵" 制造描述:"雪天适合用它钓鱼。"
		OCEANFISHINGLURE_HERMIT_DROWSY = "钓鱼的新发明",		-- 物品名:"麻醉鱼饵" 制造描述:"把鱼闷住就抓住了一半。"
		OCEANFISHINGLURE_HERMIT_HEAVY = "唔...只有足够重的鱼才能看得上这个鱼饵",		-- 物品名:"重量级鱼饵" 制造描述:"钓一条大鱼！"
		
        OCEANFISH_SMALL_1 = "它还没来得及长大。",		-- 物品名:"小孔雀鱼"
		OCEANFISH_SMALL_2 = "呜呣呣...不要喷我...",		-- 物品名:"针鼻喷墨鱼"
		OCEANFISH_SMALL_3 = "要不...放回海里..?",		-- 物品名:"小饵鱼"
		OCEANFISH_SMALL_4 = "努力换来的回报。",		-- 物品名:"三文鱼苗"
		OCEANFISH_SMALL_5 = "看起来很古怪……很脆？",		-- 物品名:"爆米花鱼"
		OCEANFISH_SMALL_6 = "比目鱼,但是它身上有落叶的沙沙声",		-- 物品名:"落叶比目鱼"
		OCEANFISH_SMALL_7 = "这种鱼的头上有一朵小花",		-- 物品名:"花朵金枪鱼"
		OCEANFISH_SMALL_8 = "很烫很烫的鱼",		-- 物品名:"炽热太阳鱼"
        OCEANFISH_SMALL_9 = "它的肚子里似乎有吐不完的水",		-- 物品名:"口水鱼"

		OCEANFISH_MEDIUM_1 = "它应该很喜欢在海底的泥沙里睡觉",		-- 物品名:"泥鱼"
		OCEANFISH_MEDIUM_2 = "钓一条晚饭上来。",		-- 物品名:"斑鱼"
		OCEANFISH_MEDIUM_3 = "能钓起它, 我应该是很棒的对吧?",		-- 物品名:"浮夸狮子鱼"
		OCEANFISH_MEDIUM_4 = "唔...该说是幸运呢...还是不幸呢..?",		-- 物品名:"黑鲶鱼"
		OCEANFISH_MEDIUM_5 = "是玉米还是鱼?真是奇怪...",		-- 物品名:"玉米鳕鱼"
		OCEANFISH_MEDIUM_6 = "象征着吉祥的锦鲤,很漂亮",		-- 物品名:"花锦鲤"
		OCEANFISH_MEDIUM_7 = "象征着吉祥的锦鲤,很漂亮",		-- 物品名:"金锦鲤"
		OCEANFISH_MEDIUM_8 = "它们只在冬天出没。",		-- 物品名:"冰鲷鱼"
        OCEANFISH_MEDIUM_9 = "它身上有甜甜的气息。",		-- 物品名:"甜味鱼"

		PONDFISH = "在池塘就能钓上的鱼",		-- 物品名:"淡水鱼"
		PONDEEL = "一条鳗鱼。",		-- 物品名:"活鳗鱼"
        FISHMEAT = "生鱼肉,做成什么料理比较好呢",		-- 物品名:"生鱼肉"
        FISHMEAT_COOKED = "烤熟后风味很浓",		-- 物品名:"鱼排"
        FISHMEAT_SMALL = "一小块鱼肉, 可以搭配其他料理享用",		-- 物品名:"小鱼块"
        --此处缺失"鱼肉干("fishmeat_dried")"和"小鱼干("fishmeat_small_dried")"的检查语音,但在speech_wilson.lua中没有找到,仅在wiki和游戏中有出现物品
        FISHMEAT_SMALL_COOKED = "烤熟了也很好吃",		-- 物品名:"烤小鱼块"
		SPOILED_FISH = "变质的鱼, 已经不能再吃了",		-- 物品名:"变质的鱼"
		FISH_BOX = "让鱼更好的保持新鲜",		-- 物品名:"锡鱼罐" 制造描述:"保持鱼与网捕之日一样新鲜。"
        POCKET_SCALE = "称一称鱼的重量",		-- 物品名:"弹簧秤" 制造描述:"随时称鱼的重量！"
		TACKLECONTAINER = "把钓鱼的工具都收到一起吧",		-- 物品名:"钓具箱" 制造描述:"整齐收纳你的钓具。"
		SUPERTACKLECONTAINER = "把钓鱼的工具都收到一起吧",		-- 物品名:"超级钓具箱" 制造描述:"更多收纳钓具的空间？我上钩了！"
		TROPHYSCALE_FISH =		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获。"
		{
			GENERIC = "这是做什么用的...我好像懂了...",		-- 常态默认
			HAS_ITEM = "重量: {weight}\n捕获人: {owner}",		-- 存放着不是自己钓的鱼,且重量在此类鱼重量范围的后80%
			HAS_ITEM_HEAVY = "重量: {weight}\n捕获人: {owner}\n丰盛的收获,好厉害!",		-- 存放着不是自己钓的鱼,且重量在此类鱼重量范围的前20% 
			BURNING = "糟糕, 需要赶快灭火",		-- 正在燃烧
			BURNT = "不知道其中的鱼怎么样了?\n似乎有烤鱼的香味~",		-- 烧焦的
			OWNER = "重量: {weight}\n捕获人: {owner}\n啊, 我竟然做到了...",		-- 存放着自己钓的鱼,且重量在此类鱼重量范围的后80%
			OWNER_HEAVY = "重量: {weight}\n捕获人: {owner}\n小鱼,你想家人吗?",		-- 存放着自己钓的鱼,且重量在此类鱼重量范围的前20% 
		},
		OCEANFISHABLEFLOTSAM = "一堆烂泥和杂草。",		-- 物品名:"海洋残骸"(离开了水下)

		CALIFORNIAROLL = "简单制作的寿司",		-- 物品名:"加州卷"
		SEAFOODGUMBO = "一碗营养的海鲜汤",		-- 物品名:"海鲜浓汤"
		SURFNTURF = "好丰盛的一餐",		-- 物品名:"海鲜牛排"
        WOBSTER_SHELLER = "想吃龙虾~", 		-- 物品名:"龙虾"
        WOBSTER_DEN = "里面应该有很多龙虾吧?",		-- 物品名:"龙虾窝"
        WOBSTER_SHELLER_DEAD = "要趁着新鲜做成料理",		-- 物品名:"死龙虾"
        WOBSTER_SHELLER_DEAD_COOKED = "一顿美餐！",		-- 物品名:"美味的龙虾"
        LOBSTERBISQUE = "我想要一个匙子。",		-- 物品名:"龙虾汤"
        LOBSTERDINNER = "嗯, 好吃！",		-- 物品名:"龙虾正餐"
        WOBSTER_MOONGLASS = "和我见过的龙虾有些不一样.",		-- 物品名:"月光龙虾"
        MOONGLASS_WOBSTER_DEN = "里面藏着什么?",		-- 物品名:"月光玻璃窝"

		TRIDENT = "有一段传说里存在类似的三叉戟",		-- 物品名:"刺耳三叉戟" 制造描述:"在汹涌波涛中引领潮流吧！"
		WINCH =		-- 物品名:"夹夹绞盘" 制造描述:"让它帮你捞起重的东西吧。"
		{
			GENERIC = "它可以帮我打捞海下的东西",		-- 常态默认(放置)
			RETRIEVING_ITEM = "抓到了什么?",		-- 正在打捞
			HOLDING_ITEM = "这就是在海底下的东西么..?",		-- 打捞成功尚未取下时
		},
        HERMITHOUSE = 		-- 物品名:"隐士之家"
		{
            GENERIC = "不可以让老奶奶住这么差的房子。",		-- 第一阶段
            BUILTUP = "比原来好多啦~",		-- 其他阶段
        }, 
        SHELL_CLUSTER = "贝壳和泥沙混在一起了",		--贝壳堆
		SINGINGSHELL_OCTAVE3 =		-- 低音贝壳钟
		{
			GENERIC = "会唱歌的贝壳",		--常态默认
		},
		SINGINGSHELL_OCTAVE4 =		-- 中音贝壳钟
		{
			GENERIC = "会唱歌的贝壳",		--常态默认
		},
		SINGINGSHELL_OCTAVE5 =		-- 高音贝壳钟
		{
			GENERIC = "会唱歌的贝壳",		--常态默认
        },
        CHUM = "给鱼儿们的饵料",		--鱼食
        SUNKENCHEST =		--沉底宝箱
        {
            GENERIC = "找到了一个宝箱",		--常态默认
            LOCKED = "我们需要一把钥匙。",		--锁上了
        },
        
        HERMIT_BUNDLE = "这是, 努力的回报。",		--一包谢意
        HERMIT_BUNDLE_SHELLS = "里面装着叮铃当啷的贝壳。",		--贝壳钟包

        RESKIN_TOOL = "给家具做个清洁",		--清洁扫把
        MOON_FISSURE_PLUGGED = "老奶奶很聪明,她把裂缝堵上了",		--堵住的裂缝


		----------------------- ROT STRINGS GO ABOVE HERE ------------------

		-- Walter
        WOBYBIG = 		--大沃比
        {
            "又大又毛茸茸的,最适合抱了",
            "它的皮毛……很柔软。",
        },
        WOBYSMALL = 		--小沃比
        {
            "它真可爱!",
            "很乖的小狗狗",
        },
		WALTERHAT = "出门的时候可以戴, 不过我有自己的帽子",		--松树先锋队帽子
		SLINGSHOT = "一柄弹弓",		--可靠的弹弓
		SLINGSHOTAMMO_ROCK = "小石子",				--鹅卵石
		SLINGSHOTAMMO_MARBLE = "大理石做成的",				--大理石弹
		SLINGSHOTAMMO_THULECITE = "带有魔法的弹药",			--诅咒弹药
        SLINGSHOTAMMO_GOLD = "金色的珠子",		--黄金弹药
        SLINGSHOTAMMO_HONEY = "黏糊糊的...",		--黏黏弹
        SLINGSHOTAMMO_SLOW = "被打中就跑不快了,而且很痛!",		--减速弹药
        SLINGSHOTAMMO_FREEZE = "可以把敌人冻住",		--冰冻弹药
		SLINGSHOTAMMO_POOP = "它应该有它的用处吧。",		--便便弹
		SLINGSHOTAMMO_STINGER = "和蜜蜂的尾针一样锋利",		--针刺弹
		SLINGSHOTAMMO_MOONGLASS = "给弹弓用的弹药,我能感受到有月亮的能量",		--月亮弹
		SLINGSHOTAMMO_GELBLOB = "把敌人作为弹药发出去..?",		--恶液弹
		SLINGSHOTAMMO_SCRAPFEATHER = "有电魔法在上面",		--电击废料弹
        SLINGSHOTAMMO_DREADSTONE = "被打到会很疼的!",		--绝望小石
        SLINGSHOTAMMO_GUNPOWDER = "会爆炸吗?会的吧...",		--轰轰弹
        SLINGSHOTAMMO_LUNARPLANTHUSK = "被打到会很疼的!",		--亮茄外壳弹药
        SLINGSHOTAMMO_PUREBRILLIANCE = "被打到会很疼的!",		--纯粹辉煌弹药
        SLINGSHOTAMMO_HORRORFUEL = "被打到会很疼的!",		--纯粹恐惧弹药
        PORTABLETENT = "有露营的氛围了~",		--宿营帐篷
        PORTABLETENT_ITEM = "是收拾好的帐篷",		--宿营帐篷(物品栏)

        -- Wigfrid
        BATTLESONG_DURABILITY = "听到这首音乐,武器好像更顺手了",		--武器化的颤音
        BATTLESONG_HEALTHGAIN = "这首曲子...嗯,四糸乃会加油的!",		--心碎歌谣
        BATTLESONG_SANITYGAIN = "这首曲子...嗯,四糸乃会加油的!",		--醍醐灌顶华彩
        BATTLESONG_SANITYAURA = "这首曲子...嗯,四糸乃会加油的!",		--英勇美声颂
        BATTLESONG_FIRERESISTANCE = "嗯...现在四糸乃就不怕火了~",		--防火假声
        BATTLESONG_INSTANT_TAUNT = "这首曲子似乎让怪物们很生气",		--粗鲁插曲
        BATTLESONG_INSTANT_PANIC = "这首曲子会吓跑怪物",		--惊心独白

        -- Webber
        MUTATOR_WARRIOR = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--战士变身涂鸦
        MUTATOR_DROPPER = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--悬蛛变身涂鸦
        MUTATOR_HIDER = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--洞穴变身涂鸦
        MUTATOR_SPITTER = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--喷吐变身涂鸦
        MUTATOR_MOON = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--破碎变身涂鸦
        MUTATOR_HEALER = "这个不能吃的...嗯...也许可以给蜘蛛吃...",		--护士变身涂鸦
        SPIDER_WHISTLE = "四糸乃不喜欢被蜘蛛跟着",		--韦伯口哨
        SPIDERDEN_BEDAZZLER = "给蜘蛛们的家装扮一下,虽然我不是很想靠近",		--蛛巢装饰套装
        SPIDER_HEALER = "那只蜘蛛在为同伴疗伤..?",		--护士蜘蛛
        SPIDER_REPELLENT = "可以把跟随的蜘蛛们赶回家,但四糸乃不会用这个",		--驱赶盒子
        SPIDER_HEALER_ITEM = "给蜘蛛疗伤的...",		--治疗黏团

        -- Wendy
		GHOSTFLOWER = "真是一朵奇怪的花",		--哀悼荣耀
		GHOSTLYELIXIR_SLOWREGEN = "它并不是给我喝的,精灵不喝这个",		--亡者补药
		GHOSTLYELIXIR_FASTREGEN = "它并不是给我喝的,精灵不喝这个",		--灵魂万灵药
		GHOSTLYELIXIR_SHIELD = "它并不是给我喝的,精灵不喝这个",		--不屈药剂
		GHOSTLYELIXIR_ATTACK = "它并不是给我喝的,精灵不喝这个",		--夜影万金油
		GHOSTLYELIXIR_SPEED = "它并不是给我喝的,精灵不喝这个",		--强健精油
		GHOSTLYELIXIR_RETALIATION = "它并不是给我喝的,精灵不喝这个",		--蒸馏复仇
        GHOSTLYELIXIR_REVIVE = "它并不是给我喝的,精灵不喝这个",		--恐怖经历
		SISTURN =		--姐妹骨灰罐
		{
			GENERIC = "我也帮忙收集一些花吧",		--常态默认(空)
			SOME_FLOWERS = "还需要更多的花瓣",		--内有1·3片花瓣
			LOTS_OF_FLOWERS = "看起来成功了",		--激活
            LOTS_OF_FLOWERS_EVIL = "我感觉不太好...",		--(暂无注释)
            LOTS_OF_FLOWERS_BLOSSOM = "那是...什么声音..?",  		--(暂无注释)
		},
        SMALLGHOST = "幽、幽灵...啊-!!",		--小惊吓

        --warly
        PORTABLECOOKPOT_ITEM =		--便携烹饪锅
        {
            GENERIC = "随时随地都可以制作料理。",		--常态默认(物品栏)
            DONE = "料理完成啦~",		--有烹饪好的料理
			COOKING_LONG = "料理还需要一点时间",		--烹饪倒计时大于15秒
			COOKING_SHORT = "请放心, 料理很快就好",		--烹饪倒计时小于等于15秒
			EMPTY = "我需要准备一些食材",		--不在烹饪且没有烹饪好的料理
        },
        PORTABLEBLENDER_ITEM = "可以把一些食材研磨成粉",		--便携研磨器(物品栏)
        PORTABLESPICER_ITEM =		--便携香料站
        {
            GENERIC = "可以制作一些香料,让料理更香",		--常态默认
            DONE = "完成啦~",		--有调味好的料理
        },
        SPICEPACK = "把食物装在里面可以保存得更久",		--厨师袋
        SPICE_GARLIC = "大蒜粉末",		--蒜粉
        SPICE_SUGAR = "甜甜的~",		--蜂蜜水晶
        SPICE_CHILI = "闻起来就很辣",		--辣椒面
        SPICE_SALT = "做料理不能缺少盐",		--调味盐
        MONSTERTARTARE = "我还有其他可以吃的吗?",		--怪物鞑靼(大厨特色菜)
        FRESHFRUITCREPES = "是可丽饼!有点怀念了...",		--鲜果可丽饼(大厨特色菜)
        FROGFISHBOWL = "我一定要吃这个吗?",		--蓝带鱼排(大厨特色菜)
        POTATOTORNADO = "土豆...串?",		--花式回旋块茎
        DRAGONCHILISALAD = "好精致~但也好辣...呜~",		--辣龙椒沙拉(大厨特色菜)
        GLOWBERRYMOUSSE = "这是...特别的慕斯雪糕!好吃!",		--发光浆果慕斯(大厨特色菜)
        VOLTGOATJELLY = "看起来能吃",		--伏特羊肉冻(大厨特色菜)
        NIGHTMAREPIE = "好吓人的料理",		--恐怖国王饼(大厨特色菜)
        BONESOUP = "放入骨头熬制的浓汤,很有营养",		--骨头汤(大厨特色菜)
        MASHEDPOTATOES = "土豆泥和奶油混合在一起...",		--奶油土豆泥
        POTATOSOUFFLE = "松软可口",		--蓬松土豆蛋奶酥(大厨特色菜)
        MOQUECA = "一锅满满的海鲜杂烩",		--海鲜杂烩(大厨特色菜)
        GAZPACHO = "凉凉的芦笋汁,适合夏天喝",		--芦笋冷汤(大厨特色菜)
        ASPARAGUSSOUP = "把芦笋煮成汤,我想喝一点试试",		--芦笋汤
        VEGSTINGER = "浓郁的酒味,我还是不要喝了吧...",		--蔬菜鸡尾酒
        BANANAPOP = "冰冰凉凉的冻香蕉,好吃~",		--香蕉冻
        CEVICHE = "唔...味道...还不错..?",		--酸橘汁腌鱼
        SALSA = "看着就很辣",		--生鲜萨尔萨酱
        PEPPERPOPPER = "看着就很辣",		--爆炒填馅辣椒

        -- Wolfgang
        MIGHTY_GYM =		--强大健身房
        {
            GENERIC = "唔...四糸乃还是比较喜欢看电视",		--常态默认
            BURNT = "烧坏成这样了...大叔是不是不能锻炼了?",		--烧毁
        },

        DUMBBELL = "用来锻炼的哑铃",		--哑铃
        DUMBBELL_GOLDEN = "金灿灿的高级哑铃",		--黄金哑铃
		DUMBBELL_MARBLE = "用大理石制作的更结实的哑铃",		--大理石哑铃
        DUMBBELL_GEM = "...用宝石制作的哑铃?",		--宝石哑铃
        POTATOSACK = "",		--土豆袋

        DUMBBELL_HEAT = "在锻炼的同时也能保持温暖",		--热铃
        DUMBBELL_REDGEM = "可以喷火的哑铃\n四糸奈:画风都变得奇怪了",		--火铃
        DUMBBELL_BLUEGEM = "可以冻住别人的哑铃\n四糸奈:哦呀~和四糸乃一样的力量呢~",		--冰铃

        --woodie
        WEREITEM_BEAVER = "这是什么?",		--俗气海狸像
        WEREITEM_GOOSE = "这是什么?",		--俗气鹅像
        WEREITEM_MOOSE = "这是什么?",		--俗气鹿像

        -- Wanda
        POCKETWATCH_HEAL = 		--不老表
        {
			GENERIC = "一块怀表,四糸乃想知道它有没有特别的作用,比如魔法..?",		--常态默认
			RECHARGING = "这块怀表的时间...是不是不太对..?",		--冷却中
		},

        POCKETWATCH_REVIVE = 		--第二次机会表
        {
			GENERIC = "一块怀表,四糸乃想知道它有没有特别的作用,比如魔法..?",		--常态默认
			RECHARGING = "这块怀表的时间...是不是不太对..?",		--冷却中
		},

        POCKETWATCH_WARP = 		--倒走表
        {
			GENERIC = "一块怀表,四糸乃想知道它有没有特别的作用,比如魔法..?",		--常态默认
			RECHARGING = "这块怀表的时间...是不是不太对..?",		--冷却中
		},

        POCKETWATCH_RECALL = 		--溯源表
        {
			GENERIC = "一块怀表,四糸乃想知道它有没有特别的作用,比如魔法..?",		--常态默认
			RECHARGING = "这块怀表的时间...是不是不太对..?",		--冷却中
			--UNMARKED = "only_used_by_wanda",		--
			--MARKED_SAMESHARD = "only_used_by_wanda",		--
			--MARKED_DIFFERENTSHARD = "only_used_by_wanda",		--
		},

        POCKETWATCH_PORTAL = 		--裂缝表
        {
			GENERIC = "一块怀表,四糸乃想知道它有没有特别的作用,比如魔法..?",		--常态默认
			RECHARGING = "这块怀表的时间...是不是不太对..?",		--冷却中
			--UNMARKED = "only_used_by_wanda unmarked",		--
			--MARKED_SAMESHARD = "only_used_by_wanda same shard",		--
			--MARKED_DIFFERENTSHARD = "only_used_by_wanda other shard",		--
		},

        POCKETWATCH_WEAPON = 		--警钟
        {
			GENERIC = "那个...看起来就会很痛。",		--常态默认
			--DEPLETED = "only_used_by_wanda",		--
		},

        POCKETWATCH_PARTS = "只是一些钟表零件",		--时间碎片
        POCKETWATCH_DISMANTLER = "一套维修工具",		--钟表匠工具

        POCKETWATCH_PORTAL_ENTRANCE =		--时间裂缝(入口)
		{
			GENERIC = "我真的必须...进去吗?",		--常态默认
			DIFFERENTSHARD = "看起来有点吓人...",		--裂缝开启中
		},
        POCKETWATCH_PORTAL_EXIT = "唔呣...摔了个屁股敦...",		--时间裂缝(出口)

        -- Waxwell
		MAGICIAN_CHEST = "这个箱子...它传来了魔法的气息",		-- 魔术师箱子
		TOPHAT_MAGICIAN = "一顶魔术师的帽子",		-- 魔术师高礼帽

        --wurt
        MERMHAT = "戴上这个假装是鱼人族",		--聪明的伪装
        MERMTHRONE =		--皇家地毯
        {
            GENERIC = "鱼人王的宝座",		--常态默认
            BURNT = "它烧坏了...",		--烧毁
        },        
        MERMTHRONE_CONSTRUCTION =		--皇家手工套装
        {
            GENERIC = "我能帮上忙吗?",		--常态默认
            BURNT = "烧坏了...",		--烧毁
        },        
        MERMHOUSE_CRAFTED = 		--鱼人工艺屋
        {
            GENERIC = "鱼人的房子",		--常态默认
            BURNT = "烧坏了...",		--烧毁
        },
        MERMWATCHTOWER_REGULAR = "有位威严的国王在里面",		--鱼人堡垒(有国王时)
        MERMWATCHTOWER_NOKING = "堡垒没有了国王,什么都没守护...",		--鱼人堡垒(鱼人王不在)
        MERMKING = "鱼人们的国王",		--鱼人之王
        MERMGUARD = "它非常尊敬它的国王并时刻护卫",		--忠诚鱼人守卫
        MERM_PRINCE = "它在努力当好国王",		--皇室练习生

        SQUID = "鱿鱼的眼睛亮亮的,晚上有它在很安心",		--鱿鱼

        -- WX78
        WX78MODULE_MAXHEALTH = "这是...\n四糸奈: 看起来是块电子零件呢~",		--强化电路
        WX78MODULE_MAXHEALTH2 = "这是...\n四糸奈: 看起来是块电子零件呢~",		--超级强化电路
        WX78MODULE_MAXSANITY = "这是...\n四糸奈: 看起来是块电子零件呢~",		--超级处理器电路
        WX78MODULE_MAXSANITY1 = "这是...\n四糸奈: 看起来是块电子零件呢~",		--处理器电路
        WX78MODULE_MOVESPEED = "这是...\n四糸奈: 看起来是块电子零件呢~",		--加速电路                                                           
        WX78MODULE_MOVESPEED2 = "这是...\n四糸奈: 看起来是块电子零件呢~",		--超级加速电路
        WX78MODULE_HEAT = "这是...\n四糸奈: 看起来是块电子零件呢~",		--热能电路
        WX78MODULE_NIGHTVISION = "这是...\n四糸奈: 看起来是块电子零件呢~",		--光电电路
        WX78MODULE_COLD = "这是...\n四糸奈: 看起来是块电子零件呢~",		--制冷电路
        WX78MODULE_TASER = "这是...\n四糸奈: 看起来是块电子零件呢~",		--电气化电路
        WX78MODULE_LIGHT = "这是...\n四糸奈: 看起来是块电子零件呢~",		--照明电路
        WX78MODULE_MAXHUNGER = "这是...\n四糸奈: 看起来是块电子零件呢~",		--超级胃增益电路
        WX78MODULE_MAXHUNGER1 = "这是...\n四糸奈: 看起来是块电子零件呢~",		--胃增益电路
        WX78MODULE_MUSIC = "这是...\n四糸奈: 看起来是块电子零件呢~",		--合唱盒电路
        WX78MODULE_BEE = "这是...\n四糸奈: 看起来是块电子零件呢~",		--豆增压电路

        WX78_SCANNER =		--生物扫描分析仪
        {
            GENERIC = "那个是什么..?\n四糸奈: 不知道, 只是一个铁皮玩具吧",		--常态默认
            HUNTING = "它好像在找什么",		--寻找可扫描物品
            SCANNING = "它似乎发现了什么",		--扫描中
        },

        WX78_SCANNER_ITEM = "我不懂怎么使用它",		--生物扫描分析仪(物品栏)
        WX78_SCANNER_SUCCEEDED = "它在发光, 或许是等待它的主人收回它。",		--生物扫描分析仪(扫描成功)

        WX78_MODULEREMOVER = "这似乎致死一个...钳子?",		--电路提取器

        SCANDATA = "唔...好复杂的数据报告...",		--生物数据

        --hermit
        CRABKING = 		--帝王蟹
        {
            GENERIC = "他看起来不太开心...",		--常态默认
            INERT = "它想要一些宝石打扮自己",		--沉睡
        },
		CRABKING_CLAW = "好大的钳子!",		--巨钳
		MESSAGEBOTTLE = "一个漂流瓶,里面还有一封信",		--瓶中信
		MESSAGEBOTTLEEMPTY = "一个空瓶子,可以用来装东西",		--空瓶子
        MEATRACK_HERMIT =		--晾肉架(寄居蟹奶奶的晾肉架)
        {
            DONE = "老奶奶--! 肉晾好了。",		-- 完成了
            DRYING = "它在干燥的风中晃来晃去。",		--正在风干
            DRYINGINRAIN = "雨水让它没那么容易晾干。",		-- 雨天风干
            GENERIC = "我可以帮老奶奶把肉挂在这里。",		-- 常态默认
            BURNT = "被烧坏的架子不能晾晒了",		-- 烧焦的
            DONE_NOTMEAT = "老奶奶--! 东西晾好啦。",		-- 非肉类晾晒完成(比如海带)
            DRYING_NOTMEAT = "它在干燥的风中晃来晃去。",		-- 非肉类晾晒中(比如海带)
            DRYINGINRAIN_NOTMEAT = "雨水让它没那么容易晾干。",		-- 非肉类雨天晾晒(比如海带)
        },
        BEEBOX_HERMIT =		--蜂箱(寄居蟹奶奶的蜂箱)
        {
            READY = "蜂蜜存满了",		-- 准备好采收的，满的
			FULLHONEY = "蜂蜜存满了",		-- 蜂蜜满了
			GENERIC = "小蜜蜂们的新家",		-- 常态默认
			NOHONEY = "小蜜蜂们累了",		-- 没有蜂蜜
			SOMEHONEY = "再等一段时间吧...",		-- 有一些蜂蜜
			BURNT = "蜂箱被烧没了...",		-- 烧焦的
        },
        HERMITCRAB = "这里只有她一个人吗...",		--寄居蟹隐士
        HERMIT_PEARL = "珍珠奶奶托付给我的信物, 我会努力找到的!",		--珍珠的珍珠
        HERMIT_CRACKED_PEARL = "不...是我把它弄坏了...对不起!",		--开裂的珍珠


        WATERPLANT = "只要我们不拿它们的藤壶，它们就会跟我们做朋友。",		--海草
        WATERPLANT_BOMB = "要小心",		--种壳
        WATERPLANT_BABY = "如果能一直保持这个大小就好了...",		--海芽
        WATERPLANT_PLANTER = "可以种出藤壶",		--海芽插穗
        SHARK = "那个标记...是鲨鱼?!",		--岩石大白鲨
        MASTUPGRADE_LAMP_ITEM = "夜间航行的必需品",		--甲板照明灯(物品栏)
        MASTUPGRADE_LIGHTNINGROD_ITEM = "防雷很重要的.",		--避雷导线(物品栏)
        WATERPUMP = "给船灭火",		--消防泵
        BARNACLE = "想吃到这些有些困难",		--藤壶
        BARNACLE_COOKED = "味道...嗯...很好吃~",		--熟藤壶
        BARNACLEPITA = "...有点硬",		--藤壶皮塔饼
        BARNACLESUSHI = "这也是一种寿司..?",		--藤壶握寿司
        BARNACLINGUINE = "一碗香喷喷的面~",		--藤壶中细面
        BARNACLESTUFFEDFISHHEAD = "太饿了,还是吃掉吧...",		--酿鱼头
        LEAFLOAF = "绿绿的糕点...要试一下吗?",		--叶肉糕
        LEAFYMEATBURGER = "里面没有肉的...不会吃胖",		--素食堡
        LEAFYMEATSOUFFLE = "像果冻一样弹弹的,但是闻起来味道不太好...",		--果冻沙拉
        MEATYSALAD = "唔...肉味道的蔬菜..?",		--牛肉绿叶菜
        
        -- GROTTO

		MOLEBAT = "是什么环境让它变成这样的?",		--裸鼹蝠
        MOLEBATHILL = "噫...好脏的地方...",		--裸鼹蝠丘

        BATNOSE = "不是很想拿着这个...",		--裸露鼻孔
        BATNOSE_COOKED = "烤熟了更不想拿了...",		--炭烤鼻孔
        BATNOSEHAT = "唔...戴上去会变得可爱吗?",		--牛奶帽

        MUSHGNOME = "它是从哪里出来的..?",		--蘑菇地精

        MOON_CAP = "这种蘑菇为什么叫月亮..?",		--月亮蘑菇
        MOON_CAP_COOKED = "可以吃吗..?听说有些蘑菇会中毒...",		--熟月亮蘑菇

        LIGHTFLIER = "请帮助我...照亮一下...拜托了...",		--球状光虫

        GROTTO_POOL_BIG = "大自然真神奇啊...",		--玻璃绿洲
        GROTTO_POOL_SMALL = "大自然真神奇啊...",		--小玻璃绿洲

        DUSTMOTH = "爱干净的小家伙",		--尘蛾

        DUSTMOTHDEN = "它们的家很干净",		--整洁洞穴

        ARCHIVE_LOCKBOX = "唔...我该怎么打开它?",		--蒸馏的知识
        ARCHIVE_CENTIPEDE = "我们可能闯到别人家了。",		--远古哨兵蜈蚣
        ARCHIVE_CENTIPEDE_HUSK = "它应该不会突然动起来吧...",		--哨兵蜈蚣壳

        ARCHIVE_COOKPOT =		--远古窑
        {
			COOKING_LONG = "刚放进去呢...",		--烹饪倒计时大于15秒
			COOKING_SHORT = "再等一小会就好啦~",		--烹饪倒计时小于等于15秒
			DONE = "食物出炉了。",		--烹饪结束,或已有烹饪好的料理
			EMPTY = "该做饭了",		--空的
			BURNT = "锅被烧坏了...",		--烧毁
        },

        ARCHIVE_MOON_STATUE = "古代的这些雕像真神奇啊...",		--远古月亮雕像
        ARCHIVE_RUNE_STATUE =		--远古月符石
        {
            LINE_1 = "我看不懂上面的文字",		--第一块
            LINE_2 = "要是有人能告诉我上面写着什么就好了",		--第二块
            LINE_3 = "我看不懂上面的文字",		--第三块
            LINE_4 = "要是有人能告诉我上面写着什么就好了",		--第四块
            LINE_5 = "我看不懂上面的文字",		--第五块
        },
		VAULT_RUNE = "I can't read that.",		--
		VAULT_STATUE =		--圣殿月符石
		{
			LORE1 = "...这上面写了什么?",		--第一块
			LORE2 = "...这上面写了什么?",		--第二块
			LORE3 = "...这上面写了什么?",		--第三块
		},

        ARCHIVE_RESONATOR = 		--星象探测仪
        {
            GENERIC = "它会帮我找到什么呢..?",		--常态默认
            IDLE = "好像真的找到什么了!",		--探测结束
        },

        ARCHIVE_RESONATOR_ITEM = "照着蓝图做出来的,我是不是很厉害,嘿嘿~",		--星象探测仪(物品栏)

        ARCHIVE_LOCKBOX_DISPENCER = 		--知识饮水机
        {
          POWEROFF = "看起来坏掉了...",		--充能前
          GENERIC =  "古代的人们真厉害!",		--充能后
        },

        ARCHIVE_SECURITY_DESK = 		--远古哨所
        {
            POWEROFF = "现在是关闭状态",		--关闭
            GENERIC = "被激活了...会发生什么...",		--激活
        },

        ARCHIVE_SECURITY_PULSE = "跟上它吧",		--安保脉冲

        ARCHIVE_SWITCH = 		--华丽基座
        {
            VALID = "宝石给了它能量",		--有宝石
            GEMS = "它需要宝石才能使用",		--无宝石
        },

        ARCHIVE_PORTAL = 		--封印的传送门
        {
            POWEROFF = "这里也是一扇门..?",		--未激活
            GENERIC = "好像没那么容易",		--已激活
        },

        WALL_STONE_2 = "石头做的,更坚固的墙",		--档案馆石墙
        WALL_RUINS_2 = "以前的工艺很厉害...",		--档案馆铥墙

        REFINED_DUST = "灰尘多到结成块了...",		--尘土块
        DUSTMERINGUE = "那个...其实这不是给我吃的...",		--琥珀美食

        SHROOMCAKE = "蛋糕里放了好多蘑菇!",		--蘑菇蛋糕
        SHROOMBAIT = "这个真的能吃吗..?",		--酿夜帽

        NIGHTMAREGROWTH = "我们应该离它们远一些。",		--梦魇城墙

        TURFCRAFTINGSTATION = "学习改变土地的知识",		--土地夯实器

        MOON_ALTAR_LINK = "里面会有什么?",		--神秘能量

        -- FARMING
        COMPOSTINGBIN =		--堆肥桶
        {
            GENERIC = "等...发酵成肥料就好",		--常态默认
            WET = "有点太湿了",		--潮湿度高
            DRY = "有点太干了",		--干燥度高
            BALANCED = "完成啦~",		--完成
            BURNT = "糟糕了...",		--烧毁
        },
        COMPOST = "发酵完成的肥料",		--堆肥
        SOIL_AMENDER =		--催长剂起子
		{
			GENERIC = "等里面的东西发酵一段时间吧",		--常态默认
			STALE = "已经开始发酵了,耐心等待吧~",		--正在发酵的催长剂
			SPOILED = "可能...快好了吧...",		--已发酵的催长剂
		},
		SOIL_AMENDER_FERMENTED = "成功了!",		--超级催长剂

        WATERINGCAN =		--浇水壶
        {
            GENERIC = "我可以用这个给植物浇水。",		--常态默认
            EMPTY = "不知道附近有没有池塘",		--空的
        },
        PREMIUMWATERINGCAN =		--鸟嘴壶
        {
            GENERIC = "我可以用这个给植物浇水。",		--常态默认
            EMPTY = "需要先装点水进去",		--空的
        },

		FARM_PLOW = "我不太会种菜,但我会努力的",		--耕地机
		FARM_PLOW_ITEM = "开始在这片大陆上种菜吧",		--耕地机(物品栏)
		FARM_HOE = "用小锄头松松土,种子才能长大",		--园艺锄
		GOLDEN_FARM_HOE = "用更好的锄头松松土,种子才能长大",		--黄金园艺锄
		NUTRIENTSGOGGLESHAT = "好高级的设备,这样种植也不会太难了",		--高级耕作先驱帽
		PLANTREGISTRYHAT = "它正在教我更多关于植物的知识!",		--耕作先驱帽

        FARM_SOIL_DEBRIS = "把农田清理一下,省出更多位置来吧~!",		--农田杂物

		FIRENETTLES = "采摘时要小心,火荨麻是不能吃的",		--火荨麻叶
		FORGETMELOTS = "花的名字是必忘我,其实它并不想我们忘记它。",		--必忘我
		SWEETTEA = "喝一杯温绵的茶, 舒缓心情",		--舒缓茶
		TILLWEED = "小心,不能靠近这种草",		--犁地草
		TILLWEEDSALVE = "嗯...作为伤药使用效果很好。",		--犁地草膏
        WEED_IVY = "那是...小心不要被它抓到!",		--刺针旋花
        IVY_SNARE = "这些根须...困住了...",		--缠绕根须

		TROPHYSCALE_OVERSIZEDVEGGIES =		--农产品秤
		{
			GENERIC = "让农作物称一称。",		--常态默认
			HAS_ITEM = "重量: {weight}\n收获日: {day}\n嗯,开心~",		--存在巨大作物并且重量在其重量范围的后 80%
			HAS_ITEM_HEAVY = "重量: {weight}\n收获日: {day}\n不知道有没有更大的",		--存在巨大作物并且重量在其重量范围的前 20%
            HAS_ITEM_LIGHT = "机器是不是坏了?",		--放普通作物
			BURNING = "糟糕...要赶紧灭火",		--正在燃烧
			BURNT = "烧坏了...",		--烧毁
        },

        CARROT_OVERSIZED = "这么大的胡萝卜,好神奇~!",		--巨型胡萝卜
        CORN_OVERSIZED = "这么大的玉米,好神奇~!",		--巨型玉米
        PUMPKIN_OVERSIZED = "这么大的南瓜,好神奇~!",		--巨型南瓜
        EGGPLANT_OVERSIZED = "这么大的茄子,好神奇~!",		--巨型茄子
        DURIAN_OVERSIZED = "这么大的榴莲,好神奇~!",		--巨型榴莲
        POMEGRANATE_OVERSIZED = "这么大的石榴,好神奇~!",		--巨型石榴
        DRAGONFRUIT_OVERSIZED = "这么大的火龙果,好神奇~!",		--巨型火龙果
        WATERMELON_OVERSIZED = "这么大的西瓜,好神奇~!",		--巨型西瓜
        TOMATO_OVERSIZED = "这么大的番茄,好神奇~!",		--巨型番茄
        POTATO_OVERSIZED = "这么大的土豆,好神奇~!",		--巨型土豆
        ASPARAGUS_OVERSIZED = "这么大的芦笋,好神奇~!",		--巨型芦笋
        ONION_OVERSIZED = "这么大的洋葱,好神奇~!",		--巨型洋葱
        GARLIC_OVERSIZED = "这么大的大蒜,好神奇~!",		--巨型大蒜
        PEPPER_OVERSIZED = "这么大的辣椒,好神奇~!",		--巨型辣椒

        VEGGIE_OVERSIZED_ROTTEN = "那么大的蔬菜就这样坏了...好可惜...",		--巨型腐烂蔬菜

		FARM_PLANT =		--作物植株
		{
			GENERIC = "一株植物",		--常态默认
			SEED = "种子在努力长大~",		--种子
			GROWING = "它还在努力长大",		--萌芽阶段、小阶段、中阶段
			FULL = "成熟的果实,可以收获了",		--已长成阶段
			ROTTEN = "如果我经常来田地就不会忘记了...",		--腐烂阶段
			FULL_OVERSIZED = "好大的蔬菜,好神奇~!",		--巨大阶段
			ROTTEN_OVERSIZED = "那么大的蔬菜就这样坏了...好可惜...",		--腐烂巨大阶段
			FULL_WEED = "这应该不是蔬菜也不是水果",		--杂草已长成
			BURNING = "糟糕了...",		--正在燃烧
		},

        FRUITFLY = "不...不要破坏我的田地...",		--果蝇
        LORDFRUITFLY = "请...请不要破坏我的田地...",		--果蝇王
        FRIENDLYFRUITFLY = "谢谢你帮忙照顾田地",		--友好果蝇
        FRUITFLYFRUIT = "果蝇似乎喜欢绕着它飞。",		--友好果蝇果

        SEEDPOUCH = "把种子收到一起,这样就不会乱了",		--种子袋

		-- Crow Carnival(鸦年华)(有空再写)
		--[[CARNIVAL_HOST = "What an odd fellow.",		--良羽鸦
		CARNIVAL_CROWKID = "Good day to you, small bird person.",		--
		CARNIVAL_GAMETOKEN = "One shiny token.",		--
		CARNIVAL_PRIZETICKET =		--
		{
			GENERIC = "That's the ticket!",		--
			GENERIC_SMALLSTACK = "That's the tickets!",		--
			GENERIC_LARGESTACK = "That's a lot of tickets!",		--
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "It's a little trapdoor.",		--
		CARNIVALGAME_FEEDCHICKS_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "This looks like fun!",		--
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_FEEDCHICKS_FOOD = "I don't need to chew them up first, do I?",		--

		CARNIVALGAME_MEMORY_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_MEMORY_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "Not to brag, but I've been called a bit of an egghead in the past.",		--
		},
		CARNIVALGAME_MEMORY_CARD =		--
		{
			GENERIC = "It's a little trapdoor.",		--
			PLAYING = "Is this the right one?",		--
		},

		CARNIVALGAME_HERDING_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_HERDING_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "Those eggs are looking a little runny.",		--
		},
		CARNIVALGAME_HERDING_CHICK = "Come back here!",		--

		CARNIVALGAME_SHOOTING_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_SHOOTING_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "I could calculate the trajectory, but it involves a lot of complicated numbers and squiggles.",		--
		},
		CARNIVALGAME_SHOOTING_TARGET =		--
		{
			GENERIC = "It's a little trapdoor.",		--
			PLAYING = "That target's really starting to bug me.",		--
		},

		CARNIVALGAME_SHOOTING_BUTTON =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "Science compels me to press that big shiny button!",		--
		},

		CARNIVALGAME_WHEELSPIN_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_WHEELSPIN_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "It turns out that spinning your wheels is actually very productive.",		--
		},

		CARNIVALGAME_PUCKDROP_KIT = "This really is a pop-up carnival.",		--
		CARNIVALGAME_PUCKDROP_STATION =		--
		{
			GENERIC = "It won't let me play until I give it something shiny.",		--
			PLAYING = "Physics don't always work the same way twice.",		--
		},

		CARNIVAL_PRIZEBOOTH_KIT = "The real prize is the booth we made along the way.",		--
		CARNIVAL_PRIZEBOOTH =		--
		{
			GENERIC = "I've got my eyes on the prize. That one, over there!",		--
		},

		CARNIVALCANNON_KIT = "I've got a lot of experience in making things explode.",		--
		CARNIVALCANNON =
		{
			GENERIC = "This experiment blows up on purpose!",		--
			COOLDOWN = "What a blast!",		--
		},

		CARNIVAL_PLAZA_KIT = "It's a scientifically proven fact that birds love trees.",		--
		CARNIVAL_PLAZA =		--
		{
			GENERIC = "It doesn't really scream \"Cawnival\" yet, does it?",		--
			LEVEL_2 = "A little birdy told me it could use some more decorations around here.",		--
			LEVEL_3 = "This tree is caws for celebration!",		--
		},

		CARNIVALDECOR_EGGRIDE_KIT = "I hope this prize is all it's cracked up to be.",		--
		CARNIVALDECOR_EGGRIDE = "I could watch it for hours.",		--

		CARNIVALDECOR_LAMP_KIT = "Only some light work left to do.",		--
		CARNIVALDECOR_LAMP = "It's powered by whimsy.",		--
		CARNIVALDECOR_PLANT_KIT = "Maybe it's a boxwood?",		--
		CARNIVALDECOR_PLANT = "Either it's small, or I'm gigantic.",		--
		CARNIVALDECOR_BANNER_KIT = "I have to build it myself? I should have known there'd be a catch.",		--
		CARNIVALDECOR_BANNER = "I think all these shiny decorations reflect well on me.",		--

		CARNIVALDECOR_FIGURE =		--
		{
			RARE = "See? Proof that trying the exact same thing over and over will eventually lead to success!",		--
			UNCOMMON = "You don't see this kind of design too often.",		--
			GENERIC = "I seem to be getting a lot of these...",		--
		},
		CARNIVALDECOR_FIGURE_KIT = "The thrill of discovery!",		--
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "The thrill of discovery!",		--

        CARNIVAL_BALL = "It's genius in its simplicity.", --unimplemented		--
		CARNIVAL_SEEDPACKET = "I was feeling a bit peckish.",		--
		CARNIVALFOOD_CORNTEA = "Is this drink supposed to be crunchy?",		--

        CARNIVAL_VEST_A = "I think it makes me look adventurous.",		--
        CARNIVAL_VEST_B = "It's like wearing my own shade tree.",		--
        CARNIVAL_VEST_C = "I hope there's no bugs in it...",--]]		--

        -- YOTB(皮弗娄牛之年)(有空再写)
        --[[YOTB_SEWINGMACHINE = "Sewing can't be that hard... can it?",		--
        YOTB_SEWINGMACHINE_ITEM = "There looks to be a bit of assembly required.",		--
        YOTB_STAGE = "Strange, I never see him enter or leave...",		--
        YOTB_POST =  "This contest is going to go off without a hitch! Well, figuratively speaking.",		--
        YOTB_STAGE_ITEM = "It looks like a bit of building is in order.",		--
        YOTB_POST_ITEM =  "I'd better get that set up.",		--

        YOTB_PATTERN_FRAGMENT_1 = "If I put some of these together, I bet I could make a beefalo costume.",		--
        YOTB_PATTERN_FRAGMENT_2 = "If I put some of these together, I bet I could make a beefalo costume.",		--
        YOTB_PATTERN_FRAGMENT_3 = "If I put some of these together, I bet I could make a beefalo costume.",		--

        YOTB_BEEFALO_DOLL_WAR = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_DOLL = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_NATURE = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_ROBOT = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_ICE = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_FORMAL = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        YOTB_BEEFALO_DOLL_BEAST = {		--
            GENERIC = "Scientifically formulated for maximum huggableness.",		--
            YOTB = "I wonder what the Judge would say about this?",		--
        },
        WAR_BLUEPRINT = "How ferocious!",		--
        DOLL_BLUEPRINT = "My beefalo will look as cute as a button!",		--
        FESTIVE_BLUEPRINT = "This is just the occasion for some festivity!",		--
        ROBOT_BLUEPRINT = "This requires a suspicious amount of welding for a sewing project.",		--
        NATURE_BLUEPRINT = "You really can't go wrong with flowers.",		--
        FORMAL_BLUEPRINT = "This is a costume for some Grade A beefalo.",		--
        VICTORIAN_BLUEPRINT = "I think my grandmother wore something similar.",		--
        ICE_BLUEPRINT = "I usually like my beefalo fresh, not frozen.",		--
        BEAST_BLUEPRINT = "I'm feeling lucky about this one!",		--幸运兽礼服款式

        --]]

        --[[-- YOT Catcoon(也是浣猫之年)(有空再写)
		KITCOONDEN =		--
		{
			GENERIC = "You'd have to be pretty small to fit in there.",		--
            BURNT = "NOOOO!",		--
			PLAYING_HIDEANDSEEK = "Now where could they be...",		--
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "Not much time left! Where are they?!",		--
		},

		KITCOONDEN_KIT = "The whole kit and caboodle.",		--

		TICOON =		--
		{
			GENERIC = "He looks like he knows what he's doing!",		--
			ABANDONED = "I'm sure I can find them on my own.",		--
			SUCCESS = "Hey, he found one!",		--
			LOST_TRACK = "Someone else found them first.",		--
			NEARBY = "Looks like there's something nearby.",		--
			TRACKING = "I should follow his lead.",		--
			TRACKING_NOT_MINE = "He's leading the way for someone else.",		--
			NOTHING_TO_TRACK = "It doesn't look like there's anything left to find.",		--
			TARGET_TOO_FAR_AWAY = "They might be too far away for him to sniff out.",		--
		},

		YOT_CATCOONSHRINE =		--
        {
            GENERIC = "What to make...",		--
            EMPTY = "Maybe it would like a feather to play with...",		--
            BURNT = "Smells like scorched fur.",		--
        },

		KITCOON_FOREST = "Aren't you the cutest little cat thing!",		--
		KITCOON_SAVANNA = "Aren't you the cutest little cat thing!",		--
		KITCOON_MARSH = "I must collect more... for research!",		--
		KITCOON_DECIDUOUS = "Aren't you the cutest little cat thing!",		--
		KITCOON_GRASS = "Aren't you the cutest little cat thing!",		--
		KITCOON_ROCKY = "I must collect more... for research!",		--
		KITCOON_DESERT = "I must collect more... for research!",		--
		KITCOON_MOON = "I must collect more... for research!",		--
		KITCOON_YOT = "I must collect more... for research!",		--
        --]]

        --[[-- Year of the Rabbit(兔人之年)(有空再写)
        YOTR_FIGHTRING_KIT = "It must be built, for science!",		--枕头大战坑套装
        YOTR_FIGHTRING_BELL =		--枕头大战钟
        {
            GENERIC = "It's peaceful, for now.",
            PLAYING = "I think we've all learned a lot here today.",
        },

        YOTR_DECOR_1 = {		--矮兔灯
            GENERAL = "That rabbit can really light up a room.",
            OUT = "That rabbit isn't lighting up anything.",
        },
        YOTR_DECOR_2 = {		--高兔灯
            GENERAL = "That rabbit can really light up a room.",
            OUT = "That rabbit isn't lighting up anything.",
        },

        HAREBALL = "At this point... I've eaten worse things.",		--兔毛球
        YOTR_DECOR_1_ITEM = "I know just the place for it.",		--矮兔灯(物品栏)
        YOTR_DECOR_2_ITEM = "I know just the place for it.",		--高兔灯(物品栏)
        --]]

        --[[-- Year of the Dragon(龙蝇之年)(有空再写)
        YOTD_DRAGONSHRINE =		-- 
        {
            GENERIC = "I'm burning with curiosity to see what's on offer.",		-- 
            EMPTY = "It might like a piece of charcoal.",		-- 
            BURNT = "Things got a little heated.",		-- 
        },

        DRAGONBOAT_KIT = "I'd better stop dragon my feet and build it.",		-- 
        DRAGONBOAT_PACK = "Boat building made easy!",		-- 

        BOATRACE_CHECKPOINT = "There's the checkpoint!",		-- 
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "One more thing to check off my list.",		-- 
        BOATRACE_START = "You have to start somewhere.",		-- 
        BOATRACE_START_THROWABLE_DEPLOYKIT = "Where to start?",		-- 

        BOATRACE_PRIMEMATE = "Someone's shadowing me!",		-- 
        BOATRACE_SPECTATOR_DRAGONLING = "Its support is getting me all fired up!",		-- 

        YOTD_STEERINGWHEEL = "That'll steer me in the right direction. And the left direction.",		-- 
        YOTD_STEERINGWHEEL_ITEM = "That's going to be the steering wheel.",		-- 
        YOTD_OAR = "It's a really handy paddle.",		-- 
        YOTD_ANCHOR = "I wouldn't want my boat to fly away.",		-- 
        YOTD_ANCHOR_ITEM = "Now I can build an anchor.",		-- 
        MAST_YOTD = "That's one scaly sail.",		-- 
        MAST_YOTD_ITEM = "Now I can build a mast.",		-- 
        BOAT_BUMPER_YOTD = "When you mess with a dragon boat, you get the horns!",		-- 
        BOAT_BUMPER_YOTD_KIT = "A soon-to-be boat bumper.",		-- 
        BOATRACE_SEASTACK = "Buoy oh buoy!",		-- 
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "Buoy oh buoy!",		-- 
        BOATRACE_SEASTACK_MONKEY = "Buoy oh buoy!",		-- 
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "Buoy oh buoy!",		-- 
        MASTUPGRADE_LAMP_YOTD = "Aww, just look how its eyes light up when it sees me!",		-- 
        MASTUPGRADE_LAMP_ITEM_YOTD = "I'm full of bright ideas.",		-- 
        WALKINGPLANK_YOTD = "Dressing it up doesn't make me feel better about using it.",		-- 
        CHESSPIECE_YOTD = "Just the sight of it gets my heart racing!",		-- 
        --]]

        BEEF_BELL = "叮铃铃~和牛牛做朋友的铃铛",		--皮弗娄牛铃

        -- Moon Storm
        ALTERGUARDIAN_PHASE1 = 		--天体英雄(一阶段)
        {
            GENERIC = "啊...它生气了...",		--常态默认
            DEAD = "总、总算...解决了...呼...",		--死亡
        },
        ALTERGUARDIAN_PHASE2 = 		--天体英雄(二阶段)
        {
            GENERIC = "它的形态改变了",		--常态默认
            DEAD = "总、总算...解决了...呼...",		--死亡
        },
        ALTERGUARDIAN_PHASE2SPIKE = "我、我会努力不被它的障碍物困住的!",		--月光玻璃尖刺
        ALTERGUARDIAN_PHASE3 = "呜...又动起来啦...",		--天体英雄(三阶段)
        ALTERGUARDIAN_PHASE3TRAP = "我要离远一点",		--启迪陷阱
        ALTERGUARDIAN_PHASE3DEADORB = "这种力量感觉起来...可是...\n四糸奈:小心一些,不要随便靠近。",		--(暂无注释)(已知和天体英雄三阶段有关但不清楚是哪个)
        ALTERGUARDIAN_PHASE3DEAD = "这回...总、总应该算成功了吧...呼~",		--被击败的天体英雄(天体英雄三阶段死亡)

        ALTERGUARDIANHAT = "戴上后我能看到更多东西了!",		--启迪之冠
        ALTERGUARDIANHATSHARD = "具有魔法效果的碎片",		--启迪碎片

        MOONSTORM_GLASS = 		--充能玻璃石
        {
            GENERIC = "我从来没见过雷劈出来的玻璃...", 		--常态默认
            INFUSED = "它在不停地往外散发能量" 		--充能的
        },

        MOONSTORM_STATIC = "看上去好像很危险", 		--能量静电
        MOONSTORM_STATIC_ITEM = "我能看到里面有个小火花~", 		--约束静电
        MOONSTORM_STATIC_ROAMER = "我要怎么做才能抓住它?\n四糸奈:用那个试试~", 		--未约束的静电
        MOONSTORM_SPARK = "这是什么...好像有电", 		--月熠

        BIRD_MUTANT = "它是被什么影响了吗..?", 		--月盲乌鸦
        BIRD_MUTANT_SPITTER = "它是被什么影响了吗..?", 		--奇形鸟

        WAGSTAFF_NPC = "他好像需要帮助..?\n四糸奈:哦呀~好像有人遇到困难了呢~", 		--颗粒状传输(月亮风暴中的瓦斯塔夫)

        WAGSTAFF_NPC_MUTATIONS = "他好像需要帮助..嗯...好像不对...", 		--颗粒状传输(击杀变异Boss后出现的瓦斯塔夫)
        WAGSTAFF_NPC_WAGPUNK = "他想去哪里..?\n四糸奈:跟上去看看吧!", 		--颗粒状传输(指引玩家寻找"被丢弃的垃圾"的瓦斯塔夫)

        ALTERGUARDIAN_CONTAINED = "那个机器...", 		--月亮精华提取器

        WAGSTAFF_TOOL_1 = "这个会是他想找的东西吗?", 		--网状缓冲器
        WAGSTAFF_TOOL_2 = "这个会是他想找的东西吗?", 		--装置除垢器
        WAGSTAFF_TOOL_3 = "这个会是他想找的东西吗?", 		--垫圈开槽器
        WAGSTAFF_TOOL_4 = "这个会是他想找的东西吗?", 		--概念刷洗器
        WAGSTAFF_TOOL_5 = "这个会是他想找的东西吗?", 		--校准观察机

        MOONSTORM_GOGGLESHAT = "这样我就不怕沙子进到眼睛里了!", 		--星象护目镜

        MOON_DEVICE = 		--月亮虹吸器
        {
            GENERIC = "这个应该怎么用?", 		--常态默认(三阶段)
            CONSTRUCTION1 = "还有很多工作没做完,我现在还不能休息...", 		--一阶段
            CONSTRUCTION2 = "嗯...感觉还缺少一部分\n四糸奈:别急~四糸乃,我们慢慢来吧", 		--二阶段
        },

        -- Waterlog
        WATERTREE_PILLAR = "好大一棵树!", 		--大树干
        OCEANTREE = "长在水里的树", 		--疙瘩树
        OCEANTREENUT = "树种子", 		--疙瘩树果
        WATERTREE_ROOT = "要小心, 不要让船撞上", 		--大树根

        OCEANTREE_PILLAR = "树荫底下好乘凉~", 		--高出平均值的树干

        OCEANVINE = "从树上延伸下来的藤条", 		--苔藓藤条
        FIG = "无花果", 		--无花果
        FIG_COOKED = "烤熟的无花果,会是什么味道的呢?", 		--熟无花果

        SPIDER_WATER = "又是蜘蛛...呜....", 		--海黾
        MUTATOR_WATER = "这似乎是蜘蛛的食物...", 		--海黾变身涂鸦
        OCEANVINE_COCOON = "我应该离那里远一点。", 		--海黾巢穴
        OCEANVINE_COCOON_BURNT = "被烧掉了...", 		--海黾巢穴(烧毁)

        GRASSGATOR = "他好像很害羞。", 		--草鳄鱼

        TREEGROWTHSOLUTION = "虽然名字是\"树果酱\",但这是胶水,不是吃的", 		--树果酱

        FIGATONI = "在意面中加入无花果,甜味更丰富了~", 		--无花果意面
        FIGKABAB = "一串烤无花果", 		--无花果烤串
        KOALEFIG_TRUNK = "唔...好可怕的食物...", 		--无花果酿象鼻
        FROGNEWTON = "四糸奈: 这些食材可以组合在一起?!", 		--无花果蛙腿三明治

        -- The Terrorarium
        TERRARIUM =  		--盒中泰拉
        {
            GENERIC = "好神奇的一个小盒子,里面关着一棵树", 		--常态默认
            CRIMSON = "盒子里的小树好像不是很健康...", 		--猩红
            ENABLED = "嗯...好像有什么不得了的事情要发生了...", 		--激活
			WAITING_FOR_DARK = "什么也没发生...要不睡一会儿再看看..?", 		--非黑夜时触摸
			COOLDOWN = "里面的小树不见了...", 		--冷却
			SPAWN_DISABLED = "无论怎么摇晃它也不会再发生什么了...", 		--由自定义世界禁用
        },
        TERRARIUMCHEST =		--显眼箱子
		{
			GENERIC = "这个箱子现在不会发光了",		--常态默认(首次开箱之后)
			BURNT = "它被烧掉了",		--烧毁
			SHIMMER = "有一个特别的箱子...\n四糸奈:我们要不要看看里面有什么?",		--首次开启前
		},
        EYEMASKHAT = "这副面具让我有些害怕...",		--眼面具

        EYEOFTERROR = "呜哇~!\n四糸奈:四糸乃小心！",		--恐怖之眼
        EYEOFTERROR_MINI = "盯着看...是...是不礼貌的的说...",		--可疑窥视者
        EYEOFTERROR_MINI_GROUNDED = "它好像要孵化出什么了...",		--恐怖之蛋

        FROZENBANANADAIQUIRI = "冰冰凉凉的, 好喝!",		--冰香蕉冻唇蜜
        BUNNYSTEW = "兔兔那么可爱,还是做成了汤...",		--炖兔子
        MILKYWHITES = "...呃",		--乳白物

        CRITTER_EYEOFTERROR = "你看到了什么，小家伙？",		--友好窥视者

        SHIELDOFTERROR ="...确实...很恐怖...",		--恐怖盾牌
        TWINOFTERROR1 = "呜哇~!\n四糸奈:四糸乃小心！",		--激光眼
        TWINOFTERROR2 = "呜哇~!\n四糸奈:四糸乃小心！",		--魔焰眼

        -- Cult of the Lamb(咩咩启示录)
		--[[COTL_TRINKET = "What a crowning achievement.",
		TURF_COTL_GOLD = "Don't walk on that, it was expensive!",
		TURF_COTL_BRICK = "Bricks are the building blocks of the floor.",
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "What a soothing light.",
			GENERIC = "It needs some fuel.",
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "What an inspirational figure!",
			GENERIC = "It needs some fuel.",
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "I could stare at it forever... and ever...",
			GENERIC = "It needs some fuel.",
		},--]]

        -- Year of the Catcoon(浣猫之年)(有空再写)
        --[[CATTOY_MOUSE = "Mice with wheels, what will science think up next?",
        KITCOON_NAMETAG = "I should think of some names! Let's see, Wilson Jr., Wilson Jr. 2...",

		KITCOONDECOR1 =
        {
            GENERIC = "It's not a real bird, but the kits don't know that.",
            BURNT = "Combustion!",
        },
		KITCOONDECOR2 =
        {
            GENERIC = "Those kits are so easily distracted. Now what was I doing again?",
            BURNT = "It went up in flames.",
        },

		KITCOONDECOR1_KIT = "It looks like there's some assembly required.",
		KITCOONDECOR2_KIT = "It doesn't look too hard to build.",--]]

        -- Pirates
        BOAT_ROTATOR = "选左边还是选右边",		-- 转向舵
        BOAT_ROTATOR_KIT = "放在船上可以让船转起来~",		-- 转向舵套装
        BOAT_BUMPER_KELP = "在船边放一些海带,保护船",		-- 海带保险杠
        BOAT_BUMPER_KELP_KIT = "可以保护船",		-- 海带保险杠套装
		BOAT_BUMPER_SHELL = "在船周围放一贝壳,保护船",		-- 贝壳保险杠
        BOAT_BUMPER_SHELL_KIT = "可以保护船",		-- 贝壳保险杠套装
        BOAT_BUMPER_CRABKING = "很坚固的防护装置,可以保护船",		-- 帝王蟹保险杠
        BOAT_BUMPER_CRABKING_KIT = "可以保护船",		-- 帝王蟹保险杠套装

        BOAT_CANNON = 		-- 大炮
        {
            GENERIC = "一门大炮\n四糸奈:快快快!我们装点炮弹进去!",		-- 常态默认(未装填)
            AMMOLOADED = "都...放进去了...\n四糸奈:哇嘎嘎!发射发射~",		-- 已装填
            NOAMMO = "炮弹都用完了",		-- 炮弹全部发射完毕
        },
        BOAT_CANNON_KIT = "组装大炮",		-- 大炮套装
        CANNONBALL_ROCK_ITEM = "一些炮弹,需要有大炮才能用",		-- 炮弹(物品栏)

        OCEAN_TRAWLER = 		-- 海洋拖网捕鱼器
        {
            GENERIC = "很方便的捕鱼设备",		-- 常态默认
            LOWERED = "现在我需要等一等",		-- 等待
            CAUGHT = "好像抓到了什么...",		-- 捕捉到了
            ESCAPED = "看起来跑掉了...",		-- 鱼逃脱
            FIXED = "现在再来一次吧...",		-- 修复完成(重新放下)
        },
        OCEAN_TRAWLER_KIT = "我应该把它放在鱼很多的地方",		-- 海洋拖网捕鱼器套装

        BOAT_MAGNET =		-- 自动航行仪
        {
            GENERIC = "它会自己向着灯塔前进,所以灯塔在哪里呢..?",		-- 常态默认
            ACTIVATED = "它成功运行了",		-- 激活
        },
        BOAT_MAGNET_KIT = "把这些放在船上组装好就可以了\n四糸奈: 看起来有点复杂啊...四糸乃,我来帮你!",		-- 自动航行仪套装

        BOAT_MAGNET_BEACON =		-- 自动航行灯塔
        {
            GENERIC = "灯塔让我们不会迷失方向,但这个好像不是灯塔...",		-- 常态默认
            ACTIVATED = "它在吸引船靠近",		-- 激活
        },
        DOCK_KIT = "嗯...可以搭建码头",		-- 码头套装
        DOCK_WOODPOSTS_ITEM = "让码头更坚固的柱子",		-- 码头桩(物品栏)

        MONKEYHUT =		-- 猴子小屋
        {
            GENERIC = "小猴子住的家...虽然这些小猴子不太受欢迎",		-- 常态默认
            BURNT = "烧坏的房子...",		-- 烧毁
        },
        POWDER_MONKEY = "请...请不要伤害我...\n四糸奈:离四糸乃和这艘船远一点!",		-- 火药猴
        PRIME_MATE = "它带着船长帽子",		-- 大副
		LIGHTCRAB = "它会发光~!",		-- 发光蟹
        CUTLESS = "一柄木头做成的剑",		-- 木头短剑
        CURSED_MONKEY_TOKEN = "它给我一种不太对劲的感觉...",		-- 诅咒饰品
        OAR_MONKEY = "船桨",		-- 战桨
        BANANABUSH = "那些是...香蕉?可是它不是长树上的吗..?",		-- 香蕉丛
        DUG_BANANABUSH = "我想把它种到家旁边",		-- 采下的香蕉丛
        PALMCONETREE = "一棵不认识的树",		-- 棕榈松果树
        PALMCONE_SEED = "树种子",		-- 棕榈松果树芽
        PALMCONE_SAPLING = "等小树长成大树",		-- 棕榈松果树苗
        PALMCONE_SCALE = "树上坚硬的外壳",		-- 棕榈松果树鳞片
        MONKEYTAIL = "这株草是不是有点像尾巴..?",		-- 猴尾草
        DUG_MONKEYTAIL = "也许可以换个地方种下去...",		-- 采下的猴尾草

        MONKEY_MEDIUMHAT = "船长的帽子",		-- 船长的三角帽
        MONKEY_SMALLHAT = "海盗头上绑的纱布",		-- 海盗头巾
        POLLY_ROGERSHAT = "一顶帽子和一只鹦鹉,就像海盗船长一样~",		-- 波莉·罗杰的帽子
        POLLY_ROGERS = "小鹦鹉,你的名字是什么?",		-- 波莉·罗杰

        MONKEYISLAND_PORTAL = "它好像有点不对劲...",		-- 非自然传送门
        MONKEYISLAND_PORTAL_DEBRIS = "它坏掉了...",		-- 损坏的机器
        MONKEYQUEEN = "猴子们的女王,她一直住在这个地方",		-- 月亮码头女王
        MONKEYPILLAR = "柱子",		-- 猴子柱
        PIRATE_FLAG_POLE = "海盗旗",		-- 月亮码头海盗旗

        BLACKFLAG = "一面黑色的旗子",		-- 黑旗
        PIRATE_STASH = "那底下埋着什么..?",		-- X(宝藏埋藏点(被火药猴抢走的东西也会在这里))
        STASH_MAP = "是一张藏宝图~!",		-- 海盗地图

        BANANAJUICE = "香蕉味的奶昔",		-- 香蕉奶昔

        FENCE_ROTATOR = "让建筑物换个方向的魔法武器",		-- 栅栏击剑

        CHARLIE_STAGE_POST = "舞台上演着舞台剧",		-- 舞台
        CHARLIE_LECTURN = "表演准备的剧本",		-- 剧本

        CHARLIE_HECKLER = "它们扮演旁白的角色",		-- 嘲鸫

        PLAYBILL_THE_DOLL = "剧本名《附魔玩偶》",		-- 附魔玩偶\n舞台剧
        PLAYBILL_THE_VEIL = "剧本名《黑罩》",		-- 黑罩\n舞台剧
        PLAYBILL_THE_VAULT = "剧本名《任务完成,一份忏悔》",		-- 任务完成\n一份忏悔
        STATUEHARP_HEDGESPAWNER = "长满了蔷薇",		-- 荆棘密布的雕像
        HEDGEHOUND = "那些花丛有些奇怪...\n四糸奈:小心埋伏,四糸乃...",		-- 蔷薇狼
        HEDGEHOUND_BUSH = "漂亮的蔷薇花",		-- 蔷薇

        MASK_DOLLHAT = "一副玩偶面具",		-- 玩偶面具
        MASK_DOLLBROKENHAT = "一副玩偶面具,它裂开了...",		-- 开裂玩偶面具
        MASK_DOLLREPAIREDHAT = "一副玩偶面具,但是很破",		-- 破碎玩偶面具
        MASK_BLACKSMITHHAT = "一副铁匠面具,戴上扮演铁匠",		-- 铁匠面具
        MASK_MIRRORHAT = "一副镜子面具,戴上扮演一面镜子",		-- 镜子面具
        MASK_QUEENHAT = "一副女王面具,戴上扮演女王",		-- 女王面具
        MASK_KINGHAT = "一副国王面具,戴上扮演国王",		-- 国王面具
        MASK_TREEHAT = "一副树木面具,戴上扮演树木",		-- 树木面具
        MASK_FOOLHAT = "一副小丑面具,戴上扮演小丑",		-- 小丑面具

        COSTUME_DOLL_BODY = "玩偶的表演服",		-- 玩偶服
        COSTUME_QUEEN_BODY = "女王的表演服",		-- 女王服
        COSTUME_KING_BODY = "国王的表演服",		-- 国王服
        COSTUME_BLACKSMITH_BODY = "铁匠的表演服",		-- 铁匠服
        COSTUME_MIRROR_BODY = "镜子的表演服",		-- 镜子服
        COSTUME_TREE_BODY = "树木的表演服",		-- 树木服
        COSTUME_FOOL_BODY = "小丑的表演服",		-- 小丑服

        STAGEUSHER =		-- 多刺舞台之手
        {
            STANDING = "呜哇!..呼~吓...吓到了...",		-- 暗影触手伸出来时
            SITTING = "有些古怪的桌子",		-- 坐下(暗影之手收起来)
        },
        SEWING_MANNEQUIN =		-- 假人
        {
            GENERIC = "它可以和稻草人一样守护田地吗..?",		-- 常态默认
            BURNT = "假人烧坏了...",		-- 烧毁
        },

        --
		DREADSTONE = "只是石头, 不吓人! ...对吧?",		--绝望石
		HORRORFUEL = "它给我一种恐怖的感觉...\n四糸奈:我也有点...",		--纯粹恐惧
		DAYWALKER =		--梦魇疯猪
		{
			GENERIC = "明明解开了...为什么它还是不开心..?",		--常态默认(拘束解开)
			IMPRISONED = "它看上去有点可怜...",		--封印中
		},
		DAYWALKER_PILLAR =		--开裂的柱子
		{
			GENERIC = "外面是大理石...那里面是什么..?",		--常态默认(完整)
			EXPOSED = "还是破坏不了这根柱子...",		--绝望石暴露出来
		},
		DAYWALKER2 =		--拾荒疯猪
		{
			GENERIC = "它似乎比以前好多了",		--常态默认
			BURIED = "他被困在那堆垃圾下面了。",		--受困
			HOSTILE = "放轻松...放轻松,大家伙...",		--击败
		},
		ARMORDREADSTONE = "用坚硬的石头做成的铠甲",		--绝望石盔甲
		DREADSTONEHAT = "用坚硬的石头做成的头盔",		--绝望石头盔

        -- Rifts 1
        LUNARRIFT_PORTAL = "天空裂出一道伤口。",		--裂隙(月亮裂隙)
        LUNARRIFT_CRYSTAL = "像冰一样闪亮的矿石",		--裂隙晶体

        LUNARTHRALL_PLANT = "放着不管会变成麻烦的...",		--致命亮茄
        LUNARTHRALL_PLANT_VINE_END = "该清理一下这些藤曼了...",		--钻地藤蔓

		LUNAR_GRAZER = "它是通过那个奇怪的裂隙来的..?",		--牧者

        PUREBRILLIANCE = "很漂亮的、亮闪闪的石头~!",		--纯粹辉煌
        LUNARPLANT_HUSK = "它非常非常...坚硬",		--亮茄外壳

		LUNAR_FORGE = "这里可以做点东西\n四糸奈:我们可以用它来做点手工!",		--辉煌铁匠铺
		LUNAR_FORGE_KIT = "需要放到合适的位置组装一下",		--辉煌铁匠铺套装

		LUNARPLANT_KIT = "它可以帮助我修补我不会修的东西。",		--亮茄修补套件
		ARMOR_LUNARPLANT = "很坚固的盔甲,就是穿在身上有点重...",		--亮茄盔甲
		LUNARPLANTHAT = "很坚固的头盔,就是穿在身上有点重...",		--亮茄头盔
		BOMB_LUNARPLANT = "比一般炸弹威力更大",		--亮茄炸弹
		STAFF_LUNARPLANT = "一柄魔法棒~",		--亮茄魔杖
		SWORD_LUNARPLANT = "它的剑身是什么能量构成的..?",		--亮茄剑
		PICKAXE_LUNARPLANT = "既是锤子也是斧子",		--亮茄粉碎者
		SHOVEL_LUNARPLANT = "嗯...小铲子的作用有很多...",		--亮茄锄铲

		--BROKEN_FORGEDITEM = "它坏了,我修不好...",		--(暂无注释)

        PUNCHINGBAG = "那~么大一个沙包",		--拳击袋

        -- Rifts 2
        SHADOWRIFT_PORTAL = "地面的伤口越来越多了...",		--裂隙(暗影)

		SHADOW_FORGE = "这里可以做点东西\n四糸奈:我们可以用它来做点手工!",		--暗影术基座
		SHADOW_FORGE_KIT = "需要放到合适的位置组装一下",		--暗影术基座套装

        FUSED_SHADELING = "是噩梦吗..?\n四糸奈:四糸乃小心!",		--熔合暗影
        FUSED_SHADELING_BOMB = "那是什么...\n四糸奈: 快, 跑远点!",		--绝望螨

		VOIDCLOTH = "一块布,可以做些衣服",		--暗影碎布
		VOIDCLOTH_KIT = "它可以帮助我修补我不会修的东西。",		--虚空修补套件
		VOIDCLOTHHAT = "唔...里面好暗!",		--虚空风帽
		ARMOR_VOIDCLOTH = "一件斗篷,穿上会不会变得帅气呢~",		--虚空长袍

        VOIDCLOTH_UMBRELLA = "这把伞可以挡住酸雨",		--暗影伞
        VOIDCLOTH_SCYTHE = "一把镰刀,可以很方便地割菜",		--暗影收割者

		SHADOWTHRALL_HANDS = "走、走开!! 呜呜...",		--墨荒(躁动未被识别前)
		SHADOWTHRALL_HORNS = "走、走开!! 呜呜...",		--墨荒(刮擦未被识别前)
		SHADOWTHRALL_WINGS = "走、走开!! 呜呜...",		--墨荒(尖叫未被识别前)
		SHADOWTHRALL_MOUTH = "走、走开!! 呜呜...",		--墨荒(狞笑未被识别前)

        CHARLIE_NPC = "我是不是见过她..?\n四糸奈:我们在天黑的时候见过她,躲藏在黑暗里的家伙",		--暗影女王(查理)
        CHARLIE_HAND = "是需要什么吗..?",		--召唤之手

        NITRE_FORMATION = "一大堆石头",		--硝石堆
        DREADSTONE_STACK = "来自地底深处的石头",		--绝望石矿苗
        
        SCRAPBOOK_PAGE = "这上面可能写了一些我不知道的事情...",		--丢失的图鉴页面

        LEIF_IDOL = "就像学园祭上的火堆一样,点燃就可以了...",		--树精守卫雕像
        WOODCARVEDHAT = "木头做的安全帽\n四糸奈:防止高空掉落物",		--硬木帽
        WALKING_STICK = "一根手杖,也许其他人更需要",		--木手杖

        IPECACSYRUP = "四糸乃看了说明书,这个其实是泻药与催吐剂的结合",		--泻根糖浆
        --BOMB_LUNARPLANT_WORMWOOD = "Our friend seems to be getting more in touch with his lunar roots.", -- Unused
        --WORMWOOD_MUTANTPROXY_CARRAT =		--(暂无注释,命令生成貌似是个特效)
        --{
        --	DEAD = "That's the end of that.",		--
        --	GENERIC = "Are carrots supposed to have legs?",		--
        --	HELD = "You're kind of ugly up close.",		--
        --	SLEEPING = "It's almost cute.",		--
        --},
        --WORMWOOD_MUTANTPROXY_LIGHTFLIER = "How strange, carrying one makes my pocket feel lighter!",		--
		--WORMWOOD_MUTANTPROXY_FRUITDRAGON =		--
		--{
		--	GENERIC = "It's cute, but it's not ripe yet.",		--
		--	RIPE = "I think it's ripe now.",		--
		--	SLEEPING = "It's snoozing.",		--
		--},

        SUPPORT_PILLAR_SCAFFOLD = "方便我们上去建造柱子",		--支柱脚手架
        SUPPORT_PILLAR = "柱子,防止倒塌",		--支柱
        SUPPORT_PILLAR_COMPLETE = "给柱子加固一下,让它能支撑更久",		--加固支柱
        SUPPORT_PILLAR_BROKEN = "已经坏得只剩这么一点了...",		--支柱瓦砾

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "方便我们上去建造柱子",		--绝望石支柱脚手架
		SUPPORT_PILLAR_DREADSTONE = "用更好的材料搭起的柱子,防止倒塌",		--绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "给柱子加固一下,让它能支撑更久",		--加固绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "没想到已经破损得只剩这么一点了...",		--绝望石支柱瓦砾

        WOLFGANG_WHISTLE = "裁判和教练身上都能见到这种哨子",		--训练哨

        -- Rifts 3

        MUTATEDDEERCLOPS = "它已经不是它自己了...",		--晶体独眼巨鹿
        MUTATEDWARG = "它已经不是它自己了...",		--附身座狼
        MUTATEDBEARGER = "它已经不是它自己了...",		--装甲熊獾

        LUNARFROG = "这不是普通的青蛙!",		--明眼青蛙

        DEERCLOPSCORPSE =		--死掉了的独眼巨鹿
        {
            GENERIC  = "呼~结、结束了吧...",		--常态默认
            BURNING  = "希望它在天堂可以过得更好...",		--燃烧中
            REVIVING = "它、它它...复活了..?",		-- 复活中
        },

        WARGCORPSE =		--死掉了的座狼
        {
            GENERIC  = "呼~结、结束了吧...",		--常态默认
            BURNING  = "希望它在天堂可以过得更好...",		--燃烧中
            REVIVING = "为什么还要起来战斗..?",		-- 复活中
        },

        BEARGERCORPSE =		--死掉了的熊獾
        {
            GENERIC  = "呼~结、结束了吧...",		--常态默认
            BURNING  = "愿灵魂得到安息...",		--燃烧中
            REVIVING = "明明受了那么重的伤...",		-- 复活中
        },

        BEARGERFUR_SACK = "这个冰桶...就只用来放食物吧",		--极地熊獾桶
        HOUNDSTOOTH_BLOWPIPE = "把收集来的犬牙发射出去",		--嚎弹炮
        DEERCLOPSEYEBALL_SENTRYWARD =		--冰眼结晶器
        {
            GENERIC = "在那周围应该很凉快",    -- Enabled.(常态默认(有眼球))
            NOEYEBALL = "它上面好像还缺点什么",  -- Disabled.(无眼球)
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "把它放地上组装起来吧?",		--冰眼结晶器套装

        SECURITY_PULSE_CAGE = "可以用来装特别的东西,比如能量球",		--火花柜
        SECURITY_PULSE_CAGE_FULL = "吸收了一颗小光球",		--火花柜(满)

		CARPENTRY_STATION =		--锯马
        {
            GENERIC = "可以用来做漂亮的木头家具",		--常态默认
            BURNT = "不能做家具了吗..?",		--烧毁
        },

        WOOD_TABLE = -- Shared between the round and square tables.		--木桌(木方桌和木圆桌共用检查台词)
        {
            GENERIC = "一张简单的木头桌子",		--常态默认
            HAS_ITEM = "桌子上放了一些东西",		--放置物品
            BURNT = "烧坏了...",		--烧毁
        },

        WOOD_CHAIR =		--木椅
        {
            GENERIC = "坐上去休息一会吧",		--常态默认
            OCCUPIED = "已经有人坐在上面了,一会再使用吧...",		--被占用
            BURNT = "没有地方坐着休息了...",		--烧毁
        },

        DECOR_CENTERPIECE = "只是一件装饰品",		--物品名:"艺术？"
        DECOR_LAMP = "一盏可以放在桌子上的台灯",		--餐桌灯
        DECOR_FLOWERVASE =		--餐桌花瓶
        {
			GENERIC = "桌上有一盆花",		-- 常态默认(插着花瓣时)
			EMPTY = "我可以做点插花放进去",		-- 花瓶里什么都没有
			WILTED = "啊...枯萎了...",		-- 花瓶里的光源枯萎了(因为插花不会枯萎)
			FRESHLIGHT = "现在...在发光",		-- 新的发光的(比如插入发光浆果)
			OLDLIGHT = "我救不了它, 只能换新的",		-- 发光的即将枯萎
        },
        DECOR_PICTUREFRAME =		--空画框
        {
            GENERIC = "一幅画",		--常态默认(有绘制(物品画))
            UNDRAWN = "一起画画吧~",		--未绘制
        },
        DECOR_PORTRAITFRAME = "嗯, 很好看",		--愉快画像

        PHONOGRAPH = "一台老式留声机",		--留声机
        RECORD = "放在留声机上播放",		--唱片
        RECORD_CREEPYFOREST = "这首曲子...",		--惊悚森林(唱片)
        RECORD_DRSTYLE = "这首曲子...",		--D.R.风格(唱片)
        RECORD_EFS = "这首曲子...",		--E.F.S.(唱片)
        RECORD_HALLOWEDNIGHTS = "这首曲子...好像很适合万圣节晚上",		--万圣夜

        ARCHIVE_ORCHESTRINA_MAIN = "似乎有特别的顺序",		--远古小合奏机

        WAGPUNKHAT = "它...它不会控制我的想法吧..?",		--W.A.R.B.I.S.头戴齿轮
        ARMORWAGPUNK = "四糸乃不喜欢身上都是齿轮",		--W.A.R.B.I.S.盔甲
        WAGSTAFF_MACHINERY = "这台机器已经没人要了...",		--被丢弃的垃圾
        WAGPUNK_BITS = "一些金属零件",		--废料
        WAGPUNKBITS_KIT = "它可以帮助我修复我不会修的东西",		--自动修理机

        WAGSTAFF_MUTATIONS_NOTE = "唔...看不懂...",		--研究笔记(被丢弃的垃圾研究笔记)

        -- Meta 3
        BATTLESONG_INSTANT_REVIVE = "这首曲子很有活力",		-- 战士重奏

        WATHGRITHR_IMPROVEDHAT = "将军们喜欢这顶头盔",		-- 统帅头盔
        SPEAR_WATHGRITHR_LIGHTNING = "带电的长矛",		-- 奔雷矛

        BATTLESONG_CONTAINER = "哇，它能存这么多歌。",		-- 战斗号子罐

        SADDLE_WATHGRITHR = "四糸乃的\"天使\"(冰洁傀儡)并不需要这个",		-- 战斗鞍具

        WATHGRITHR_SHIELD = "有一面盾牌在,四糸乃会很安全",		-- 战斗圆盾

        BATTLESONG_SHADOWALIGNED = "有些担心唱这首歌的伙伴",		-- 黑暗悲歌
        BATTLESONG_LUNARALIGNED = "有些担心唱这首歌的伙伴",		-- 启迪摇篮曲

		SHARKBOI = "它像人一样走路",		-- 大霜鲨
        BOOTLEG = "这是谁的鞋子,他一定很着急....",		-- 出逃腿靴
        OCEANWHIRLPORTAL = "海上有个大漩涡",		-- 漩涡传送门

        EMBERLIGHT = "舒服又暖和~",		-- 火球
        --WILLOW_EMBER = "only_used_by_willow",		-- 以太余烬

        -- Rifts / Meta QoL

        HEALINGSALVE_ACID = "很臭,但效果很好",		-- 黏糊糊的药膏

        BEESWAX_SPRAY = "防..腐..喷雾?",		-- 防腐喷雾
        WAXED_PLANT = "它被吓得一动不动", -- Used for all waxed plants, from farm plants to trees.(用于给所有的打蜡植物)

        STORAGE_ROBOT = {		-- 瓦器人
            GENERIC = "它会帮我收集周围的材料",		-- 常态默认
            BROKEN = "它坏掉了...",		-- 破损
        },

        SCRAP_MONOCLEHAT = "能看到更多东西",		-- 视界扩展器
        SCRAPHAT = "一顶安全头盔",		-- 拾荒尖帽

        FENCE_JUNK = "栅栏",		-- 垃圾栅栏
        JUNK_PILE = "这里是废弃垃圾场",		-- 垃圾堆
        JUNK_PILE_BIG = {		-- 摇摇欲坠的垃圾堆
            BLUEPRINT = "里面好像有东西",		-- 具有蓝图
            GENERIC = "太多了...",		-- 常态默认
        },
        
        ARMOR_LUNARPLANT_HUSK = "这件盔甲我不适合穿",		-- 荆棘茄甲

        -- Meta 4 / Ocean QoL

        OTTER = "它总是喜欢偷吃",		-- 水獭掠夺者
        OTTERDEN = {		-- 水獭掠夺者窝点
            GENERIC = "里面没有什么东西",		-- 常态默认(无物品)
            HAS_LOOT = "里面好像藏了什么...\n四糸奈:进去看看!",		-- 有物品
        },
        OTTERDEN_DEAD = "糟糕了...\n四糸奈:也许不该拆了那个窝",		-- 拆毁的水獭掠夺者窝点

        BOAT_ANCIENT_ITEM = "古时候的船是这样搭建的吗?",		-- 古董船套装
        BOAT_ANCIENT_CONTAINER = "这里面可以放东西~",		-- 货舱
        WALKINGPLANK_ANCIENT = "要小心,不要摔到海里去。",		-- 古董跳板

        ANCIENTTREE_SEED = "有点好奇,它长大后会变成什么...",		-- 惊喜种子

        ANCIENTTREE_GEM = {		-- 萌芽石
            GENERIC = "这是一颗奇怪的树,里面好像烧着火",		-- 常态默认(长成)
            STUMP = "长出了成熟的果子",		-- 结果
        },

        ANCIENTTREE_SAPLING_ITEM = "刚种下去呢~",		-- 萌芽石苗(控制台代码是"ancienttree_gem_sapling_item")

        ANCIENTTREE_SAPLING = {		-- 种下的惊喜种子(控制台代码是"ancienttree_gem_sapling")
            GENERIC = "它正在长大吗?四糸乃不太清楚...",		-- 常态默认
            WRONG_TILE = "这里给不了它所需的营养。",		-- 种错地方
            WRONG_SEASON = "现在好像不是合适的季节",		-- 季节错误
        },
 
        ANCIENTTREE_NIGHTVISION = {		-- 阴郁之棘(由惊喜种子发芽长成年轻的阴郁之棘)
            GENERIC = "长满尖刺的紫树",		-- 常态默认(长成)
            STUMP = "它结果了",		-- 结果
        },

        ANCIENTFRUIT_GEM = "这是那颗很热的树结出的果实",		-- 晶洞果
        ANCIENTFRUIT_NIGHTVISION = "只有夜晚才能采摘",		-- 夜莓
        ANCIENTFRUIT_NIGHTVISION_COOKED = "煮熟的莓子",		-- 熟夜莓

        BOATPATCH_KELP = "先用海带补一补船上的漏洞吧...",		-- 海带补丁

        CRABKING_MOB = "螃蟹守卫",		-- 蟹卫
        CRABKING_MOB_KNIGHT = "螃蟹族的骑士,它们守护的公主在哪里呢..?",		-- 蟹骑士
        CRABKING_CANNONTOWER = "四糸奈:小心那些炮塔!\n四糸乃:嗯!",		-- 加农炮塔
        CRABKING_ICEWALL = "冰铺成的路障。",		-- 冰障

        SALTLICK_IMPROVED = "野生动物们渴望它。",		-- 美味舔盐块

        OFFERING_POT =		-- 食堂海带盘
        {
            GENERIC = "里面什么都没有,应该是吃完了...",		-- 常态默认(空的)
            SOME_KELP = "也许可以再放一点海带进去",		-- 有一点海带
            LOTS_OF_KELP = "现在满满的,可以啦~",		-- 海带很多(满的)
        },

        OFFERING_POT_UPGRADED =		-- 高级食堂海带盘
        {
            GENERIC = "里面什么都没有,应该是吃完了...",		-- 常态默认(空的)
            SOME_KELP = "也许可以再放一点海带进去",		-- 有一点海带
            LOTS_OF_KELP = "现在满满的,可以啦~",		-- 海带很多(满的)
        },

        MERM_ARMORY = "鱼人们专用的武器库",		-- 鱼人军械库
        MERM_ARMORY_UPGRADED = "鱼人们专用的武器库",		-- 高级鱼人军械库
        MERM_TOOLSHED = "鱼人们专用的简易工具棚",		-- 劣质工具棚
        MERM_TOOLSHED_UPGRADED = "鱼人们专用的工具棚",		-- 不那么劣质的工具棚
        MERMARMORHAT = "这个头盔不适合我",		-- 沼泽斗士头盔
        MERMARMORUPGRADEDHAT = "这个头盔不适合我",		-- 沼泽战士头盔
        MERM_TOOL = "简单的工具",		-- 劣质工具
        MERM_TOOL_UPGRADED = "鱼人们专用的工具",		-- 不那么劣质的工具

        WURT_SWAMPITEM_SHADOW = "能做出特殊效果的沼泽地,不过我用不来这个",		-- 绝望投泥带
        WURT_SWAMPITEM_LUNAR = "能做出特殊效果的沼泽地,不过我用不来这个",		-- 光芒投泥带

        MERM_SHADOW = "它被暗影魔法影响了",		-- 暗影鱼人
        MERMGUARD_SHADOW = "它被暗影魔法影响了",		-- 暗影鱼人守卫
        MERM_LUNAR = "它被天上的魔法影响了",		-- 变异鱼人
        MERMGUARD_LUNAR = "它被天上的魔法影响了",		-- 变异鱼人守卫

        -- Rifts 4

        SHADOW_BEEF_BELL = "它能让我的牛伙伴在这片大陆复活",		-- 阴郁皮弗娄牛铃
        SADDLE_SHADOW = "让我有些不安的鞍具",		-- 梦魇鞍具
        SHADOW_BATTLEAXE = "一柄受了诅咒的斧头,它上面的气息让我有些不安",		-- 暗影槌
        VOIDCLOTH_BOOMERANG = "回旋镖上的力量让我有些不安",		-- 阴郁回旋镖
		ROPE_BRIDGE_KIT = "在悬崖边上搭一座临时桥梁",		-- 洞穴探险者的桥梁套件
		GELBLOB =		-- 恶液
		{
			GENERIC = "唔...不、不要过来...!",		-- 常态默认
			HAS_ITEM = "它不想把东西还回去了...",		-- 有物品在里面
			HAS_CHARACTER = "有人需要拯救!",		--有玩家在里面 
		},
        RABBITKING_AGGRESSIVE = "兔子大王生气了",		-- 暴戾兔王
        RABBITKING_PASSIVE = "兔子大王看上去心情很好",		-- 和善兔王
        RABBITKING_LUCKY = "那只小兔子和别的不一样诶~",		-- 机缘兔子
        RABBITKINGMINION_BUNNYMAN = "它们在保护兔子国王",		-- 皇家兔子警卫
        ARMOR_CARROTLURE = "在身上绑一圈胡萝卜就不会被兔兔们误会了吧",		-- 胡萝卜外套
        RABBITKINGHORN = "可以让兔兔们帮我保管一些物品",		-- 挖洞兔号角
        RABBITKINGHORN_CHEST = "把东西放进去,兔兔们会帮忙照料的",		-- 便携式巢穴
        RABBITKINGSPEAR = "兔兔们见到这个就像见到生气的兔子大王一样",		-- 兔王棍
        RABBITHAT = "小兔兔,乖哦~",		-- 洞穴花环
        WORM_BOSS = "那是...巨大的虫子——!",		-- 巨大洞穴蠕虫

        STONE_TABLE = -- Shared between the round and square tables.		-- 石桌
        {
            GENERIC = "一张石头桌子",		-- 常态默认
            HAS_ITEM = "桌子上放了一些物品",		-- 有物品摆放在上面
        },

        STONE_CHAIR =		-- 石椅
        {
            GENERIC = "一张石头做的椅子,要不要上去坐一下?",		-- 常态默认
            OCCUPIED = "现在有人在使用,等会再来吧...",		-- 被占用
        },

        CARPENTRY_BLADE_MOONGLASS = "要小心使用,它很锋利",		-- 月光玻璃锯片

        CHEST_MIMIC_REVEALED = "难道是宝箱怪?",		-- 暴躁箱子

        GELBLOB_STORAGE = {		-- 恶液储存箱
            GENERIC  = "里面是空的",		--常态默认(空的) 
            FULL = "隔绝了空气,它会一直保持新鲜",		-- 装满了
        },
        GELBLOB_STORAGE_KIT = "黏糊糊的....四糸乃不喜欢,但是它可以保护很多东西",		-- 恶液储存箱套件
        GELBLOB_BOTTLE = "四糸乃不喜欢瓶子里装的这些",		-- 恶液罐

        PLAYER_HOSTED =		-- 被附身的尸体
        {
            GENERIC = "他身上的力量...\n四糸奈:有些不对劲",		-- 常态默认
            ME = "那是...另一个我..?怎么会..?",		-- 自己
        },

        MASK_SAGEHAT = "一副贤者面具,戴上扮演闲着",		-- 贤者面具
        MASK_HALFWITHAT = "一副蠢人面具,戴上扮演一个笨蛋~",		-- 蠢人面具
        MASK_TOADYHAT = "一副马屁精面具,戴上扮演马屁精",		-- 马屁精面具

        SHADOWTHRALL_PARASITE = "四糸乃相当害怕",		-- 虚空面具/暗域先驱

        PUMPKINCARVER = "雕南瓜~要一起来试试吗~",		-- 巨型南瓜雕刻工具(南瓜勺、南瓜刀、南瓜锯共用一句检查语句)
		SNOWMAN =		-- 雪人
		{
			GENERIC = "雪人先生你好呀~",		-- 常态默认
			SNOWBALL = "圆圆的,可以堆雪人玩~",		-- 滚起的雪球
		},
        SNOWBALL_ITEM = "可以打雪仗吗",		-- 雪球(物品栏)

        --[[-- Year of the Snake(洞穴蠕虫之年)(有空再写)
        YOTS_SNAKESHRINE =		-- 洞穴蠕虫神龛
        {
            GENERIC = "It's bursting with promise!",		-- 
            EMPTY = "It has a monstrous appetite.",		-- 
            BURNT = "Willow!",		-- 
        },
        YOTS_WORM = "It comes from lesser depths.",		-- 镀金洞穴蠕虫
        YOTS_LANTERN_POST = 		-- 喜庆灯笼柱
        {
            GENERIC = "It's post to be there.",		-- 
            BURNT = "It's post post",		-- 
        },
        YOTS_LANTERN_POST_ITEM = "Where's it post to go?",		-- 喜庆灯笼柱套装
        CHESSPIECE_DEPTHWORM  = "It's a worm, figures.",		-- (暂无注释)
        --]]

        -- Meta 5
        GHOSTLYELIXIR_LUNAR = "它并不是给我喝的,精灵不喝这个",		-- 光之怒
        GHOSTLYELIXIR_SHADOW = "它并不是给我喝的,精灵不喝这个",		-- 诅咒之苦

		SLINGSHOTMODKIT = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 弹弓野外作业包
		SLINGSHOT_BAND_PIGSKIN = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 猪皮弹弓皮筋
		SLINGSHOT_BAND_TENTACLE = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 甩尾弹弓皮筋
		SLINGSHOT_BAND_MIMIC = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 附身弹弓皮筋
		SLINGSHOT_FRAME_BONE = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 骨制弹弓框
		SLINGSHOT_FRAME_GEMS = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 铥矿弹弓框
		SLINGSHOT_FRAME_WAGPUNK_0 = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 废料弹弓框
		SLINGSHOT_FRAME_WAGPUNK = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 加量废料弹弓框
		SLINGSHOT_HANDLE_STICKY = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 粘性弹弓手柄
		SLINGSHOT_HANDLE_JELLY = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 蜂王浆弹弓手柄
		SLINGSHOT_HANDLE_SILK = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 弹弓手柄缠带
		SLINGSHOT_HANDLE_VOIDCLOTH = "弹弓的改装零件, 四糸乃不会玩弹弓",		-- 虚空弹弓手柄

		WOBY_TREAT = "大狗狗的零食",		-- 沃比零食
		BANDAGE_BUTTERFLYWINGS = "绷带应该在受伤的时候使用,四糸乃以前从电视上学到的",		-- 扑腾绷带
		PORTABLEFIREPIT_ITEM = "很方便的在森林里搭建简单的篝火",		-- 便携营火
        SLINGSHOTAMMO_CONTAINER = "装弹药的小包",		-- 弹药袋

        ELIXIR_CONTAINER = "不知道里面装了什么...",		-- 野餐盒
        GHOSTFLOWERHAT = "戴上会获得幽灵的感受吗?",		-- 幽魂花冠
        WENDY_RESURRECTIONGRAVE = "重生...\n四糸奈:希望我们永远用不上它,四糸乃。",		-- 多年生植物祭坛
        GRAVEURN =		-- 灵魂容器
        {
            GENERIC = "空的",		-- 常态默认(空)
            HAS_SPIRIT = "里面有...有什么在动...",		-- 盛有灵魂
        },

        --SHALLOW_GRAVE = "Better you than me.",		-- 矮坟(非玩家)(wegame特供)
        THULECITEBUGNET = "更高级的捕虫网",		-- 铥矿捕虫网

        -- Deck of Cards(有空再写)
        --DECK_OF_CARDS = "Are we playing with a full deck?",		-- 牌堆
        --PLAYING_CARD = "It's fifty-one short of a deck.",		-- 扑克牌
        --BALATRO_MACHINE = "I'm game for a game.",		-- 小丑

		-- Rifts 5
		GESTALT_CAGE =		-- 幻灵捕获机
		{
			GENERIC = "现在还是空的",		-- 常态默认(空)
			FILLED = "抓到了",		-- 满的
		},
		WAGBOSS_ROBOT_SECRET = "里面应该是某种机器",		-- 未公开构造体
        WAGBOSS_ROBOT = "大机器人",		-- 战争瓦器人
        WAGBOSS_ROBOT_POSSESSED = "它是不是失控了?!",		-- 启迪战争瓦器人
		WAGBOSS_ROBOT_LEG = "机器人身上的一部分...不知道还有没有用..?",		-- 战争瓦器人腿
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "以前我们是不是见过?",		-- 天体仇灵
		ALTERGUARDIAN_PHASE1_LUNARRIFT_GESTALT = "亮闪闪的,应该就是这个!",		-- 纯粹虚影
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "究竟是哪里不对...\n四糸奈:先别管这些了,保护好自己",		-- 天体后裔
		WAGDRONE_ROLLING =		-- 螨地爬
        {
            GENERIC = "它们失控了...",		-- 常态默认(敌对活动状态)
            INACTIVE = "它在做什么..?",		-- 敌对闲置状态
            DAMAGED = "有没有什么办法修好它呢..?",		-- 损坏状态
            FRIENDLY = "安...安全了吗..?",		-- 友好状态
        },
        WAGDRONE_FLYING =		-- 黄莺
        {
            GENERIC = "它们的攻击,有点麻麻的...",		-- 常态默认(活动状态)
            INACTIVE = "可能是没能量了..?",		-- 闲置状态
            DAMAGED = "彻底坏掉了...\n四糸奈:记得拿走它的零件",		--损坏状态 
        },
		WAGDRONE_PARTS = "可以用来修理小转动机器人。",		-- 陀螺传导核心
		--WAGDRONE_BEACON = "This will help keep things contained.",		-- 螨地爬屏障柱 (疑似未实装台词)

        WAGPUNK_WORKSTATION = "这是一张工作台,可以学点新的知识",		-- 概念制造器
        WAGPUNK_LEVER = "这个拉杆是做什么的...\n四糸奈:拉一下试试~",		-- 杠杆选择器
        WAGPUNK_FLOOR_KIT = "珍珠奶奶想要更大的一座岛..?",		-- 基底扩展器
        WAGPUNK_CAGEWALL = "它好像想把我困住",		-- 动能场扩展器

		WAGSTAFF_ITEM_1 = "这个...是谁的手套?",		-- 手套
		WAGSTAFF_ITEM_2 = "这上面记录了好多东西...不过四糸乃看不懂...",		-- 剪贴板

        HERMITCRAB_RELOCATION_KIT = "可以帮老奶奶搬个家,让她不那么孤独",		-- 隐士迁居套装

        WANDERINGTRADER =		-- 怪皮弗娄牛
        {
            REVEALED = "你好呀,牛先生",		-- 流浪商人形态
            GENERIC = "那头牛是不是有点奇怪?",		-- 常态默认
        },

        GESTALT_GUARD_EVOLVED = "请...请不要伤害我...\n四糸奈:没用的,它盯上我们了",		-- 敌意虚影
        FLOTATIONCUSHION = "能够保护我从游回岸上。",		-- 个人漂浮装置
        LUNAR_SEED = "一颗好看的珠子",		-- 天体珠宝

        -- rifts5.1
        WAGBOSS_ROBOT_CONSTRUCTIONSITE = "还需要更多的零件",		-- 战争瓦器人底座
        WAGBOSS_ROBOT_CONSTRUCTIONSITE_KIT = "方便携带",		-- 战争瓦器人底座套装
        WAGBOSS_ROBOT_CREATION_PARTS = "机器人的零件",		-- 战争瓦器人零件
        MOONSTORM_STATIC_CATCHER = "里面什么都没有",		-- 静电约束仪
        COOLANT = "感觉放在身上对身体不是很好",		-- 核化液

        FENCE_ELECTRIC = {		-- 麻刺节点
            LINKED = "嗯...现在可以了",		-- 连接      --NOTE: the fence post is fully linked to two other posts
            GENERIC = "只有一个好像没什么用",		-- 常态默认(单个)           --NOTE: no links or electricity, just boring ol fence post
        },
        FENCE_ELECTRIC_ITEM = "需要先种进地里",		-- 麻刺节点(物品栏)

        MUTATEDBIRD = "那只小鸟...是不是有点不对\n四糸奈:它的眼里毫无生气.",		-- 亮喙鸟

        BIRDCORPSE =		-- 死掉了的亮喙鸟
        {
            GENERIC  = "它应该不会再起来了...", --witnessing the corpse		-- 常态默认
            BURNING  = "愿灵魂得到安息...", --when its burning		-- 燃烧中
            REVIVING = "它还活着", --when its mutating and being revived		-- 复活中
        },

        BUZZARDCORPSE = {		-- 死掉了的秃鹫
            GENERIC  = "它应该不会再起来了...", --witnessing the corpse		-- 常态默认
            BURNING  = "愿灵魂得到安息...", --when its burning		-- 燃烧中
            REVIVING = "它还活着", --when its mutating and being revived		-- 复活中
        },

        MUTATEDBUZZARD_GESTALT = {		-- 水晶冠秃鹫
            GENERIC = "四糸奈,我有些不安...\n四糸奈:没事的...",		-- 常态默认 -- Generic string
            EATING_CORPSE = "它在吃的是什么...!",		-- 进食中 -- Eating from a fresh corpse (might be from the players kill or another creatures kill)
        },

        -- Rifts 6

        SHADOWTHRALL_CENTIPEDE = {		-- 巨荒蜈/涟漪
            HEAD = "它有两个头", --The head segment
            BODY = "它的身体好大,而且很结实", --The body segment
            FLIPPED = "噗、它翻不过来了(/≧▽≦)/", --When it's flipped over (either head or body segment)
        },

        TREE_ROCK =		-- 巨石枝
		{
			BURNING = "底下的\"树干\"烧焦了...", --It's vines are burning, it will collapse		-- 烧毁
			CHOPPED = "石头落到了地上", --It's 'chopped', so the rock fell		-- 砍倒
			GENERIC = "一株藤曼,顶着块大石头..?", --Rock is still on tree		-- 常态默认
		},
        CAVE_VENT_ROCK =		-- 喷气孔
        {
            GENERIC = "是大地在呼吸", -- Not ventilating anything		-- 常态默认
            HOT     = "周围越来越热了...", -- Ventiliating hot air, making the area warm		-- 炙热蒸汽
            GAS     = "好难闻的味道\n四糸奈:这气体吸多了会中毒,我们离远一点吧", -- Ventiliating Toadstools gas fumes and spores		-- 瓦斯气体
            MIASMA  = "好难闻的味道..\n四糸奈:小心,这气体有毒", -- Ventiliating the shadow rift miasma		-- 暗影瘴气
        },
        CAVE_FERN_WITHERED = "它枯萎了...",		-- 枯萎的蕨类
        FLOWER_CAVE_WITHERED = "它枯萎了,无法再为我们照明...",		-- 枯萎的荧光花

		ABYSSPILLAR_MINION =		-- 追随者
		{
			GENERIC = "还好只是雕像", --off, looks like decor/statue		-- 常态默认
			ACTIVATED = "它在学我,唔~", --turned on and hopping over puzzle pillars		-- 活动
		},
		ABYSSPILLAR_TRIAL = "一个拉杆,是控制哪里的?",		-- 杠杆

        VAULT_TELEPORTER =		-- 圣殿路标
        {
            GENERIC = "它会把我和四糸奈送去另一个地方",		-- 常态默认
            BROKEN = "它现在是坏掉的状态",		-- 破损
            UNPOWERED = "它需要一些能量",		-- 未充能
        },
		--VAULT_TELEPORTER_UNDERCONSTRUCTION = "\"This Waymark is under development for a future update.\"",		-- (暂无注释)(疑似未实装内容)
		VAULT_ORB = "不知道这个能不能用来修路标",		-- 传送宝珠
        VAULT_LOBBY_EXIT = "要...要跳下去吗..?\n四糸奈:跳吧跳吧~没事的",		-- 裂口
		VAULT_CHANDELIER_BROKEN = "太久了,它自己掉下来了",		-- 圣殿华灯(由于玩家只能检查损坏的,因此只有这一句台词)

		ANCIENT_HUSK = "这里发生过不好的事情。",		-- 远古遗骸
		MASK_ANCIENT_HANDMAIDHAT = "他以前肯定很厉害",		-- 鞘翅面具
		MASK_ANCIENT_ARCHITECTHAT = "是位热爱科学的科学家",		-- 远见者面具
		MASK_ANCIENT_MASONHAT = "他一定很勤劳",		-- 工匠面具

        TREE_ROCK_SEED = "一颗种子",		-- 巨石枝种子
        TREE_ROCK_SAPLING = "发芽了",		-- 巨石枝树苗

        -- Rifts 6.1
        OCEANWHIRLBIGPORTALEXIT = "里面应该能找到我们需要的东西", -- The flotsam pickable not the waterfall.		-- 海洋漂浮物

		VAULT_TORCH =		-- 谜之火焰
		{
			GENERIC = "古代人使用的灯台",		-- 常态默认(卡住)
			BROKEN = "开关坏掉了...", --the torch still functions, just the lever is broken		-- 损坏
		},

        CAVE_VENT_MITE =		-- 地热螨
		{
			DEAD = "它没有气息了...",		-- 死亡
			GENERIC = "一只小虫子,唔...",		-- 常态默认
			SLEEPING = "它睡着了",		-- 睡眠
            VENTING = "...好难闻的味道!", -- in the shield state and venting out gasses		-- 喷气
        },

        --[[--Hallowed Nights 2025(20025万圣夜)(没有写的必要)
		PUMPKINHAT =		-- 无面南瓜
		{
			GENERIC = "That's a hollow expression.",
			UNCARVED = "It's no gourd to wear without a face.",--can't wear it unless it's carved.
		},

        PENGUINCORPSE =		-- 死掉了的企鸥
		{
            GENERIC  = "I call fowl.", --witnessing the corpse
            BURNING  = "That's what I call a firebird.", --when its burning
            REVIVING = "It's becoming a new species!", --when its mutating and being revived
		},
        SPIDERCORPSE =		-- 死掉了的蜘蛛
		{
			GENERIC = "Ewwww!",
			BURNING = "Much better.",
			REVIVING = "This is all wrong.",
		},
        SPIDERQUEENCORPSE =		-- 死掉了的蜘蛛女王
		{
			GENERIC = "Eww! I feel sick.",
			BURNING = "Much better.",
			REVIVING = "This is not good.",
		},
        MERMCORPSE =		-- 死掉了的鱼人
		{
			GENERIC = "A merm has died.",
			BURNING = "That smell is the worst.",
			REVIVING = "Dead merm waking!",
		},
        GENERIC_CORPSE = -- A generic set of lines for ANY corpse, until they get their own unique lines at least.
        {		-- 通用"死掉了的{name}"
            GENERIC = "It's definitely dead.",
            BURNING = "No coming back from that.",
            REVIVING = "TODO",
        },
        --]]


    },
    DESCRIBE_GENERIC = "四糸乃不认识这件物品",		--检查物品描述的缺省值
    DESCRIBE_TOODARK = "天...黑了...",		--天太黑
    DESCRIBE_SMOLDERING = "它快着火了。",		--冒烟

    DESCRIBE_PLANTHAPPY = "它看起来很健康。",		--检查开心的农作物
    DESCRIBE_PLANTVERYSTRESSED = "我要怎么帮助它?",		--检查压力巨大的农作物
    DESCRIBE_PLANTSTRESSED = "有什么东西让它不高兴了。",		--检查有压力的农作物
    DESCRIBE_PLANTSTRESSORKILLJOYS = "我可能要除一下草...",		--压力来源是杂草
    DESCRIBE_PLANTSTRESSORFAMILY = "它太孤单了",		--压力来源是没有其他种在一起的植物
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "它们太挤了",		--压力来源是一块地里的农作物太满了
    DESCRIBE_PLANTSTRESSORSEASON = "这个季节似乎不适合种植这种作物...",		--压力来源是季节不对
    DESCRIBE_PLANTSTRESSORMOISTURE = "我想应该给它浇点水",		--压力来源是缺水了
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "土地有些贫瘠",		--压力来源是缺少肥料
    DESCRIBE_PLANTSTRESSORHAPPINESS = "它似乎希望有人和它聊聊天~",		--压力来源是没人对话

    EAT_FOOD =		--吃特殊食物
    {
        TALLBIRDEGG_CRACKED = "对不起, 我不得不这么做...",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "我好像看到了原来的世界...",		--吃节日欢愉
    },


}
