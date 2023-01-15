local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();

-- Hide Fake Glass
_G.ATS = false;
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Hide Fake Glass: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Hide Fake Glass: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    for i, v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do
                        if v.Name == 'TouchInterest' then
                            v.Parent.Transparency = 0.5;
                        end
                    end
                    break
                else
                    for i, v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do
                        if v.Name == 'TouchInterest' then
                            v.Parent.Transparency = 1;
                        end
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Hide Fake Glass: Off";
    end
end);

Setup:CreateClickSounds();
