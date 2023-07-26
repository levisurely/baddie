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
local AutoES = Setup:CreateButton(GameUI, "Find Rats: Off", Color3.new(1, 1, 0));
AutoES.MouseButton1Down:Connect(function()
	for i, v in pairs((game:GetService("Workspace")).Terrain.Map.Decor.Rats:GetChildren()) do
		fireclickdetector(v.Click.ClickDetector);
	end;
end);
_G.ATS = false;
local AutoETS = Setup:CreateButton(GameUI, "Auto Click: Off", Color3.new(1, 1, 0));
AutoETS.MouseButton1Down:Connect(function()
	if _G.ATS == false then
		_G.ATS = true;
		AutoETS.Text = "Auto Click: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.ATS == false then
					break;
				else
					fireclickdetector((game:GetService("Workspace")).Terrain.Misc.Button.Button.ClickDetector);
				end;
			end;
		end));
	else
		_G.ATS = false;
		AutoETS.Text = "Auto Click: Off";
	end;
end);
_G.AF = false;
local AutoF = Setup:CreateButton(GameUI, "Auto Fix Power: Off", Color3.new(1, 1, 0));
AutoF.MouseButton1Down:Connect(function()
	if _G.AF == false then
		_G.AF = true;
		AutoF.Text = "Auto Fix Power: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AF == false then
					break;
				else
					fireclickdetector((game:GetService("Workspace")).Terrain.Misc["Power Box"].Root.ProximityPrompt);
				end;
			end;
		end));
	else
		_G.AF = false;
		AutoF.Text = "Auto Fix Power: Off";
	end;
end);
Setup:CreateClickSounds();
