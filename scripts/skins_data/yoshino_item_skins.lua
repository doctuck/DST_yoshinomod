--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--||||||||||||||这一页放着各种模组物品的皮肤||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

--四糸奈的皮肤
--初始款式在物品创建时就有了，不用再写

YOSHINO_API.MakeItemSkin("yoshinon", "yoshinon_skin1", {
    name = "枫花之日",          --皮肤的名字
    rarity = "祖传",            --优先级（非官方定义的会自己构建）
    rarityorder = 2,            --优先度排序，但似乎没什么用
    raritycorlor = { 199/255, 11/255, 67/255, 1 },  --优先度的字体颜色

    atlas = "images/inventoryimages/yoshinon.xml",  --皮肤物品栏贴图
    image = "yoshinon_skin1",
	baseatlas = "images/inventoryimages/yoshinon.xml",	--如果替换了就改，否则不传
	baseimage = "yoshinon_none",			--如果基础贴图与预设物不同名就改，否则不传

    build = "yoshinon_skin1",   			--皮肤放在地上的材质包
    bank = "yoshinon",          			--放在地上时使用的动画
    anim = "idle",              			--放在地上时，播放的动画
    basebuild = "yoshinon",     			--基础构建，不能省略
    basebank = "yoshinon",      			--如果替换了bank就传 不需要就不传
    baseanim = "idle",          			--如果替换了anim就传 不需要就不传

    init_fn = function(inst)
        inst.yoshinon_skinner = "yoshinon_skin1"   --给物品增加一个皮肤的识别属性（同时也是贴图替换时的build）
    end,
    clear_fn = function(inst)        --清理时的回调函数
        inst.AnimState:SetBank("yoshinon")
        inst.AnimState:SetBuild("yoshinon")
        inst.AnimState:PlayAnimation("idle")
        inst.yoshinon_skinner = nil   --清空
    end,
})
YOSHINO_API.MakeItemSkin("yoshinon", "yoshinon_skin2", {
    name = "捣蛋幽灵",
    rarity = "祖传",
    rarityorder = 3,
    raritycorlor = { 199/255, 11/255, 67/255, 1 },

    atlas = "images/inventoryimages/yoshinon.xml",
    image = "yoshinon_skin2",
	baseatlas = "images/inventoryimages/yoshinon.xml",
	baseimage = "yoshinon_none",

    build = "yoshinon_skin2",
    bank = "yoshinon",
    anim = "idle",
    basebuild = "yoshinon",
    basebank = "yoshinon",

    baseanim = "idle",
    init_fn = function(inst)        --初始化交换在手上的动画
        inst.yoshinon_skinner = "yoshinon_skin2"
    end,
    clear_fn = function(inst)        --清理时的回调函数
        inst.AnimState:SetBank("yoshinon")
        inst.AnimState:SetBuild("yoshinon")
        inst.AnimState:PlayAnimation("idle")
        inst.yoshinon_skinner = nil
    end,
})