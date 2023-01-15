local Players = game:GetService("Players");
local RS = game:GetService("ReplicatedStorage");
local IM = RS:WaitForChild("itemmodels");
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
-- Auto Buy
_G.ATS = false;
-- Daylans trade sim btw
local AutoETS = Setup:CreateButton(GameUI, "Auto Buy: Off", Color3.new(1, 1, 0));
IM.ChildAdded:Connect(function(child)
    coroutine.resume(coroutine.create(function()
        if _G.ATS == true then
            coroutine.resume(coroutine.create(function()
                local args = {
                    [1] = "openitem",
                    [2] = tostring(child.Name)
                };
                game:GetService("ReplicatedStorage").event:FireServer(unpack(args));
            end));
            coroutine.resume(coroutine.create(function()
                local BRV = {
                    [1] = "buy",
                    [2] = tonumber(child.Name),
                    [3] = 0
                };
                game:GetService("ReplicatedStorage").event:FireServer(unpack(BRV));
            end));
        end
    end));
end);
AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Buy: On";
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Buy: Off";
    end
end);
Setup:CreateClickSounds();
