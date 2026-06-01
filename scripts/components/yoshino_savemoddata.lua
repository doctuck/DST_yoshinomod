--这个组件是用来保存一些方便控制的数据，没有其他额外意义
--为防止污染全局变量存储池，特意添加此组件

local SaveModData = Class(function(self, inst)
        self.inst = inst
        self.array_data = {}
    end,
    nil,
    {}
)

function SaveModData:OnSave()
    return {
        array_data = self.array_data,
    }
end

function SaveModData:OnLoad(data)
    if data ~= nil then
        self.array_data = data.array_data
    end
end


return SaveModData