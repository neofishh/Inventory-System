local itemsFolder = workspace.Items

local serverScriptService = game:GetService("ServerScriptService")

local modules = serverScriptService:WaitForChild("Modules")
local replicatedStorage = game:GetService("ReplicatedStorage")
local repliModules = replicatedStorage.Modules

local itemData = require(repliModules.ItemData)
local remotes = replicatedStorage:WaitForChild("Remotes")
local pickupModule = require(modules.Pickup)
local spawnItemModule = require(modules.SpawnItem)
local dropModule = require(modules.Drop)



remotes.Spawn.OnServerEvent:Connect(function(player)
	local id = math.random(1, 3)
	spawnItemModule.spawn(player, id)
end)




remotes.RequestDrop.OnServerEvent:Connect(function(player, itemId)
	dropModule.Drop(player, itemId)
end)