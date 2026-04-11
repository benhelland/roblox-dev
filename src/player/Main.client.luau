local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local _Remotes = require(ReplicatedStorage.Remotes)
local _player = Players.LocalPlayer

-- example: listen for a remote event from the server
-- Remotes.MyEvent.OnClientEvent:Connect(function(data)
-- 	print(player.Name, data)
-- end)
