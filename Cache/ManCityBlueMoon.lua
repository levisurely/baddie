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
-- Auto Collect Points
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Collect Points: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Collect Points: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break
                else
                    for i, v in pairs(game.workspace.Points:GetDescendants()) do
                        if v.name == "Point" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position);
                            wait(0.2);
                        end
                    end
                    wait(3);
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Collect Points: Off";
    end
end);

Setup:CreateClickSounds();
