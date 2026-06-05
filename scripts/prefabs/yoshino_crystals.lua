
--动漫里灵结晶的发音貌似是(sephira ?) 但无法确定，最终还是用了比较正式的crystal（结晶）表示
local function makecrystals(prefabname,animname)
    --资源加载
    local assets = {
        Asset("IMAGE", "images/inventoryimages/"..prefabname..".tex"), --物品栏贴图
        Asset("ATLAS", "images/inventoryimages/"..prefabname..".xml"),
        Asset("ANIM", "anim/yoshino_crystals.zip"),                 --放地上时的动画
    }
    --添加预制物的预制物
    local prefabs = {}
    --作祟复活时触发的函数
    local function onhuant(inst,doer)
        if doer~=nil and doer:HasTag("yoshino") then
            doer:PushEvent("respwanbycrystal",{data= "bycrystal"})
            inst:Remove()
            return true
        end
        return false
    end
    --吃下后触发的函数
    local function oneatenfn(inst, eater)
        if eater.components.spiritual_energy ~= nil then    --回复灵力值
            eater.components.spiritual_energy:DoDelta(TUNING.MOD_YOSHINO.CRYSTALS_DELTA)
        end
        --猪人吃下直接变疯猪 (备注：无论吃多少个，一位猪人死亡均只掉落一个灵结晶)
        if inst:HasTag("yoshino_anticrystal") and eater.prefab == "pigman" and eater.components.werebeast ~= nil then
            eater.components.werebeast:TriggerDelta(4)
            if not eater.components.lootdropper then eater:AddComponent("lootdropper") end
            table.insert(eater.components.lootdropper.loot, "yoshino_crystal")      --吃下反灵结晶的猪人死亡时必定额外掉落灵结晶
        end
    end
    --创建预制物
    local function fn()
        local inst = CreateEntity() --定义 inst变量 指代 创建实体函数

        --/////////////////////////////////////////////////////////////////////////////////////////
        --//Entity组件是在主客机端都会运行的，这部分组件必须写在网络代码片段的上面，包含以下内容：
        --//Transform：变换组件，控制Prefab的位置、方向、缩放等等。
        --//AnimState：动画组件，控制Prefab的材质(Build)，动画集合(Bank)和动画播放(Animation)。
        --//Phiysics：物理组件，控制Prefab的物理行为，比如速度，碰撞类型等等。
        --//Light：光照组件，添加该组件可使得Prefab成为一个光源。
        --//Network：网络组件，添加与否决定了一个Prefab在主机上生成时，是否会被客户端“看”到。
        --//MapEntity：地图实体组件，使用该组件可以为Prefab在小地图上创建一个图标。
        --//SoundEmitter：声音组件，控制Prefab的声音集合和播放。
        --//添加一个Entity组件的代码是inst.entity:AddXXX()
        --/////////////////////////////////////////////////////////////////////////////////////////

        inst.entity:AddTransform()         --添加变化(大小、位置、形状等)
        inst.entity:AddAnimState()         --添加动画状态
        --inst.entity:AddSoundEmitter()      --添加声音组件
        inst.entity:AddDynamicShadow()     --添加阴影
        inst.entity:AddNetwork()           --加入服务器

        local float_anim = { bank = "yoshino_crystals", anim = animname }                --漂浮使用的动画
        MakeInventoryPhysics(inst)                                            --可物理模拟（如果没有这个，则无法进行相关action）
        MakeInventoryFloatable(inst, "small", 0.2, 0.80, nil, nil, float_anim) --可漂浮

        inst.DynamicShadow:SetSize(1, 0.5)             --设置阴影大小
        inst.AnimState:SetBank("yoshino_crystals")     --地上动画，scml文件中的动画集合名
        inst.AnimState:SetBuild("yoshino_crystals")    --地上动画素材包，zip文件名
        inst.AnimState:PlayAnimation(animname, true)   --默认播放的动画，需要指定scml文件里的动画集合下的具体动画名, 第2个参数表示是否循环播放
        --inst.AnimState:SetScale(1.2, 1.2, 1.2) --放大倍率

        inst:AddTag(prefabname)         --添加物品标签
        inst:AddTag("nosteal")                 --不可被偷
        inst:AddTag("recoverspiritual")     --灵力恢复标签
        
        inst.entity:AddLight()                 --添加光源组件
        inst.Light:SetFalloff(0.4)               --光源衰减，取值(0.05~1)，衰减越高，光线传播距离越短小
        inst.Light:SetIntensity(0.6)           --光源强度，取值(0~1)
        inst.Light:SetRadius(0.2)              --光源半径,0.6个单位=1码
        inst.Light:Enable(true)               --初始设置为开
        inst.Light:SetColour(180 / 255, 195 / 255, 50 / 255)--光源颜色

        inst.entity:SetPristine()        --同步初始化

        if not TheWorld.ismastersim then --主客机判断（在此行以上为主客机共有，这行之后，客机会在if中运行完并停下，只有主机和服务端才能往下走）
            return inst
        end

        inst:AddComponent("inspectable") --该预设物可检查

        --加载物品图标
        inst:AddComponent("inventoryitem") --该预设物是可放进背包的物品
        inst.components.inventoryitem.imagename = prefabname
        inst.components.inventoryitem.atlasname = "images/inventoryimages/"..prefabname..".xml"
        --inst.components.inventoryitem:SetOnPickupFn(OnPickup)   --拾起时调用对应函数
        --inst.components.inventoryitem:SetOnDroppedFn(OnDropped) --掉落时调用对应函数
        inst.components.inventoryitem:SetSinks(false)           --设置true可以落水，掉海里直接消失。

        inst:AddComponent("waterproofer")                       --防水（比防雨高级）
        inst.components.waterproofer.effectiveness = 0          --但是无法让四糸乃防水（取值0~1）

        inst:AddComponent("edible")             --可食用
        inst.components.edible.healthvalue = (prefabname == "yoshino_anticrystal") and -50 or 0
        inst.components.edible.hungervalue = 0
        inst.components.edible.foodtype = FOODTYPE.GENERIC
        inst.components.edible.sanityvalue = 0
        inst.components.edible.temperaturedelta = 0  --吃下后的温度变化
        inst.components.edible.temperatureduration = 0  --吃下后的温度变化持续时间？
        inst.components.edible:SetOnEatenFn(oneatenfn)

        inst:AddComponent("stackable")  --可堆叠
        --（备注：组件初始化默认就是堆叠20，所以就不用再写了，非要写的话一定要使用官方TUNING表里固定的几个堆叠数字，否则无法适配“防卡很多招 workshop-3050607025”<--修改官方全局变量的笨蛋，不要用！）
        --inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM --最大堆叠20个

        inst:AddComponent("tradable")   --可交易组件，有了这个就可以给猪人
        
        inst:AddComponent("yoshino_savemoddata")    --保存数据用的，但这里不使用其功能，仅作为动作所需组件


        if prefabname == "yoshino_crystal" then
            MakeHauntable(inst, TUNING.HAUNT_COOLDOWN_SMALL, TUNING.HAUNT_INSTANT_REZ) --可被鬼魂作祟
            inst.components.hauntable:SetOnHauntFn(onhuant) --作祟时触发的函数
        else
            MakeHauntableLaunch(inst) --可被鬼魂作祟并能够弹起来
        end
        return inst
    end
    return Prefab(prefabname, fn, assets, prefabs)
end

return makecrystals("yoshino_crystal","idle_crystal"),
       makecrystals("yoshino_anticrystal","idle_anticrystal")
