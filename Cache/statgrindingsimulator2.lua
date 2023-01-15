local Players = game:GetService("Players");
local MS = game:GetService("MarketplaceService");
local RS = game:GetService("ReplicatedStorage");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;

local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();
local Codes = {
    ["Release"] = true,
    ["Update1"] = true,
    ["Christmas"] = true,
    ["Update2"] = true,
    ["Update3"] = true,
    ["NewYears"] = true
};

local MainUI = PUI:WaitForChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
-- Redeem All Codes Reward
local RedeemCodes = Setup:CreateButton(GameUI, "Redeem All Codes", Color3.new(1, 1, 0));

RedeemCodes.MouseButton1Down:Connect(function()
    RedeemCodes.Text = "Fetching Codes...";
    RedeemCodes.Text = "Redeeming Codes...";
    for i, v in pairs(Codes) do

        local args = {
            [1] = i
        }

        game:GetService("ReplicatedStorage").Remotes.RedeemCode:InvokeServer(unpack(args))
        RedeemCodes.Text = "Redeemed " .. i;
    end
    RedeemCodes.Text = "Redeemed All Codes!";
    wait(2);
    RedeemCodes.Text = "Redeem All Codes";
end);

-- Rejoin Button
local RejoinButton = Setup:CreateButton(GameUI, "Rejoin", Color3.new(1, 1, 0));

RejoinButton.MouseButton1Down:Connect(function()
    RejoinButton.Text = "Rejoining...";
    game:GetService("TeleportService"):Teleport(game.GameId);
end);

Setup:CreateClickSounds();
