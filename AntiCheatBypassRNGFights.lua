local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Hello!",
    Text = "This script is to bypass the anti-cheat of RNG Fights, the anti-cheat is being removed.",
    Duration = 3600,
    Button1 = "OK",
    Callback = function()
        print("Notification closed")
    end
})

print("|| Xeric Hub || working on it...")
a=function(b)b=string.lower(b)return string.find(b,"anti")or string.find(b,"cheat")or string.find(b,"meter")end
c=function(d)for _,e in ipairs(d:GetDescendants())do if e:IsA("Instance")and e.Name and a(e.Name)then pcall(function()e:Destroy()end)end end end
c(game)
print("|| Xeric Hub || removed anti-cheat, if you get banned, please report it here: discord.gg/MvH8e4rsNf")
