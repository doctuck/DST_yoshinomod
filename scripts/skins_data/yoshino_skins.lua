
-- 人物皮肤
local function MakeYOSHINOSkin(name, data, notemp, free)
	local d = {}
	d.rarity = "典藏"
	d.rarityorder = 2
	d.raritycorlor = { 0 / 255, 255 / 255, 249 / 255, 1 }
	d.release_group = -1001
	d.skin_tags = { "BASE", "yoshino", "CHARACTER" }
	d.skins = {
		normal_skin = name,
		ghost_skin = "ghost_yoshino_build"
	}
	--if not free then
	--	d.checkfn = YOSHINO_API.YOSHINOSkinCheckFn
	--	d.checkclientfn = YOSHINO_API.YOSHINOSkinCheckFn
	--end
	d.share_bigportrait_name = "yoshino"
	d.FrameSymbol = "Reward"
    --如果传入数据缺失，默认使用上面的
    --否则遍历传进来的数据进行覆盖
	for k, v in pairs(data) do
		d[k] = v
	end
    --创建皮肤
	YOSHINO_API.MakeCharacterSkin("yoshino", name, d)
	--if not notemp then
	--	local d2 = shallowcopy(d)
	--	d2.rarity = "限时体验"
	--	d2.rarityorder = 80
	--	d2.raritycorlor = { 0.957, 0.769, 0.188, 1 }
	--	d2.FrameSymbol = "heirloom"
	--	d2.name = data.name .. "(限时)"
	--	YOSHINO_API.MakeCharacterSkin("yoshino", name .. "_tmp", d2)
	--end
end


MakeYOSHINOSkin("yoshino_none", {
	name = "四糸乃", -- 皮肤的名称
	des = "四糸乃的休闲衣装", -- 皮肤界面的描述
	quotes = "好、好的……我会努力的", -- 选人界面的描述
	rarity = "Character", -- 稀有度 官方不存在的珍惜度则直接覆盖字符串
	rarityorder = 1, -- 稀有度的排序 用于按优先级排序 基本没啥用
	raritycorlor = { 153 / 255, 255 / 255, 255 / 255, 1 }, -- {R,G,B,A}
	skins = {
        normal_skin = "yoshino",
        ghost_skin = "ghost_yoshino_build",
    },
	build_name_override = "yoshino",
	share_bigportrait_name = "yoshino_none",
},true,true)

MakeYOSHINOSkin("yoshino_skin1",{
    name = "枫色祈愿",      --皮肤的显示名称
    des = "秋日祭, 赏花大会等郊游时穿的衣装",        --选人界面的皮肤描述
    quotes = "一起...去郊游吗...?",    --选人界面，底下的台词描述
    rarity = "Elegant",     --稀有度 官方不存在的珍惜度则直接覆盖字符串
    rarityorder = 2, -- 稀有度的排序 用于按优先级排序 基本没啥用
    raritycorlor = {255/255,215/255,0/255,1},
    assets = {
            Asset("ANIM", "anim/yoshino_skin1.zip"),
            Asset("ANIM", "anim/ghost_yoshino_build.zip")
        },
    skins = {
        normal_skin = "yoshino_skin1",
        ghost_skin = "ghost_yoshino_build"
    },
    build_name_override = "yoshino_skin1",  --皮肤选择图标
    share_bigportrait_name = "yoshino_skin1",   --皮肤大图采用的图标（记得在xml里Element name处的".tex"要改成"_oval.tex"才能生效）
},true,true)
