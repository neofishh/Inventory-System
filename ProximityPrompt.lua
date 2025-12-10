local proximity = {}


local serverScriptService = game:GetService("ServerScriptService")
local modules = serverScriptService:WaitForChild("Modules")

local pickupModule = require(modules.Pickup)


function proximity.Triggered(playerWhoTriggered, proximityPrompt)
	local character = playerWhoTriggered.Character
	local part = proximityPrompt.Parent
	if not character then return end
	pickupModule.Pickup(part, playerWhoTriggered)
	part:Destroy()
end


return proximity
