game:GetService("RunService").RenderStepped:Connect(function()
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("GunStorage"):WaitForChild("Damage")
    local players = game:GetService("Players"):GetPlayers()

    local args = {}


    for _, player in ipairs(players) do
        if player.Character and player ~= game.Players.LocalPlayer then
            local playerArgs = {
                [1] = player.Character:FindFirstChild("BA-11s"),
                [2] = workspace:WaitForChild(player.Name), 
                [3] = player.Character:FindFirstChild("HumanoidRootPart")
            }
            table.insert(args, playerArgs)
        end
    end
    for _, playerArgs in ipairs(args) do
        remote:FireServer(unpack(playerArgs))
        wait(0.1)
    end
end)
