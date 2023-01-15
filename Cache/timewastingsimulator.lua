local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
--Time Wasting SIm
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();

-- See Thru Blocks In Mine
_G.HGB = false;
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Glass Blocks: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.HGB == false then
        _G.HGB = true;
        AutoETS.Text = "Glass Blocks: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                if _G.HGB == false then
                    for i, v in pairs(game:GetService("Workspace")["FrozenIsland_Blocks"]:GetChildren()) do
                        v.Transparency = 0;
                    end
                    break
                else
                    for i, v in pairs(game:GetService("Workspace")["FrozenIsland_Blocks"]:GetChildren()) do
                        v.Transparency = 0.5;
                    end
                end
            end
        end));
    else
        _G.HGB = false;
        AutoETS.Text = "Glass Blocks: Off";
    end
end);

-- Auto Mine
_G.AM = false;
_G.PS = nil;
local AutoMine = Setup:CreateButton(GameUI, "Auto Mine: Off", Color3.new(1, 1, 0));

AutoMine.MouseButton1Down:Connect(function()
    if _G.AM == false then
        _G.AM = true;
        AutoMine.Text = "Auto Mine: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                local P = workspace.FrozenIsland_Blocks:GetChildren()[1]
                local args = {
                    [1] = P
                }
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("better pickaxe") then
                    _G.PS = "better pickaxe"
                else
                    _G.PS = "pickaxe";
                end
                if _G.AM == false or _G.PS == nil or
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.PS) == nil then
                    break
                end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = P.CFrame
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.PS).RemoteEvent:FireServer(unpack(
                    args))
                task.wait(1);
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.PS).RemoteEvent:FireServer(unpack(
                    args))
                task.wait(1)
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.PS).RemoteEvent:FireServer(unpack(
                    args))
                task.wait(1);
            end
        end));
    else
        _G.AM = false;
        AutoMine.Text = "Auto Mine: Off";
    end
end);

-- Auto Sweep
_G.AS = false;
local AutoSweep = Setup:CreateButton(GameUI, "Auto Sweep: Off", Color3.new(1, 1, 0));

AutoSweep.MouseButton1Down:Connect(function()
    if _G.AS == false then
        _G.AS = true;
        AutoSweep.Text = "Auto Sweep: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace")["npc_becuz_why_not"].janitor.HumanoidRootPart.CFrame
                fireclickdetector(game:GetService("Workspace")["npc_becuz_why_not"].janitor.ClickDetector)
                local P = game:GetService("Workspace").Puddles.Puddles2ElectricBoogaloo:GetChildren()[1]
                if _G.AS == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mop") == nil then
                    break
                end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = P.CFrame
                game:GetService("Players").LocalPlayer.Character.Mop.SweepEvent:FireServer()
            end
        end));
    else
        _G.AS = false;
        AutoSweep.Text = "Auto Sweep: Off";
    end
end);

-- Auto Box
_G.AB = false;
local AutoBox = Setup:CreateButton(GameUI, "Auto Box: Off", Color3.new(1, 1, 0));

AutoBox.MouseButton1Down:Connect(function()
    if _G.AB == false then
        _G.AB = true;
        AutoBox.Text = "Auto Box: On";
        coroutine.resume(coroutine.create(function()
            while task.wait() do
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace")["npc_becuz_why_not"].box.HumanoidRootPart.CFrame
                fireclickdetector(game:GetService("Workspace")["npc_becuz_why_not"].box.ClickDetector)
                local P = game:GetService("Workspace").Puddles.Puddles2ElectricBoogaloo:GetChildren()[1]
                if _G.AB == false then
                    break
                end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace").MainPlace.DELIVERtm.Start.Box.CFrame
                fireclickdetector(game:GetService("Workspace").MainPlace.DELIVERtm.Start.ClickDetector)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace").MainPlace.DELIVERtm.Deliver.HB.CFrame
            end
        end));
    else
        _G.AB = false;
        AutoBox.Text = "Auto Box: Off";
    end
end);

-- Stats Loader Frame
local StatsUI = Setup:CreateMenu("StatsSploit", _G.Color, 10050, false);

-- Title Text for Stats
local EGjackTitle = Setup:CreateTitle(StatsUI.Parent, "Stats");

local ShowStats = Setup:CreateButton(game:GetService("CoreGui").skijack.skijack.ScrollingFrame, "Stats",
    Color3.new(1, 0, 1));

ShowStats.MouseButton1Down:Connect(function()
    StatsUI.Parent.Visible = not StatsUI.Parent.Visible;
end);

-- Load All Stats Into UI
for i, v in pairs(game:GetService("Players").LocalPlayer:GetDescendants()) do
    if v:IsA("NumberValue") then
        local Egz = Setup:CreateTitle(StatsUI.Parent, v.Name .. ": " .. v.Value);
        v.Changed:Connect(function()
            Egz.Text = v.Name .. ": " .. v.Value;
        end);
    end
end

Setup:CreateClickSounds();
