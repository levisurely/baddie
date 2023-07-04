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
local YourTycoon = nil;
for i, v in pairs((game:GetService("Workspace")).Tycoons:GetChildren()) do
	if v:IsA("Folder") then
		if v:FindFirstChild("TycoonOwner") then
			if v.TycoonOwner.Value == Player or v.TycoonOwner.Value == Player.Name then
				YourTycoon = v;
				break;
			end;
		end;
	end;
end;
if YourTycoon == nil then
	for i, v in pairs((game:GetService("Workspace")).Tycoons:GetChildren()) do
		if v:IsA("Folder") then
			if v:FindFirstChild("TycoonOwner") then
				if v.TycoonOwner.Value == "" or v.TycoonOwner.Value == "None" then
					Player.Character.HumanoidRootPart.CFrame = v.Claim.Claim.CFrame;
					YourTycoon = v;
					break;
				end;
			end;
		end;
	end;
end;
print(YourTycoon);
_G.APO = false;
local AutoPost = Setup:CreateButton(GameUI, "Auto Interact With Workers: Off", Color3.new(1, 1, 0));
AutoPost.MouseButton1Down:Connect(function()
	if _G.APO == false then
		_G.APO = true;
		AutoPost.Text = "Auto Interact With Workers: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.APO == false then
					break;
				else
					local items = YourTycoon.Items:GetChildren();
					for i, item in pairs(items) do
						if item:IsA("Model") then
							if item.FriendPC:FindFirstChild("Needs") then
								if item.FriendPC.Needs.Value ~= "None" then
									Player.Character.HumanoidRootPart.CFrame = item.Papers.CFrame;
									fireproximityprompt(item.FriendPC.Noob.Torso.ProximityPrompt);
								end;
							end;
						end;
					end;
				end;
			end;
		end));
	else
		_G.APO = false;
		AutoPost.Text = "Auto Interact With Workers: Off";
	end;
end);
_G.AUO = false;
local AutoRecord = Setup:CreateButton(GameUI, "Auto Record: Off", Color3.new(1, 1, 0));
AutoRecord.MouseButton1Down:Connect(function()
	if _G.AUO == false then
		_G.AUO = true;
		AutoRecord.Text = "Auto Record: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AUO == false then
					break;
				else
					local args = {
						[1] = (game:GetService("Players")).LocalPlayer
					};
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("CDs")):FireServer(unpack(args));
				end;
			end;
		end));
	else
		_G.AUO = false;
		AutoRecord.Text = "Auto Record: Off";
	end;
end);
_G.AC = false;
local AutoCollect = Setup:CreateButton(GameUI, "Auto Collect: Off", Color3.new(1, 1, 0));
AutoCollect.MouseButton1Down:Connect(function()
	if _G.AC == false then
		_G.AC = true;
		AutoCollect.Text = "Auto Collect: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AC == false then
					break;
				elseif YourTycoon.StaticItems.CDCollect.StorageAmt.Value > 0 then
					for i, v in pairs(YourTycoon.StaticItems.CDCollect:GetDescendants()) do
						if v:IsA("ProximityPrompt") then
							Player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame;
							fireproximityprompt(v);
						end;
					end;
				end;
			end;
		end));
	else
		_G.AC = false;
		AutoCollect.Text = "Auto Collect: Off";
	end;
end);
_G.AP = false;
local AutoAP = Setup:CreateButton(GameUI, "Auto Sell: Off", Color3.new(1, 1, 0));
AutoAP.MouseButton1Down:Connect(function()
	if _G.AP == false then
		_G.AP = true;
		AutoAP.Text = "Auto Sell: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AP == false then
					break;
				elseif Player.Data.CDs.Value > 0 then
					local v = (workspace.NPCS:GetChildren())[math.random(1, #workspace.NPCS:GetChildren())];
					if v:IsA("Model") then
						Player.Character.HumanoidRootPart.CFrame = v.Torso.CFrame;
						fireproximityprompt(v.Torso.ProximityPrompt);
					end;
				end;
			end;
		end));
	else
		_G.AP = false;
		AutoAP.Text = "Auto Sell: Off";
	end;
end);
_G.ABF = false;
local AutoABF = Setup:CreateButton(GameUI, "Auto Buy Follower Buttons: Off", Color3.new(1, 1, 0));
AutoABF.MouseButton1Down:Connect(function()
	if _G.ABF == false then
		_G.ABF = true;
		AutoABF.Text = "Auto Buy Follower Buttons: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.ABF == false then
					break;
				else
					for i, v in pairs(YourTycoon.FollowerAchievements:GetChildren()) do
						if v:IsA("BasePart") then
							if v:FindFirstChild("Cost") and v.Transparency == 0 then
								if v.Cost.Value <= Player.leaderstats.Clout.Value then
									Player.Character.HumanoidRootPart.CFrame = v.CFrame;
								end;
							end;
						end;
					end;
				end;
			end;
		end));
	else
		_G.ABF = false;
		AutoABF.Text = "Auto Buy Follower Buttons: Off";
	end;
end);
_G.ABM = false;
local AutoABM = Setup:CreateButton(GameUI, "Auto Buy Money Buttons: Off", Color3.new(1, 1, 0));
AutoABM.MouseButton1Down:Connect(function()
	if _G.ABM == false then
		_G.ABM = true;
		AutoABM.Text = "Auto Buy Money Buttons: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.ABM == false then
					break;
				else
					for i, v in pairs(YourTycoon.Purchases:GetChildren()) do
						if v:IsA("BasePart") then
							if v:FindFirstChild("Cost") and v.Transparency == 0 then
								if v.Cost.Value <= Player.Data.Cois.Value then
									Player.Character.HumanoidRootPart.CFrame = v.CFrame;
								end;
							end;
						end;
					end;
				end;
			end;
		end));
	else
		_G.ABM = false;
		AutoABM.Text = "Auto Buy Money Buttons: Off";
	end;
end);
local character = Player.Character or Player.CharacterAdded:Wait();
local humanoid = character:WaitForChild("Humanoid");
humanoid.Seated:Connect(function(isSeated, seatPart)
	if isSeated == true then
		humanoid.Sit = false;
	end;
end);
Setup:CreateClickSounds();
