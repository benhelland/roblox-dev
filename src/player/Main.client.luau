local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local _Remotes = require(ReplicatedStorage.Remotes) -- rename to Remotes once you add remotes
local _player = Players.LocalPlayer -- rename to player once you use it

-- example: listen for a remote event from the server
-- _Remotes.MyEvent.OnClientEvent:Connect(function(data)
-- 	print(_player.Name, data)
-- end)
