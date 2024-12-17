local function fireKillAllRemoteEvent()
    local players = game:GetService("Players")
    local remoteEvent =game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DamageEvent")
    for _, player in ipairs(players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = "Rifle",
                [2] = player.Character.Humanoid,
                [3] = player.Character.Torso,
                [4] = 0,
                [5] = 0.085,
                [6] = 0.025,
                [7] = 40,
                [8] = 100
            }
            remoteEvent:FireServer(unpack(args))
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(fireKillAllRemoteEvent)
