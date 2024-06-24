game:GetService("RunService").RenderStepped:Connect(function()
    local players = game:GetService("Players"):GetPlayers()

    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local args = {
                [1] = "Lasgun",
                [2] = player.Character.Humanoid,
                [3] = 12 
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("damage_event"):FireServer(unpack(args))
        end
    end
end)
