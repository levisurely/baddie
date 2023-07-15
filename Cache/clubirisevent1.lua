local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
	["content-type"] = "application/json"
};
_G.Color = Color3.new(0, 0, 0);
local Setup = (loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ")))();
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = (MainUI:WaitForChild("gameskijack")):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Get Letters", Color3.new(1, 1, 0));
AutoETS.MouseButton1Down:Connect(function()
	for i, v in pairs((game:GetService("Workspace")).LetterHidingSpots:GetChildren()) do
		for a, z in pairs(v:GetChildren()) do
			z.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
		end;
	end;
end);
local AutoSuns = Setup:CreateButton(GameUI, "Get Suns", Color3.new(1, 1, 0));
AutoSuns.MouseButton1Down:Connect(function()
	for i, v in pairs((game:GetService("Workspace")).SunFolder:GetChildren()) do
		v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	end;
end);
Setup:CreateClickSounds();
