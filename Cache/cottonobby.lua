local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
-- Auto Complete Obby
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Complete Obby: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Complete Obby: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break
                else
                    for i = tonumber(Player:WaitForChild("leaderstats"):WaitForChild("Stage").Value), 72 do
                        wait(1);
                        Player.Character.HumanoidRootPart.CFrame =
                            game:GetService("Workspace"):WaitForChild("Stages")[i].CFrame;
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Complete Obby: Off";
    end
end);

Setup:CreateClickSounds();
