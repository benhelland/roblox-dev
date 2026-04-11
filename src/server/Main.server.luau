local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local _Remotes = require(ReplicatedStorage.Remotes) -- rename to Remotes once you add remotes

Players.PlayerAdded:Connect(function(_player) -- rename to player once you use it
	-- example: fire a remote when a player joins
	-- _Remotes.MyEvent:FireClient(_player, "hello")
end)

