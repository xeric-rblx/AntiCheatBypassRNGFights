print("|| Xeric Hub || working on it...")
a=function(b)b=string.lower(b)return string.find(b,"anti")or string.find(b,"cheat")or string.find(b,"meter")end
c=function(d)for _,e in ipairs(d:GetDescendants())do if e:IsA("Instance")and e.Name and a(e.Name)then pcall(function()e:Destroy()end)end end end
c(game)
print("|| Xeric Hub || removed anti-cheat, if you get banned, please report it here: discord.gg/MvH8e4rsNf")
