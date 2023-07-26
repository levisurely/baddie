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
local AutoETS = Setup:CreateButton(GameUI, "Auto Press Button: Off", Color3.new(1, 1, 0));
AutoETS.MouseButton1Down:Connect(function()
	if _G.ATS == false then
		_G.ATS = true;
		AutoETS.Text = "Auto Press Button: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.ATS == false then
					break;
				else
					fireclickdetector((game:GetService("Workspace")).ButtonPresser.Button.ClickDetector);
				end;
			end;
		end));
	else
		_G.ATS = false;
		AutoETS.Text = "Auto Press Button: Off";
	end;
end);
_G.AF = false;
local AutoF = Setup:CreateButton(GameUI, "Auto Collect Coins: Off", Color3.new(1, 1, 0));
AutoF.MouseButton1Down:Connect(function()
	if _G.AF == false then
		_G.AF = true;
		AutoF.Text = "Auto Collect Coins: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AF == false then
					break;
				else
					for i, v in pairs((game:GetService("Workspace")).Coins:GetChildren()) do
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Coin.CFrame;
						game.Players.LocalPlayer.Character.Humanoid.Jump = true;
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true;
						task.wait(1);
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false;
					end;
				end;
			end;
		end));
	else
		_G.AF = false;
		AutoF.Text = "Auto Collect Coins: Off";
	end;
end);
_G.AWO = false;
local AutoAO = Setup:CreateButton(GameUI, "Auto Win Obbies: Off", Color3.new(1, 1, 0));
AutoAO.MouseButton1Down:Connect(function()
	if _G.AWO == false then
		_G.AWO = true;
		AutoAO.Text = "Auto Win Obbies: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AWO == false then
					break;
				else
					for i, v in pairs((game:GetService("Workspace")):GetDescendants()) do
						if v.Name == "WinnerBrickPart" or v.Name == "WinPartTP" or v.Name == "Win" or v.Name == "TheWinPatr" or v.Name == "WinWin" or v.Name == "TheWin" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
						elseif v:FindFirstChild("TouchInterest") and string.find(v.Name, "Win") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
						elseif v:FindFirstChild("TouchInterest") and v.Name == "REWARD" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
						end;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map113") then
						for i, v in pairs((game:GetService("Workspace")).Map113.TheCandy:GetDescendants()) do
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.MeshPart.CFrame;
						end;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map140") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map140.DeadTP.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map64") or (game:GetService("Workspace")):FindFirstChild("Map48") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Loader.HumanoidRootPart.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map137") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map137.DeadTP.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map153") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map153.DeadTP.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map135") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map135.DeadTP.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map144") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map144.DeadTP.CFrame;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map131") or (game:GetService("Workspace")):FindFirstChild("Map72") or (game:GetService("Workspace")):FindFirstChild("Map142") or (game:GetService("Workspace")):FindFirstChild("Map15") or (game:GetService("Workspace")):FindFirstChild("Map85") or (game:GetService("Workspace")):FindFirstChild("Map143") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true;
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false;
					end;
					if (game:GetService("Workspace")):FindFirstChild("Map92") then
						for i, v in pairs(((game:GetService("Workspace")):FindFirstChild("Map92")).Rings:GetChildren()) do
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
						end;
					end;
				end;
			end;
		end));
	else
		_G.AWO = false;
		AutoAO.Text = "Auto Win Obbies: Off";
	end;
end);
Setup:CreateClickSounds();
