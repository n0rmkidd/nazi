loadstring(game:HttpGet(('https://pastebin.com/raw/Cu7bKQWN'),true))()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end

local Player = game.Players.LocalPlayer
local RenderStepped = game.RunService.RenderStepped
local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart", 5)
 
function CharacterPosition(p, a, b, c, x, y, z)
    local BodyForce = Instance.new("BodyForce")
    BodyForce.Force = Vector3.new(0, 196.2, 0) * p:GetMass()
    BodyForce.Parent = p
    
    RenderStepped:Connect(function()
        p.CFrame = HumanoidRootPart.CFrame * CFrame.new(a, b, c) * CFrame.Angles(x, y, z)
    end)
    
    p:BreakJoints()
end
 
CharacterPosition(Player.Character["Left Arm"], -1, 1.5, 0, 0, 0, math.rad(-90))
CharacterPosition(Player.Character["Right Arm"], 1.5, 1, 0, 0, 0, math.rad(180))
CharacterPosition(Player.Character["Left Leg"], -1.5, -1, 0, 0, 0, math.rad(0))
CharacterPosition(Player.Character["Right Leg"], 1, -1.5, 0, 0, 0, math.rad(90))
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(0,-30,0)
wait(0.5)
end)
end
end
