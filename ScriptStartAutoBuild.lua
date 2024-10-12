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
