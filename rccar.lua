loadstring(game:HttpGet(('https://pastebin.com/raw/AHMxx0FC'),true))()

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150

game:GetService("RunService").RenderStepped:Connect(function()
    setsimulationradius(math.huge)
end)


local offset = CFrame.new(0,-1,0)
local fling = false
flingoffset = Vector3.new(0,-1,0)
flingvel = 9999999
local accessoryname = "MeshPartAccessory"
local name = "Eltoría RS750"

function gethrp(char)
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChildWhichIsA("BasePart")
end

local plr = game:GetService("Players").LocalPlayer
local chara = plr.Character
chara.Archivable = true
local fakechara = workspace:FindFirstChild(name) or chara:clone()
fakechara.Name = name
fakechara.Parent = workspace
local duck = chara:FindFirstChild(accessoryname) or chara:FindFirstChildWhichIsA("Accessory") or false
assert(duck,"No valid accessories exist!")
local phandle = duck:FindFirstChild("Handle")
if phandle:FindFirstChild("AccessoryWeld") then phandle:FindFirstChild("AccessoryWeld"):Destroy() end



if fling then
    local flinghat
    for i,v in pairs(chara:GetChildren()) do
        if v.Name ~= duck.Name then flinghat = v end 
    end
    if flinghat then
    flinghandle = flinghat:WaitForChild("Handle")
    if flinghandle:FindFirstChildOfClass("SpecialMesh") then flinghandle:FindFirstChildOfClass("SpecialMesh"):Destroy() end
--mover = Instance.new("BodyPosition",flinghandle)
--mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    
    
    flinghat.Parent = workspace
    local vel = Instance.new("BodyAngularVelocity",flinghandle)
    vel.AngularVelocity = Vector3.new(flingvel,flingvel,flingvel)
    vel.MaxTorque = Vector3.new(500000,500000,500000)
    vel.P = 300000
    else fling = false
    end
    
end 


plr.Character = fakechara
fakechara:FindFirstChildWhichIsA("Humanoid").Died:connect(function() plr.Character = chara workspace.CurrentCamera.CameraSubject = chara:FindFirstChildWhichIsA('Humanoid') fakechara:Destroy() end)
local fakehrp = fakechara:FindFirstChild("Torso") or gethrp(fakechara)
local realhrp = gethrp(chara)
workspace.CurrentCamera.CameraSubject = fakechara:FindFirstChildWhichIsA('Humanoid')
for i,v in pairs(fakechara:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Transparency = 1
    elseif v:IsA("Accessory") or v:IsA("Decal") then
        v:Destroy()
    end
end



repeat game:GetService("RunService").Heartbeat:wait()
    pcall(function()
        phandle.CFrame = fakehrp.CFrame * offset
        phandle.Velocity = Vector3.new(0,0,0)
    end)
    if fling then 
    	flinghandle.Position = (fakehrp.CFrame * offset).p + flingoffset
    	flinghandle.Velocity = Vector3.new(0,0,0)
	   flinghandle.CanCollide = false
        end
    realhrp.Anchored = true
until fakechara.Parent == nil
realhrp.Anchored = false
repeat game:GetService("RunService").Heartbeat:wait()
    pcall(function()
        phandle.CFrame = realhrp.CFrame * offset
        phandle.Velocity = Vector3.new(0,0,0)
    end)
        if fling then 
        pcall(function()
	--mover.Position = Vector3.new(0,workspace.FallenPartsDestroyHeight-10,0)
	flinghandle.CanCollide = false
        end)
        end
until chara.Parent == nil or workspace:FindFirstChild(name) ~= nil
