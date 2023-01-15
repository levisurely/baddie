local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();

-- Show Correct Doors
_G.ATS = false;
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Show Correct Doors: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Show Correct Doors: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    for i, v in pairs(game:GetService("Workspace")["Questions"]:GetChildren()) do
                        for _, w in pairs(v:GetChildren()) do
                            if tonumber(w.Name) and w:FindFirstChild("Question+Choices") then
                                if w["Question+Choices"]:FindFirstChild("CorrectDoor") then
                                    w["Question+Choices"]["CorrectDoor"].Transparency = 0;
                                end
                            end
                        end
                    end
                    break
                else
                    for i, v in pairs(game:GetService("Workspace")["Questions"]:GetChildren()) do
                        for _, w in pairs(v:GetChildren()) do
                            if tonumber(w.Name) and w:FindFirstChild("Question+Choices") then
                                if w["Question+Choices"]:FindFirstChild("CorrectDoor") then
                                    w["Question+Choices"]["CorrectDoor"].Transparency = 1;
                                end
                            end
                        end
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Show Correct Doors: Off";
    end
end);

-- Auto Complete Obby
_G.ETS = false;
local AutoXETS = Setup:CreateButton(GameUI, "Auto Complete Obby: Off", Color3.new(1, 1, 0));

AutoXETS.MouseButton1Down:Connect(function()
    if _G.ETS == false then
        _G.ETS = true;
        AutoXETS.Text = "Auto Complete Obby: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ETS == false then
                    break
                else
                    for i = tonumber(Player:WaitForChild("leaderstats"):WaitForChild("Stage").Value), 50 do
                        wait(1);
                        Player.Character.HumanoidRootPart.CFrame =
                            game:GetService("Workspace"):WaitForChild("Checkpoints")[i].CFrame;
                    end
                end
            end
        end));
    else
        _G.ETS = false;
        AutoXETS.Text = "Auto Complete Obby: Off";
    end
end);

Setup:CreateClickSounds();
