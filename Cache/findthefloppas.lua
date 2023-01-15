local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ"))();

-- All Floppas in Find The Floppas
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Find All Floppas", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    for i, v in pairs(game:GetService("Workspace"):WaitForChild("Floppas"):GetChildren()) do
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
    end
end);

Setup:CreateClickSounds();
