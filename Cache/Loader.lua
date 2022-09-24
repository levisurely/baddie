local Games = {
    [9579974235] = "FindFloppas",
  [3587619225] = "MegaEasyObby",
      [9616411936] = "BlueMoonCollect",
  [12996397] = "MegaFunObby",
    [9940051005] = "BloxLegends",
  [9757510382] = "DylanTradeSimulator",
      [8980446061] = "ultra_beauty",
  [9648883891] = "FestivalTycoon",
}

local Supported = Games[game.PlaceId] or false
if Supported ~= false then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/catgirIz/lev-is-a-baddie/main/Cache/' .. Supported .. '.lua'))()
end

if not game.PlaceId == Supported  then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Script Not Found",
	Text = "No Script For Game ID "..game.PlaceId,
	Icon = "rbxassetid://8447740059"
})
else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Script Found!", -- Required
	Text = "Found Script For Game ID "..game.PlaceId,
	Icon = "rbxassetid://8447740059"
})
end
