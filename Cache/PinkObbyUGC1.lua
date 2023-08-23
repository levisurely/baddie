local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ"))();

-- Complete Obby
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Complete Obby", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
for i = game:GetService("Players").LocalPlayer.leaderstats.Stage.Value, 100 do
	wait(0.5);
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").Stages:WaitForChild(i).Spawn.CFrame;
end;
end);

Setup:CreateClickSounds();
