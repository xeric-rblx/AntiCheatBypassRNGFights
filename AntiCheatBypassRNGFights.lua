local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Hello!",
    Text = "This script is to bypass the anti-cheat of RNG Fights, the anti-cheat is currently being removed.",
    Duration = 3600,
    Button1 = "OK",
    Callback = function()
        print("Notification closed")
    end
})

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Credits",
    Text = "made by fluflu",
    Duration = 3600,
    Button1 = "idgaf",
    Callback = function()
        print("Notification closed")
    end
})

print("|| Xeric Hub || working on it...")

local function hasAntiCheatKeywords(name)
    local lowered = string.lower(name)
    return string.find(lowered, "anti") or string.find(lowered, "cheat") or string.find(lowered, "meter")
end

local function removeAntiCheatComponents(root)
    for _, descendant in ipairs(root:GetDescendants()) do
        if descendant:IsA("Instance") and descendant.Name and hasAntiCheatKeywords(descendant.Name) then
            pcall(function()
                descendant:Destroy()
            end)
        end
    end
end

removeAntiCheatComponents(game)

print("|| Xeric Hub || removed anti-cheat, if you get banned, please report it here: discord.gg/MvH8e4rsNf")
