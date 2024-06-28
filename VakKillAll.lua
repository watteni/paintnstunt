local function fireKillAllRemoteEvent()
    local players = game:GetService("Players")
    local remoteEvent =game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Game"):WaitForChild("RE"):WaitForChild("Damage")
    for _, player in ipairs(players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = 100,
                [2] = player.Character.Humanoid
            }
            remoteEvent:FireServer(unpack(args))
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(fireKillAllRemoteEvent)
