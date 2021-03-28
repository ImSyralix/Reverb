
--remove line below for no wallbang
loadstring(game:HttpGet("https://raw.githubusercontent.com/ascaxz/ReleaseScripts/main/Pistol1v1SilentAim.lua"))()

game:GetService("Players").SyralixTM.PlayerGui.MainGui.crosshair.ImageTransparency = 100

local m_deagle = require(game:GetService("ReplicatedStorage").GunModules.Deagle)
m_deagle.recoilMult = 0
m_deagle.ClipSize = math.huge
m_deagle.FireRate = 0.01
m_deagle.ReloadTime = 0.1
m_deagle.WalkSpeed = 25

local m_tec9 = require(game:GetService("ReplicatedStorage").GunModules:FindFirstChild("Tec-9"))
m_tec9.recoilMult = 0
m_tec9.ClipSize = math.huge
m_tec9.FireRate = 0.01
m_tec9.ReloadTime = 0.1
m_tec9.WalkSpeed = 25

local m_glock = require(game:GetService("ReplicatedStorage").GunModules.Glock)
m_glock.recoilMult = 0
m_glock.ClipSize = math.huge
m_glock.FireRate = 0.01
m_glock.ReloadTime = 0.1
m_glock.WalkSpeed = 25

local m_1911 = require(game:GetService("ReplicatedStorage").GunModules:FindFirstChild("1911"))
m_1911.recoilMult = 0
m_1911.ClipSize = math.huge
m_1911.FireRate = 0.01
m_1911.ReloadTime = 0.1
m_1911.WalkSpeed = 25

--EPIC CROSSHAIR!

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

--Properties:


--Triggerbot
--Setting--
local ToggleKey = Enum.KeyCode.E 
--End Of Settings--

--==//[[ Main ]]\\==--

local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character or Player.CharacterAdded:wait()
local Root = Char.HumanoidRootPart or Char:WaitForChild("HumanoidRootPart")
local Camera = game.Workspace.CurrentCamera
local Mouse = Player:GetMouse()
local PlayerTeam = Player.Team
local Neutral = Player.Neutral
local UIS = game:GetService("UserInputService")
local Toggled = false

---==GUI==---
local GUI = Instance.new("ScreenGui")
local On = Instance.new("TextLabel")
local Loaded = Instance.new("TextLabel")
GUI.Name = "GUI"
GUI.Parent = game.CoreGui --game.Players.LocalPlayer:WaitForChild("PlayerGui")
On.Name = "On"
On.Parent = GUI
On.BackgroundColor3 = Color3.new(0.313726, 0.313726, 0.313726)
On.BackgroundTransparency = 100
On.BorderSizePixel = 0
On.Position = UDim2.new(0.0, 0, 0.0, 300)
On.Size = UDim2.new(0, 160, 0, 20)
On.Font = Enum.Font.Arial
On.Text = "[E] Triggerbot: False"
On.TextColor3 = Color3.new(1, 1, 1)
On.TextScaled = true
On.TextSize = 20
On.TextWrapped = true
Loaded.Name = "Loaded"
Loaded.Parent = GUI
Loaded.BackgroundColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Loaded.BackgroundTransparency = 100
Loaded.BorderSizePixel = 0
Loaded.Position = UDim2.new(0.806596696, 0, 0.949685514, 0)
Loaded.Size = UDim2.new(0, 258, 0, 32)
Loaded.Font = Enum.Font.Arial
Loaded.Text = "Reverb.WTF Loaded."
Loaded.TextColor3 = Color3.new(1, 1, 1)
Loaded.TextScaled = true
Loaded.TextSize = 14
Loaded.TextWrapped = true
---End Gui--

local FindTeams = function()
	local CC1 = false
	local CC2 = false
	
if PlayerTeam ~= nil and Neutral == false then
		if #game:GetService("Teams"):GetTeams() > 0 then
		CC1 = true
		for i, v in pairs(game:GetService("Teams"):GetTeams()) do
			if #v:GetPlayers() > 0 and v ~= PlayerTeam and CC1 == true then
				CC2 = true
			elseif #v:GetPlayers() <= 0 and CC1 == true then
				return "FFA"
			end
		end
		elseif #game:GetService("Teams"):GetTeams() <= 0 then
			return "FFA"
		end
elseif Neutral == true then
	return "FFA"	
elseif PlayerTeam == nil then
	return "FFA"
end
if CC1 == true and CC2 == true then
	return "TEAMS"
end
end
--{[/| Functions |\]}--

function Click()
	mouse1click()
	--print("Tripped")
end
function CastRay(Mode)
	local RaySPTR = Camera:ScreenPointToRay(Mouse.X, Mouse.Y) --Hence the var name, the magnitude of this is 1.
	local NewRay = Ray.new(RaySPTR.Origin, RaySPTR.Direction * 9999)
	local Target, Position = workspace:FindPartOnRayWithIgnoreList(NewRay, {Char,workspace.CurrentCamera})
	if Target and Position and game:GetService("Players"):GetPlayerFromCharacter(Target.Parent) and Target.Parent.Humanoid.Health > 0 or Target and Position and game:GetService("Players"):GetPlayerFromCharacter(Target.Parent.Parent) and Target.Parent.Parent.Humanoid.Health > 0 then
		local TPlayer = game:GetService("Players"):GetPlayerFromCharacter(Target.Parent) or game:GetService("Players"):GetPlayerFromCharacter(Target.Parent.Parent)
		if TPlayer.Team ~= PlayerTeam and Mode ~= "FFA" and TPlayer ~= Player then
			Click()
		elseif TPlayer.Team == PlayerTeam and TPlayer ~= Player then
			if Mode == "FFA" then
				Click()
			end
		end
	end
end
--End Functions--
UIS.InputBegan:Connect(function(Input)
	if Input.KeyCode == ToggleKey then
		Toggled = not Toggled
		On.Text = "[E] Triggerbot: ".. tostring(Toggled)
	end
end)

local PreMode = FindTeams()
local O = false
game:GetService("RunService").Stepped:Connect(function()
		local Mode = FindTeams()
	if O == false then
		O = true
		print(Mode)
	end
	if Mode ~= PreMode then
		PreMode = Mode
		print(Mode)
	end
	if Toggled == true then

	CastRay(Mode)
end
end)


ScreenGui.Parent = game.CoreGui

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 100.000
TextLabel.Position = UDim2.new(0.5, -100, 0.5, -46)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "卐"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 50.000

Spin = TextLabel
while true do
wait(0.01)
Spin.Rotation = Spin.Rotation +3
end



local Loggers = getconnections(game:GetService("LogService").MessageOut)[2].Function
debug.setupvalue(Loggers, 1, {})
hookfunction(Loggers, function() end)
