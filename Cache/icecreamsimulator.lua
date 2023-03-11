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

-- Auto Bubble
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Ability: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Ability: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break
                else
                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
            end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Ability: Off";
    end
end);

Setup:CreateClickSounds();
