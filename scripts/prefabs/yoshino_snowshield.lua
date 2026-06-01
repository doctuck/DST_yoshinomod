local ANIM_SHIELD_TEXTURE = resolvefilepath("images/inventoryimages/yoshino_snowshield.tex") -- 这里一定要用 resolvefilepath() 包装一下，否则会出现找不到贴图的错误
local REVEAL_SHADER = "shaders/vfx_particle_reveal.ksh"                                      -- 系统里的一个shader，跟渲染有关
local assets = {
    Asset("IMAGES", ANIM_SHIELD_TEXTURE),              --贴图加载
    Asset("SHADER", REVEAL_SHADER),                    --shader加载
    Asset("ANIM", "anim/yoshino_snowshield.zip")       --动画包加载
}
local prefabs = {}

local function ShowFX(inst)
    inst.AnimState:SetMultColour(1,1,1,1)
end
local function HideFX(inst)
    inst.AnimState:SetMultColour(0,0,0,0)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()                      --添加变化(大小、位置、形状等)
    inst.entity:AddAnimState()                      --添加动画状态
    --inst.entity:AddSoundEmitter()                   --添加声音组件
    inst.entity:AddNetwork()                        --加入服务器
    inst.entity:SetPristine()                       --同步初始化

    inst.AnimState:SetBank("yoshino_snowshield")    --地上动画，scml文件中的动画集合名
    inst.AnimState:SetBuild("yoshino_snowshield")   --地上动画素材包，zip文件名
    inst.AnimState:PlayAnimation("idle", true)      --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名
    --inst.AnimState:SetScale(1.2, 1.2, 1.2)          --放大倍率
    inst.AnimState:SetLayer(LAYER_WORLD) --图层设置(详见官方data/scripts/constants.lua的全局变量)
    inst.AnimState:SetSortOrder(4)                  --图层排序，用于相同层级时的判断,0表示最底层
    --inst.AnimState:SetDeltaTimeMultiplier(0.5)      --设置动画播放的倍速
    --inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround) --设置方向地面定向，将特效贴地

    MakeInventoryPhysics(inst)   --可物理模拟
    MakeInventoryFloatable(inst) --可漂浮

    inst:AddTag("FX")            --该预制物是特效
    inst:AddTag("NOCLICK")       --该特效预制物不可被点击
    inst:AddTag("snowshield")   --添加标签用于检索和判断

    if not TheWorld.ismastersim then
        return inst
    end

    --inst:AddComponent("inspectable") --可检查组件
    inst:AddComponent("timer")  --计时器组件
    inst:ListenForEvent("timerdone", function(inst, data)
        if data and data.name == "yoshino_snowshield" then
            HideFX(inst)
            inst:Remove()
        end
    end)

    --写两个给外部使用的透明度调节接口，不一定用到
    inst.ShowAnim = ShowFX
    inst.HideAnim = HideFX

    inst:ListenForEvent("ms_playerdespawn", function() --玩家离开世界时
        inst:Remove()      --移除该特效
    end, TheWorld)

    return inst
end

return Prefab("yoshino_snowshield", fn, assets, prefabs)
