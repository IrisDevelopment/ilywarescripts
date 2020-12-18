HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000--67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthPO_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthPO_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = (Position or Vector3.new(0,0,0)) + Part0.CenterOfMass
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AttachmentA,AttachmentB,AlignOri,AttachmentC,AttachmentD}
end

if _G.netted ~= true then
	_G.netted = true
	coroutine.wrap(function()
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.ThrottleAdjustTime = math.huge*math.huge
		settings().Physics.AllowSleep = false
		game:GetService("RunService").RenderStepped:Connect(function()
			game:FindFirstChildOfClass("Players").LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game:FindFirstChildOfClass("Players").LocalPlayer,"SimulationRadius",math.huge*math.huge)
		end)
	end)()
end

warn([==[

Bypass made by Mizt
Thanks for choosing my bypass

]==])
game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local fldr = Instance.new("Folder",workspace)
fldr.Name = "Bypass by Mizt"
local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
CloneChar.Parent = fldr
CloneChar.HumanoidRootPart.CFrame = game:FindFirstChildOfClass("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non" 
CloneChar.Humanoid.DisplayDistanceType = "None"

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		local clonnedhat = v:Clone()
		clonnedhat.Parent = CloneChar
		local hatath = clonnedhat.Handle:FindFirstChildOfClass("Attachment")
		local partath
		for _,v in pairs(CloneChar:GetChildren()) do
			if v:IsA("BasePart") then
				for _,w in pairs(v:GetChildren()) do
					if w.Name == hatath.Name then
						partath = w
						break
					end
				end
				if partath then break end
			end
		end
		local accweld = Instance.new("Weld",clonnedhat.Handle)
		accweld.Name = "AccessoryWeld"
		accweld.Part0 = clonnedhat.Handle
		accweld.Part1 = partath.Parent
		accweld.C0 = hatath.CFrame
		accweld.C1 = partath.CFrame
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.UpperTorso,Vector3.new(0,1.35,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[4]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = (((DeadChar.UpperTorso.CFrame * CFrame.new(0,1.35,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse())
						else
							v.Handle.CFrame = alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alirot.Attachment1.Rotation.X),math.rad(alirot.Attachment1.Rotation.Y),math.rad(alirot.Attachment1.Rotation.Z))
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
				--[[while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					local alipos = CloneChar[v.Name].Handle:FindFirstChildOfClass("AlignPosition")
					local alirot = CloneChar[v.Name].Handle:FindFirstChildOfClass("AlignOrientation")
					v.Handle.CFrame = alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alirot.Attachment1.Rotation.X),math.rad(alirot.Attachment1.Rotation.Y),math.rad(alirot.Attachment1.Rotation.Z))
				end]]
			end
		end)()
    end
end

game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
DeadChar.Parent = game
local a = DeadChar.UpperTorso
local b = DeadChar.HumanoidRootPart
local c = DeadChar.Humanoid
DeadChar.LowerTorso.Root.Parent = b
DeadChar.Head.Neck.Parent = a
a.Parent = game:FindFirstChildOfClass("Workspace")
c.Parent = game:FindFirstChildOfClass("Workspace")
local told = a:Clone()
local told1 = c:Clone()
b["Root"].Part1 = told
b["Root"].Part0 = DeadChar.Head
a.Name = "torso"
a.Neck:Destroy()
c.Name = "hum"
told.Parent = DeadChar
told1.Parent = DeadChar
DeadChar.PrimaryPart = told
told1.Health = 0
a.Parent = DeadChar
c.Parent = DeadChar
b["Root"]:Destroy()
DeadChar.HumanoidRootPart.Parent = workspace

told:Destroy()
told1:Destroy()
a.Name = "UpperTorso"
DeadChar.Parent = workspace

if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end


local con
function UnCollide()
    if HumanDied then con:Disconnect(); return end
    --[[for _,Parts in next, CloneChar:GetDescendants() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _,Parts in next, DeadChar:GetDescendants() do
        if Parts:IsA("BasePart") then
        Parts.CanCollide = false
        end 
    end 
end
con = game:GetService("RunService").Stepped:Connect(UnCollide)

local resetBindable = Instance.new("BindableEvent")
resetBindable.Event:connect(function()
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
    resetBindable:Destroy()
    pcall(function()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
		DeadChar.Head:Destroy()
		DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
		if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
	end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChildOfClass("Humanoid") or CloneChar:FindFirstChildOfClass("Humanoid").Health <= 0 and not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChildOfClass("Humanoid") or DeadChar:FindFirstChildOfClass("Humanoid").Health <= 0 then 
			HumanDied = true
			print("DEAD")
            pcall(function()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
				DeadChar.Head:Destroy()
				DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
				if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
			end)
            if resetBindable then
                game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
                resetBindable:Destroy()
            end
            break
        end		
    end
end)()

SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.15,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))

SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.2,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.85,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.2,0),Vector3.new(0,0,0))
SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.85,0),Vector3.new(0,0,0))

for _,v in pairs(DeadChar:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "Head" then
		--[[local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = CloneChar[v.Name].CFrame
			end
		end)()]]
	elseif v:IsA("BasePart") and v.Name == "Head" then
		local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = DeadChar.UpperTorso.CFrame * CFrame.new(0,1.35,0)
			end
		end)()
	end
end

for _,BodyParts in next, CloneChar:GetDescendants() do
if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
BodyParts.Transparency = 1 end end
game:GetService("RunService").RenderStepped:wait()
game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Camera").CameraSubject = CloneChar.Humanoid

for _,v in pairs(DeadChar:GetDescendants()) do
    if v.ClassName == "Motor6D" then
        v:Destroy()
    end
end
fldr.Parent = DeadChar

function RUNANIMATESCRIPT(FOLDER)

local Figure = FOLDER.Parent
local Torso = Figure:WaitForChild("Torso")
local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")
local Neck = Torso:WaitForChild("Neck")
local Humanoid = Figure:WaitForChild("Humanoid")
local pose = "Standing"

local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0
local animTable = {}
local animNames = { 
	idle = 	{	
				{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
				{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
			},
	walk = 	{ 	
				{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
			}, 
	run = 	{
				{ id = "run.xml", weight = 10 } 
			}, 
	jump = 	{
				{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
			}, 
	fall = 	{
				{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
			}, 
	climb = {
				{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
			}, 
	sit = 	{
				{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
			},	
	toolnone = {
				{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
			},
	toolslash = {
				{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
--				{ id = "slash.xml", weight = 10 } 
			},
	toollunge = {
				{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
			},
	wave = {
				{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
			},
	point = {
				{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
			},
	dance1 = {
				{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
			},
	dance2 = {
				{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
			},
	dance3 = {
				{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
			},
	laugh = {
				{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
			},
	cheer = {
				{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
			},
}
local dances = {"dance1", "dance2", "dance3"}

-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

function configureAnimationSet(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	-- check for config values
	local config = FOLDER:FindFirstChild(name)
	if (config ~= nil) then
--		print("Loading anims " .. name)
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
		local idx = 1
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject == nil) then
					animTable[name][idx].weight = 1
				else
					animTable[name][idx].weight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
	--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
				idx = idx + 1
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
		end
	end
end

-- Setup animation objects
function scriptChildModified(child)
	local fileList = animNames[child.Name]
	if (fileList ~= nil) then
		configureAnimationSet(child.Name, fileList)
	end	
end

FOLDER.ChildAdded:connect(scriptChildModified)
FOLDER.ChildRemoved:connect(scriptChildModified)


for name, fileList in pairs(animNames) do 
	configureAnimationSet(name, fileList)
end	

-- ANIMATION

-- declarations
local toolAnim = "None"
local toolAnimTime = 0

local jumpAnimTime = 0
local jumpAnimDuration = 0.3

local toolTransitionTime = 0.1
local fallTransitionTime = 0.3
local jumpMaxLimbVelocity = 0.75

-- functions

function stopAllAnimations()
	local oldAnim = currentAnim

	-- return to idle if finishing an emote
	if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
		oldAnim = "idle"
	end

	currentAnim = ""
	currentAnimInstance = nil
	if (currentAnimKeyframeHandler ~= nil) then
		currentAnimKeyframeHandler:disconnect()
	end

	if (currentAnimTrack ~= nil) then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end
	return oldAnim
end

function setAnimationSpeed(speed)
	if speed ~= currentAnimSpeed then
		currentAnimSpeed = speed
		currentAnimTrack:AdjustSpeed(currentAnimSpeed)
	end
end

function keyFrameReachedFunc(frameName)
	if (frameName == "End") then

		local repeatAnim = currentAnim
		-- return to idle if finishing an emote
		if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
			repeatAnim = "idle"
		end
		
		local animSpeed = currentAnimSpeed
		playAnimation(repeatAnim, 0.0, Humanoid)
		setAnimationSpeed(animSpeed)
	end
end

-- Preload animations
function playAnimation(animName, transitionTime, humanoid) 
		
	local roll = math.random(1, animTable[animName].totalWeight) 
	local origRoll = roll
	local idx = 1
	while (roll > animTable[animName][idx].weight) do
		roll = roll - animTable[animName][idx].weight
		idx = idx + 1
	end
--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
	local anim = animTable[animName][idx].anim

	-- switch animation		
	if (anim ~= currentAnimInstance) then
		
		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop(transitionTime)
			currentAnimTrack:Destroy()
		end

		currentAnimSpeed = 1.0
	
		-- load it to the humanoid; get AnimationTrack
		currentAnimTrack = humanoid:LoadAnimation(anim)
		currentAnimTrack.Priority = Enum.AnimationPriority.Core
			
		-- play the animation
		currentAnimTrack:Play(transitionTime)
		currentAnim = animName
		currentAnimInstance = anim

		-- set up keyframe name triggers
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
		currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
		
	end

end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

local toolAnimName = ""
local toolAnimTrack = nil
local toolAnimInstance = nil
local currentToolAnimKeyframeHandler = nil

function toolKeyFrameReachedFunc(frameName)
	if (frameName == "End") then
--		print("Keyframe : ".. frameName)	
		playToolAnimation(toolAnimName, 0.0, Humanoid)
	end
end


function playToolAnimation(animName, transitionTime, humanoid, priority)	 
		
		local roll = math.random(1, animTable[animName].totalWeight) 
		local origRoll = roll
		local idx = 1
		while (roll > animTable[animName][idx].weight) do
			roll = roll - animTable[animName][idx].weight
			idx = idx + 1
		end
--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
		local anim = animTable[animName][idx].anim

		if (toolAnimInstance ~= anim) then
			
			if (toolAnimTrack ~= nil) then
				toolAnimTrack:Stop()
				toolAnimTrack:Destroy()
				transitionTime = 0
			end
					
			-- load it to the humanoid; get AnimationTrack
			toolAnimTrack = humanoid:LoadAnimation(anim)
			if priority then
				toolAnimTrack.Priority = priority
			end
				
			-- play the animation
			toolAnimTrack:Play(transitionTime)
			toolAnimName = animName
			toolAnimInstance = anim

			currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
		end
end

function stopToolAnimations()
	local oldAnim = toolAnimName

	if (currentToolAnimKeyframeHandler ~= nil) then
		currentToolAnimKeyframeHandler:disconnect()
	end

	toolAnimName = ""
	toolAnimInstance = nil
	if (toolAnimTrack ~= nil) then
		toolAnimTrack:Stop()
		toolAnimTrack:Destroy()
		toolAnimTrack = nil
	end


	return oldAnim
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


function onRunning(speed)
	if speed > 0.01 then
		playAnimation("walk", 0.1, Humanoid)
		if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
			setAnimationSpeed(speed / 14.5)
		end
		pose = "Running"
	else
		if emoteNames[currentAnim] == nil then
			playAnimation("idle", 0.1, Humanoid)
			pose = "Standing"
		end
	end
end

function onDied()
	pose = "Dead"
end

function onJumping()
	playAnimation("jump", 0.1, Humanoid)
	jumpAnimTime = jumpAnimDuration
	pose = "Jumping"
end

function onClimbing(speed)
	playAnimation("climb", 0.1, Humanoid)
	setAnimationSpeed(speed / 12.0)
	pose = "Climbing"
end

function onGettingUp()
	pose = "GettingUp"
end

function onFreeFall()
	if (jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	end
	pose = "FreeFall"
end

function onFallingDown()
	pose = "FallingDown"
end

function onSeated()
	pose = "Seated"
end

function onPlatformStanding()
	pose = "PlatformStanding"
end

function onSwimming(speed)
	if speed > 0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

function getTool()	
	for _, kid in ipairs(Figure:GetChildren()) do
		if kid.className == "Tool" then return kid end
	end
	return nil
end

function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end

function animateTool()
	
	if (toolAnim == "None") then
		playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
		return
	end

	if (toolAnim == "Slash") then
		playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end

	if (toolAnim == "Lunge") then
		playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end
end

function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder:SetDesiredAngle(3.14 /2)
	LeftShoulder:SetDesiredAngle(-3.14 /2)
	RightHip:SetDesiredAngle(3.14 /2)
	LeftHip:SetDesiredAngle(-3.14 /2)
end

local lastTick = 0

function move(time)
	local amplitude = 1
	local frequency = 1
		local deltaTime = time - lastTick
		lastTick = time

	local climbFudge = 0
	local setAngles = false

		if (jumpAnimTime > 0) then
			jumpAnimTime = jumpAnimTime - deltaTime
		end

	if (pose == "FreeFall" and jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	elseif (pose == "Seated") then
		playAnimation("sit", 0.5, Humanoid)
		return
	elseif (pose == "Running") then
		playAnimation("walk", 0.1, Humanoid)
	elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
--		print("Wha " .. pose)
		stopAllAnimations()
		amplitude = 0.1
		frequency = 1
		setAngles = true
	end

	if (setAngles) then
		local desiredAngle = amplitude * math.sin(time * frequency)

		RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
		LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
		RightHip:SetDesiredAngle(-desiredAngle)
		LeftHip:SetDesiredAngle(-desiredAngle)
	end

	-- Tool Animation handling
	local tool = getTool()
	if tool and tool:FindFirstChild("Handle") then
	
		local animStringValueObject = getToolAnim(tool)

		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end

		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end

		animateTool()		
	else
		stopToolAnimations()
		toolAnim = "None"
		toolAnimInstance = nil
		toolAnimTime = 0
	end
end


local events = {}
local eventHum = Humanoid

local function onUnhook()
	for i = 1, #events do
		events[i]:Disconnect()
	end
	events = {}
end

local function onHook()
	onUnhook()
	
	pose = eventHum.Sit and "Seated" or "Standing"
	
	events = {
		eventHum.Died:connect(onDied),
		eventHum.Running:connect(onRunning),
		eventHum.Jumping:connect(onJumping),
		eventHum.Climbing:connect(onClimbing),
		eventHum.GettingUp:connect(onGettingUp),
		eventHum.FreeFalling:connect(onFreeFall),
		eventHum.FallingDown:connect(onFallingDown),
		eventHum.Seated:connect(onSeated),
		eventHum.PlatformStanding:connect(onPlatformStanding),
		eventHum.Swimming:connect(onSwimming)
	}
end


onHook()
--FOLDER:WaitForChild("Loaded").Value = true


-- main program

-- initialize to idle
playAnimation("idle", 0.1, Humanoid)
pose = "Standing"

spawn(function()
	while Figure.Parent ~= nil do
		local _, time = wait(0.1)
		move(time)
	end
end)

return {
	onRunning = onRunning, 
	onDied = onDied, 
	onJumping = onJumping, 
	onClimbing = onClimbing, 
	onGettingUp = onGettingUp, 
	onFreeFall = onFreeFall, 
	onFallingDown = onFallingDown, 
	onSeated = onSeated, 
	onPlatformStanding = onPlatformStanding,
	onHook = onHook,
	onUnhook = onUnhook
}

end
RUNANIMATESCRIPT(CloneChar.Animate)
--By Rufus14 lolol
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Part0 = Instance.new("Part")
Sound1 = Instance.new("Sound")
Attachment2 = Instance.new("Attachment")
RopeConstraint3 = Instance.new("RopeConstraint")
Part4 = Instance.new("Part")
SpecialMesh5 = Instance.new("SpecialMesh")
Attachment6 = Instance.new("Attachment")
RopeConstraint7 = Instance.new("RopeConstraint")
RopeConstraint8 = Instance.new("RopeConstraint")
Part0.Parent = mas
Part0.BrickColor = BrickColor.new("Pearl")
Part0.Anchored = true
Part0.Size = Vector3.new(9.97000027, 0.720000267, 7.03999949)
Part0.CFrame = CFrame.new(16.7149887, 13.7606668, 36.7299957, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part0.BottomSurface = Enum.SurfaceType.Smooth
Part0.TopSurface = Enum.SurfaceType.Smooth
Part0.Color = Color3.new(0.905882, 0.905882, 0.92549)
Part0.Position = Vector3.new(16.7149887, 13.7606668, 36.7299957)
Part0.Color = Color3.new(0.905882, 0.905882, 0.92549)
Sound1.Parent = Part0
Sound1.SoundId = "rbxassetid://1205183071"
Attachment6.Parent = Part0
Attachment6.Visible = true
RopeConstraint8.Parent = Attachment6
RopeConstraint8.Color = BrickColor.new("Maroon")
RopeConstraint8.Visible = true
RopeConstraint8.Attachment0 = nil
RopeConstraint8.Attachment1 = Attachment6
RopeConstraint8.Color = BrickColor.new("Maroon")
RopeConstraint8.Length = 7.5
RopeConstraint8.Thickness = 0.20000000298023
RopeConstraint8.Restitution = 0.10000000149012
Part4.Parent = mas
Part4.Size = Vector3.new(3.6299994, 2.9199996, 2.94999957)
Part4.CFrame = CFrame.new(16.4487038, 1.47368073, 36.9643707, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part4.BottomSurface = Enum.SurfaceType.Smooth
Part4.TopSurface = Enum.SurfaceType.Smooth
Part4.Position = Vector3.new(16.4487038, 1.47368073, 36.9643707)
SpecialMesh5.Parent = Part4
SpecialMesh5.MeshId = "http://www.roblox.com/asset/?id=112335925"
SpecialMesh5.Scale = Vector3.new(3, 3, 3)
SpecialMesh5.TextureId = "http://www.roblox.com/asset/?id=112335881"
SpecialMesh5.MeshType = Enum.MeshType.FileMesh
SpecialMesh5.Scale = Vector3.new(3, 3, 3)
Attachment6.Parent = Part0
Attachment6.Visible = true
RopeConstraint8.Parent = Attachment6
RopeConstraint8.Color = BrickColor.new("Maroon")
RopeConstraint8.Visible = true
RopeConstraint8.Length = 7.5
RopeConstraint8.Thickness = 0.20000000298023
RopeConstraint8.Restitution = 0
for i,v in pairs(mas:GetChildren()) do
	v.Parent = game:GetService("Players").LocalPlayer.Character
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
Part0.CFrame = game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,7.5,0)
game.Players.LocalPlayer.Character.Torso.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame * CFrame.new(0,2,0)
Part4.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame * CFrame.new(0,-3,0)
RopeConstraint8.Attachment0 = game.Players.LocalPlayer.Character.Torso.NeckAttachment
RopeConstraint8.Attachment1 = Attachment6
RopeConstraint8.Visible = true
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
-- Objects

local ScreenGui = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

TextButton.Parent = ScreenGui
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.Position = UDim2.new(0.318378747, 0, 0.816154361, 0)
TextButton.Size = UDim2.new(0, 496, 0, 135)
TextButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TextButton.Font = Enum.Font.Code
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "end it."
TextButton.TextColor3 = Color3.new(0.454902, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true
function kys()
	ScreenGui:destroy()
	local bodyvel = Instance.new("BodyVelocity", Part4)
	bodyvel.Velocity = game.Players.LocalPlayer.Character.Torso.CFrame.lookVector * 45
	local death = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)
	death.Volume = 10
	death.SoundId = "rbxassetid://12222242"
	wait(0.2)
	death:Play()
	bodyvel:destroy()
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        if game.Players.LocalPlayer.Character:findFirstChild("Torso") then
            game.Players.LocalPlayer.Character.Torso.Velocity = game.Players.LocalPlayer.Character.Torso.CFrame.lookVector * 10
            for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
                if v.ClassName == "Motor6D" then
                    if v.Name == "Neck" then
                       
                    else
                        v:destroy()
                    end
                end
            end
        end
        if game.Players.LocalPlayer.Character:findFirstChild("Right Arm") then
            local attachment = Instance.new("Attachment", game.Players.LocalPlayer.Character.Torso)
            attachment.Position = Vector3.new(1, 1, 0)
            local ball = Instance.new("BallSocketConstraint", game.Players.LocalPlayer.Character)
            ball.Attachment0 = game.Players.LocalPlayer.Character["Right Arm"].RightShoulderAttachment
            ball.Attachment1 = attachment
            local collidepartofleftleg = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
            collidepartofleftleg.Name = "Bone"
            collidepartofleftleg.Size = Vector3.new(0.8,1.4,0.8)
            collidepartofleftleg.Transparency = 1
            collidepartofleftleg:BreakJoints()
            local weeld = Instance.new("Weld", collidepartofleftleg)
            weeld.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
            weeld.Part1 = collidepartofleftleg
            weeld.C0 = weeld.C0 * CFrame.new(0,-0.3,0)
        end
        if game.Players.LocalPlayer.Character:findFirstChild("Left Arm") then
            local attachment = Instance.new("Attachment", game.Players.LocalPlayer.Character.Torso)
            attachment.Position = Vector3.new(-1, 1, 0)
            local ball = Instance.new("BallSocketConstraint", game.Players.LocalPlayer.Character)
            ball.Attachment0 = attachment
            ball.Attachment1 = game.Players.LocalPlayer.Character["Left Arm"].LeftShoulderAttachment
            local collidepartofleftleg = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
            collidepartofleftleg.Name = "Bone"
            collidepartofleftleg.Size = Vector3.new(0.8,1.4,0.8)
            collidepartofleftleg.Transparency = 1
            collidepartofleftleg:BreakJoints()
            local weeld = Instance.new("Weld", collidepartofleftleg)
            weeld.Part0 = game.Players.LocalPlayer.Character["Left Arm"]
            weeld.Part1 = collidepartofleftleg
            weeld.C0 = weeld.C0 * CFrame.new(0,-0.3,0)
        end
        if game.Players.LocalPlayer.Character:findFirstChild("Right Leg") then
            local attachment = Instance.new("Attachment", game.Players.LocalPlayer.Character.Torso)
            attachment.Position = Vector3.new(0.5, -1, 0)
            local ball = Instance.new("BallSocketConstraint", game.Players.LocalPlayer.Character)
            ball.Attachment0 = game.Players.LocalPlayer.Character["Right Leg"].RightFootAttachment
            ball.Attachment1 = attachment
            game.Players.LocalPlayer.Character["Right Leg"].RightFootAttachment.Position = Vector3.new(0, 1, 0)
            local collidepartofleftleg = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
            collidepartofleftleg.Name = "Bone"
            collidepartofleftleg.Size = Vector3.new(0.8,1.4,0.8)
            collidepartofleftleg.Transparency = 1
            collidepartofleftleg:BreakJoints()
            local weeld = Instance.new("Weld", collidepartofleftleg)
            weeld.Part0 = game.Players.LocalPlayer.Character["Right Leg"]
            weeld.Part1 = collidepartofleftleg
            weeld.C0 = weeld.C0 * CFrame.new(0,-0.3,0)
        end
        if game.Players.LocalPlayer.Character:findFirstChild("Left Leg") then
            local attachment = Instance.new("Attachment", game.Players.LocalPlayer.Character.Torso)
            attachment.Position = Vector3.new(-0.5, -1, 0)
            local ball = Instance.new("BallSocketConstraint", game.Players.LocalPlayer.Character)
            ball.Attachment0 = game.Players.LocalPlayer.Character["Left Leg"].LeftFootAttachment
            ball.Attachment1 = attachment
            game.Players.LocalPlayer.Character["Left Leg"].LeftFootAttachment.Position = Vector3.new(0, 1, 0)
            local collidepartofleftleg = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
            collidepartofleftleg.Name = "Bone"
            collidepartofleftleg.Size = Vector3.new(0.8,1.4,0.8)
            collidepartofleftleg.Transparency = 1
            collidepartofleftleg:BreakJoints()
            local weeld = Instance.new("Weld", collidepartofleftleg)
            weeld.Part0 = game.Players.LocalPlayer.Character["Left Leg"]
            weeld.Part1 = collidepartofleftleg
            weeld.C0 = weeld.C0 * CFrame.new(0,-0.3,0)
        end
        if game.Players.LocalPlayer.Character:findFirstChild("Head") then
            local attachment = Instance.new("Attachment", game.Players.LocalPlayer.Character.Head)
				attachment.Position = Vector3.new(0, -0.5, 0)
				attachment.Name = "lol"
				attachment.Visible = false
				game.Players.LocalPlayer.Character.Torso.NeckAttachment.Visible = false
				game.Players.LocalPlayer.Character.Torso.NeckAttachment.Position = game.Players.LocalPlayer.Character.Torso.NeckAttachment.Position + Vector3.new(0,0,0)
				local ball = Instance.new("BallSocketConstraint", game.Players.LocalPlayer.Character)
	            ball.Attachment0 = game.Players.LocalPlayer.Character.Torso.NeckAttachment
	            ball.Attachment1 = attachment
				ball.LimitsEnabled = true
				ball.TwistLimitsEnabled = true
				ball.UpperAngle = 90
				ball.Restitution = 0.5
				ball.TwistUpperAngle = 180
				ball.TwistLowerAngle = -180
	            local  collidepartofleftleg = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
	            collidepartofleftleg.Name = "Bone"
	            collidepartofleftleg.Size = Vector3.new(0.7,0.7,0.7)
	            collidepartofleftleg.Transparency = 1
	            collidepartofleftleg:BreakJoints()
	            local weeld = Instance.new("Weld", collidepartofleftleg)
	            weeld.Part0 = collidepartofleftleg
	            weeld.Part1 = game.Players.LocalPlayer.Character["Head"]
				if game.Players.LocalPlayer.Character.Torso:findFirstChild("Neck") then
					game.Players.LocalPlayer.Character.Torso.Neck:destroy()
				end
				if game.Players.LocalPlayer.Character.Head:findFirstChild("face") then
					game.Players.LocalPlayer.Character.Head.face.Texture = "http://www.roblox.com/asset/?id=810245460"
				end
        end
		game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		game.Players.LocalPlayer.Character.Humanoid.Health = 0.1
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
		local dead = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)
		dead.Volume = 10
		dead.SoundId = "rbxassetid://1248405065"
		dead:Play()
		dead.Looped = true
		while true do
			game.Players.LocalPlayer.Character.Humanoid.Health = 0.1
			game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
			wait()
		end
end
TextButton.MouseButton1Click:connect(kys)
