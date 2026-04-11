local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local _Remotes = require(ReplicatedStorage.Remotes)

Players.PlayerAdded:Connect(function(_player)
	-- example: fire a remote when a player joins
	-- Remotes.MyEvent:FireClient(player, "hello")
end)

