local language = locale == "zh" or locale == "zhr" or false
name = language and "氷芽川·四糸乃" or "Himekawa_Yoshino" --mod名字
description = [[
《约会大作战》中的四糸乃
模组仅上传steam

1.关于模组的设置，其中灵力最大值的设定需要进入游戏后等待5~10秒左右才会更改显示的值
（不过不用担心，只是显示bug(懒得改了)，数值显示正常就行，最大值在服务器那边也是正常的只是同步会延迟一点）
2.空间震用了蚁狮地震的特效模拟，但四糸乃的识别名为"隐居者"，很少触发空间震，所以默认是关闭的。
3.四糸乃首次进入永恒大陆必定下雨。

反馈可加Q群303721628
]]
author = "doctuckos"
version = "1.4.0"
version_compatible = version
forumthread = "" --不在单机版使用所以不管
server_filter_tags = { "yoshino", "hermit", "四糸乃", "约会大作战", "doctuckos" }

icon_atlas = "modicon.xml"
icon = "modicon.tex"

api_version = 6                    --单机版本号
api_version = 10                   --联机版本号
priority = -12                       --加载时的优先度，数字越大优先级越高，最多100

dst_compatible = true              --兼容联机
dont_starve_compatible = false     --不兼容单机原版
shipwrecked_compatible = false     --不兼容海难版本DLC
reign_of_giants_compatible = false --不兼容巨人版本DLC
hamlet_compatible = false          --不兼容哈姆雷特DLC

all_clients_require_mod = true     --所有人加载mod


local keylist = {
	{ description = "0", data = 48 },
	{ description = "1", data = 49 },
	{ description = "2", data = 50 },
	{ description = "3", data = 51 },
	{ description = "4", data = 52 },
	{ description = "5", data = 53 },
	{ description = "6", data = 54 },
	{ description = "7", data = 55 },
	{ description = "8", data = 56 },
	{ description = "9", data = 57 },
	{ description = "A", data = 97 },
	{ description = "B", data = 98 },
	{ description = "C", data = 99 },
	{ description = "D", data = 100 },
	{ description = "E", data = 101 },
	{ description = "F", data = 102 },
	{ description = "G", data = 103 },
	{ description = "H", data = 104 },
	{ description = "I", data = 105 },
	{ description = "J", data = 106 },
	{ description = "K", data = 107 },
	{ description = "L", data = 108 },
	{ description = "M", data = 109 },
	{ description = "N", data = 110 },
	{ description = "O", data = 111 },
	{ description = "P", data = 112 },
	{ description = "Q", data = 113 },
	{ description = "R", data = 114 },
	{ description = "S", data = 115 },
	{ description = "T", data = 116 },
	{ description = "U", data = 117 },
	{ description = "V", data = 118 },
	{ description = "W", data = 119 },
	{ description = "X", data = 120 },
	{ description = "Y", data = 121 },
	{ description = "Z", data = 122 }
}
local max_energy = {
	{ description = "100", data = 100 },
	{ description = "110", data = 110 },
	{ description = "120", data = 120 },
	{ description = "130", data = 130 },
	{ description = "140", data = 140 },
	{ description = "150", data = 150 },
	{ description = "160", data = 160 },
	{ description = "170", data = 170 },
	{ description = "180", data = 180 },
	{ description = "190", data = 190 },
	{ description = "200", data = 200 },
}
local reiryoku_cost = {
	{ description = "1", data = 1 },
	{ description = "2", data = 2 },
	{ description = "3", data = 3 },
	{ description = "4", data = 4 },
	{ description = "5", data = 5 },
	{ description = "6", data = 6 },
	{ description = "7", data = 7 },
	{ description = "8", data = 8 },
	{ description = "9", data = 9 },
	{ description = "10", data = 10 },
	{ description = "11", data = 11 },
	{ description = "12", data = 12 },
}
local function AddTitle(title)
	return {
		name = "",
		label = title,
		options = { { description = "", data = 0 } },
		default = 0
	}
end

--mod配置
configuration_options = {
	AddTitle("人物特性设置"),
	{
		name = "max_spiritual_energy", --主键
		label = language and "灵力最大值设定" or "Set Max spiritual_energy",
		hover = "设置四糸乃的灵力最大值\n选择人物后再更改不会生效, 此时需要重选人物",
		options = max_energy,
		default = 100
	},
	{
		name = "space_shake", --主键
		label = language and "空间震" or "need the earthquake",
		hover = "人物首次生成时是否产生空间震(地裂效果)",
		options = {
			{description = "Yes", data = 1},
			{description = "No", data = 0}
		},
		default = 0
	},
	{
		name = "addcold_cost", --主键
		label = language and "身着冰铠时积累冰冻消耗的灵力" or "Spirit_energy consumed by freezing while equipped sirvon",
		hover = "装备冰铠，每次对敌人积累冰冻点数所需消耗的灵力",
		options = reiryoku_cost,
		default = 12
	},
	AddTitle("快捷键设置"),
	{
		name = "call_zadkiel_key",
		label = language and "召唤冰结傀儡" or "call mount \"zadkiel\"",
		hover = "召唤坐骑的按键",
		options = keylist,
		default = 122
	},
	AddTitle("技能设置"),
	{
		name = "zadkiel_cost",
		label = language and "召唤冰结傀儡的灵力花费" or "energy cost for call mount \"zadkiel\"",
		hover = "设定消耗多少灵力以召唤四糸乃的天使·冰结傀儡",
		options = {
			{ description = "5", data = 5 },
			{ description = "10", data = 10 },
			{ description = "15", data = 15 },
			{ description = "20", data = 20 },
			{ description = "25", data = 25 },
			{ description = "30", data = 30 },
			{ description = "35", data = 35 },
			{ description = "40", data = 40 },
		},
		default = 40
	},
	{
		name = "zadkiel_ride_cost",
		label = language and "骑乘冰结傀儡期间的持续灵力消耗" or "energy consumed during the riding \"zadkiel\"",
		options = {
			{ description = "-0/min",  data = 0 },
			{ description = "-1/min",  data = 1 },
			{ description = "-2/min",  data = 2 },
			{ description = "-3/min",  data = 3 },
			{ description = "-4/min",  data = 4 },
			{ description = "-5/min",  data = 5 },
			{ description = "-6/min",  data = 6 },
			{ description = "-7/min",  data = 7 },
			{ description = "-8/min",  data = 8 },
			{ description = "-9/min",  data = 9 },
			{ description = "-10/min", data = 10 },
			{ description = "-11/min", data = 11 },
			{ description = "-12/min", data = 12 },
			{ description = "-13/min", data = 13 },
			{ description = "-14/min", data = 14 },
			{ description = "-15/min", data = 15 },
		},
		default = 10
	},
	{
		name = "shield_cooldown",
		label = language and "护盾冷却时间" or "shield cooldown",
		hover = "被动技能(冰雪护盾)的冷却时长",
		options = {
			{ description = "5",  data = 5 },
			{ description = "6",  data = 6 },
			{ description = "7",  data = 7 },
			{ description = "8",  data = 8 },
			{ description = "9",  data = 9 },
			{ description = "10", data = 10 },
			{ description = "11", data = 11 },
			{ description = "12", data = 12 },
			{ description = "13", data = 13 },
			{ description = "14", data = 14 },
			{ description = "15", data = 15 },
		},
		default = 10
	},
	{
		name = "shield_cost",
		label = language and "护盾灵力消耗" or "spiritual_energy cost of shield",
		hover = "(被动技能)冰雪护盾抵挡伤害时的灵力消耗",
		options = reiryoku_cost,
		default = 10
	},
}
