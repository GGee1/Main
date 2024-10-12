function loadBuildData(data)
    local blueprint = {}
    for line in string.gmatch(data, "[^\n]+") do
        local blockData = split(line, ", ")
        table.insert(blueprint, {
            blockType = blockData[1],
            position = Vector3.new(tonumber(blockData[2]), tonumber(blockData[3]), tonumber(blockData[4])),
            scale = Vector3.new(tonumber(blockData[5]), tonumber(blockData[6]), tonumber(blockData[7])),
            color = Color3.fromRGB(tonumber(blockData[8]), tonumber(blockData[9]), tonumber(blockData[10]))
        })
    end
    return blueprint
end
