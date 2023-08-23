local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
	["content-type"] = "application/json"
};
_G.Color = Color3.new(0, 0, 0);
local Setup = (loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ")))();
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = (MainUI:WaitForChild("gameskijack")):WaitForChild("ScrollingFrame");
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Show Unreleased Skins: Off", Color3.new(1, 1, 0));
local Codes = {
	johnroblox = true,
	friday = true,
	happy4th = true,
	extraskipsss = true,
	j0hnrbx = true,
	longwait = true,
	raz0rf1sh = true,
	["10kplayers"] = true,
	["1milvisits"] = true,
	gor1lla = true,
	kitt3n = true,
	["120k"] = true,
	summer = true,
	["3s8kzmc"] = true,
	thankyou = true,
	b1rdhunt3r = true,
	trickortreat = true,
	r3tro = true,
	gamermode0n = true,
	sw33txp = true,
	moarexp = true,
	["02moment"] = true,
	electro = true,
	["5kmilestone"] = true,
	t3mplar = true,
	spr1ngm1l3stone = true,
	happy3ast3r = true,
	w33klicode = true,
	icyfreeze = true,
	doublebloxies = true,
	launch = true,
	gems = true,
	["1pumpkin"] = true,
	["30k"] = true,
	["2spooky4u"] = true,
	newyear2021 = true,
	roblox = true,
	imababy = true,
	itwasmortar = true,
	teleportfailed = true,
	FIFTYK = true,
	COMMUNITY20 = true,
	beachglad2022 = true,
	JOHNRETURNS = true,
	M3RRY2022TDS = true
};
local RedeemCodes = Setup:CreateButton(GameUI, "Redeem All Codes", Color3.new(1, 1, 0));
RedeemCodes.MouseButton1Down:Connect(function()
	RedeemCodes.Text = "Fetching Codes...";
	RedeemCodes.Text = "Redeeming Codes...";
	for i, v in pairs(Codes) do
		local args = {
			[1] = "Codes",
			[2] = "Redeem",
			[3] = i
		};
		(game:GetService("ReplicatedStorage")).RemoteFunction:InvokeServer(unpack(args));
		RedeemCodes.Text = "Redeemed " .. i;
	end;
	RedeemCodes.Text = "Redeemed All Codes!";
	wait(2);
	RedeemCodes.Text = "Redeem All Codes";
end);
AutoETS.MouseButton1Down:Connect(function()
	if _G.ATS == false then
		_G.ATS = true;
		AutoETS.Text = "Show Unreleased Skins: On";
		coroutine.resume(coroutine.create(function()
			while wait() do
				if _G.ATS == false then
					break;
				elseif game.PlaceId == 3260590327 then
					repeat
						wait();
					until game:IsLoaded();
					while wait() do
						local E1 = (game:GetService("Players")).LocalPlayer.PlayerGui.Interface.Root.Inventory.View.Frame:GetChildren();
						local E2 = E1[2]:GetChildren();
						local Towers = E2[2].Frame.Panel.ScrollingFrame;
						for _, v in pairs(Towers:GetDescendants()) do
							if v:IsA("ImageButton") then
								v.Visible = true;
							end;
						end;
					end;
				end;
			end;
		end));
	else
		_G.ATS = false;
		AutoETS.Text = "Show Unreleased Skins: Off";
	end;
end);
local UnlockPets = Setup:CreateButton(GameUI, "Showed Unreleased Towers", Color3.new(1, 1, 0));
UnlockPets.MouseButton1Down:Connect(function()
	if game.PlaceId == 3260590327 then
		repeat
			wait();
		until game:IsLoaded();
		local Towers = (game:GetService("Players")).LocalPlayer.PlayerGui.Interface.Root.Inventory.View.Frame.Frame.Frame;
		for _, v in pairs(Towers:GetDescendants()) do
			if v:IsA("ImageButton") then
				v.Visible = true;
			end;
		end;
	end;
end);
local Spoofer = Setup:CreateButton(GameUI, "Group Spoofer", Color3.new(1, 1, 0));
Spoofer.MouseButton1Down:Connect(function()
	if game.PlaceId == 3260590327 or game.PlaceId == 5591597781 then
		local OldNamecall;
		OldNamecall = hookmetamethod(game, "__namecall", function(...)
			local Self, Args = ..., {
				select(2, ...)
			};
			if getnamecallmethod() == "IsInGroup" and Args[1] == 4914494 and checkcaller() then
				return true;
			end;
			return OldNamecall(..., unpack(Args));
		end);
	end;
end);
Setup:CreateClickSounds();
