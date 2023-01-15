local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
--The Difficulty Machine: Revamp
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");

-- Auto Save
_G.AS = false;
local AutoES = Setup:CreateButton(GameUI, "Auto Save: Off", Color3.new(1, 1, 0));

AutoES.MouseButton1Down:Connect(function()
    if _G.AS == false then
        _G.AS = true;
        AutoES.Text = "Auto Save: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                if _G.AS == false then
                    break
                else
                    fireclickdetector(game:GetService("Workspace").Save.ClickDetector);
                end
            end
        end));
    else
        _G.AS = false;
        AutoES.Text = "Auto Save: Off";
    end
end);

-- Auto Click
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Click: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Click: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                if _G.ATS == false then
                    break
                else
                    fireclickdetector(game:GetService("Workspace").Click.ClickDetector);
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Click: Off";
    end
end);

-- Auto Fling
_G.AF = false;
local AutoF = Setup:CreateButton(GameUI, "Auto Fling: Off", Color3.new(1, 1, 0));

AutoF.MouseButton1Down:Connect(function()
    if _G.AF == false then
        _G.AF = true;
        AutoF.Text = "Auto Fling: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                if _G.AF == false then
                    break
                else
                    fireclickdetector(game:GetService("Workspace").Fling.ClickDetector);
                end
            end
        end));
    else
        _G.AF = false;
        AutoF.Text = "Auto Fling: Off";
    end
end);

-- Auto Sell Mode
local AutoSell = Setup:CreateButton(GameUI,
    "Auto Sell: " .. game:GetService("Workspace").Autosell.SurfaceGui.TextLabel.Text, Color3.new(1, 1, 0));

AutoSell.MouseButton1Down:Connect(function()
    fireclickdetector(game:GetService("Workspace").Autosell.ClickDetector);
end);

coroutine.resume(coroutine.create(function()
    while task.wait() do
        AutoSell.Text = "Auto Sell: " .. game:GetService("Workspace").Autosell.SurfaceGui.TextLabel.Text;
    end
end));

Setup:CreateClickSounds();
