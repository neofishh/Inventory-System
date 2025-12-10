local drop = {}


local serverScriptService = game:GetService("ServerScriptService")
local modules = serverScriptService:WaitForChild("Modules")
local store = require(modules.Store)
local spawnItemModule = require(modules.SpawnItem)



local serverScriptService = game:GetService("ServerScriptService")
local modules = serverScriptService:WaitForChild("Modules")
local spawnItemModule = require(modules.SpawnItem)

function drop.Drop(player, id)
	local playerInventoryVar = store.retrievePlayerInventory(player)
	if table.find(playerInventoryVar, id) then
		spawnItemModule.spawn(player, id)
	else
		print("Failure")
	end



end



return drop
