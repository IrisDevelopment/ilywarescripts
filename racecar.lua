game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=70 game.Players.LocalPlayer.Character.Humanoid.JumpPower=0.0001 Float_Height="-1.1" AnimationId="129342287" local a=Instance.new("Animation") a.AnimationId="rbxassetid://"..AnimationId local a=game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(a) a:Play() a:AdjustSpeed(1) for a,a in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if a.ClassName=="Part"then a.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end local a=1 G=game _=wait p=G:GetService("Players").LocalPlayer.Character p:FindFirstChild("Humanoid").HipHeight=Float_Height _(1.5) t=.4 for a=1,a do repeat p:FindFirstChild("Humanoid").HipHeight=Float_Height-n _(t) p:FindFirstChild("Humanoid").HipHeight=Float_Height+n _(t)until p:FindFirstChild("Humanoid").Health==0 end
print("Hold space for more control.")