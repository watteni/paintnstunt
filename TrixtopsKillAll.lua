local remote = game:GetService("ReplicatedStorage"):WaitForChild("RCLStorage"):WaitForChild("Remotes"):WaitForChild("HitEvent")
local players = game:GetService("Players"):GetPlayers()

game:GetService("RunService").RenderStepped:Connect(function()
    for _, player in ipairs(players) do
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            local args = {
                [1] = "scrub",
                [2] = humanoid,
                [3] = 100
            }
            remote:FireServer(unpack(args))
        end
    end
end)
