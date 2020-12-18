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
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end

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

local fldr = Instance.new("Folder",game:FindFirstChildOfClass("Players").LocalPlayer["Character"])
fldr.Name = "DMYF"
local CloneChar = DeadChar:Clone()
local ANIMATIONHERE
if CloneChar:FindFirstChild("Animate") then
	ANIMATIONHERE = CloneChar:FindFirstChild("Animate"):Clone()
	CloneChar:FindFirstChild("Animate"):Destroy()
end
if CloneChar:FindFirstChildOfClass("Folder") then CloneChar:FindFirstChildOfClass("Folder"):Destroy() end
if CloneChar.Torso:FindFirstChild("Neck") then
	local Clonessss = CloneChar.Torso:FindFirstChild("Neck"):Clone()
	Clonessss.Part0 = nil
	Clonessss.Part1 = DeadChar.Head
	Clonessss.Parent = DeadChar.Torso
end
CloneChar.Parent = fldr
CloneChar.HumanoidRootPart.CFrame = DeadChar.HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non"
CloneChar.Humanoid.DisplayDistanceType = "None"

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
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
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
	end
end

local a = DeadChar.Torso
local b = DeadChar.HumanoidRootPart
local c = DeadChar.Humanoid
a.Parent = game:FindFirstChildOfClass("Workspace")
c.Parent = game:FindFirstChildOfClass("Workspace")
local told = a:Clone()
local told1 = c:Clone()
b["RootJoint"].Part0 = told
b["RootJoint"].Part1 = DeadChar.Head
a.Name = "torso"
a.Neck:Destroy()
c.Name = "Mizt Hub Best"
told.Parent = DeadChar
told1.Parent = DeadChar
DeadChar.PrimaryPart = told
told1.Health = 0
b:Destroy()
a.Parent = DeadChar
c.Parent = DeadChar
told:Destroy()
told1:Destroy()
a.Name = "Torso"

if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end

local Collider
function UnCollide()
	if HumanDied then Collider:Disconnect(); return end
	for _,Parts in next, CloneChar:GetChildren() do
		if Parts:IsA("BasePart") then
			Parts.CanCollide = false 
		end 
	end
	for _,Parts in next, DeadChar:GetChildren() do
		if Parts:IsA("BasePart") then
			Parts.CanCollide = false
		end 
	end 
end
Collider = game:GetService("RunService").Stepped:Connect(UnCollide)

local resetBindable = Instance.new("BindableEvent")
resetBindable.Event:connect(function()
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	resetBindable:Destroy()
	HumanDied = true
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


SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"])
SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"])
SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"])
SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"])
SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"])
SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"])

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
				v.CFrame = DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)
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

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
	end
end

if ANIMATIONHERE then ANIMATIONHERE.Parent = CloneChar end
Player = game.Players.LocalPlayer
PlayerGui = Player.PlayerGui
Mouse = Player:GetMouse()
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Character)
sick.Parent = Torso
sick.Name = "comander_cool"
sick:resume()
sick.Looped = true
sick.Volume = 1
sick.SoundId = "rbxassetid://935994277"
sick.Pitch = 1
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
it = Instance.new
MODE = "1"
Animation_Speed = 3
local FORCERESET = false
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local HOODC0 = CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0))
local SHOTGUNC0 = CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local s = 0
local c = 1
local anchrd = false
local RUN = game:service'RunService'
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local AntiBanish = true
local AMODE = "box"
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
local NICE = 2.8
local VALUE3 = false
--ROBLOXIDLEANIMATION.Parent = Humanoid

local Effects = IT("Folder", Character)
Effects.Name = "Effects"

local ANIMATOR = Humanoid.Animator
local ANIMATE = Character:FindFirstChild("Animate")
local UNANCHOR = true
local TOBANISH = {}
local SKILLFONT = "Arcade"
--//=================================\\
--\\=================================//

local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local Plrs = S.Players
NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

function shakes(power,length)
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
	local var = script.Shaker:Clone()
	var.Parent = v.Character
	local pw = var.Shakeval
	local lgth = var.MultLength
	pw.Value = power
	lgth.Value = length
	var.Disabled = false
	game:GetService("Debris"):AddItem(var, length+4)
	end
end

ff = Instance.new("ForceField",Character)
ff.Visible = false

function localshakes(power,length)
local var = script.Shaker:Clone()
var.Parent = Player.Character
local pw = var.Shakeval
local lgth = var.MultLength
pw.Value = power
lgth.Value = length
var.Disabled = false
game:GetService("Debris"):AddItem(var, length+4)
end



local MATTER = {"Plastic","Wood","Slate","Concrete","CorrodedMetal","DiamondPlate","Foil","Grass","Ice","Marble","Granite","Brick","Pebble","Sand","Fabric","SmoothPlastic","Metal","WoodPlanks","Cobblestone","Air","Water","Rock","Glacier","Snow","Sandstone","Mud","Basalt","Ground","CrackedLava","Neon","Glass","Asphalt","LeafyGrass","Salt","Limestone","Pavement","ForceField"}

local PlayerSize = 1
local FT,FRA,FLA,FRL,FLL = Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh"),Instance.new("SpecialMesh")
FT.MeshId,FT.Scale = "rbxasset://fonts/torso.mesh",Vector3.new(PlayerSize,PlayerSize,PlayerSize)
FRA.MeshId,FRA.Scale = "rbxasset://fonts/rightarm.mesh",Vector3.new(PlayerSize,PlayerSize,PlayerSize)
FLA.MeshId,FLA.Scale = "rbxasset://fonts/leftarm.mesh",Vector3.new(PlayerSize,PlayerSize,PlayerSize)
FRL.MeshId,FRL.Scale = "rbxasset://fonts/rightleg.mesh",Vector3.new(PlayerSize,PlayerSize,PlayerSize)
FLL.MeshId,FLL.Scale = "rbxasset://fonts/leftleg.mesh",Vector3.new(PlayerSize,PlayerSize,PlayerSize)

local AUDIOS = {"rbxassetid://844654533","rbxassetid://1439600000","rbxassetid://2256088590","rbxassetid://3154204326"}

if Player.Character:FindFirstChild("Animate") then
	local an = Humanoid:GetPlayingAnimationTracks()
	for i = 1, #an do
		an[i]:Stop()
	end
	Humanoid.Animator:Destroy()
	Player.Character:FindFirstChild("Animate"):Destroy()
	ANIMATOR:Destroy()
	ANIMATE:Destroy()
end
local fakerot = 0

local mde = "normal"


function BypassGS(sound)
	Instance.new("StringValue",sound).Name = "PleaseDontDestroyMeImAGoodBoiSoundSoPleaseDontDestroyMe"
end

--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//
--DO NOT TOUCH THIS
if Character:FindFirstChild("Adds")then wait(.2) script.Disabled = true script:Destroy() error("You Shouldn't Have Added A Banisher Gun To My Script") end

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end
function Rwait(num)
if num == 0 or num == nil then
RUN.Stepped:wait()
else
for i=0,num do
RUN.Stepped:wait()
end
end
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end
BypassGS(sick)
local S = IT("Sound",script)
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		BypassGS(NEWSOUND)
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CreateSound2(ID, PARENT, VOLUME, PITCH, TIMEPOS, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		BypassGS(NEWSOUND)
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.TimePosition = TIMEPOS
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end
function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end
function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end
function ApplyDamage(Humanoid,Damage)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health < 2000 then
		if Humanoid.Health - Damage > 0 then
			Humanoid.Health = Humanoid.Health - Damage
		else
			Humanoid.Parent:BreakJoints()
		end
	else
		Humanoid.Parent:BreakJoints()
	end
end

function Fancy_spawntrail(LOC,AIMTO,OUCH)
	WACKYEFFECT2({Time = 25, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(1.1,1.1,1.1), Transparency = 0, Transparency2 = 1, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	for i = 1, 1 do
		local POS1 = CF(LOC,AIMTO)*CF(0,0,-45).p
		local AIMPOS = CF(LOC,POS1) * CF(0,0,-45) * ANGLES(RAD(MRANDOM(-25,25)), RAD(MRANDOM(-25,25)), RAD(MRANDOM(-25,25)))*CF(0,0,MRANDOM(5,75)/10).p
		local HIT,POS = CastProperRay(LOC,AIMPOS,1000,Character)
		local DISTANCE = (POS - LOC).Magnitude
		if HIT then
			local HUM = nil
			if HIT.Parent:FindFirstChildOfClass("Humanoid") then
				HUM = HIT.Parent:FindFirstChildOfClass("Humanoid")
			elseif HIT.Parent.Parent:FindFirstChildOfClass("Humanoid") then
				HUM = HIT.Parent.Parent:FindFirstChildOfClass("Humanoid")
			end
			if HUM then
			Kill3(HIT.Parent)
			end
		end
		
		WACKYEFFECT2({Time = 20, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = 1, SoundVolume = 4})
		WACKYEFFECT2({Time = 20, EffectType = "Box", Size = VT(0,0,DISTANCE), Size2 = VT(0.7,0.7,DISTANCE), Transparency = 0.6, Transparency2 = 1, CFrame = CF(LOC,POS)*CF(0,0,-DISTANCE/2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
end


function Fancy_spawntrail3(LOC,AIMTO,OUCH)
	WACKYEFFECT2({Time = 25, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(1.1,1.1,1.1), Transparency = 0, Transparency2 = 1, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	for i = 1, 1 do
		local POS1 = CF(LOC,AIMTO)*CF(0,0,-45).p
		local AIMPOS = CF(LOC,POS1) * CF(0,0,-45) * ANGLES(RAD(MRANDOM(-0,0)), RAD(MRANDOM(-0,0)), RAD(MRANDOM(-0,0)))*CF(0,0,MRANDOM(5,75)/10).p
		local HIT,POS = CastProperRay(LOC,AIMPOS,1000,Character)
		local DISTANCE = (POS - LOC).Magnitude
		if HIT then
			local HUM = nil
			if HIT.Parent:FindFirstChildOfClass("Humanoid") then
				HUM = HIT.Parent:FindFirstChildOfClass("Humanoid")
			elseif HIT.Parent.Parent:FindFirstChildOfClass("Humanoid") then
				HUM = HIT.Parent.Parent:FindFirstChildOfClass("Humanoid")
			end
			if HUM then
		Kill2(HUM)
			BEAN(HUM)
			end
		end
		WACKYEFFECT2({Time = 20, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = 1, SoundVolume = 4})
		WACKYEFFECT2({Time = 20, EffectType = "Box", Size = VT(0,0,DISTANCE), Size2 = VT(0.7,0.7,DISTANCE), Transparency = 0.6, Transparency2 = 1, CFrame = CF(LOC,POS)*CF(0,0,-DISTANCE/2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
end


function Fancy_spawntrail2(LOC,AIMTO,OUCH)
	WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(0.3,0.3,0.3), Transparency = 0, Transparency2 = 1, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	for i = 1, 1 do
		local POS1 = CF(LOC,AIMTO)*CF(0,0,-45).p
		local AIMPOS = CF(LOC,POS1) * CF(0,0,-45) * ANGLES(RAD(MRANDOM(0,15)), RAD(MRANDOM(0,15)), RAD(MRANDOM(0,15)))*CF(0,0,MRANDOM(5,75)/10).p
		local HIT,POS = CastProperRay(LOC,AIMPOS,1000,Character)
		local DISTANCE = (POS - LOC).Magnitude
		WACKYEFFECT2({Time = 20, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(0.3,0.3,0.3), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT2({Time = 20, EffectType = "Box", Size = VT(0,0,DISTANCE), Size2 = VT(0.1,0.1,DISTANCE), Transparency = 0.6, Transparency2 = 1, CFrame = CF(LOC,POS)*CF(0,0,-DISTANCE/2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
end

function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Really red", "Trail", VT(0,0,0))
	MakeForm(TRAIL,"Cyl")
	local DIST = (FROM - TO).Magnitude
	if BIG == true then
		TRAIL.Size = VT(0.5,DIST,0.5)
	else
		TRAIL.Size = VT(0.25,DIST,0.25)
	end
	TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function()
		for i = 1, 5 do
			Swait()
			TRAIL.Transparency = TRAIL.Transparency + 0.1
		end
		TRAIL:remove()
	end))
end

function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function WACKYEFFECT3(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)),RAD(MRANDOM(0,0)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT) 
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		elseif TYPE == "Hat" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "173774068", "", SIZE, VT(0,0,0))
		elseif TYPE == "Arm" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "2828256740", "", SIZE, VT(0,0,0))
		elseif TYPE == "torso" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "48112070", "", SIZE, VT(0,0,0))
		elseif TYPE == "Head" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "539723444", "", SIZE, VT(0,0,0))
		elseif TYPE == "Mask" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4548197626", "", SIZE, VT(0,0,0))
		elseif TYPE == "Spike" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "2720161649", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end


--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT4(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local MIDDLESIZE = (Table.Size2 or VT(0.5,0.5,0.5))
	local ENDSIZE = (Table.Size3 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT) 
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		elseif TYPE == "Hat" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "173774068", "", SIZE, VT(0,0,0))
		elseif TYPE == "Arm" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "2828256740", "", SIZE, VT(0,0,0))
		elseif TYPE == "torso" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "48112070", "", SIZE, VT(0,0,0))
		elseif TYPE == "Head" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "539723444", "", SIZE, VT(0,0,0))
		elseif TYPE == "Mask" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4548197626", "", SIZE, VT(0,0,0))
		elseif TYPE == "Spike" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "2720161649", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE + MIDDLESIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end
print("This script was made possible thanks to DevHub.")
function chatfunc(text)
	local chat = coroutine.wrap(function()
	if Character:FindFirstChild("TalkingBillBoard")~= nil then
		Character:FindFirstChild("TalkingBillBoard"):destroy()
	end
	local Bill = Instance.new("BillboardGui",Character)
	Bill.Size = UDim2.new(0,20,0,10)
	Bill.StudsOffset = Vector3.new(0,3,0)
	Bill.Adornee = Character.Head
	Bill.Name = "TalkingBillBoard"
	local Hehe = Instance.new("TextLabel",Bill)
	Hehe.BackgroundTransparency = 1
	Hehe.BorderSizePixel = 0
	Hehe.Text = ""
	Hehe.Font = "Highway"
	Hehe.TextSize = 30
	Hehe.TextStrokeTransparency = 0
	Hehe.Size = UDim2.new(1,0,0.5,0)
	coroutine.resume(coroutine.create(function()
		while Hehe ~= nil do
			wait()
			Hehe.TextColor3 = C3(250,250,250)
			Hehe.TextStrokeColor3 = C3(0,0,0)
			Hehe.Position = UDim2.new(0,0,.1,0)	
			Hehe.Rotation = 0
		end
	end))
	for i = 1,string.len(text),1 do
		wait()
		Hehe.Text = string.sub(text,1,i)
	end
	wait(3)--Re[math.random(1, 93)]
	for i = 0, 5, .035 do
		wait()
		Bill.ExtentsOffset = Vector3.new(math.random(-i, i), math.random(-i, i), math.random(-i, i))
		Hehe.TextStrokeTransparency = i
		Hehe.TextTransparency = i
	end
	Bill:Destroy()
	end)
chat()
end


--chatfunc(Player.Name..":".."Sup!")
--ParticleEmitter({Speed = 0.5, Drag = 0, Size1 = 0.2, Size2 = 0, Lifetime1 = 0.3, Lifetime2 = 0.7, Parent = Dangle, Emit = 100, Offset = 360, Enabled = true, Acel = VT(0,5,0)})
function Banish(Foe)
	if Foe then
		coroutine.resume(coroutine.create(function()
			--if game.Players:FindFirstChild(Foe.Name) then
				table.insert(TOBANISH,Foe.Name)
			--end
			Foe.Archivable = true
			local CLONE = Foe:Clone()
			Foe:Destroy()
			CLONE.Parent = Effects
			CLONE:BreakJoints()
			local MATERIALS = {"Glass","Neon"}
			for _, c in pairs(CLONE:GetDescendants()) do
				if c:IsA("BasePart") then
					c.Anchored = true
					c.Transparency = c.Transparency + 1
					c.Material = MATERIALS[MRANDOM(1,2)]
					c.Color = C3(1,0,0)
					if c.ClassName == "MeshPart" then
						c.TextureID = ""
					end
					if c:FindFirstChildOfClass("SpecialMesh") then
						c:FindFirstChildOfClass("SpecialMesh").TextureId = ""
					end
					if c:FindFirstChildOfClass("Decal") then
						c:FindFirstChildOfClass("Decal"):remove()
					end
					c.Name = "Banished"
					c.CanCollide = false
				else
					c:remove()
				end
			end
			local A = false
			for i = 1, 35 do
				if A == false then
					A = true
				elseif A == true then
					A = false
				end
				for _, c in pairs(CLONE:GetDescendants()) do
					if c:IsA("BasePart") then
						c.Anchored = true
						c.Material = MATERIALS[MRANDOM(1,2)]
						c.Transparency = c.Transparency + 0.8/35
						if A == false then
							c.CFrame = c.CFrame*CF(0,0,0)
						elseif A == true then
							c.CFrame = c.CFrame*CF(0,0,0)						
						end
					end
				end
				Swait()
			end
			CLONE:remove()
		end))
	end
end


function Kill2(Foe)
	local TARGET = Mouse.Target
	if Foe then
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = TARGET.Parent:FindFirstChild("HumanoidRootPart") or TARGET.Parent:FindFirstChild("Torso") or TARGET.Parent:FindFirstChild("UpperTorso")
				local FOE = Mouse.Target.Parent
				ATTACK = true
				Rooted = true
        WACKYEFFECT({Time = 100, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(-2,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color=Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 100, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(2,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color=Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 100, EffectType = "Arm", Size = VT(2.05,1.05,1.05), Size2 = VT(2.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color=Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 100, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,-2,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color=Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 100, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,-2,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color=Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 100, EffectType = "Head", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,1,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Plastic", 	Color= Color3.fromRGB(MRANDOM(1,255),MRANDOM(1,255),MRANDOM(1,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
				FOE.Parent = nil
			end
	end
end

function Kill3(Foe)
	local TARGET = Mouse.Target
	if Foe then
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = TARGET.Parent:FindFirstChild("HumanoidRootPart") or TARGET.Parent:FindFirstChild("Torso") or TARGET.Parent:FindFirstChild("UpperTorso")
				local FOE = Mouse.Target.Parent
				ATTACK = true
				Rooted = true
        WACKYEFFECT({Time = 35, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(-2,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color=Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 35, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(2,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color=Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 35, EffectType = "Arm", Size = VT(2.05,1.05,1.05), Size2 = VT(2.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,0,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color=Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 35, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,-2,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color=Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 35, EffectType = "Arm", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,-2,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color=Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

        WACKYEFFECT({Time = 35, EffectType = "Head", Size = VT(1.05,1.05,1.05), Size2 = VT(1.05,1.05,1.05), Transparency = 0, Transparency2 = 1, CFrame = ROOT.CFrame*CF(0,1,0), MoveToPos = ROOT.CFrame*CF(MRANDOM(-9,9),MRANDOM(-9,9),MRANDOM(-9,9)).p, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", 	Color= Color3.fromRGB(255,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
				FOE.Parent = nil
			end
	end
end


workspace.ChildAdded:connect(function(instance)
    for BANISH = 1, #TOBANISH do
		if TOBANISH[BANISH] ~= nil then
			if instance.Name == TOBANISH[BANISH] then
				coroutine.resume(coroutine.create(function()
					instance:ClearAllChildren()

				end))
			end
		end
	end
end)
function StatLabel(CFRAME, TEXT, COLOR)
	local STATPART = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
	STATPART.CFrame = CF(CFRAME.p,CFRAME.p+VT(MRANDOM(-5,5),MRANDOM(0,5),MRANDOM(-5,5)))
	local BODYGYRO = IT("BodyGyro", STATPART)
	game:GetService("Debris"):AddItem(STATPART ,5)
	local BILLBOARDGUI = Instance.new("BillboardGui", STATPART)
	BILLBOARDGUI.Adornee = STATPART
	BILLBOARDGUI.Size = UD2(2.5, 0, 2.5 ,0)
	BILLBOARDGUI.StudsOffset = VT(-2, 2, 0)
	BILLBOARDGUI.AlwaysOnTop = false
	local TEXTLABEL = Instance.new("TextLabel", BILLBOARDGUI)
	TEXTLABEL.BackgroundTransparency = 1
	TEXTLABEL.Size = UD2(2.5, 0, 2.5, 0)
	TEXTLABEL.Text = TEXT
	TEXTLABEL.Font = SKILLFONT
	TEXTLABEL.FontSize="Size42"
	TEXTLABEL.TextColor3 = COLOR
	TEXTLABEL.TextStrokeTransparency = 0
	TEXTLABEL.TextScaled = true
	TEXTLABEL.TextWrapped = true
	coroutine.resume(coroutine.create(function(THEPART, THEBODYPOSITION, THETEXTLABEL)
		for i = 1, 10 do
			Swait()
			STATPART.CFrame = STATPART.CFrame * CF(0,0,-0.2)
			TEXTLABEL.TextTransparency = TEXTLABEL.TextTransparency + (1/10)
			TEXTLABEL.TextStrokeTransparency = TEXTLABEL.TextTransparency
		end
		THEPART.Parent = nil
	end),STATPART, TEXTLABEL)
end
function ApplyDamage2(Humanoid,Damage,TorsoPart)
	local defence = Instance.new("BoolValue",Humanoid.Parent)
	defence.Name = ("HitBy"..Player.Name)
	game:GetService("Debris"):AddItem(defence, 0.001)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health ~= 0 then
		local CritChance = MRANDOM(1,100)
		if Damage > Humanoid.Health then
			Damage = math.ceil(Humanoid.Health)
			if Damage == 0 then
				Damage = 0.1
			end
		end
		Humanoid.Health = Humanoid.Health - Damage
	end
end

function ApplyAoE3(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							CHILD:BreakJoints()
						else
							local DMG = MRANDOM(MINDMG,MAXDMG)
							ApplyDamage2(HUM,DMG,TORSO)
						end
						if FLING > 0 then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity") 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = CF(POSITION,TORSO.Position).lookVector*FLING
									bv.Parent = c
									Debris:AddItem(bv,0.05)
								end
							end
						end
					end
				end
			end
		end
	end
end

function ApplyDamage(Humanoid,Damage,TorsoPart)
	local defence = Instance.new("BoolValue",Humanoid.Parent)
	defence.Name = ("HitBy"..Player.Name)
	game:GetService("Debris"):AddItem(defence, 0.001)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health ~= 0 then
		local CritChance = MRANDOM(1,100)
		if Damage > Humanoid.Health then
			Damage = math.ceil(Humanoid.Health)
			if Damage == 0 then
				Damage = 0.1
			end
		end
		Humanoid.Health = Humanoid.Health - Damage
		StatLabel(TorsoPart.CFrame * CF(0, 0 + (TorsoPart.Size.z - 1), 0), Damage, C3(0, 0, 0))
	end
end
local Blk = CreatePart(0,LeftArm,"Neon",1,1,BrickColor.Random(),"aa",VT(0.005,0.005,0.005),false)
local BW = CreateWeldOrSnapOrMotor("Weld",LeftArm,LeftArm,Blk,CF(0,-2,0),CF(0,0,0))



--[[
top=it("Shirt",Character)
top.Name = "Shirt"
bottom=it("Pants",Character)
bottom.Name = "Pants"

if Player.Name ~= "Commandcodes1234" then
for i,x in pairs(Character:GetDescendants()) do if x:IsA("Shirt") or x:IsA("Pants") then x:Destroy() end end

top=it("Shirt",Character)
top.Name = "Shirt"
bottom=it("Pants",Character)
bottom.Name = "Pants"
Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=0"
Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=0"
end
]]


--[[coroutine.resume(coroutine.create(function()
	while wait() do
		end
end))--]]

--[[
local hd = script.Headz
hd.Parent = Character
hd.CFrame = Head.CFrame
weldBetween(Head,hd)
local BUCKETWELD = CreateWeldOrSnapOrMotor("Weld", Head, Head, hd, CF(0, 0, 0), CF(0, 0, 0))
BUCKETWELD.C0 = BUCKETWELD.C0 * ANGLES(RAD(-0), RAD(0), RAD(0))


]]
--[[
coroutine.resume(coroutine.create(function()
	while wait() do

	end
end))

]]
coroutine.resume(coroutine.create(function()
	while wait() do
for _,c in pairs(Character:GetDescendants()) do
if c.ClassName == "CharacterMesh" then
c:Remove()
end
	end
	end
end))




function Warp()

    local HITFLOOR,HITPOS = Raycast(Mouse.Hit.p+VT(0,1,0), (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 100, Character)
    if HITFLOOR then
        HITPOS = HITPOS + VT(0,0,0)
        local POS = RootPart.Position
        RootPart.CFrame = CF(HITPOS,CF(POS,HITPOS)*CF(0,0,-100000).p)
        CreateSound(164320294,Torso,3,1.5,false)
		localshakes(0.1,5)
	end
end






local BEANED = {}



local BEANED = {}

function BEAN(skid)	
if skid then	
g = game.Players:GetPlayers()
	local kickfolder = IT("Folder",Effects)
	local naeeym2 = Instance.new("BillboardGui",kickfolder)
	naeeym2.AlwaysOnTop = false
	naeeym2.Size = UDim2.new(5,35,2,35)
	naeeym2.StudsOffset = Vector3.new(0,1,0)
	naeeym2.Name = "Mark"
	local tecks2 = Instance.new("TextLabel",naeeym2)
	tecks2.BackgroundTransparency = 1
	tecks2.TextScaled = true
	tecks2.BorderSizePixel = 0
	tecks2.Text = ""
	tecks2.Font = "Arcade"
	tecks2.TextSize = 30
	tecks2.TextStrokeTransparency = 0
	tecks2.TextColor3 = Color3.fromRGB(0,0,0)
	tecks2.TextStrokeColor3 = Color3.fromRGB(0,0,0)
	tecks2.Size = UDim2.new(1,0,0.5,0)
	tecks2.Parent = naeeym2
--CreateSound("395664538", skid, 5, 1, false)
local Players = game:GetService("Players")
local die = Players:FindFirstChild(skid.Name)
--die:Kick()
	if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
	end
		if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
		end
			if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
			end
				if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
				end
					if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
					end
						if Players:FindFirstChild(skid.Name) then
	die:Kick("You were never allowed here in the first place.")
						end
						table.insert(BEANED,skid.name)
	--]]
			--CreateSound("527749592", game.Workspace, 700, 1, false)
	--CHARACTER:Remove()
	--[[
	for i,v in pairs(g) do
	--v:remove()
	end ]]--
	--[[
	if CHARACTER.Name ~= "Default Dummy" or CHARACTER.Name ~= "NPC" then
for i,v in pairs(g) do
	if string.find(string.upper(v.Name),CHARACTER) == 1 then
v:remove()
end
end
	end]]--
	--[[
		for _, p in pairs(game.Players:GetChildren()) do
		if p:FindFirstChild("CHARACTER") then

		end
	end]]--
	coroutine.resume(coroutine.create(function()
		for i = 1, 50 do
			Swait()
			for i,v in ipairs(kickfolder:GetChildren()) do
				if v.ClassName == "Part" or v.ClassName == "MeshPart" then
					v.Transparency = 1
				end
				naeeym2.Enabled = false
			end
			Swait()
			for i,v in ipairs(kickfolder:GetChildren()) do
				if v.ClassName == "Part" or v.ClassName == "MeshPart" then
					v.Transparency = 0
				end
				naeeym2.Enabled = true
			end
		end
		kickfolder:remove()
	end))
	--wait(6)
	--skid:Remove()
end
end 


local function CheckForBan(player)
	for i = 1, #BEANED do
		if player.Name == BEANED[i] then
			player:Kick() --Ban Reason Change between the '' to change the reason!
		end
	end
end

game.Players.PlayerAdded:connect(function()
	for i,v in pairs(game.Players:GetPlayers())do
		CheckForBan(v)
	end  
end)



function template()
	ATTACK = true
	Rooted = true
	for i=0, 0.1, 0.01 / Animation_Speed do
		Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.35 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.35 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0))* RIGHTSHOULDERC0, 0.35 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.35 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 0.35 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 , 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 0.35 / Animation_Speed)
		end
	ATTACK = false
	Rooted = false
end











local EyeSizes={
	NumberSequenceKeypoint.new(0,1,0),
	NumberSequenceKeypoint.new(1,0,0)
}
local EyeTrans={
	NumberSequenceKeypoint.new(0,0.8,0),
	NumberSequenceKeypoint.new(1,1,0)
}
local PE=Instance.new("ParticleEmitter",nil)
PE.LightEmission=.8
PE.Color = ColorSequence.new(BRICKC("Really red").Color)
PE.Size=NumberSequence.new(EyeSizes)
PE.Transparency=NumberSequence.new(EyeTrans)
PE.Lifetime=NumberRange.new(0.35,1.5)
PE.Rotation=NumberRange.new(0,360)
PE.Rate=999
PE.VelocitySpread = 10000
PE.Acceleration = Vector3.new(0,0,0)
PE.Drag = 5
PE.Speed = NumberRange.new(0,0,0)
PE.Texture="http://www.roblox.com/asset/?id=1351966707"
PE.ZOffset = -0
PE.Name = "PE"
PE.Enabled = false



function particles(art)
	local PARTICLES = PE:Clone()
	PARTICLES.Parent = art
end

function KillChildren(v)
	v:BreakJoints()
	for _, c in pairs(v:GetChildren()) do
		if c:IsA("BasePart") then
			if c.Transparency < 1 then
				if c:FindFirstChildOfClass("Decal") then
					c:FindFirstChildOfClass("Decal"):remove()
				end
				particles(c)
				c.PE.Enabled = true
				c.Parent = Effects
				c.CanCollide = false
				c.Material = "Neon"
				c.Color = C3(1,0,0)
				c.Transparency = 1
				local grav = Instance.new("BodyPosition",c)
				grav.P = 20000
				grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
				grav.position = c.Position + VT(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5))
				grav.Name = "GravityForce"
				coroutine.resume(coroutine.create(function()
					for i = 1, 20 do
						Swait()
						c.Transparency = c.Transparency + 1/20
					end
					c.PE.Enabled = false
					Debris:AddItem(c,2)
				end))
			end
		end
	end
end

local WHITELIST = {"Jack_Hase","Godcat567","Powertommm"}
function SmiteAoE(POSITION,RANGE)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local LISTED = false
			for LIST = 1, #WHITELIST do
				if WHITELIST[LIST] ~= nil then
					if CHILD.Name == WHITELIST[LIST] then
						LISTED = true
					end
				end
			end
			if LISTED == false then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - POSITION).Magnitude <= RANGE+TORSO.Size.Magnitude then
							KillChildren(CHILD)
						end
					end
				end
			end
		end
	end
end




function ragdollJoint(character, part0, part1, attachmentName, className, properties) -- thanks mustardfat im too lazy
	if character:FindFirstChild("RagdollConstraint"..part1.Name) == nil then
	for i,v in pairs(character:GetChildren()) do
		if v:IsA("MeshPart") and (v.MeshId == 'http://www.roblox.com/asset/?id=553602991' or v.MeshId == 'http://www.roblox.com/asset/?id=553602977' or v.MeshId == 'http://www.roblox.com/asset/?id=553602987') then
			v.Size = Vector3.new(1,1,1)
		end
	end
	if part1:FindFirstChildOfClass('Motor6D') then
		part1:FindFirstChildOfClass('Motor6D'):Remove()
	end
	if attachmentName ~= "NeckAttachment" then
		attachmentName = attachmentName.."RigAttachment"
	end
	local constraint = Instance.new(className.."Constraint")
	constraint.Attachment0 = part0:FindFirstChild(attachmentName)
	constraint.Attachment1 = part1:FindFirstChild(attachmentName)
	constraint.Name = "RagdollConstraint"..part1.Name
	if character:FindFirstChildOfClass('Humanoid').Health > 0 then
	local collidepart = Instance.new('Part',part1)
	collidepart.Size = part1.Size/2
	if string.find(string.lower(part1.Name),"upper") then
		if string.find(string.lower(part1.Name),"leg") then
			collidepart.Size = part1.Size/3
		else
			collidepart.Size = part1.Size/2.5
		end
	end
	collidepart.CanCollide = true
	collidepart.Name = "RagdollJoint"
	collidepart.Anchored = false
	collidepart.Transparency = 1
	collidepart.CFrame = part1.CFrame
	collidepart:BreakJoints()
	local attachment0 = Instance.new('Attachment',part1)
	local attachment1 = Instance.new('Attachment',collidepart)
	if attachment0 and attachment1 then
		local constraint = Instance.new("HingeConstraint")
		constraint.Attachment0 = attachment0
		constraint.Attachment1 = attachment1
		constraint.LimitsEnabled = true
		constraint.UpperAngle = 0
		constraint.LowerAngle = 0
		constraint.Parent = character
	end
	if string.find(string.lower(part1.Name),"upper") then
		if string.find(string.lower(part1.Name),"leg") then
			attachment0.Position = Vector3.new(0,0.01,0)
		else
			attachment0.Position = Vector3.new(0,0.25,0)
		end
	else
		attachment0.Position = Vector3.new(0,-0.1,0)
	end
	end
	for _,propertyData in next,properties or {} do
		constraint[propertyData[1]] = propertyData[2]
	end
	constraint.Parent = character
	return constraint
	end
end

local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}

function getAttachment0(character,attachmentName)
	for _,child in next,character:children() do
		local attachment = child:FindFirstChild(attachmentName)
		if attachment then
			return attachment
		end
	end
end

function recurse(root,callback,i)
	i= i or 0
	for _,v in pairs(root:GetChildren()) do
		i = i + 1
		callback(i,v)
		
		if #v:GetChildren() > 0 then
			i = recurse(v,callback,i)
		end
	end
	
	return i
end

local Stunned = {}

function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso'
end

function FakeWeld(p0,p1)
	local attachment0 = Instance.new('Attachment',p0)
	local attachment1 = Instance.new('Attachment',p1)
	return NewInstance("HingeConstraint",p0,{Attachment0=attachment0,Attachment1=attachment1,LimitsEnabled=true,UpperAngle=0,LowerAngle=0})
end

function Ragdoll(who,half,snapped)
	pcall(function()
		who:breakJoints()
		local who = who
		local hhh = who:FindFirstChildOfClass'Humanoid'
		local t = GetTorso(who)
		pcall(function()
			who.HumanoidRootPart:destroy()
		end)
		hhh.Health = 0
		Stunned[who] = true
		if(hhh.RigType == Enum.HumanoidRigType.R6)then
			local RA,LA,RL,LL,HD = who:FindFirstChild'Right Arm',who:FindFirstChild'Left Arm',who:FindFirstChild'Right Leg',who:FindFirstChild'Left Leg',who:FindFirstChild'Head'			
			pcall(function()
				if(hhh.Health > 0)then  local CollideRA = NewInstance('Part',who,{Size=RA.Size/1.5,Anchored=false,Transparency=1,Name='Collision'})
				FakeWeld(RA,CollideRA) end
				local RAJ = NewInstance("Attachment",t,{Position=V3.N(1.5,.5,0),Orientation=V3.N()})
				local RAJ2 = NewInstance("Attachment",RA,{Position=V3.N(0,.5,0),Orientation=V3.N()})
				local RAC = NewInstance('BallSocketConstraint',t,{Radius=.15,LimitsEnabled=true,Enabled=true,Restitution=0,UpperAngle=90,Attachment0=RAJ,Attachment1=RAJ2})
			end)
			pcall(function()
				local LAJ = NewInstance("Attachment",t,{Position=V3.N(-1.5,.5,0),Orientation=V3.N()})
				local LAJ2 = NewInstance("Attachment",LA,{Position=V3.N(0,.5,0),Orientation=V3.N()})

				local LAC = NewInstance('BallSocketConstraint',t,{Radius=.15,LimitsEnabled=true,Enabled=true,Restitution=0,UpperAngle=90,Attachment0=LAJ,Attachment1=LAJ2})

				if(hhh.Health > 0)then local CollideLA = NewInstance('Part',who,{Size=LA.Size/1.5,Anchored=false,Transparency=1,Name='Collision'})
				FakeWeld(LA,CollideLA) end
			end)
			pcall(function()
				if(HD)then 
					local NJ = NewInstance('Attachment',t,{Position=V3.N(0,1,0),Orientation=V3.N()})
					local NJ2 = NewInstance('Attachment',HD,{Position=V3.N(0,-.5,0),Orientation=V3.N()})
					local NJ3 = NewInstance('Attachment',HD,{Position=V3.N(0,.5,0),Orientation=V3.N()})
					local HC = NewInstance('HingeConstraint',t,{LimitsEnabled=true,UpperAngle=50,LowerAngle=-50,Attachment0=NJ,Attachment1=NJ2})
	
					if(snapped)then
						NJ.Orientation = V3.N(0,90,0)
					end
					if(hhh.Health > 0)then 
						local CollideHD = NewInstance('Part',who,{Size=HD.Size/1.5,Anchored=false,Transparency=1,Name='Collision'})
						FakeWeld(HD,CollideHD)
					end
				end
			end)
			if(not half)then
				local RLJ = NewInstance("Attachment",t,{Position=V3.N(.5,-1,0),Orientation=V3.N()})
				local RLJ2 = NewInstance("Attachment",RL,{Position=V3.N(0,1,0),Orientation=V3.N()})
				local LLJ = NewInstance("Attachment",t,{Position=V3.N(-.5,-1,0),Orientation=V3.N()})
				local LLJ2 = NewInstance("Attachment",LL,{Position=V3.N(0,1,0),Orientation=V3.N()})
				local RLC = NewInstance('BallSocketConstraint',t,{Radius=.15,LimitsEnabled=true,Enabled=true,Restitution=0,UpperAngle=90,Attachment0=RLJ,Attachment1=RLJ2})
				local LLC = NewInstance('BallSocketConstraint',t,{Radius=.15,LimitsEnabled=true,Enabled=true,Restitution=0,UpperAngle=90,Attachment0=LLJ,Attachment1=LLJ2})
				if(hhh.Health > 0)then local CollideRL = NewInstance('Part',who,{Size=RL.Size/1.5,Anchored=false,Transparency=1,Name='Collision'})
				local CollideLL = NewInstance('Part',who,{Size=LL.Size/1.5,Anchored=false,Transparency=1,Name='Collision'})

				FakeWeld(RL,CollideRL)
				FakeWeld(LL,CollideLL) end
			end
			for _,v in next, who:children() do
				if(v:IsA'BasePart')then
					v.CanCollide = true
				end
			end
		else
			local character = who
			
			if(half)then
				pcall(function()
					character.UpperTorso.WaistRigAttachment:Destroy()
				end)
			end

			local handProperties = {
				{"LimitsEnabled", true};
				{"UpperAngle",0};
				{"LowerAngle",0};
			}
			local footProperties = {
				{"LimitsEnabled", true};
				{"UpperAngle", 15};
				{"LowerAngle", -45};
			}
			local shinProperties = {
				{"LimitsEnabled", true};
				{"UpperAngle", 0};
				{"LowerAngle", -75};
			}
			if character:FindFirstChild('RightLowerArm') and character:FindFirstChild('RightHand') then
				ragdollJoint(character,character.RightLowerArm, character.RightHand, "RightWrist", "Hinge", handProperties)
			end
			if character:FindFirstChild('UpperTorso') and character:FindFirstChild('RightUpperArm') then
				ragdollJoint(character, character.UpperTorso, character["RightUpperArm"], "RightShoulder", "BallSocket")
			end
			if character:FindFirstChild('RightUpperArm') and character:FindFirstChild('RightLowerArm') then
				ragdollJoint(character, character.RightUpperArm, character.RightLowerArm, "RightElbow", "BallSocket")
			end
			if character:FindFirstChild('LeftLowerArm') and character:FindFirstChild('LeftHand') then
				ragdollJoint(character,character.LeftLowerArm, character.LeftHand, "LeftWrist", "Hinge", handProperties)
			end
			if character:FindFirstChild('UpperTorso') and character:FindFirstChild('LeftUpperArm') then
				ragdollJoint(character, character.UpperTorso, character["LeftUpperArm"], "LeftShoulder", "BallSocket")
			end
			if character:FindFirstChild('LeftUpperArm') and character:FindFirstChild('LeftLowerArm') then
				ragdollJoint(character, character.LeftUpperArm, character.LeftLowerArm, "LeftElbow", "BallSocket")
			end
			if character:FindFirstChild('RightUpperLeg') and character:FindFirstChild('RightLowerLeg') then
				ragdollJoint(character,character.RightUpperLeg, character.RightLowerLeg, "RightKnee", "Hinge", shinProperties)
			end
			if character:FindFirstChild('RightLowerLeg') and character:FindFirstChild('RightFoot') then
				ragdollJoint(character,character.RightLowerLeg, character.RightFoot, "RightAnkle", "Hinge", footProperties)
			end
			if character:FindFirstChild('LowerTorso') and character:FindFirstChild('RightUpperLeg') then
				ragdollJoint(character,character.LowerTorso, character.RightUpperLeg, "RightHip", "BallSocket")
			end
			if character:FindFirstChild('LeftUpperLeg') and character:FindFirstChild('LeftLowerLeg') then
				ragdollJoint(character,character.LeftUpperLeg, character.LeftLowerLeg, "LeftKnee", "Hinge", shinProperties)
			end
			if character:FindFirstChild('LeftLowerLeg') and character:FindFirstChild('LeftFoot') then
				ragdollJoint(character,character.LeftLowerLeg, character.LeftFoot, "LeftAnkle", "Hinge", footProperties)
			end
			if character:FindFirstChild('LowerTorso') and character:FindFirstChild('LeftUpperLeg') then
				ragdollJoint(character,character.LowerTorso, character.LeftUpperLeg, "LeftHip", "BallSocket")
			end
			if character:FindFirstChild('UpperTorso') and character:FindFirstChild('LowerTorso') then
				ragdollJoint(character,character.LowerTorso, character.UpperTorso, "Waist", "BallSocket", {
					{"LimitsEnabled",true};
					{"UpperAngle",5};
					{"Radius",5};
				})
			end
			if character:FindFirstChild('UpperTorso') and character:FindFirstChild('Head') then
				ragdollJoint(character,character.UpperTorso, character.Head, "Neck", "Hinge", {
					{"LimitsEnabled",true};
					{"UpperAngle",50};
					{"LowerAngle",-50};
				})
			end
			local NeckA = ragdollJoint(character,character.UpperTorso, character.Head, "Neck", "Hinge", {
				{"LimitsEnabled",true};
				{"UpperAngle",50};
				{"LowerAngle",-50};
			})

			recurse(character, function(_,v)
				if v:IsA("Attachment") then
					v.Axis = Vector3.new(0, 1, 0)
					v.SecondaryAxis = Vector3.new(0, 0, 1)
					v.Rotation = Vector3.new(0, 0, 0)
					if(v.Parent == character.Head and snapped)then
						v.Orientation = V3.N(0,-90,0)
					end
				end
			end)
		end
	end)
end


local YTES = {true,false}

function KickA()
	local TARGET = Mouse.Target
	if TARGET ~= nil then
	local HITFLOOR, HITPOS = Raycast(RightLeg.Position, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 2 , Character)
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = TARGET.Parent:FindFirstChild("HumanoidRootPart") or TARGET.Parent:FindFirstChild("Torso") or TARGET.Parent:FindFirstChild("UpperTorso")
				local FOE = Mouse.Target.Parent
				ATTACK = true
				Rooted = true
			Ragdoll(FOE,(YTES[MRANDOM(1,#YTES)]),(YTES[MRANDOM(1,#YTES)]))
				BEAN(FOE)
				ATTACK = false
				Rooted = false
			end
		end
	end
function KillB()
	local TARGET = Mouse.Target
	if TARGET ~= nil then
	local HITFLOOR, HITPOS = Raycast(RightLeg.Position, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 2 , Character)
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = TARGET.Parent:FindFirstChild("HumanoidRootPart") or TARGET.Parent:FindFirstChild("Torso") or TARGET.Parent:FindFirstChild("UpperTorso")
				local FOE = Mouse.Target.Parent
				ATTACK = true
			Rooted = false
			
			Ragdoll(FOE,(YTES[MRANDOM(1,#YTES)]),(YTES[MRANDOM(1,#YTES)]))
				ATTACK = false
				Rooted = false
			end
		end
end





function Effect(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or Color3.new(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BrickColor.new("Pearl"), "Effect", Vector3.new(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", Vector3.new(SIZE.X,SIZE.X,0.1), Vector3.new(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", Vector3.new(SIZE.X/10,0,SIZE.X/10), Vector3.new(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", Vector3.new(SIZE.X/10,0,SIZE.X/10), Vector3.new(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, Vector3.new(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - (Vector3.new((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end



function Lightning(Part0, Part1, Times, Offset, Color, Timer, sSize, eSize, Trans, Boomer, sBoomer, slow, stime)
  local magz = (Part0 - Part1).magnitude
  local curpos = Part0
  local trz = {
    -Offset,
    Offset
  }
  for i = 1, Times do
    local li = Instance.new("Part", Effects)
    li.Name = "Lightning"
    li.TopSurface = 0
    li.Material = "Neon"
    li.BottomSurface = 0
    li.Anchored = true
    li.Locked = true
    li.Transparency = 0
    li.BrickColor = Color
    li.formFactor = "Custom"
    li.CanCollide = false
    li.Size = Vector3.new(0.1, 0.1, magz / Times)
    local Offzet = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
    local trolpos = CFrame.new(curpos, Part1) * CFrame.new(0, 0, magz / Times).p + Offzet
    if Times == i then
      local magz2 = (curpos - Part1).magnitude
      li.Size = Vector3.new(0.1, 0.1, magz2)
      li.CFrame = CFrame.new(curpos, Part1) * CFrame.new(0, 0, -magz2 / 2)
    else
      li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / Times / 2)
    end
    curpos = li.CFrame * CFrame.new(0, 0, magz / Times / 2).p
    li:Destroy()
	Effect({Time = Timer, EffectType = "Box", Size = Vector3.new(sSize,sSize,li.Size.Z), Size2 = Vector3.new(eSize,eSize,li.Size.Z), Transparency = Trans, Transparency2 = 1, CFrame = li.CFrame, MoveToPos = nil, RotationX = nil, RotationY = nil, RotationZ = nil, Material = "Neon", Color = li.Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = Boomer, Boomerang = 0, SizeBoomerang = sBoomer})
  	if slow == true then
	swait(stime)
	end
  end
end

--[[
--refit by godcat
local Regen = {}
delay(1,function()
	local Descendants = Character:GetDescendants()
	
	for i = 1,#Descendants do
		local E = Descendants[i]
		if E:IsA("BasePart") and not E:IsDescendantOf(Effects) then
			E.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Wood)
			table.insert(Regen,{E,E.Parent,E.Color,E.Size,E.Material})
		end
		if E:IsA("JointInstance") then
			table.insert(Regen,{E,E.Parent,nil,nil,nil})
		end
	end
end)

for e = 1, #Regen do
	if Regen[e] ~= nil then
		local STUFF = Regen[e]
		local PART = STUFF[1]
		local PARENT = STUFF[2]
		local MATERIAL = STUFF[3]
		local COLOR = STUFF[4]
		local TRANSPARENCY = STUFF[5]
		if PART.ClassName == "Part" and PART ~= Body.RootPart then
			PART.Material = MATERIAL
			PART.Color = COLOR
			PART.Transparency = TRANSPARENCY
		end
		PART.AncestryChanged:Connect(function()
			PART.Parent = PARENT
		end)
	end
end

function Refit()
	for i = 1,#Regen do
		local E = Regen[i]
		local PART = E[1]
		local PARENT = E[2]
		local COLOR = E[3]
		local SIZE = E[4]
		local MATERIAL = E[5]
		
		if PART:IsA("BasePart") and PART.Parent ~= PARENT then
			PART.Color = COLOR
			PART.Size = SIZE
			PART.Material = MATERIAL
		end
		if PART.Parent ~= PARENT then
			Humanoid.Parent = nil
			PART.Parent = PARENT
			Humanoid.Parent = Character
		end
	end
	Humanoid.Parent = Character
end

local BODY = {}

for e = 1, #BODY do
	if BODY[e] ~= nil then
		local STUFF = BODY[e]
		local PART = STUFF[1]
		local PARENT = STUFF[2]
		local MATERIAL = STUFF[3]
		local COLOR = STUFF[4]
		local TRANSPARENCY = STUFF[5]
		if PART.ClassName == "Part" and PART ~= RootPart then
			PART.Material = MATERIAL
			PART.Color = COLOR
			PART.Transparency = TRANSPARENCY
		end
		PART.AncestryChanged:Connect(function()
			PART.Parent = PARENT
		end)
	end
end

function Refit2()
	Character.Parent = workspace
	Effects.Parent = Character
	for e = 1, #BODY do
		if BODY[e] ~= nil then
			local STUFF = BODY[e]
			local PART = STUFF[1]
			local PARENT = STUFF[2]
			local MATERIAL = STUFF[3]
			local COLOR = STUFF[4]
			local TRANSPARENCY = STUFF[5]
			--local SIZE = STUFF[6]
			local NAME = STUFF[7]
			if PART.ClassName == "Part" and PART ~= RootPart then
				PART.Material = MATERIAL
				PART.Transparency = TRANSPARENCY
				PART.Name = NAME
			end
			if PART.Parent ~= PARENT then
				if PART.Name == "Head" or PART.Name == "Neck" or PART.Name == "Torso" then
					Humanoid:remove()
				end
				PART.Parent = PARENT
				if PART.Name == "Head" or PART.Name == "Neck" or PART.Name == "Torso" then
					Humanoid = IT("Humanoid",Character)
				end
			end
		end
	end
end


Humanoid.Died:Connect(Refit)
Humanoid.HealthChanged:Connect(function()
	if Humanoid.Health <= 1 then
		Humanoid.Health = math.huge
		Refit()
	end
end)--]]

function MouseDown(Mouse)
	if ATTACK == false then
	Bonk()
	end
end

function MouseUp(Mouse)
HOLD = false
end
function KeyDown(Key)
	KEYHOLD = true
	if Key == "q" and ATTACK == false then
	Warp()
	end
	if Key == "z" and ATTACK == false then
	KillB()
	end
	if Key == "x" and ATTACK == false then
	KickA()
end
end

function KeyUp(Key)
	KEYHOLD = false
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

if Character:FindFirstChildOfClass("Humanoid") == nil then
	Humanoid = Instance.new("Humanoid",Character)
end

while true do
	Swait()
	ANIMATE.Parent = nil
	if Character:FindFirstChildOfClass("Humanoid") == nil then
		Humanoid = IT("Humanoid",Character)
	end

	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 then
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
	end
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , -0.5-0.5*COS(SINE/NICE)) * ANGLES(RAD(90), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0))* RIGHTSHOULDERC0, 1 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1.5+0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE), 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5-0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE) , 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 1 / Animation_Speed)
	    end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , -0.5-0.5*COS(SINE/NICE)) * ANGLES(RAD(180), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0))* RIGHTSHOULDERC0, 1 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1.5+0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE), 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5-0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE) , 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
				if mde == "normal" then
				Speed = 60
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , -0.5-0.5*COS(SINE/NICE)) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0))* RIGHTSHOULDERC0, 3 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 3 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1.5+0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE), 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 3 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5-0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE) , 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 3 / Animation_Speed)
			end		
		end	
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			Speed = 60

				local Testwalk1 = Humanoid.MoveDirection*Torso.CFrame.LookVector
	            local Testwalk2 = Humanoid.MoveDirection*Torso.CFrame.RightVector
	            LOOKVEC = Testwalk1.X+Testwalk1.Z
			    RIGHTVEC = Testwalk2.X+Testwalk2.Z
			if mde == "normal" then
			if MRANDOM(1+5*COS(SINE/0.5),1+5*COS(SINE/0.5)) == 5 then
				CreateSound(4724428597, Torso, 10, MRANDOM(9,15)/12,false)
end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , -0.5-0.5*COS(SINE/NICE)) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0))* RIGHTSHOULDERC0, 3 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(50+40*COS(SINE/NICE)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 3 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.5+0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE)+ 0.3 * SIN(SINE / 2), 0)* ANGLES(RAD((-LOOKVEC  + LOOKVEC/5  * COS(SINE / 1))*90* COS(SINE / 2)),RAD(0),RAD((-RIGHTVEC + RIGHTVEC/5  * COS(SINE / 1))*40*COS(SINE/2)))*ANGLES(RAD(0),RAD(90),RAD(0)), 3 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5-0.5*COS(SINE/NICE), -0.5+0.5*COS(SINE/NICE)- 0.3 * SIN(SINE / 2), 0)* ANGLES(RAD((LOOKVEC  - LOOKVEC/5  * COS(SINE / 1))*90* COS(SINE / 2)),RAD(0),RAD((RIGHTVEC - RIGHTVEC/5  * COS(SINE / 1))*40*COS(SINE/2)))*ANGLES(RAD(0),RAD(-90),RAD(0)), 3 / Animation_Speed)	
			end	
		end
	end
Player.Chatted:connect(function(message)
if message:sub(1,5) == "play/"  then
sick.SoundId = "rbxassetid://"..message:sub(6)
elseif message:sub(1,6) == "pitch/"  then
sick.PlaybackSpeed = message:sub(7)
elseif message:sub(1,6) == "speed/"  then
NICE = message:sub(7)
elseif message:sub(1,4) == "vol/"  then
sick.Volume = message:sub(5) 
elseif message:sub(1,5) == "skip/"  then
sick.TimePosition = message:sub(6)

end
end)

	Humanoid.MaxHealth = math.huge
	Humanoid.Health = math.huge
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	if mde == "Mask" then
		if Head:FindFirstChild("face") then
			Head.face.Transparency = 1
		end
	else 
		if Head:FindFirstChild("face") then
			Head.face.Transparency = 0
		end
		end
end

-------------------------------------------------
