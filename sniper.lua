--//====================================================\\--
--||			   DOXX SOCIETY
--\\====================================================//--
game["Run Service"].RenderStepped:connect(function()
	settings().Physics.AllowSleep = false
	setsimulationradius(math.huge*math.huge,math.huge*math.huge)
end)

local s = Instance.new("Sound")

s.Name = "Sound"
s.SoundId = "https://web.roblox.com/asset/?id=221057812"
s.Volume = 1
s.Looped = false
s.archivable = false

s.Parent = game.Workspace

wait(1)

s:play()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "DOXX SOCIETY";
	Text = "Script loaded.";
	Icon = "rbxthumb://type=Asset&id=4360506542&w=150&h=150"})
Duration = 29;

loadstring(game:GetObjects("rbxassetid://5698675958")[1].Source)()

local debounce = true
Ply = game.Players.LocalPlayer
Char = Ply.Character
Tor = Char.Torso
He = Char.Head
Ne = Tor.Neck
Hu = Char.Humanoid
LA = Char["Left Arm"] 
LL = Char["Left Leg"] 
RA = Char["Right Arm"] 
RL = Char["Right Leg"]
LS = Tor["Left Shoulder"] 
RS = Tor["Right Shoulder"] 
LH = Tor["Left Hip"] 
RH = Tor["Right Hip"] 
Combo = 1
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
RP = Char.HumanoidRootPart
RJ = RP.RootJoint
RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
LHCF = CFrame.Angles(0, math.rad(-90), 0)
RHCF = CFrame.Angles(0, math.rad(90), 0)
attack = false
equipped = false
local Anim = "Idle"
Effects = { }
cam = workspace.CurrentCamera
local m = Instance.new("Model")
m.Parent = Char
m.Name = "WeaponModel"
local ToolName = "Sniper"
local Gun = Char[ToolName]
local GHandle = Gun.Handle
h = Instance.new("Attachment",GHandle)
ra = Instance.new("Attachment",LA)
gap = Instance.new("AlignPosition",GHandle)
gap.Attachment0 = h
gap.Attachment1 = ra
gap.RigidityEnabled = true
gao = Instance.new("AlignOrientation",GHandle)
gao.Attachment0 = h
gao.Attachment1 = ra
gao.RigidityEnabled = true
GHandle:FindFirstChildOfClass("AlignOrientation").Attachment1 = LA.LeftGripAttachment
GHandle:FindFirstChildOfClass("AlignPosition").Attachment1 = LA.LeftGripAttachment
LA.LeftGripAttachment.Orientation = Vector3.new(70,2.5,-90)
LA.LeftGripAttachment.Position = Vector3.new(0.5,-1.2,-0.6)


RS.Parent = nil 
LS.Parent = nil 

RW = Instance.new("Weld")
RW.Name = "Right Shoulder"
RW.Part0 = Tor 
RW.C0 = CFrame.new(1.5, 0.5, 0)
RW.C1 = CFrame.new(0, 0.5, 0)
RW.Part1 = RA 
RW.Parent = Tor 

LW = Instance.new("Weld")
LW.Name = "Left Shoulder"
LW.Part0 = Tor 
LW.C0 = CFrame.new(-1.5, 0.5, 0)
LW.C1 = CFrame.new(0, 0.5, 0) 
LW.Part1 = LA 
LW.Parent = Tor 

mouse = Ply:GetMouse()

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreatePart(FF, Par, Mat, Ref, Tra, BC, Nam, Siz)
	local Part = Instance.new("Part")
	Part.formFactor = FF
	Part.Parent = Par
	Part.Reflectance = Ref
	Part.Transparency = Tra
	Part.CanCollide = false
	Part.Locked = true
	Part.BrickColor = BrickColor.new(tostring(BC))
	Part.Name = Nam
	Part.Size = Siz
	Part.Position = Tor.Position
	Material = Mat
	RemoveOutlines(Part)
	return Part
end

function CreateMesh(Ms, Par, MType, MId, OS, Sca)
	local Msh = Instance.new(Ms)
	Msh.Parent = Par
	Msh.Offset = OS
	Msh.Scale = Sca

	if Ms == "SpecialMesh" then
		Msh.MeshType = MType
		Msh.MeshId = MId
	end
end

function CreateWeld(Par, PartA, PartB, CA, CB)
	local Weld = Instance.new("Weld")
	Weld.Parent = Par
	Weld.Part0 = PartA
	Weld.Part1 = PartB
	Weld.C0 = CA
	Weld.C1 = CB
	return Weld
end

Barrel = CreatePart(Enum.FormFactor.Custom, m, Enum.Material.SmoothPlastic, 0, 0, "Smoky grey", "Barrel", Vector3.new(0.324199915, -0.4, 0.216133296))
Barrel.Transparency = 1
Barrelweld = CreateWeld(m, GHandle, Barrel, CFrame.new(-4.5, 5, -1.22, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.000385284424, 0, 0.648399353, 1.88395493e-016, 1.00281931e-024, -1, 0.999999642, 0, 4.37113812e-008, 0, -0.999999642, -4.73655636e-016))

function CreateSound(id, par, vol, pit) 
	coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound")
		sou.Parent = par or workspace
		sou.Volume = vol
		sou.Pitch = pit or 1
		sou.SoundId = id
		wait() 
		sou:play() 
	end))
end

function clerp(a, b, t)
	return a:lerp(b, t)
end

function rayCast(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

function Damage(hit, damage, cooldown, Color1, Color2, HSound, HPitch)
	for i, v in pairs(hit:GetChildren()) do 
		if v:IsA("Humanoid") and hit.Name ~= Char.Name then
			local find = v:FindFirstChild("Hitz")
			if not find then
				if v.Parent:findFirstChild("Head") then
					local BillG = Instance.new("BillboardGui"){
						Parent = v.Parent.Head,
						Size = UDim2.new(1, 0, 1, 0),
						Adornee = v.Parent.Head,
						StudsOffset = Vector3.new(math.random(-3, 3), math.random(3, 5), math.random(-3, 3)),
					}
					local TL = Instance.new("TextLabel"){
						Parent = BillG,
						Size = UDim2.new(3, 3, 3, 3),
						BackgroundTransparency = 1,
						Text = tostring(damage).."-",
						TextColor3 = Color1.Color,
						TextStrokeColor3 = Color2.Color,
						TextStrokeTransparency = 0,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						FontSize = Enum.FontSize.Size18,
						Font = "ArialBold",
					}
					coroutine.resume(coroutine.create(function()
						wait(1)
						for i = 0, 1, .1 do
							wait(.1)
							BillG.StudsOffset = BillG.StudsOffset + Vector3.new(0, .1, 0)
						end
						BillG:Destroy()
					end))
				end
				v.Health = v.Health - damage
				local bool = Instance.new("BoolValue"){
					Parent = v,
					Name = 'Hitz',
				}
				if HSound ~= nil and HPitch ~= nil then
					CreateSound(HSound, hit, 1, HPitch) 
				end
				game:GetService("Debris"):AddItem(bool, cooldown)
			end
		end
	end
end

function MagnitudeDamage(Part, magni, mindam, maxdam, Color1, Color2, HitSound)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Ply.Name then 
					Damage(head.Parent, math.random(mindam, maxdam), 0, Color1, Color2, HitSound, 1)
				end
			end
		end
	end
end


local PE1 = Instance.new("ParticleEmitter")
PE1.Parent = Barrel
PE1.Color = ColorSequence.new(BrickColor.new("Dark stone grey").Color)
PE1.Transparency = NumberSequence.new(0)
PE1.Size = NumberSequence.new(.5)
PE1.Texture = "rbxassetid://257430870"
PE1.Lifetime = NumberRange.new(.1)
PE1.Rate = 100
PE1.VelocitySpread = 180
PE1.Rotation = NumberRange.new(0)
PE1.Speed = NumberRange.new(0)
PE1.LightEmission = .6
PE1.LockedToPart = true
PE1.Enabled = false


local PE2 = PE1:Clone()
PE2.Size = NumberSequence.new(.7)
PE2.LightEmission = 1
PE2.Texture = "rbxassetid://87729590"

function CylinderEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.2, 0.2, 0.2))
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 2)
	Effects[#Effects + 1] = {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3
	}
end

local Ammo = 10
local Depleted = false

function Shoot(asd, spread1, spread2)
	local MainPos = asd.Position
	local MainPos2 = mouse.Hit.p
	local spread = Vector3.new((math.random(-spread1, 0) + math.random()) * spread2, (math.random(-spread1, 0) + math.random()) * spread2, (math.random(-spread1, 0) + math.random()) * spread2) * (asd.Position - mouse.Hit.p).magnitude / 100
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2 + spread)
	num = 30
	Ammo = Ammo - 1
	print(Ammo)
	if Ammo == 0 then
		Depleted = true
	end
	coroutine.resume(coroutine.create(function(Spreaded) 
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, 50, RP.Parent)
			local TheHit = mouse.Hit.p
			local mag = (MainPos - pos).magnitude 
			CylinderEffect(BrickColor.new("Dark stone grey"), CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 3, mag * 5, 3, .5, 1, .5, 0.2)
			MainPos = MainPos + (MouseLook.lookVector * 50)
			num = num - 1
			if hit ~= nil then
				num = 0
				local ref = CreatePart(3, workspace, "Neon", 0, 1, BrickColor.new("Dark stone grey"), "Reference", Vector3.new())
				ref.Anchored = true
				ref.CFrame = CFrame.new(pos)
				MagnitudeDamage(ref, 5, 999999999, 999999999, BrickColor.new("Dark stone grey"), BrickColor.new("Navy blue") , "rbxassetid://199149297")
				game:GetService("Debris"):AddItem(ref, 1) 
			end
		until num <= 0
	end))
end
local Aiming = false
gyro = Instance.new("BodyGyro")
gyro.Parent = nil
gyro.P = 1e7
gyro.D = 1e3
gyro.MaxTorque = Vector3.new(0,1e7,0)


local Crouching = false

function Fire()
	if Aiming == true then
		attack = true
		debounce = false
		GHandle:FindFirstChildOfClass("AlignOrientation").Attachment1 = LA.LeftGripAttachment
		GHandle:FindFirstChildOfClass("AlignPosition").Attachment1 = LA.LeftGripAttachment
		LA.LeftGripAttachment.Orientation = Vector3.new(22.5,2.5,-90)
		LA.LeftGripAttachment.Position = Vector3.new(.75,-.8,0)
		CreateSound("rbxassetid://132572951", GHandle, 1, .9)
		CreateSound("rbxassetid://130767489", GHandle, .7, 1.2)
		PE1.Enabled = true
		PE2.Enabled = true
		Shoot(Barrel, 0, 0)
		for i = 0, 1, 0.2 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(-10), math.rad(90)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(90), math.rad(-20), math.rad(-90)), .5)
			LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.7, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(140)), .5)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		PE1.Enabled = false
		PE2.Enabled = false
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .3)
			LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .3)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		CreateSound("rbxassetid://146740582", GHandle, .7, 1)
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .5)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .5)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		for i = 0, 1, 0.3 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .4)
			RW.C0 = clerp(RW.C0, CFrame.new(.51, 0.51, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .4)
			LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.51, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .4)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		attack = false
	end

		
		debounce = true
		GHandle:FindFirstChildOfClass("AlignOrientation").Attachment1 = RA.RightGripAttachment
		GHandle:FindFirstChildOfClass("AlignPosition").Attachment1 = RA.RightGripAttachment
		RA.RightGripAttachment.Orientation = Vector3.new(0,90,-90)
		RA.RightGripAttachment.Position = Vector3.new(0,-2.85,-.75)
	
end

local Zoomed = false

function Reload()
	attack = true
	for i = 0, 1, 0.1 do
		wait()
		if Crouching == false and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		elseif Crouching == true and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		end
		Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(50)), .3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -.5) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-50)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.2, 0.5, -.5) * CFrame.Angles(math.rad(0), math.rad(60), math.rad(120)), .3)
		if Crouching == false and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
		elseif Crouching == true and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
		end
	end
	CreateSound("rbxassetid://131045401", GHandle, 1, 1)
	for i = 0, 1, 0.08 do
		wait()
		if Crouching == false and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		elseif Crouching == true and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		end
		Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(5), math.rad(50)), .3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -.5) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-50)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.2, 0.5, -.3) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(20)), .3)
		if Crouching == false and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
		elseif Crouching == true and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
		end
	end
	CreateSound("rbxassetid://131045429", GHandle, 1, 1)
	for i = 0, 1, 0.08 do
		wait()
		if Crouching == false and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		elseif Crouching == true and Aiming == true then 
			RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
		end
		Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(50)), .3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -.5) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(-50)), .5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.2, 0.5, -.3) * CFrame.Angles(math.rad(0), math.rad(60), math.rad(100)), .5)
		if Crouching == false and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
		elseif Crouching == true and Aiming == true then
			RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
		end
	end
	Ammo = 10
	print(Ammo)
	if Depleted == true then
		Depleted = false
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .3)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		CreateSound("rbxassetid://146740582", BoltHandle, .7, 1)
		for i = 0, 1, 0.1 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .5)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
		for i = 0, 1, 0.3 do
			wait()
			if Crouching == false and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			elseif Crouching == true and Aiming == true then 
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
			end
			Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(80)), .3)
			RW.C0 = clerp(RW.C0, CFrame.new(.5, 0.5, -.6) * CFrame.Angles(math.rad(80), math.rad(-30), math.rad(-90)), .5)
			LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.3, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(70)), .3)
			if Crouching == false and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
			elseif Crouching == true and Aiming == true then
				RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
			end
		end
	end
	attack = false
end

mouse.Button1Down:connect(function()
	if attack == false and Depleted == false then
		Fire()
	end
end)

mouse.KeyDown:connect(function(k)
	k = k:lower()
	if k == "r" and attack == false then
		Reload()
	elseif k == "f" and Aiming == false then
		Aiming = true
	elseif k == "f" and Aiming == true then
		Aiming = false
	elseif k == "c" and Aiming == true and Crouching == false then
		Crouching = true
	elseif k == "c" and Aiming == true and Crouching == true then
		Crouching = false
	elseif k == "z" and Aiming == true and Zoomed == false then
		Zoomed = true
		CreateSound("rbxassetid://180144779", GHandle, 1, 1)
		for i = 0, 1, 0.2 do 
			wait()
			cam.FieldOfView = cam.FieldOfView - 5
		end
		Ply.CameraMode = "LockFirstPerson"
		--Ply.DevEnableMouseLock = false
		cam.FieldOfView = 10
		mouse.Icon = "rbxassetid://18006519"
	elseif k == "z" and Aiming == true and Zoomed == true then
		Zoomed = false
		CreateSound("rbxassetid://190623951", GHandle, 1, 1)
		for i = 0, 1, 0.2 do 
			wait()
			cam.FieldOfView = cam.FieldOfView + 5
		end
		Ply.CameraMode = "Classic"
		--Ply.DevEnableMouseLock = true
		cam.FieldOfView = 80
		cam.CameraSubject = Hu
		mouse.Icon = ""
	end
end)


local sine = 0
local change = 1
local val = 0

while true do
	wait()
	sine = sine + change
	local torvel = (RP.Velocity * Vector3.new(1, 0, 1)).magnitude 
	local velderp = RP.Velocity.y
	hitfloor, posfloor = rayCast(RP.Position, (CFrame.new(RP.Position, RP.Position - Vector3.new(0, 1, 0))).lookVector, 4, Char)
	if equipped == true or equipped == false then
		if Aiming == true then
			if Crouching == false and Aiming == true then
				Hu.WalkSpeed = 10
			elseif Crouching == true and Aiming == true then
				Hu.WalkSpeed = 5
			end
			gyro.Parent = RP
			if debounce then
				GHandle:FindFirstChildOfClass("AlignOrientation").Attachment1 = RA.RightGripAttachment
				GHandle:FindFirstChildOfClass("AlignPosition").Attachment1 = RA.RightGripAttachment
				RA.RightGripAttachment.Orientation = Vector3.new(0,90,-90)
				RA.RightGripAttachment.Position = Vector3.new(0,-2.85,-.75)
			end
			local gunpos = Vector3.new(mouse.Hit.p.x, He.Position.Y, mouse.Hit.p.z)
			offset = (Tor.Position.y - mouse.Hit.p.y) / 60
			local mag = (Tor.Position - mouse.Hit.p).magnitude / 80
			offset = offset / mag 
			gyro.CFrame = CFrame.new(Vector3.new(),(mouse.Hit.p -RP.CFrame.p).unit * 100)
		elseif Aiming == false then
			Hu.JumpPower = 50
			Hu.WalkSpeed = 16
			gyro.Parent = nil
			GHandle:FindFirstChildOfClass("AlignOrientation").Attachment1 = LA.LeftGripAttachment
			GHandle:FindFirstChildOfClass("AlignPosition").Attachment1 = LA.LeftGripAttachment
			LA.LeftGripAttachment.Orientation = Vector3.new(70,2.5,-90)
			LA.LeftGripAttachment.Position = Vector3.new(0.5,-1.2,-0.6)
		end
		if RP.Velocity.y > 1 and hitfloor == nil then 
			Anim = "Jump"
			if attack == false and Aiming == false then
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), .3)
				RW.C0 = clerp(RW.C0, CFrame.new(1.2, 0.4, -.2) * CFrame.Angles(math.rad(60), math.rad(0), math.rad(-40)), .3)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.4) * CFrame.Angles(math.rad(0), math.rad(80), math.rad(60)), .3)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-4), math.rad(0), math.rad(-30)), .3)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-4), math.rad(0), math.rad(30)), .3)
			elseif attack == false and Aiming == true then
				if Crouching == false and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				elseif Crouching == true and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				end
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .4)
				RW.C0 = clerp(RW.C0, CFrame.new(.51, 0.51, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .4)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.51, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .4)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				if Crouching == false and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				elseif Crouching == true and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
				end
			end
		elseif RP.Velocity.y < -1 and hitfloor == nil then 
			Anim = "Fall"
			if attack == false and Aiming == false then
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), .3)
				RW.C0 = clerp(RW.C0, CFrame.new(1.2, 0.4, -.2) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(-40)), .3)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.4) * CFrame.Angles(math.rad(0), math.rad(80), math.rad(100)), .3)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-4), math.rad(0), math.rad(30)), .3)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-4), math.rad(0), math.rad(-30)), .3)
			elseif attack == false and Aiming == true then
				if Crouching == false and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				elseif Crouching == true and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				end
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .4)
				RW.C0 = clerp(RW.C0, CFrame.new(.51, 0.51, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .4)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.51, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .4)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				if Crouching == false and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				elseif Crouching == true and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
				end
			end
		elseif torvel < 1 and hitfloor ~= nil then
			Anim = "Idle"
			if attack == false and Aiming == false then
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(50)), .3)
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(-50)), .3)
				RW.C0 = clerp(RW.C0, CFrame.new(1.2, 0.4, 0) * CFrame.Angles(math.rad(70), math.rad(0), math.rad(-40)), .3)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.4) * CFrame.Angles(math.rad(0), math.rad(80), math.rad(70)), .3)
				RH.C0 = clerp(RH.C0, CFrame.new(.9, -.5, .2) * RHCF * CFrame.Angles(math.rad(-5), math.rad(-50), math.rad(0)), .3)
				LH.C0 = clerp(LH.C0, CFrame.new(-.5, -1, -1) * LHCF * CFrame.Angles(math.rad(-5), math.rad(-50), math.rad(50)), .3)
			elseif attack == false and Aiming == true then
				if Crouching == false and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				elseif Crouching == true and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				end
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .4)
				RW.C0 = clerp(RW.C0, CFrame.new(.51, 0.51, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .4)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.51, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .4)
				if Crouching == false and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				elseif Crouching == true and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -.5, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
				end
			end
		elseif torvel > 2 and hitfloor ~= nil then
			Anim = "Walk"
			if attack == false and Aiming == false then
				RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), .3)
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), .3)
				RW.C0 = clerp(RW.C0, CFrame.new(1.2, 0.4, -.2) * CFrame.Angles(math.rad(50), math.rad(0), math.rad(-40)), .3)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.4) * CFrame.Angles(math.rad(0), math.rad(80), math.rad(50)), .3)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-3), math.rad(0), math.rad(0)), .3)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-3), math.rad(0), math.rad(0)), .3)
			elseif attack == false and Aiming == true then
				if Crouching == false and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				elseif Crouching == true and Aiming == true then 
					RJ.C0 = clerp(RJ.C0, RootCF * CFrame.new(0, 0, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .4)
				end
				Ne.C0 = clerp(Ne.C0, NeckCF * CFrame.Angles(math.rad(5), math.rad(0), math.rad(90)), .4)
				RW.C0 = clerp(RW.C0, CFrame.new(.51, 0.51, -.6) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), .4)
				LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.51, 0) * CFrame.Angles(math.rad(0), math.rad(160), math.rad(90)), .4)
				RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				if Crouching == false and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
				elseif Crouching == true and Aiming == true then
					RH.C0 = clerp(RH.C0, CFrame.new(1, -.1, -.5) * RHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), .4)
					LH.C0 = clerp(LH.C0, CFrame.new(-1, -.1, -.2) * LHCF * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(50)), .4)
				end
			end
		end

	end
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, .5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end
