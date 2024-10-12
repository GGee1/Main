-- Função que escolhe o bloco correto
function getBlockByType(blockType)
    for _, block in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if block.Name == blockType then
            return block
        end
    end
    return nil -- Caso o bloco não seja encontrado
end

-- Função que coloca, escala e pinta o bloco
function placeBlock(blockData)
    local character = game.Players.LocalPlayer.Character
    local humanoid = character:FindFirstChild("Humanoid")
    
    if humanoid then
        local tool = getBlockByType(blockData.blockType)
        if tool then
            tool.Parent = character
            humanoid:EquipTool(tool)
            
            -- Colocar o bloco
            local args = {
                [1] = CFrame.new(blockData.position) -- Posição do bloco
            }
            game:GetService("ReplicatedStorage").PlaceBlock:FireServer(unpack(args))
            
            -- Escalar o bloco
            local argsScale = {
                [1] = tool, -- Referência ao bloco que foi colocado
                [2] = blockData.scale -- Escala do bloco
            }
            game:GetService("ReplicatedStorage").ResizeBlock:FireServer(unpack(argsScale))
            
            -- Pintar o bloco
            local argsColor = {
                [1] = tool, -- Referência ao bloco que foi colocado
                [2] = blockData.color -- Cor do bloco
            }
            game:GetService("ReplicatedStorage").PaintBlock:FireServer(unpack(argsColor))
        end
    end
end

-- Função que percorre toda a planta baixa e constroi, escala e pinta os blocos
function build()
    for _, blockData in ipairs(blueprint) do
        placeBlock(blockData)
        wait(0.5) -- Pequeno delay para cada bloco
    end
end

-- Iniciar a construção
build()
