local player=game.Players.LocalPlayer
local mouse = player:GetMouse()

local bodythurst=Instance.new("BodyVelocity", player.Character.Head)

local speedy=false
mouse.KeyDown:connect(function(key)
if key:byte() == 48 then
bodythurst.force=Vector3.new(0,0,-4000)
end end)

local player=game.Players.LocalPlayer
local mouse = player:GetMouse()

local bodythurst=Instance.new("BodyAngularVelocity", player.Character.Head)

local speedy=false
mouse.KeyDown:connect(function(key)
if key:byte() == 48 then
bodythurst.force=Vector3.new(0,0,-4000)
end end)

  local Anim = Instance.new("Animation")

      Anim.AnimationId = "rbxassetid://27432686"

      local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)

bruh:Play()

bruh:AdjustSpeed(0)

      wait(2000)

bruh:Stop()
