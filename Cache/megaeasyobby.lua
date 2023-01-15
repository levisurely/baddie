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
                    for i = tonumber(Player:WaitForChild("leaderstats"):WaitForChild("Stage").Value), 800 do
                        wait(1);
                        Player.Character.HumanoidRootPart.CFrame =
                            game:GetService("Workspace"):WaitForChild("Checkpoints")[i].CFrame;
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Complete Obby: Off";
    end
end);

local UnlockPets = Setup:CreateButton(GameUI, "Unlock All Pets", Color3.new(1, 1, 0));

UnlockPets.MouseButton1Down:Connect(function()
    for i, v in pairs(Player:WaitForChild("PetInventory"):GetChildren()) do
        v.Value = true;
    end
end);

local UE = Setup:CreateButton(GameUI, "Unlock All Effects", Color3.new(1, 1, 0));

UE.MouseButton1Down:Connect(function()
    for i, v in pairs(Player:WaitForChild("Inventory"):GetChildren()) do
        v.Value = true;
    end
end);

Setup:CreateClickSounds();
