local ReplicatedStorage = game:GetService("ReplicatedStorage")

local folder = ReplicatedStorage:FindFirstChild("Remotes")
	or Instance.new("Folder")
folder.Name = "Remotes"
folder.Parent = ReplicatedStorage

local function ensure(name: string, className: string): Instance
	local existing = folder:FindFirstChild(name)
	if existing then return existing end
	local obj = Instance.new(className)
	obj.Name = name
	obj.Parent = folder
	return obj
end

local Remotes = {}

-- define remotes here, e.g:
-- Remotes.MyEvent = ensure("MyEvent", "RemoteEvent")
-- Remotes.MyFunction = ensure("MyFunction", "RemoteFunction")

return Remotes
