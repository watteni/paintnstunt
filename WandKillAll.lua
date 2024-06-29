local chatremote = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local chatargs = {
    [1] = "avada kedavra",
    [2] = "All"
}
local castremote = game:GetService("Players").LocalPlayer.Character.Wand.ToServer
local players = game:GetService("Players"):GetPlayers()

game:GetService("RunService").RenderStepped:Connect(function()
    for _, player in ipairs(players) do
        local head = player.Character:FindFirstChild("Head")
        if head and player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            chatremote:FireServer(unpack(chatargs))    
            local castargs = {
                [1] = "Cast",
                [2] = head.position,
                [3] = head.position,
                [4] = false,
                [5] = game:GetService("Players").LocalPlayer.Character.Wand,
                [6] = false
            }
            castremote:FireServer(unpack(castargs))
        end
    end
end)
