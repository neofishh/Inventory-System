local pickupModule = {}

local replicatedStorage = game:GetService("ReplicatedStorage")
local remotes = replicatedStorage:WaitForChild("Remotes")

local serverScriptService = game:GetService("ServerScriptService")
local modules = serverScriptService:WaitForChild("Modules")
local store = require(modules.Store)


itemsInWorld = {}

playerInventory = {}








function pickupModule.Pickup(part, playerWhoTriggered)


	store.playerItem(part, playerWhoTriggered)


end




return pickupModule
