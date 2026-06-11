STRINGS.NAMES.yoshino = "四糸乃" --人物在游戏里面的名字
STRINGS.NAMES.YOSHINO = "四糸乃" --人物实体的名称
STRINGS.CHARACTER_NAMES.yoshino = "四糸乃" -- 人物选人界面的名字

-- 人物列表选择界面，右侧，人物下面的稍大号字体的说明，一般是职业
STRINGS.CHARACTER_TITLES.yoshino = "精灵"
-- 人物列表选择界面，右侧，人物下面的稍大号字体下面的小号字说明，一般是人物特性
STRINGS.CHARACTER_DESCRIPTIONS.yoshino = [[
    *邻界的精灵，胆小温顺但坚强
    *能操控水与寒气，但有时会控制不住
    *四糸奈手偶是成为精灵时唯一的随身物品
]]
-- 点击人物，进到人物详情页，人物下面的台词
STRINGS.CHARACTER_QUOTES.yoshino = "好、好的……我会努力的"
--生存几率显示
STRINGS.CHARACTER_SURVIVABILITY.yoshino = "四糸乃有点害怕"
-- 世界内检查界面显示的名字（审视自我）
STRINGS.SKIN_NAMES.yoshino_none = "冰芽川·四糸乃"
-- 人物语言反馈，这里填写的都是其他玩家描述四糸乃的语音（如果其他玩家没有写“对玩家通用”的语音，则会调用此处）
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO = {
    GENERIC = "来自其他世界的朋友，%s", --游戏中被点击时
    ATTACKER = "呵，你终于主动攻击了么", --若四糸乃攻击其他玩家，被检查时其他人会说这句
    MURDERER = "杀人的精灵", --若四糸乃击杀了其他玩家，被检查时其他人会说这句
    REVIVER = "复活的手段很厉害", --若四糸乃复活了其他玩家，被检查时其他人会说这句
    FIRESTARTER = "冰雪的精灵也能释放火焰吗", --若四糸乃火烧其他玩家，被检查时其他人会说这句
    GHOST = "哦，天哪" --游戏中变成幽灵状态时，其他玩家检查时会说这句
}
STRINGS.CHARACTERS.YOSHINO = require("speech_yoshino_zh") --导入人物台词

STRINGS.NAMES.YOSHINON = "四糸奈" --游戏里或配方上的名字
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINON = "手偶四糸奈" --检查四糸奈时的通用台词
STRINGS.CHARACTERS.GENERIC.ANNOUNCE_PICK_YOSHINON = "把它还给四糸乃吧" --其他人捡到四糸奈时触发的台词
STRINGS.RECIPE_DESC.YOSHINON = "用特殊魔法把四糸奈召唤回来" --配方上的描述，最多两行，共32个中文字符不含"\n"符号

STRINGS.NAMES.YOSHINO_ZADKIEL = "天使·冰结傀儡"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_ZADKIEL = "四糸乃的\"天使\"…!" --角色检查时的通用描述
STRINGS.CHARACTERS.GENERIC.ACTIONFAIL.MOUNT.NOTYOSHINO = "我无法掌控\"天使\"" --非四糸乃角色试图骑乘冰结傀儡

STRINGS.RECIPE_DESC.ICE = "释放寒冷的灵力凝结冰晶" --配方上的描述，最多两行，共32个中文字符不含"\n"符号

STRINGS.NAMES.YOSHINO_MILKCOCO = "牛奶可可" --游戏里或配方上的名字
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_MILKCOCO = "香甜可口的乳制饮品" --食物描述
STRINGS.NAMES.YOSHINO_OYAKODON = "亲子丼" --游戏里或配方上的名字
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_OYAKODON = "一碗热乎的鸡肉盖饭" --食物描述

STRINGS.NAMES.YOSHINO_CRYSTAL = "灵结晶 (仁爱)" --游戏里或配方上的名字
STRINGS.NAMES.YOSHINO_ANTICRYSTAL = "反灵结晶 (无情)" --游戏里或配方上的名字
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_CRYSTAL = "充满未知能量的结晶体,寒冷又明亮" --检查灵结晶时的通用台词
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_ANTICRYSTAL = "充满未知能量的结晶体,令人脊背发凉" --检查反灵结晶时的通用台词

STRINGS.NAMES.YOSHINO_ELYONBAN = "神威灵装·四番"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_ELYONBAN = "四糸乃的最初的灵装" --检查神威灵装·四番的通用台词
STRINGS.RECIPE_DESC.YOSHINO_ELYONBAN = "四糸乃的基础灵装" --配方上的描述，最多两行，共32个中文字符不含"\n"符号

STRINGS.NAMES.YOSHINO_ELFZ = "神威灵装·四番(反转形态)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_ELFZ = "四糸乃的反转灵装, 究竟是什么造成它的出现?" --检查神威灵装·四番(反转)的通用台词

STRINGS.NAMES.YOSHINO_SIRVON = "冰结傀儡·冻铠"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_SIRVON = "冰洁纯净的铠甲" --检查冰铠的通用台词
STRINGS.RECIPE_DESC.YOSHINO_SIRVON = "全新的,更强的灵装" --配方上的描述，最多两行，共32个中文字符不含"\n"符号

STRINGS.NAMES.YOSHINO_FAN = "折扇"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOSHINO_FAN = "一柄漂亮的扇子" --检查四糸乃的折扇时的通用台词
STRINGS.RECIPE_DESC.YOSHINO_FAN = "漂亮的扇子，居家旅行必备"   --配方上的描述，最多两行，共32个中文字符不含"\n"符号

STRINGS.CHARACTERS.GENERIC.ACTIONFAIL.REBACK_ZADKIEL = {    --动作REBACK_ZADKIEL失败语音
    GENERIC = "我做不到",
}
