local store = {}

itemsInWorld = {}

playerInventory = {}


local replicatedStorage = game:GetService("ReplicatedStorage")
local remotes = replicatedStorage:WaitForChild("Remotes")

local repliModules = replicatedStorage:WaitForChild("Modules")



function store.itemInWorld(newPart, newItem)
	itemsInWorld[newPart] = {
		id = newItem.Id,
	}
	print(itemsInWorld)

end


function store.playerItem(part, playerWhoTriggered)
	local entry = itemsInWorld[part]
	if not entry then
		return
	end
	if not playerInventory[playerWhoTriggered] then
		playerInventory[playerWhoTriggered] = {} -- create an array/table
	end


	table.insert(playerInventory[playerWhoTriggered], entry.id)
	
	
	remotes.Pickup:FireClient(playerWhoTriggered, playerInventory[playerWhoTriggered], entry.id)

end




function store.retrievePlayerInventory(player)
	return playerInventory[player]
end




return store
