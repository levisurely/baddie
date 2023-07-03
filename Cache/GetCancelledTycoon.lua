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
-- Auto Post Opinions
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Post Opinions: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Post Opinions: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break
                else
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Post"):FireServer()
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Post Opinions: Off";
    end
end);

Setup:CreateClickSounds();
