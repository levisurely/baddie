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
-- Auto Complete Obby
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Complete Obby: Off", Color3.new(1, 1, 0));
local Codes = {
    ["extraskips1"] = true,
    ["squidgame"] = true,
    ["summer2021"] = true,
    ["extraskipsss"] = true,
    ["dizc0rd"] = true,
    ["extraskips2"] = true
};

-- Redeem All Codes Reward
local RedeemCodes = Setup:CreateButton(GameUI, "Redeem All Code", Color3.new(1, 1, 0));

RedeemCodes.MouseButton1Down:Connect(function()
    RedeemCodes.Text = "Fetching Codes...";
    RedeemCodes.Text = "Redeeming Codes...";
    for i, v in pairs(Codes) do
        local args = {
            [1] = "redeemCode",
            [2] = {
                [1] = i
            }
        };
        game:GetService("ReplicatedStorage").ntw.RF:InvokeServer(unpack(args));
        RedeemCodes.Text = "Redeemed " .. i;
    end
    RedeemCodes.Text = "Redeemed All Codes!";
    wait(2);
    RedeemCodes.Text = "Redeem All Codes";
end);

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Complete Obby: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break;
                else
                    for i = tonumber(Player:WaitForChild("leaderstats"):WaitForChild("Stage").Value), 2725 do
                        wait(0.25);
                        if _G.ATS == true then
                            break;
                        end;
                        Player.Character.HumanoidRootPart.CFrame =
                            game:GetService("Workspace"):WaitForChild("stages")[i].CFrame;
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Complete Obby: Off";
    end
end);

local UnlockPets = Setup:CreateButton(GameUI, "Unlock All Items", Color3.new(1, 1, 0));

UnlockPets.MouseButton1Down:Connect(function()
    for i, v in pairs(Player:WaitForChild("Items"):GetChildren()) do
        v.Value = true;
    end
end);
Setup:CreateClickSounds();
