local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Remotes = {}

if RunService:IsServer() then
	local folder = Instance.new("Folder")
	folder.Name = "Remotes"
	folder.Parent = ReplicatedStorage

	local function _ensure(name: string, className: string): Instance
		local existing = folder:FindFirstChild(name)
		if existing then return existing end
		local obj = Instance.new(className)
		obj.Name = name
		obj.Parent = folder
		return obj
	end

	-- define remotes here, e.g:
	-- Remotes.MyEvent = _ensure("MyEvent", "RemoteEvent")
	-- Remotes.MyFunction = _ensure("MyFunction", "RemoteFunction")
else
	local _folder = ReplicatedStorage:WaitForChild("Remotes")

	-- access remotes here, e.g:
	-- Remotes.MyEvent = _folder:WaitForChild("MyEvent")
	-- Remotes.MyFunction = _folder:WaitForChild("MyFunction")
end

return Remotes
