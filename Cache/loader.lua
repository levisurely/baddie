local Games = {
    [2686040248] = "0bid0MathObby", --Math Obby By 0bid0
    [9579974235] = "findthefloppas", --Find The Floppa Morphs
    [10042496417] = "findthezombies", --Find The Zombie Morphs
    [10955145868] = "findtheducks", --Find The Duck Morphs
    [3587619225] = "megaeasyobby", --Mega Easy Obby
    [9616411936] = "ManCityBlueMoon", --Man City Blue Moon
    [12996397] = "megafunobby", --Mega Fun Obby
    [9940051005] = "BloxLegends", --Blox Legends
    [6403373529] = "slapbattles", --Slap Battles
    [9757510382] = "dalyanstradesimulator", --Dylan's Trade Simulator
    [8980446061] = "ultrabeauty", --Ultra Beauty
    [9648883891] = "festivaltycoon", --Festive Tycoon
    [9551640993] = "miningsimulator2", --Mining Simulator 2
    [7952502098] = "ImpossibleGlassBridgeObby", --Impossible Glass Bridge Obby
    [7378813434] = "cottonobby", --Cotton Obby
    [9228830112] = "chocolateobby", --Chocolate Obby
    [7341058233] = "FunObby", --Fun Obby
    [9304358188] = "findthememes", --Find The Memes
    [8328774140] = "dreamobby", --Dream Obby
    [3327818733] = "timewastingsimulator", --Time Wasting Simulator
    [11113551747] = "statgrindingsimulator2", --Stat Grinding Simulator 2
    [11915606459] = "thedifficultymachine_Revamp", --The Defficulty Machine: Revamp
    [10652184030] = "jumpclicker"; --Jump Clicker
};

local function Check()
local Supported = Games[game.PlaceId] or false;
if Supported ~= false then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/catgirIz/baddie/main/Cache/'..Supported..'.lua'))();
end;

if not game.PlaceId == Supported then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Script Not Found",
        Duration = "300";
        Button1 = "Retry";
        Text = "No Script For Game ID " .. game.PlaceId,
        Icon = "rbxassetid://8447740059";
    });
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Script Found!",
         Duration = "300";
        Text = "Found Script For Game ID " .. game.PlaceId,
        Icon = "rbxassetid://8447740059";
    });
end;
    end;

local function Callback(answer)
    Check();
end;

local Bindable = Instance.new("BindableFunction");
Bindable.OnInvoke = Callback;
Check();
