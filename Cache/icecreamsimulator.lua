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
function fCream()
	spawn(function()
		while kVars.boolCream do
			wait();
			((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Ice Cream")).E:FireServer(math.huge);
		end;
	end);
end;
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Lick: Off", Color3.new(1, 1, 0));
AutoETS.MouseButton1Down:Connect(function()
	if _G.ATS == false then
		_G.ATS = true;
		AutoETS.Text = "Auto Lick: On";
		coroutine.resume(coroutine.create(function()
			while wait() do
				if _G.ATS == false then
					break;
				else
					if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Ice Cream") then
					((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Ice Cream")).E:FireServer(math.huge);
				else
					((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Ice Cream")).E:FireServer(math.huge);
				end;
			end;
		end));
	else
		_G.ATS = false;
		AutoETS.Text = "Auto Lick: Off";
	end;
end);
Setup:CreateClickSounds();
