local function fireDamageRemote(player)
    local args = {
        [1] = {
            ["Limb"] = player.Character:FindFirstChild("Right Arm"),
            ["Humanoid"] = player.Character.Humanoid
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("DamageRemote"):FireServer(unpack(args))
end

game:GetService("RunService").RenderStepped:Connect(function()
    local players = game:GetService("Players"):GetPlayers()

    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer and player.Character then
            fireDamageRemote(player)
        end
    end
end)
