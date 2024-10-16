-- Função para dividir a string de dados em uma tabela
function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

-- Função para carregar e processar os dados do arquivo .build
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

-- Carregar os dados do arquivo
local blueprint = loadBuildData(buildData)
