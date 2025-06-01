local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)

-- Check if PlayerGui exists
if not PlayerGui then
    warn("PlayerGui not found")
    return
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntiCheatWarningGui"
screenGui.Parent = PlayerGui
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true -- Ensure GUI isn't offset by topbar

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2
frame.ZIndex = 10
frame.Parent = screenGui

-- Create Warning Label
local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 280, 0, 50)
warningLabel.Position = UDim2.new(0.5, -140, 0, 10)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "This script only bypasses anticheat. Do you wish to continue?"
warningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
warningLabel.TextScaled = true
warningLabel.TextWrap = true
warningLabel.Font = Enum.Font.SourceSansBold
warningLabel.ZIndex = 11
warningLabel.Parent = frame

-- Create Yes Button
local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 100, 0, 40)
yesButton.Position = UDim2.new(0.25, -50, 1, -50)
yesButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
yesButton.Text = "Yes"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextScaled = true
yesButton.Font = Enum.Font.SourceSansBold
yesButton.ZIndex = 11
yesButton.Parent = frame

-- Create No Button
local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0, 100, 0, 40)
noButton.Position = UDim2.new(0.75, -50, 1, -50)
noButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
noButton.Text = "No"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextScaled = true
noButton.Font = Enum.Font.SourceSansBold
noButton.ZIndex = 11
noButton.Parent = frame

-- Add corner radius to frame for better visuals
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = frame

-- Add corner radius to buttons
local yesButtonCorner = Instance.new("UICorner")
yesButtonCorner.CornerRadius = UDim.new(0, 6)
yesButtonCorner.Parent = yesButton

local noButtonCorner = Instance.new("UICorner")
noButtonCorner.CornerRadius = UDim.new(0, 6)
noButtonCorner.Parent = noButton

-- Yes Button Functionality
yesButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    local success, result = pcall(function()
        local code = HttpService:GetAsync("https://raw.githubusercontent.com/xeric-rblx/AntiCheatBypassRNGFights/refs/heads/main/AntiCheatBypassRNGFights.lua")
        local func = loadstring(code)
        if func then
            return func()
        else
            error("Failed to load script")
        end
    end)
    if not success then
        warn("Failed to execute script: " .. tostring(result))
    else
        print("Script executed successfully")
    end
end)

-- No Button Functionality
noButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

print("GUI created successfully")
