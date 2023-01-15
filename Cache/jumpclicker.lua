local Players = game:GetService("Players");
local MS = game:GetService("MarketplaceService");
local RS = game:GetService("ReplicatedStorage");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
_G.EggSel = nil;
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();
local Codes = {
    ["10KLIKES"] = true,
    ["1KLIKES"] = true,
    ["STARTER"] = true,
    ["COMMUNITY"] = true
};

local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");

-- Eggs Loader Frame
local EggsUI = Setup:CreateMenu("Eggsskijack", _G.Color, 10050, false);

-- Title Text for Eggs
local EGjackTitle = Setup:CreateTitle(EggsUI.Parent, "Select An Egg");

local AutoHSel = Setup:CreateButton(GameUI, "Select Egg", Color3.new(1, 0, 1));

-- Load All Eggs Into UI
for i, v in pairs(game:GetService("Workspace"):WaitForChild("ScriptableObjects"):WaitForChild("Eggs"):GetChildren()) do
    local Egz = Setup:CreateButton(EggsUI, v.BillboardGui.Main.TextLabel.Text, Color3.new(1, 0, 1));
    Egz.MouseButton1Down:Connect(function()
        EggSel = v.Name;
        AutoHSel.Text = "Selected Egg: " .. v.BillboardGui.Main.TextLabel.Text
        EggsUI.Parent.Visible = false;
    end);
end

-- Auto Hatch
_G.AH = false;

local AutoHatch = Setup:CreateButton(GameUI, "Auto Hatch: Off", Color3.new(1, 1, 0));

AutoHSel.MouseButton1Down:Connect(function()
    EggsUI.Parent.Visible = not EggsUI.Parent.Visible;
end);

AutoHatch.MouseButton1Down:Connect(function()
    if EggSel == nil then
        AutoHatch.Text = "Please Select An Egg";
        EggsUI.Parent.Visible = not EggsUI.Parent.Visible;
        wait(2);
        AutoHatch.Text = "Auto Hatch: Off";
        return;
    end
    if _G.AH == false then
        _G.AH = true;
        AutoHatch.Text = "Auto Hatch: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.AH == false then
                    break
                else
                    -- Player.Character:MoveTo(game:GetService("Workspace"):WaitForChild("Eggs")[EggSel].EggName.Position)
                    local args = {
                        [1] = workspace.ScriptableObjects.Eggs[EggSel]
                    }

                    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit
                        .Services.PetService.RF.UnboxEgg:InvokeServer(unpack(args))

                end
            end
        end));
    else
        _G.AH = false;
        AutoHatch.Text = "Auto Hatch: Off";
    end
end);

-- Auto Rebirth
_G.AR = false;
local AutoRE = Setup:CreateButton(GameUI, "Auto Rebirth: Off", Color3.new(1, 1, 0));

AutoRE.MouseButton1Down:Connect(function()
    if _G.AR == false then
        _G.AR = true;
        AutoRE.Text = "Auto Rebirth: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.AR == false then
                    break
                else
                    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit
                        .Services.RebirthService.RF.Rebirth:InvokeServer();
                end
            end
        end));
    else
        _G.AR = false;
        AutoRE.Text = "Auto Rebirth: Off";
    end
end);

-- Auto Spin Wheel
_G.GroupChest = false;
local AutoCGC = Setup:CreateButton(GameUI, "Auto Spin Wheel: Off", Color3.new(1, 1, 0));

AutoCGC.MouseButton1Down:Connect(function()
    if _G.GroupChest == false then
        _G.GroupChest = true;
        AutoCGC.Text = "Auto Spin Wheel: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.GroupChest == false then
                    break
                else
                    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit
                        .Services.WheelService.RF.SpinWheel:InvokeServer();
                end
            end
        end));
    else
        _G.GroupChest = false;
        AutoCGC.Text = "Auto Spin Wheel: Off";
    end
end);

-- Auto Tap
_G.AutoTap = false;
local AutoCTap = Setup:CreateButton(GameUI, "Auto Tap: Off", Color3.new(1, 1, 0));

AutoCTap.MouseButton1Down:Connect(function()
    if _G.AutoTap == false then
        _G.AutoTap = true;
        AutoCTap.Text = "Auto Tap: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.AutoTap == false then
                    break
                else
                    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit
                        .Services.JumpService.RE.Tap:FireServer()
                end
            end
        end));
    else
        _G.AutoTap = false;
        AutoCTap.Text = "Auto Tap: Off";
    end
end);

-- Auto Win
_G.AutoWin = false;
local AutoCWin = Setup:CreateButton(GameUI, "Auto Win: Off", Color3.new(1, 1, 0));
local Controller = require(game.Players.LocalPlayer.PlayerScripts.Client.Controllers.JumpingController)
AutoCWin.MouseButton1Down:Connect(function()
    if _G.AutoWin == false then
        _G.AutoWin = true;
        AutoCWin.Text = "Auto Win: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.AutoWin == false then
                    break
                else
                    pcall(function()
                        game.Players.LocalPlayer.Character.Humanoid:SetAttribute('JumpPower', 10000000)
                        Controller:Rise()
                    end)
                end
            end
        end));
    else
        _G.AutoWin = false;
        AutoCWin.Text = "Auto Win: Off";
    end
end);

-- Redeem All Codes Reward
local RedeemCodes = Setup:CreateButton(GameUI, "Redeem All Codes", Color3.new(1, 1, 0));

RedeemCodes.MouseButton1Down:Connect(function()
    RedeemCodes.Text = "Fetching Codes...";
    RedeemCodes.Text = "Redeeming Codes...";
    for i, v in pairs(Codes) do
        local args = {
            [1] = i
        }

        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services
            .CodesService.RF.ClaimCode:InvokeServer(unpack(args))

        RedeemCodes.Text = "Redeemed " .. i;
    end
    RedeemCodes.Text = "Redeemed All Codes!";
    wait(2);
    RedeemCodes.Text = "Redeem All Codes";
end);

-- Rejoin Button
local RejoinButton = Setup:CreateButton(GameUI, "Rejoin", Color3.new(1, 1, 0));

RejoinButton.MouseButton1Down:Connect(function()
    RejoinButton.Text = "Rejoining...";
    game:GetService("TeleportService"):Teleport(game.GameId);
end);

Setup:CreateClickSounds();
