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
				if v.TycoonOwner.Value == "None" or v.TycoonOwner.Value == "" then
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
local AutoPost = Setup:CreateButton(GameUI, "Auto Post Opinions: Off", Color3.new(1, 1, 0));
AutoPost.MouseButton1Down:Connect(function()
	if _G.APO == false then
		_G.APO = true;
		AutoPost.Text = "Auto Post Opinions: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.APO == false then
					break;
				else
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Post")):FireServer();
				end;
			end;
		end));
	else
		_G.APO = false;
		AutoPost.Text = "Auto Post Opinions: Off";
	end;
end);
_G.AUO = false;
local AutoUpload = Setup:CreateButton(GameUI, "Auto Upload: Off", Color3.new(1, 1, 0));
AutoUpload.MouseButton1Down:Connect(function()
	if _G.AUO == false then
		_G.AUO = true;
		AutoUpload.Text = "Auto Upload: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AUO == false then
					break;
				else
					local args = {
						[1] = (game:GetService("Players")).LocalPlayer
					};
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Uploaded")):FireServer(unpack(args));
				end;
			end;
		end));
	else
		_G.AUO = false;
		AutoUpload.Text = "Auto Upload: Off";
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
				elseif YourTycoon.StaticItems.Belt1.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt1.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt1.Collector.ProxPart.ProximityPrompt);
				elseif YourTycoon.StaticItems.Belt2.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt2.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt2.Collector.ProxPart.ProximityPrompt);
				elseif YourTycoon.StaticItems.Belt3.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt3.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt3.Collector.ProxPart.ProximityPrompt);
				elseif YourTycoon.StaticItems.Belt4.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt4.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt4.Collector.ProxPart.ProximityPrompt);
				elseif YourTycoon.StaticItems.Belt5.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt5.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt5.Collector.ProxPart.ProximityPrompt);
				elseif YourTycoon.StaticItems.Belt6.Collector.ProxPart.Amt.Value > 0 then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Belt6.Collector.ProxPart.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Belt6.Collector.ProxPart.ProximityPrompt);
				end;
			end;
		end));
	else
		_G.AC = false;
		AutoCollect.Text = "Auto Collect: Off";
	end;
end);
_G.AUIS = false;
local AutoUIS = Setup:CreateButton(GameUI, "Auto Upgrade Internet Speed: Off", Color3.new(1, 1, 0));
AutoUIS.MouseButton1Down:Connect(function()
	if _G.AUIS == false then
		_G.AUIS = true;
		AutoUIS.Text = "Auto Upgrade Internet Speed: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AUIS == false then
					break;
				else
					local args = {
						[1] = "InternetSpeed",
						[2] = 1
					};
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("UpgradeItem")):FireServer(unpack(args));
				end;
			end;
		end));
	else
		_G.AUIS = false;
		AutoUIS.Text = "Auto Upgrade Internet Speed: Off";
	end;
end);
_G.AUWS = false;
local AutoUWS = Setup:CreateButton(GameUI, "Auto Upgrade Worker Speed: Off", Color3.new(1, 1, 0));
AutoUWS.Visible = false;
AutoUWS.MouseButton1Down:Connect(function()
	if _G.AUWS == false then
		_G.AUWS = true;
		AutoUWS.Text = "Auto Upgrade Worker Speed: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AUWS == false then
					break;
				else
					local args = {
						[1] = "Belt1Speed",
						[2] = 2
					};
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("UpgradeItem")):FireServer(unpack(args));
				end;
			end;
		end));
	else
		_G.AUWS = false;
		AutoUWS.Text = "Auto Upgrade Worker Speed: Off";
	end;
end);
_G.AUAR = false;
local AutoUAR = Setup:CreateButton(GameUI, "Auto Upgrade AD Reveue: Off", Color3.new(1, 1, 0));
AutoUAR.Visible = false;
AutoUAR.MouseButton1Down:Connect(function()
	if _G.AUAR == false then
		_G.AUAR = true;
		AutoUAR.Text = "Auto Upgrade AD Reveue: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AUAR == false then
					break;
				else
					local args = {
						[1] = "Belt1Value",
						[2] = 2
					};
					(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("UpgradeItem")):FireServer(unpack(args));
				end;
			end;
		end));
	else
		_G.AUAR = false;
		AutoUAR.Text = "Auto Upgrade AD Reveue: Off";
	end;
end);
_G.AP = false;
local AutoAP = Setup:CreateButton(GameUI, "Auto Apology: Off", Color3.new(1, 1, 0));
AutoAP.MouseButton1Down:Connect(function()
	if _G.AP == false then
		_G.AP = true;
		AutoAP.Text = "Auto Apology: On";
		coroutine.resume(coroutine.create(function()
			while task.wait() do
				if _G.AP == false then
					break;
				elseif Player.PlayerGui.CutsceneHandler.Label1.Visible == true then
					Player.Character.HumanoidRootPart.CFrame = YourTycoon.StaticItems.Camera.Part.CFrame;
					fireproximityprompt(YourTycoon.StaticItems.Camera.MeshPart.ProximityPrompt);
				end;
			end;
		end));
	else
		_G.AP = false;
		AutoAP.Text = "Auto Apology: Off";
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
								if v.Cost.Value <= Player.leaderstats.Haters.Value then
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
								if v.Cost.Value <= Player.Data.Cash.Value then
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
