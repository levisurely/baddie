local Games = {
	[2686040248] = "0bid0MathObby",
	[9579974235] = "findthefloppas",
	[10042496417] = "findthezombies",
	[10955145868] = "findtheducks",
	[3587619225] = "megaeasyobby",
	[9616411936] = "ManCityBlueMoon",
	[12996397] = "megafunobby",
	[9940051005] = "BloxLegends",
	[6403373529] = "slapbattles",
	[9757510382] = "dalyanstradesimulator",
	[8980446061] = "ultrabeauty",
	[9648883891] = "festivaltycoon",
	[9551640993] = "miningsimulator2",
	[7952502098] = "ImpossibleGlassBridgeObby",
	[7378813434] = "cottonobby",
	[9228830112] = "chocolateobby",
	[7341058233] = "FunObby",
	[9304358188] = "findthememes",
	[8328774140] = "dreamobby",
	[3327818733] = "timewastingsimulator",
	[11113551747] = "statgrindingsimulator2",
	[11915606459] = "thedifficultymachine_Revamp",
	[13692314644] = "getcancelledtycoon",
	[11596351062] = "famousrappertycoon",
	[10652184030] = "jumpclicker"
};
if not game:IsLoaded() then
	game.Loaded:Wait();
end;
local function Check()
	local Supported = Games[game.PlaceId] or false;
	if Supported ~= false then
		(loadstring(game:HttpGet("https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/" .. Supported .. ".lua")))();
	end;
	if not game.PlaceId == Supported then
		(game:GetService("StarterGui")):SetCore("SendNotification", {
			Title = "Script Not Found",
			Duration = "300",
			Button1 = "Retry",
			Text = "No Script For Game ID " .. game.PlaceId,
			Icon = "rbxassetid://8447740059"
		});
	else
		(game:GetService("StarterGui")):SetCore("SendNotification", {
			Title = "Script Found!",
			Duration = "300",
			Text = "Found Script For Game ID " .. game.PlaceId,
			Icon = "rbxassetid://8447740059"
		});
	end;
end;
local function Callback(answer)
	Check();
end;
local Bindable = Instance.new("BindableFunction");
Bindable.OnInvoke = Callback;
Check();
