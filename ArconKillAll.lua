local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local remote = ReplicatedStorage:WaitForChild("Weapon_System"):WaitForChild("Events"):WaitForChild("Damage")

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character.Humanoid
            local weapon = Players.LocalPlayer.Character:FindFirstChild("M-84")
            
            if weapon then
                remote:FireServer(
                    humanoid,
                    100,  -- Set a high enough value to kill the target
                    weapon,
                    {
                        ["Rays"] = 1,
                        ["HeadDamage"] = 12,
                        ["FireMode"] = "Auto",
                        ["FireRate"] = 0.08,
                        ["ReloadAmount"] = 2,
                        ["BodyDamage"] = 10,
                        ["RepConfig"] = {
                            ["DamageNPCs"] = true,
                            ["HeadDamage"] = 12,
                            ["Recharge"] = 0,
                            ["Rays"] = 1,
                            ["WeaponImage"] = "rbxassetid://12684663675",
                            ["TeamKill"] = false,
                            ["Range"] = 400,
                            ["FireRate"] = 0.08,
                            ["CanCharge"] = false,
                            ["BodyDamage"] = 10,
                            ["MaxBattery"] = 100,
                            ["ReloadAmount"] = 2,
                            ["ReloadTime"] = 0.02,
                            ["LossAmount"] = 2,
                            ["Spread"] = 1,
                            ["FireMode"] = "Auto"
                        },
                        ["Config"] = weapon,
                        ["ReloadTime"] = 0.02,
                        ["Range"] = 400,
                        ["Spread"] = 1,
                        ["MaxBattery"] = 100
                    }
                )
            end
        end
    end
end)
