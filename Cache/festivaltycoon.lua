local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ"))();
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local UE = Setup:CreateButton(GameUI, "Complete Tycoon", Color3.new(1, 1, 0));

UE.MouseButton1Down:Connect(function()
    -- Badge: You Got Neon Gasmask! Item: 10787160614 Neon Gas Mask - The Chainsmokers
    game:GetService("ReplicatedStorage").RemoteObjects.ClaimMainStageChallenge:FireServer()
    -- Badge: You got Neon Swords!
    -- Item: 10787163819; Sword Pack - The Chainsmokers
    game:GetService("ReplicatedStorage").RemoteObjects.IncrementBeachCash:FireServer(10000000000)
    -- Badge: You got Neon Shades!
    -- Item: 10787157603; Purple Shades - The Chainsmokers
    game:GetService("ReplicatedStorage").RemoteObjects.DanceGameCash:FireServer(10000000000)
    task.wait(2)
    local ILoveShittyYoutubers_TakingCreditForMyScripts = game:GetService("ReplicatedStorage").RemoteObjects
                                                              .RequestButtonPurchase
    for IDoN0t, isLikingCrossdresserGay in ipairs(game:GetService("Workspace").Buttons:GetChildren()) do
        for V3rmillion, i_feel_like_it_is_but_idk in ipairs(isLikingCrossdresserGay:GetChildren()) do
            ILoveShittyYoutubers_TakingCreditForMyScripts:FireServer(i_feel_like_it_is_but_idk.Name)
        end
    end
end);

Setup:CreateClickSounds();
