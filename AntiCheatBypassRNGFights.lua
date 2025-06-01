local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 5)

if not PlayerGui then
    warn("PlayerGui not found!")
    return
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntiCheatWarningGui"
screenGui.Parent = PlayerGui
screenGui.ResetOnSpawn = false
screenGui.Enabled = true

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2
frame.Parent = screenGui

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 280, 0, 50)
warningLabel.Position = UDim2.new(0.5, -140, 0, 10)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "This script only bypasses anticheat. Do you wish to continue?"
warningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
warningLabel.TextScaled = true
warningLabel.Font = Enum.Font.SourceSans
warningLabel.Parent = frame

local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 100, 0, 40)
yesButton.Position = UDim2.new(0.25, -50, 0, 80)
yesButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
yesButton.Text = "Yes"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextScaled = true
yesButton.Font = Enum.Font.SourceSans
yesButton.Parent = frame

local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0, 100, 0, 40)
noButton.Position = UDim2.new(0.75, -50, 0, 80)
noButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
noButton.Text = "No"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextScaled = true
noButton.Font = Enum.Font.SourceSans
noButton.Parent = frame

yesButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    local success, result = pcall(function()
        return loadstring(HttpService:GetAsync("https://raw.githubusercontent.com/xeric-rblx/AntiCheatBypassRNGFights/refs/heads/main/AntiCheatBypassRNGFights.lua"))()
    end)
    if not success then
        warn("Failed to execute script: " .. tostring(result))
    end
end)

noButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
