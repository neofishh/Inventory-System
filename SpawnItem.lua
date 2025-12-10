local spawnItem = {}


local serverScriptService = game:GetService("ServerScriptService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local repliModules = replicatedStorage.Modules
local modules = serverScriptService:WaitForChild("Modules")
local itemData = require(repliModules.ItemData)

local store = require(modules.Store)
local proximityModule = require(modules.ProximityPrompt)

function spawnItem.spawn(player, id)
	local newItem = itemData.Items[id]
	local newPart: Part = Instance.new("Part")
	local character = player.Character
	local humanoid = character:FindFirstChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local spawnPosition = humanoidRootPart.CFrame * CFrame.new(0, 0, -5)


	newPart.Parent = workspace.Items
	newPart.Name = newItem.Name
	newPart.BrickColor = BrickColor.new(newItem.Color)
	newPart.CFrame = spawnPosition

	store.itemInWorld(newPart, newItem)

	local proximityPrompt = Instance.new("ProximityPrompt")
	proximityPrompt.Parent = newPart
	proximityPrompt.HoldDuration = 1
	proximityPrompt.RequiresLineOfSight = true



	
	proximityPrompt.Triggered:Connect(function(playerWhoTriggered)
		proximityModule.Triggered(playerWhoTriggered, proximityPrompt)
	end)
end


return spawnItem
