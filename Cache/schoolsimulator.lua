local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Player = Players.LocalPlayer;
local PUI = game.CoreGui;
local Headers = {
	["content-type"] = "application/json"
};
_G.Color = Color3.new(0, 0, 0);
local Setup = (loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/UI.lua?token=GHSAT0AAAAAAB26FXJQLL5V4HVVUPGVAEFAY6EN6XQ")))();
_G.ATS = false;
local MainUI = PUI:FindFirstChild("skijack");
local GameUI = (MainUI:WaitForChild("gameskijack")):WaitForChild("ScrollingFrame");
local AutoETS = Setup:CreateButton(GameUI, "Chalk Spam: Off", Color3.new(1, 1, 0));
AutoETS.MouseButton1Down:Connect(function()
	if _G.ATS == false then
		_G.ATS = true;
		AutoETS.Text = "Chalk Spam: On";
		coroutine.resume(coroutine.create(function()
			while wait() do
				if _G.ATS == true then
					local player = (game:GetService("Players")).LocalPlayer;
					for _, tool in pairs(player.Backpack:GetChildren()) do
						if tool.Name == "ChaIk" then
							tool.Parent = player.Character;
						end;
					end;
					for _, tool in pairs(player.Character:GetChildren()) do
						if tool.Name == "ChaIk" then
							tool.Parent = player.Character;
						end;
					end;
					local player = game.Players.LocalPlayer;
					local character = player.Character or player.CharacterAdded:Wait();
					local ohVector32 = character.HumanoidRootPart.Position;
					local closestPlayer, closestDistance;
					for _, p in pairs(game.Players:GetPlayers()) do
						if p ~= player and p.Character then
							local distance = (ohVector32 - p.Character.HumanoidRootPart.Position).Magnitude;
							if not closestDistance or distance < closestDistance then
								closestDistance = distance;
								closestPlayer = p;
							end;
						end;
					end;
					if closestPlayer then
						local ohVector33 = closestPlayer.Character.HumanoidRootPart.Position;
						local ohInstance1 = workspace.ChalkBoard.ChalkBoard;
						local ohColor34 = Color3.new(0, 0, 0);
						workspace[player.Name].ChaIk.Draw:FireServer(ohInstance1, ohVector32, ohVector33, ohColor34);
					end;
				else
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
				end;
			end;
		end));
	else
		_G.ATS = false;
		AutoETS.Text = "Chalk Spam: Off";
	end;
end);
local AutoSuns = Setup:CreateButton(GameUI, "Free Gamepasses", Color3.new(1, 1, 0));
AutoSuns.MouseButton1Down:Connect(function()
	local mt = getrawmetatable(game);
	local old = mt.__namecall;
	local readonly = setreadonly or make_writeable;
	local MarketplaceService = game:GetService("MarketplaceService");
	readonly(mt, false);
	mt.__namecall = function(self, ...)
		local args = {
			...
		};
		local method = table.remove(args);
		if self == MarketplaceService and method:find("UserOwnsGamePassAsync") then
			return true;
		end;
		return old(self, ...);
	end;
end);
local AutoRedDuck = Setup:CreateButton(GameUI, "Get Red Duck", Color3.new(1, 1, 0));
AutoRedDuck.MouseButton1Down:Connect(function()
	fireclickdetector((game:GetService("Workspace")).puzzle_one.lights["1"].EE.ClickDetector);
	wait(0);
	fireclickdetector((game:GetService("Workspace")).puzzle_one.lights["2"].EE.ClickDetector);
	wait(0);
	fireclickdetector((game:GetService("Workspace")).puzzle_one.lights["3"].EE.ClickDetector);
	wait(0);
	fireclickdetector((game:GetService("Workspace")).puzzle_one.lights["4"].EE.ClickDetector);
	wait(0);
	local Thing = (game:GetService("Workspace")).puzzle_one.badge;
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Thing.CFrame;
end);
Setup:CreateClickSounds();
