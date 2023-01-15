local Players = game:GetService("Players");
local MS = game:GetService("MarketplaceService");
local RS = game:GetService("ReplicatedStorage");
local SharedModules = RS:WaitForChild("SharedModules");
local ChunkUtil = require(SharedModules:WaitForChild("ChunkUtil"));
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
    ["content-type"] = "application/json"
};
_G.Color = Color3.new(0.129412, 0.129412, 0.129412);
_G.EggSel = nil;
_G.HatchHook = "";
_G.CrateHook = "";
local Setup = loadstring(game:HttpGet("https://pastebin.com/raw/qiPTxmAr"))();
local Codes = {
    ["Release"] = true,
    ["FreeEgg"] = true,
    ["FreeCrate"] = true,
    ["RareCrate"] = true,
    ["Gems"] = true,
    ["Trading"] = true,
    ["FreeGems"] = true,
    ["Lucky"] = true,
    ["SuperLucky"] = true,
    ["Update4"] = true,
    ["Factory"] = true,
    ["Update5"] = true,
    ["July4th"] = true,
    ["Update6"] = true,
    ["Fishing"] = true,
    ["Update7"] = true,
    ["Treasure"] = true,
    ["Update8"] = true,
    ["Mystery"] = true,
    ["Season2"] = true,
    ["SuperEvent"] = true,
    ["ExtraLuck"] = true,
    ["Atlantis"] = true,
    ["Update9"] = true,
    ["LostCity"] = true,
    ["LuckEvent"] = true,
    ["Update10"] = true,
    ["UltraLucky"] = true,
    ["Update11"] = true,
    ["Atlantic"] = true,
    ["Update13"] = true,
    ["Candyland"] = true,
    ["Update14"] = true,
    ["Chocolate"] = true,
    ["Update15"] = true,
    ["Pastry"] = true
};

_G.AutoMNSpeed = 1;

_G.WT = false;
_G.CT = false;

local function rgbToHex(rgb)
    local hexadecimal = '0X'
    for key, value in pairs(rgb) do
        local hex = ''
        while (value > 0) do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub('0123456789ABCDEF', index, index) .. hex
        end
        if (string.len(hex) == 0) then
            hex = '00'
        elseif (string.len(hex) == 1) then
            hex = '0' .. hex
        end
        hexadecimal = hexadecimal .. hex
    end
    return hexadecimal
end
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = MainUI:WaitForChild("gameskijack"):WaitForChild("ScrollingFrame");
Player.PlayerGui.ChildAdded:Connect(function(Added)
    if MainUI then
        if Added.Name == "CrateOpen" and _G.CrateHook ~= "" and _G.CT == true then
            repeat
                wait()
            until Added.Frame.Display.Buttons.Visible == true;
            local TextColor3 = Added.Frame.Display.Rarity.TextColor3;
            local RGB = {TextColor3.R * 255, TextColor3.G * 255, TextColor3.B * 255};
            local Hex = tonumber(rgbToHex({RGB[1], RGB[2], RGB[3]}));
            local data = {
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "Crate Unboxed!",
                    ["description"] = Player.Name .. " just unboxed a " .. Added.Frame.Display.Rarity.Text .. " " ..
                        Added.Frame.Display.Skin.Text,
                    ["thumbnail"] = {
                        url = "https://www.roblox.com/bust-thumbnail/image?userId=" .. Player.UserId ..
                            "&width=60&height=60&format=jpg"
                    },
                    ["type"] = "rich",
                    ["color"] = Hex,
                    ["fields"] = {}
                }}
            }
            local Info = game:GetService("HttpService"):JSONEncode(data)
            local HttpRequest = http_request;
            if syn then
                HttpRequest = syn.request
            else
                HttpRequest = http_request
            end
            HttpRequest({
                Url = _G.CrateHook,
                Body = Info,
                Method = "POST",
                Headers = Headers
            })
        end
        if Added.Name == "HatchGui" and _G.HatchHook ~= "" and _G.WT == true then
            for i, v in pairs(Added.Frame:GetChildren()) do
                if v:FindFirstChild("Rarity") and v:FindFirstChild("Pet") and v:FindFirstChild("Shiny") then
                    if v.Pet.Text ~= "Pet Name" then
                        local Shiny = " ";
                        if v.Shiny.Visible == true then
                            Shiny = " SHINY ";
                        end
                        local TextColor3 = Player.PlayerGui.ScreenGui.EggDisplay.Content[v.Pet.Text].Rarity.TextColor3;
                        local RGB = {TextColor3.R * 255, TextColor3.G * 255, TextColor3.B * 255};
                        local Hex = tonumber(rgbToHex({RGB[1], RGB[2], RGB[3]}));
                        local data = {
                            ["content"] = "",
                            ["embeds"] = {{
                                ["title"] = "Pet Hatched!",
                                ["description"] = Player.Name .. " just hatched a" .. Shiny .. v.Rarity.Text .. " " ..
                                    v.Pet.Text,
                                ["thumbnail"] = {
                                    url = "https://www.roblox.com/bust-thumbnail/image?userId=" .. Player.UserId ..
                                        "&width=60&height=60&format=jpg"
                                },
                                ["type"] = "rich",
                                ["color"] = Hex,
                                ["fields"] = {{
                                    ["name"] = "Cost",
                                    ["value"] = Player.PlayerGui.ScreenGui.EggDisplay.Cost.Text,
                                    ["inline"] = false
                                }, {
                                    ["name"] = "Egg",
                                    ["value"] = Player.PlayerGui.ScreenGui.EggDisplay.Title.Text,
                                    ["inline"] = false
                                }, {
                                    ["name"] = "Chance",
                                    ["value"] = Player.PlayerGui.ScreenGui.EggDisplay.Content[v.Pet.Text].Chance.Text,
                                    ["inline"] = false
                                }}
                            }}
                        }
                        local Info = game:GetService("HttpService"):JSONEncode(data)
                        local HttpRequest = http_request;
                        if syn then
                            HttpRequest = syn.request
                        else
                            HttpRequest = http_request
                        end
                        HttpRequest({
                            Url = _G.HatchHook,
                            Body = Info,
                            Method = "POST",
                            Headers = Headers
                        })
                    end
                end
            end
        end
    end
end);

-- Eggs Loader Frame
local EggsUI = Setup:CreateMenu("Eggsskijack", _G.Color, 10050, false);

-- Title Text for Eggs
local EGjackTitle = Setup:CreateTitle(EggsUI.Parent, "Select An Egg");

local AutoHSel = Setup:CreateButton(GameUI, "Select Egg", Color3.new(1, 0, 1));

-- Load All Eggs Into UI
for i, v in pairs(game:GetService("Workspace"):WaitForChild("Eggs"):GetChildren()) do
    if v:IsA("Model") then
        local Egz = Setup:CreateButton(EggsUI, v.Name, Color3.new(1, 0, 1));
        Egz.MouseButton1Down:Connect(function()
            EggSel = v.Name;
            AutoHSel.Text = "Selected Egg: " .. v.Name
            EggsUI.Parent.Visible = false;
        end);
    end
end

-- Checkpoints Loader Frame
local CheckpointsUI = Setup:CreateMenu("Checkpointsskijack", _G.Color, 10050, false);

-- Title Text for Checkpoints
local CheckpointsjackTitle = Setup:CreateTitle(CheckpointsUI.Parent, "Select An Checkpoint");

local TeleportSel = Setup:CreateButton(GameUI, "Teleport", Color3.new(1, 0, 1));

-- Load All Checkpoints Into UI
for i, v in pairs(game:GetService("Workspace"):WaitForChild("Checkpoints"):GetChildren()) do
    if v:IsA("Model") then
        local Egz = Setup:CreateButton(CheckpointsUI, v.Name, Color3.new(1, 0, 1));
        Egz.MouseButton1Down:Connect(function()
            local args = {
                [1] = v.Name
            }
            game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args));
        end);
    end
end

-- Crate Logger
local Button8 = Setup:CreateBox(GameUI, "Enter Crate Webhook Link", Color3.new(1, 1, 0));

Button8.FocusLost:Connect(function()
    if Button8.Text ~= nil and Button8.Text ~= "" then
        CrateHook = Button8.Text;
    else
        Button8.Text = "";
        Button8.PlaceholderText = "Failed To Set Crate Webhook Link";
        local CS = Instance.new("Sound");
        CS.SoundId = "rbxassetid://160715357";
        CS.Parent = Button8;
        CS:Play();
        CS.Ended:Connect(function()
            CS:Destroy();
        end);
        wait(2);
        Button8.PlaceholderText = "Enter Crate Webhook Link";
    end
end);

local CrateToggle = Setup:CreateButton(GameUI, "Crate Webhook: Off", Color3.new(1, 1, 0));

CrateToggle.MouseButton1Down:Connect(function()
    if CrateHook == "" then
        CrateToggle.Text = "Please Enter A Crate Wehook Link";
        wait(2);
        CrateToggle.Text = "Crate Webhook: Off";
        return;
    end
    if _G.CT == false then
        _G.CT = true;
        CrateToggle.Text = "Crate Webhook: On";
    else
        _G.CT = false;
        CrateToggle.Text = "Crate Webhook: Off";
    end
end);

-- Hatch Logger
local Button7 = Setup:CreateBox(GameUI, "Enter Hatch Webhook Link", Color3.new(1, 1, 0));

Button7.FocusLost:Connect(function()
    if Button7.Text ~= nil and Button7.Text ~= "" then
        HatchHook = Button7.Text;
    else
        Button7.Text = "";
        Button7.PlaceholderText = "Failed To Set Hatch Webhook Link";
        local CS = Instance.new("Sound");
        CS.SoundId = "rbxassetid://160715357";
        CS.Parent = Button7;
        CS:Play();
        CS.Ended:Connect(function()
            CS:Destroy();
        end);
        wait(2);
        Button7.PlaceholderText = "Enter Hatch Webhook Link";
    end
end);

local WebhookToggle = Setup:CreateButton(GameUI, "Hatch Webhook: Off", Color3.new(1, 1, 0));

WebhookToggle.MouseButton1Down:Connect(function()
    if HatchHook == "" then
        WebhookToggle.Text = "Please Enter A Hatch Wehook Link";
        wait(2);
        WebhookToggle.Text = "Hatch Webhook: Off";
        return;
    end
    if _G.WT == false then
        _G.WT = true;
        WebhookToggle.Text = "Hatch Webhook: On";
    else
        _G.WT = false;
        WebhookToggle.Text = "Hatch Webhook: Off";
    end
end);

-- Auto Hatch
_G.AH = false;

local AutoHatch = Setup:CreateButton(GameUI, "Auto Hatch: Off", Color3.new(1, 1, 0));

AutoHSel.MouseButton1Down:Connect(function()
    EggsUI.Parent.Visible = not EggsUI.Parent.Visible;
end);

TeleportSel.MouseButton1Down:Connect(function()
    CheckpointsUI.Parent.Visible = not CheckpointsUI.Parent.Visible;
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
                    Player.Character:MoveTo(game:GetService("Workspace"):WaitForChild("Eggs")[EggSel].EggName.Position)
                    local A_2 = false
                    local A_3 = false
                    local Event = game:GetService("ReplicatedStorage").Events.OpenEgg;
                    Event:FireServer(EggSel, A_2, A_3);
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
                    game:GetService("ReplicatedStorage").Events.Rebirth:FireServer();
                end
            end
        end));
    else
        _G.AR = false;
        AutoRE.Text = "Auto Rebirth: Off";
    end
end);

-- Auto Claim Group Chest
_G.GroupChest = false;
local AutoCGC = Setup:CreateButton(GameUI, "Auto Claim Group Chest: Off", Color3.new(1, 1, 0));

AutoCGC.MouseButton1Down:Connect(function()
    if _G.GroupChest == false then
        _G.GroupChest = true;
        AutoCGC.Text = "Auto Claim Group Chest: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.GroupChest == false then
                    break
                else
                    game:GetService("ReplicatedStorage").Functions.ClaimGroupBenefits:InvokeServer();
                end
            end
        end));
    else
        _G.GroupChest = false;
        AutoCGC.Text = "Auto Claim Group Chest: Off";
    end
end);

-- Auto Equip Best
_G.AEB = false;
local AutoEB = Setup:CreateButton(GameUI, "Auto Equip Best: Off", Color3.new(1, 1, 0));

AutoEB.MouseButton1Down:Connect(function()
    if _G.AEB == false then
        _G.AEB = true;
        AutoEB.Text = "Auto Equip Best: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.AEB == false then
                    break
                else
                    game:GetService("ReplicatedStorage").Events.EquipBestPets:FireServer();
                end
            end
        end));
    else
        _G.AEB = false;
        AutoEB.Text = "Auto Equip Best: Off";
    end
end);

-- Auto Sell
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Sell: Off", Color3.new(1, 1, 0));

AutoETS.MouseButton1Down:Connect(function()
    if _G.ATS == false then
        _G.ATS = true;
        AutoETS.Text = "Auto Sell: On";
        coroutine.resume(coroutine.create(function()
            while wait() do
                if _G.ATS == false then
                    break
                else
                    if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" and
                        Player.PlayerGui.ScreenGui.HUD.MiningFrame.Visible == true then
                        game:GetService("ReplicatedStorage").Events.Teleport:FireServer("The Overworld SurfaceSell");
                        game:GetService("ReplicatedStorage").Events.QuickSell:FireServer();
                    end
                end
            end
        end));
    else
        _G.ATS = false;
        AutoETS.Text = "Auto Sell: Off";
    end
end);

-- Redeem All Codes Reward
local RedeemCodes = Setup:CreateButton(GameUI, "Redeem All Codes", Color3.new(1, 1, 0));

RedeemCodes.MouseButton1Down:Connect(function()
    RedeemCodes.Text = "Fetching Codes...";
    RedeemCodes.Text = "Redeeming Codes...";
    for i, v in pairs(Codes) do
        game:GetService("ReplicatedStorage").Functions.RedeemCode:InvokeServer(i);
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

-- Auto Mine
local Button10 = Setup:CreateBox(GameUI, "Enter Auto Mine Speed", Color3.new(1, 1, 0));

Button10.FocusLost:Connect(function()
    local Check10 = tonumber(Button10.Text);
    if Button10.Text ~= nil and Button10.Text ~= "" and typeof(Check10) == "number" then
        AutoMNSpeed = Check10;
        Button10.Text = "";
    else
        Button10.Text = "";
        Button10.PlaceholderText = "Failed To Set Auto Mine Speed";
        local CS = Instance.new("Sound");
        CS.SoundId = "rbxassetid://160715357";
        CS.Parent = Button10;
        CS:Play();
        CS.Ended:Connect(function()
            CS:Destroy();
        end);
        wait(2);
        Button10.PlaceholderText = "Enter Auto Mine Speed";
    end
end);

_G.AM = false;

local AutoMN = Setup:CreateButton(GameUI, "Auto Mine: Off", Color3.new(1, 1, 0));

local function breakblock(pos)
    local args = {
        [1] = pos
    }
    game:GetService("ReplicatedStorage").Events.MineBlock:FireServer(unpack(args));
end

local function getPartBelow()
    local Character = Player.Character
    local Foot = Character.RightFoot
    local RayOrigin = Foot.Position
    local RayDirection = Vector3.new(0, -1, 0)
    local Params = RaycastParams.new()
    Params.FilterType = Enum.RaycastFilterType.Blacklist
    Params.FilterDescendantsInstances = {Character}
    local Result = workspace:Raycast(RayOrigin, RayDirection, Params)
    if Result then
        local RayInstance = Result.Instance;
        return RayInstance;
    end
    return nil;
end

AutoMN.MouseButton1Down:Connect(function()
    if _G.AM == false then
        _G.AM = true;
        AutoMN.Text = "Auto Mine: On";
        coroutine.resume(coroutine.create(function()
            while wait(AutoMNSpeed) do
                if _G.AM == false then
                    break
                else
                    local closest = getPartBelow()
                    if closest ~= nil then
                        local Pos = closest.Position
                        local NewPos = ChunkUtil.worldToCell(Pos)
                        coroutine.resume(coroutine.create(function()
                            breakblock(NewPos);
                        end));
                    end
                end
            end
        end));
    else
        _G.AM = false;
        AutoMN.Text = "Auto Mine: Off";
    end
end);

Setup:CreateClickSounds();
