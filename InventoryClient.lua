local gui = script.Parent

local frame = gui.Frame
local replicatedStorage = game:GetService("ReplicatedStorage")
local openInventoryButton = gui.OpenInventory
local remotes = replicatedStorage:WaitForChild("Remotes")
local Players = game:GetService("Players")
local player = Players.LocalPlayer


local repliModules = replicatedStorage.Modules

local itemDataModule = require(repliModules.ItemData)



frame.Visible = false

openInventoryButton.MouseButton1Down:Connect(function()
	if frame.Visible then
		frame.Visible = false
		frame.Active = false
	else
		frame.Visible = true
		frame.Active = true
	end

end)


gui.SpawnItem.MouseButton1Down:Connect(function()
	remotes.Spawn:FireServer()
end)



remotes.Pickup.OnClientEvent:Connect(function(inventoryTable, entryId)
	local itemName = itemDataModule.Items[entryId].Name
	local idName = tostring(entryId) 
	for _, frameChildren in pairs(frame:GetDescendants()) do
		if frameChildren:IsA("TextButton") and frameChildren.Text == "" then
			frameChildren.Text = itemName
			frameChildren:SetAttribute("ItemID", entryId)
			break
		end
	end
	
	
end)



for _, frameChildren in pairs(frame:GetDescendants()) do
	if frameChildren:IsA("TextButton") then
		frameChildren.MouseButton1Down:Connect(function()
			if frameChildren.Text == "" then 
				print("No Item in this place")	
			end
			local id = frameChildren:GetAttribute("ItemID")
			remotes.RequestDrop:FireServer(id)
			frameChildren.Text = ""
		end)
	end
end

