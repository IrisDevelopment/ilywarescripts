--[[ SIMILAR BUT NOT HATHUB BY Jauhgn#4229 / Maggie#3339 depending on which account im using
	I could've looked at the leaked version's source and just changed the position and rotation but I didn't so fuck you
	Press n like 9 times to read the secret message
	Keybinds: e, t, u, g, n
]]

x = 10
z = 10
g = 10
e = 10
b = 10
n = 1
l = 1
game["Run Service"].RenderStepped:connect(function()
    settings().Physics.AllowSleep = false
    setsimulationradius(math.huge*math.huge,math.huge*math.huge)

end)

if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
character = game.Players.LocalPlayer.Character
eye1 = game.Players.LocalPlayer.Character.NarwhalShoulderBuddy.Handle
eye2 = game.Players.LocalPlayer.Character.TopazHummingWings.Handle
smile1 = game.Players.LocalPlayer.Character["Kate Hair"].Handle
smile2 = game.Players.LocalPlayer.Character["Pink Hair"].Handle
smile3 = game.Players.LocalPlayer.Character["LavanderHair"].Handle
smile4 = game.Players.LocalPlayer.Character["Hat1"].Handle
eyebrow1 = game.Players.LocalPlayer.Character["Robloxclassicred"].Handle
eyebrow2 = game.Players.LocalPlayer.Character["Pal Hair"].Handle

eyebrow1.Mesh:Destroy()
eyebrow1.AccessoryWeld:Destroy()
eyebrow1.CanCollide = false
eyebrow1.Anchored = false

eyebrow2.Mesh:Destroy()
eyebrow2.AccessoryWeld:Destroy()
eyebrow2.CanCollide = false
eyebrow2.Anchored = false

smile1.Mesh:Destroy()
smile1.AccessoryWeld:Destroy()
smile1.CanCollide = false
smile1.Anchored = false

smile2.Mesh:Destroy()
smile2.AccessoryWeld:Destroy()
smile2.CanCollide = false
smile2.Anchored = false

smile3.Mesh:Destroy()
smile3.AccessoryWeld:Destroy()
smile3.CanCollide = false
smile3.Anchored = false

smile4.Mesh:Destroy()
smile4.AccessoryWeld:Destroy()
smile4.CanCollide = false
smile4.Anchored = false

eye1.SpecialMesh:Destroy()
eye1.AccessoryWeld:Destroy()
eye1.CanCollide = false
eye1.Anchored = false

eye2.SpecialMesh:Destroy()
eye2.AccessoryWeld:Destroy()
eye2.CanCollide = false
eye2.Anchored = false

local function align(i,v)
local att0 = Instance.new("Attachment", i)
att0.Position = Vector3.new(0,0,0)
local att1 = Instance.new("Attachment", v)
att1.Position = Vector3.new(0,0,0)
local AP = Instance.new("AlignPosition", i)
AP.Attachment0 = att0
AP.Attachment1 = att1
AP.RigidityEnabled = false
AP.ReactionForceEnabled = false
AP.ApplyAtCenterOfMass = true
AP.MaxForce = 9999999
AP.MaxVelocity = math.huge
AP.Responsiveness = 160
local AO = Instance.new("AlignOrientation", i)
AO.Attachment0 = att0
AO.Attachment1 = att1
AO.ReactionTorqueEnabled = true
AO.PrimaryAxisOnly = false
AO.MaxTorque = 9999999
AO.MaxAngularVelocity = math.huge
AO.Responsiveness = 200
end

align(eye1, character["Torso"])
align(eye2, character["Torso"])
align(smile1, character["Torso"])
align(smile2, character["Torso"])
align(smile3, character["Torso"])
align(smile4, character["Torso"])
align(eyebrow1, character["Torso"])
align(eyebrow2, character["Torso"])

eye1.Attachment.Rotation = Vector3.new(0,0,0)
eye1.Attachment.Rotation = Vector3.new(0,0,0)
smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)


character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment1"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment2"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment3"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment4"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment5"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment6"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment7"
character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment8"



character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,4.4,0)
character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,4.4,0)
character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)


--[[local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.R then
            
            eye1.Attachment.Rotation = Vector3.new(0,0,0)
            eye2.Attachment.Rotation = Vector3.new(0,0,0)
            smile1.Attachment.Rotation = Vector3.new(-90,90,85)
            smile2.Attachment.Rotation = Vector3.new(-90,90,95)
            smile3.Attachment.Rotation = Vector3.new(-90,90,70)
            smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		
		    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
            character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
            character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
            character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
            character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.55,0)
            character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.55,0)
			character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
			character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)

        end
    end
end
end)]]

local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
              if e == 10 then
                eye1.Attachment.Rotation = Vector3.new(0,0,0)
                eye2.Attachment.Rotation = Vector3.new(0,0,0)
                smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
                smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
                smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
                smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
                character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
                character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
                character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
                character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
                character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,4.4,0)
                character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,4.4,0)
		        character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
		        character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)
		        e = 20
              elseif e == 20 then
                    smile1.Attachment.Rotation = Vector3.new(-90,90,85)
                    smile2.Attachment.Rotation = Vector3.new(-90,90,95)
                    smile3.Attachment.Rotation = Vector3.new(-90,90,70)
                    smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		
		            character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.55,0)
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.55,0)
			        character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
			        character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)
			        e = 10 

    end
	            
    end
end
end
end)



local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
 
        if input.KeyCode == Enum.KeyCode.T then
          if b == 10 then
            eye1.Attachment.Rotation = Vector3.new(0,0,0)
            eye2.Attachment.Rotation = Vector3.new(0,0,0)
            smile1.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile2.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile3.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile4.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-90)
 
            character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
            character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
            character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.75,0)
            character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.75,0)
            character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.75,0)
            character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.75,0)
		    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(2,-16,0)
		    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(-2,-16,0)
		    b = 20
        elseif b == 20 then
	    	character:WaitForChild("Torso").Attachment7.Position = Vector3.new(2,9,0)
		    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(-2,10.5,0)
		    b = 30
        elseif b == 30 then
	    	character:WaitForChild("Torso").Attachment7.Position = Vector3.new(2,10.5,0)
		    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(-2,9,0)
		    b = 40
        elseif b == 40 then
            eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-100)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-80)
	        character:WaitForChild("Torso").Attachment7.Position = Vector3.new(2,9.5,0)
		    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(-2,9.5,0)
		    b = 50
        elseif b == 50 then
              eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-90)
	        character:WaitForChild("Torso").Attachment7.Position = Vector3.new(2,7,0)
		    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(-2,7,0)
		    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,-10,0)
            character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,-10,0)
            b = 10
    end
end
end
end
end
)


local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
        smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
        smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
        smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
        character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
        character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
        character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
        character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,4.4,0)
        character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,4.4,0)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)
    end
end
end
end)


local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.G then
             if g == 10 then
                eye1.Attachment.Rotation = Vector3.new(0,0,0)
                eye2.Attachment.Rotation = Vector3.new(0,0,0)
                smile1.Attachment.Rotation = Vector3.new(-90,90, -90)
                smile2.Attachment.Rotation = Vector3.new(-90,90,-0)
                smile3.Attachment.Rotation = Vector3.new(-90,90,-0)
                smile4.Attachment.Rotation = Vector3.new(-90,90,-0)
                character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,7,0)
                character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.5,7,0)
                character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0,7,0)
                character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,4,0)
                character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,6,0)
                character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,8,0)
		        character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
		        character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)
		        g = 20
		        elseif g == 20 then
		            character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,4.7,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.5,4.7,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0,4.7,0)
                    g = 10
    end
end
end
end
end
)



local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.B then
               print("b pressed")
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(0,0,0)
        smile2.Attachment.Rotation = Vector3.new(0,0,0)
        smile3.Attachment.Rotation = Vector3.new(0,0,0)
        smile4.Attachment.Rotation = Vector3.new(0,0,0)

        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(.6,-1,-.7)
        character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-.6,-1,-.7)
        character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0,-1,-1.5)
        character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,-1,-3)
        character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,-1,-5)
        character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,-1,-7)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)	
    end
end
end
end)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.V then
              
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(0,0,0)
        smile2.Attachment.Rotation = Vector3.new(0,0,0)
        smile3.Attachment.Rotation = Vector3.new(0,0,0)
        smile4.Attachment.Rotation = Vector3.new(0,0,0)

        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(.6,-1,-.7)
        character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-.6,-1,-.7)
        character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0,-1,-1.5)
        character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,-1,-3)
        character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,-7,0)
        character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,-7,0)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)
    end
end
end
end)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.U then
              if x == 10 then
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
		eye1.Attachment.Rotation = Vector3.new(0,0,0)
		smile1.Attachment.Rotation = Vector3.new(-90,90,85)
		smile2.Attachment.Rotation = Vector3.new(-90,90,95)
		smile3.Attachment.Rotation = Vector3.new(-90,90,70)
		smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,90,70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,90,110)

        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
		character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
		character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
		character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
		character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.55,0)
		character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.55,0)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(-2.4,8.5,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(2.4,8.5,0)
		x = 20
		else
		if x == 20 then
		     eye1.Attachment.Rotation = Vector3.new(0,0,0)
		eye1.Attachment.Rotation = Vector3.new(0,0,0)
		smile1.Attachment.Rotation = Vector3.new(-90,90,85)
		smile2.Attachment.Rotation = Vector3.new(-90,90,95)
		smile3.Attachment.Rotation = Vector3.new(-90,90,70)
		smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)
        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
		character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
		character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
		character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
		character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.55,0)
		character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.55,0)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(-2.2,9,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(2.2,9,0)
		x = 30
		else 
		    if x == 30 then 
		 eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
        smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
        smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
        smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)
        character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
        character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
        character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
        character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
        character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,4.4,0)
        character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,4.4,0)
		character:WaitForChild("Torso").Attachment7.Position = Vector3.new(-2,9,0)
		character:WaitForChild("Torso").Attachment8.Position = Vector3.new(2,9,0)
		x = 10
		    end
		end
    end
end
end
end
end
)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.N then
              if n == 1 then
                  eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-36.92, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-36.92, -90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)

 
 
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-.75,5,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(.5,6.75,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 2
              elseif n == 2 then 
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,7.5,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 3 
              elseif n ==3 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1.5,7,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,6.5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,4.5,0)
                    n = 4 
              elseif n == 4 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,6.5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,4.5,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1,5.5,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1,5.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(-1.5,6.5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,4.5,0)
                    n = 5
              elseif n == 5 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(90, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-30, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-30, -90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(30, -90, -90)
                    eyebrow2.Attachment.Rotation = Vector3.new(30, -90, -90)
                     character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,-20,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,5,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-.8,6,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(-1.75,4.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(.8,6,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.75,4.5,0)
                    n = 6 
              elseif n == 6 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                     character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1.5,7,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,6.5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,4.5,0)
                    n = 7
              elseif n == 7 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                     character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,6.5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,4.5,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1,5.5,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1,5.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(-1.5,6.5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,4.5,0)
                    n = 8 
              elseif n == 8 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,-20,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 9
              elseif n == 9 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
 
                    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,6,0)
                    character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1.5,7,0)
                    character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,7,0) -- /
                    character:WaitForChild("Torso").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1.5,9,0)
                    character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1.5,5,0)
                    n = 1
              end
        end
    end
    end
end
)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.RightShift then
            if l == 1 then
					eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile2.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile3.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile4.Attachment.Rotation = Vector3.new(0,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,-2,-.5)
                character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1,-2,-.5) -- /
                character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,-2,-.5)
 
                character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,-20,0) -- /
                character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1,-20,0)
                character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1,-20,0)
                character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1,-20,0)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 3
                wait(.2)
                game.Players.LocalPlayer.Character["Torso"].Anchored = true
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
                l = 2
            elseif l == 2 then
                character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,-20,-.5)
                character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1,-20,-.5) -- /
                character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,-20,-.5)
 
                character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,-20,0)
                character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,-20,0) -- /
                character:WaitForChild("Torso").Attachment6.Position = Vector3.new(1,-20,0)
                character:WaitForChild("Torso").Attachment7.Position = Vector3.new(1,-20,0)
                character:WaitForChild("Torso").Attachment8.Position = Vector3.new(1,-20,0)
                game.Players.LocalPlayer.Character["Torso"].Anchored = false
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                wait(.01)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
                l = 1
            end
        end
    end
    end
end
)
elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
--[[ SIMILAR BUT NOT HATHUB BY Jauhgn#4229 / Maggie#3339 depending on which account im using
	I could've looked at the leaked version's source and just changed the position and rotation but I didn't so fuck you
	Press n like 9 times to read the secret message
	Keybinds: e, t, u, g, n
]]

x = 10
z = 10
g = 10
e = 10
b = 10
n = 1
l = 1

character = game.Players.LocalPlayer.Character
eye1 = game.Players.LocalPlayer.Character.NarwhalShoulderBuddy.Handle
eye2 = game.Players.LocalPlayer.Character.TopazHummingWings.Handle
smile1 = game.Players.LocalPlayer.Character["Kate Hair"].Handle
smile2 = game.Players.LocalPlayer.Character["Pink Hair"].Handle
smile3 = game.Players.LocalPlayer.Character["LavanderHair"].Handle
smile4 = game.Players.LocalPlayer.Character["Hat1"].Handle
eyebrow1 = game.Players.LocalPlayer.Character["Robloxclassicred"].Handle
eyebrow2 = game.Players.LocalPlayer.Character["Pal Hair"].Handle

eyebrow1.Mesh:Destroy()
eyebrow1.AccessoryWeld:Destroy()
eyebrow1.CanCollide = false
eyebrow1.Anchored = false

eyebrow2.Mesh:Destroy()
eyebrow2.AccessoryWeld:Destroy()
eyebrow2.CanCollide = false
eyebrow2.Anchored = false

smile1.Mesh:Destroy()
smile1.AccessoryWeld:Destroy()
smile1.CanCollide = false
smile1.Anchored = false

smile2.Mesh:Destroy()
smile2.AccessoryWeld:Destroy()
smile2.CanCollide = false
smile2.Anchored = false

smile3.Mesh:Destroy()
smile3.AccessoryWeld:Destroy()
smile3.CanCollide = false
smile3.Anchored = false

smile4.Mesh:Destroy()
smile4.AccessoryWeld:Destroy()
smile4.CanCollide = false
smile4.Anchored = false

eye1.SpecialMesh:Destroy()
eye1.AccessoryWeld:Destroy()
eye1.CanCollide = false
eye1.Anchored = false

eye2.SpecialMesh:Destroy()
eye2.AccessoryWeld:Destroy()
eye2.CanCollide = false
eye2.Anchored = false

local function align(i,v)
local att0 = Instance.new("Attachment", i)
att0.Position = Vector3.new(0,0,0)
local att1 = Instance.new("Attachment", v)
att1.Position = Vector3.new(0,0,0)
local AP = Instance.new("AlignPosition", i)
AP.Attachment0 = att0
AP.Attachment1 = att1
AP.RigidityEnabled = false
AP.ReactionForceEnabled = false
AP.ApplyAtCenterOfMass = true
AP.MaxForce = 9999999
AP.MaxVelocity = math.huge
AP.Responsiveness = 160
local AO = Instance.new("AlignOrientation", i)
AO.Attachment0 = att0
AO.Attachment1 = att1
AO.ReactionTorqueEnabled = true
AO.PrimaryAxisOnly = false
AO.MaxTorque = 9999999
AO.MaxAngularVelocity = math.huge
AO.Responsiveness = 200
end

align(eye1, character["HumanoidRootPart"])
align(eye2, character["HumanoidRootPart"])
align(smile1, character["HumanoidRootPart"])
align(smile2, character["HumanoidRootPart"])
align(smile3, character["HumanoidRootPart"])
align(smile4, character["HumanoidRootPart"])
align(eyebrow1, character["HumanoidRootPart"])
align(eyebrow2, character["HumanoidRootPart"])

eye1.Attachment.Rotation = Vector3.new(0,0,0)
eye1.Attachment.Rotation = Vector3.new(0,0,0)
smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)


character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment1"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment2"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment3"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment4"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment5"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment6"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment7"
character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name = "Attachment8"



character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,4.4,0)
character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,4.4,0)
character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)


--[[local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.R then
            
            eye1.Attachment.Rotation = Vector3.new(0,0,0)
            eye2.Attachment.Rotation = Vector3.new(0,0,0)
            smile1.Attachment.Rotation = Vector3.new(-90,90,85)
            smile2.Attachment.Rotation = Vector3.new(-90,90,95)
            smile3.Attachment.Rotation = Vector3.new(-90,90,70)
            smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		
		    character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.6,7,0)
            character:WaitForChild("Torso").Attachment2.Position = Vector3.new(1.6,7,0)
            character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-1,3.95,0)
            character:WaitForChild("Torso").Attachment4.Position = Vector3.new(1,3.95,0)
            character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-2.7,3.55,0)
            character:WaitForChild("Torso").Attachment6.Position = Vector3.new(2.7,3.55,0)
			character:WaitForChild("Torso").Attachment7.Position = Vector3.new(0,-8,0)
			character:WaitForChild("Torso").Attachment8.Position = Vector3.new(0,-8,0)

        end
    end
end
end)]]

local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
              if e == 10 then
                eye1.Attachment.Rotation = Vector3.new(0,0,0)
                eye2.Attachment.Rotation = Vector3.new(0,0,0)
                smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
                smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
                smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
                smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
                character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
                character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
                character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
                character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
                character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,4.4,0)
                character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,4.4,0)
		        character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
		        character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)
		        e = 20
              elseif e == 20 then
                    smile1.Attachment.Rotation = Vector3.new(-90,90,85)
                    smile2.Attachment.Rotation = Vector3.new(-90,90,95)
                    smile3.Attachment.Rotation = Vector3.new(-90,90,70)
                    smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		
		            character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,3.55,0)
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,3.55,0)
			        character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
			        character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)
			        e = 10 

    end
	            
    end
end
end
end)



local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
 
        if input.KeyCode == Enum.KeyCode.T then
          if b == 10 then
            eye1.Attachment.Rotation = Vector3.new(0,0,0)
            eye2.Attachment.Rotation = Vector3.new(0,0,0)
            smile1.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile2.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile3.Attachment.Rotation = Vector3.new(-90,90,-90)
            smile4.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-90)
 
            character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
            character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
            character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.75,0)
            character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.75,0)
            character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,3.75,0)
            character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,3.75,0)
		    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(2,-16,0)
		    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(-2,-16,0)
		    b = 20
        elseif b == 20 then
	    	character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(2,9,0)
		    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(-2,10.5,0)
		    b = 30
        elseif b == 30 then
	    	character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(2,10.5,0)
		    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(-2,9,0)
		    b = 40
        elseif b == 40 then
            eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-100)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-80)
	        character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(2,9.5,0)
		    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(-2,9.5,0)
		    b = 50
        elseif b == 50 then
              eyebrow1.Attachment.Rotation = Vector3.new(-90,90,-90)
            eyebrow2.Attachment.Rotation = Vector3.new(-90,90,-90)
	        character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(2,7,0)
		    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(-2,7,0)
		    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,-10,0)
            character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,-10,0)
            b = 10
    end
end
end
end
end
)


local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
        smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
        smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
        smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
        character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
        character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
        character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
        character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,4.4,0)
        character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,4.4,0)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)
    end
end
end
end)


local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.G then
             if g == 10 then
                eye1.Attachment.Rotation = Vector3.new(0,0,0)
                eye2.Attachment.Rotation = Vector3.new(0,0,0)
                smile1.Attachment.Rotation = Vector3.new(-90,90, -90)
                smile2.Attachment.Rotation = Vector3.new(-90,90,-0)
                smile3.Attachment.Rotation = Vector3.new(-90,90,-0)
                smile4.Attachment.Rotation = Vector3.new(-90,90,-0)
                character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.5,7,0)
                character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.5,7,0)
                character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(0,7,0)
                character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,4,0)
                character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,6,0)
                character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,8,0)
		        character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
		        character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)
		        g = 20
		        elseif g == 20 then
		            character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.5,4.7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.5,4.7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(0,4.7,0)
                    g = 10
    end
end
end
end
end
)



local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.B then
               print("b pressed")
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(0,0,0)
        smile2.Attachment.Rotation = Vector3.new(0,0,0)
        smile3.Attachment.Rotation = Vector3.new(0,0,0)
        smile4.Attachment.Rotation = Vector3.new(0,0,0)

        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(.6,-1,-.7)
        character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(-.6,-1,-.7)
        character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(0,-1,-1.5)
        character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,-1,-3)
        character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,-1,-5)
        character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,-1,-7)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)	
    end
end
end
end)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.V then
              
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye2.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(0,0,0)
        smile2.Attachment.Rotation = Vector3.new(0,0,0)
        smile3.Attachment.Rotation = Vector3.new(0,0,0)
        smile4.Attachment.Rotation = Vector3.new(0,0,0)

        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(.6,-1,-.7)
        character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(-.6,-1,-.7)
        character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(0,-1,-1.5)
        character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,-1,-3)
        character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,-7,0)
        character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,-7,0)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,-8,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,-8,0)
    end
end
end
end)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
     
        if input.KeyCode == Enum.KeyCode.U then
              if x == 10 then
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
		eye1.Attachment.Rotation = Vector3.new(0,0,0)
		smile1.Attachment.Rotation = Vector3.new(-90,90,85)
		smile2.Attachment.Rotation = Vector3.new(-90,90,95)
		smile3.Attachment.Rotation = Vector3.new(-90,90,70)
		smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,90,70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,90,110)

        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
		character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
		character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
		character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
		character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,3.55,0)
		character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,3.55,0)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(-2.4,8.5,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(2.4,8.5,0)
		x = 20
		else
		if x == 20 then
		     eye1.Attachment.Rotation = Vector3.new(0,0,0)
		eye1.Attachment.Rotation = Vector3.new(0,0,0)
		smile1.Attachment.Rotation = Vector3.new(-90,90,85)
		smile2.Attachment.Rotation = Vector3.new(-90,90,95)
		smile3.Attachment.Rotation = Vector3.new(-90,90,70)
		smile4.Attachment.Rotation = Vector3.new(-90,90,110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)
        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
		character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
		character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
		character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
		character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,3.55,0)
		character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,3.55,0)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(-2.2,9,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(2.2,9,0)
		x = 30
		else 
		    if x == 30 then 
		 eye1.Attachment.Rotation = Vector3.new(0,0,0)
        eye1.Attachment.Rotation = Vector3.new(0,0,0)
        smile1.Attachment.Rotation = Vector3.new(-90,90,-85)
        smile2.Attachment.Rotation = Vector3.new(-90,90,-95)
        smile3.Attachment.Rotation = Vector3.new(-90,90,-70)
        smile4.Attachment.Rotation = Vector3.new(-90,90,-110)
		eyebrow1.Attachment.Rotation = Vector3.new(-90,0,-70)
		eyebrow2.Attachment.Rotation = Vector3.new(-90,0,-110)
        character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.6,7,0)
        character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(1.6,7,0)
        character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1,3.95,0)
        character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1,3.95,0)
        character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-2.7,4.4,0)
        character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(2.7,4.4,0)
		character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(-2,9,0)
		character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(2,9,0)
		x = 10
		    end
		end
    end
end
end
end
end
)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.N then
              if n == 1 then
                  eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-36.92, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-36.92, -90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)

 
 
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-.75,5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(.5,6.75,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 2
              elseif n == 2 then 
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,7.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 3 
              elseif n ==3 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1.5,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,4.5,0)
                    n = 4 
              elseif n == 4 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(1.5,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,4.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1,5.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1,5.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(-1.5,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,4.5,0)
                    n = 5
              elseif n == 5 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(90, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-30, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-30, -90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(30, -90, -90)
                    eyebrow2.Attachment.Rotation = Vector3.new(30, -90, -90)
                     character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(1.5,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-.8,6,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(-1.75,4.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(.8,6,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.75,4.5,0)
                    n = 6 
              elseif n == 6 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                     character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,-16,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1.5,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(0,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(0,4.5,0)
                    n = 7
              elseif n == 7 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(1.5,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,4.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1,5.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1,5.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(-1.5,6.5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,4.5,0)
                    n = 8 
              elseif n == 8 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(0,-20,0)
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(-1.5,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,-20,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,7,0)
                    n = 9
              elseif n == 9 then
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile2.Attachment.Rotation = Vector3.new(0, -90, -90)
                    smile3.Attachment.Rotation = Vector3.new(-90, -90, -90)
                    smile4.Attachment.Rotation = Vector3.new(-90,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
 
                    character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(-1.5,6,0)
                    character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(-1.5,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(-1.5,5,0)
                    character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(1.5,7,0)
                    character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(0,7,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(0,4.5,0) -- /
                    character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1.5,9,0)
                    character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1.5,5,0)
                    n = 1
              end
        end
    end
    end
end
)
local userInputService= game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, IsTyping)
    if not IsTyping then
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.RightShift then
            if l == 1 then
					eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    eye1.Attachment.Rotation = Vector3.new(0,0,0)
                    smile1.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile2.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile3.Attachment.Rotation = Vector3.new(180, -180, -90)
                    smile4.Attachment.Rotation = Vector3.new(0,-90, -90)
                    eyebrow1.Attachment.Rotation = Vector3.new(0,-90,-90)
                    eyebrow2.Attachment.Rotation = Vector3.new(0,-90,-90)
                character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,-2,-.5)
                character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1,-2,-.5) -- /
                character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(1,-2,-.5)
 
                character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(-1,-20,0) -- /
                character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1,-20,0)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 3
                wait(.2)
                game.Players.LocalPlayer.Character["HumanoidRootPart"].Anchored = true
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
                l = 2
            elseif l == 2 then
                character:WaitForChild("HumanoidRootPart").Attachment4.Position = Vector3.new(0,-20,-.5)
                character:WaitForChild("HumanoidRootPart").Attachment5.Position = Vector3.new(-1,-20,-.5) -- /
                character:WaitForChild("HumanoidRootPart").Attachment3.Position = Vector3.new(1,-20,-.5)
 
                character:WaitForChild("HumanoidRootPart").Attachment1.Position = Vector3.new(0,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment2.Position = Vector3.new(-1,-20,0) -- /
                character:WaitForChild("HumanoidRootPart").Attachment6.Position = Vector3.new(1,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment7.Position = Vector3.new(1,-20,0)
                character:WaitForChild("HumanoidRootPart").Attachment8.Position = Vector3.new(1,-20,0)
                game.Players.LocalPlayer.Character["HumanoidRootPart"].Anchored = false
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                wait(.01)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
                l = 1
            end
        end
    end
    end
end
)
end
