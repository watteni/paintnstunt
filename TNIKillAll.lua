local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local remote = ReplicatedStorage:WaitForChild("RemotesFolder"):WaitForChild("GunDamage")

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local args = {
                    [1] = player,
                    [2] = head,
                    [3] = head.Position
                }
                remote:InvokeServer(unpack(args))
            end
        end
    end
end)
