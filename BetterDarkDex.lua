-- syndexpro.lua --

local function NSIK_fake_script()
			
local cloneref = cloneref or function(ref)
return ref
end

-- < Functions > --

local CoreGui = cloneref(game:GetService("CoreGui"))
local RemoteDebugWindow = CoreGui:FindFirstChild("RemoteDebugWindow", true)
if RemoteDebugWindow then
    RemoteDebugWindow.Parent:Destroy()
end end

-- < Services > --	
local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local InsertService = cloneref(game:GetService("InsertService"))
-- < Aliases > --
local table_insert = table.insert
local table_foreach = table.foreach
local string_char = string.char
getgenv().getobjects = function(a)
    local Objects = {}
    if a then
        local b = InsertService:LoadLocalAsset(a)
        if b then 
            table_insert(Objects, b) 
        end
    end
    return Objects
end

-- < Values > --
local Charset = {}
local Random_Instance = Random.new()
-- < Source > --

for i = 48,  57 do 
	table_insert(Charset, string_char(i))
end

for i = 65,  90 do 
	table_insert(Charset, string_char(i))
end

for i = 97, 122 do
	table_insert(Charset, string_char(i))
end

function RandomCharacters(length)
	return length > 0 and RandomCharacters(length - 1)..Charset[Random_Instance:NextInteger(1, #Charset)] or ""
end
			
local HTTPService = cloneref(game:GetService("HttpService"))
local CoreGui     = cloneref(game:GetService("CoreGui"))
local ScriptContext = cloneref(game:GetService("ScriptContext"))
local RandomObject = CoreGui:FindFirstChildOfClass("ScreenGui")
local RandomObject2 = Instance.new("Folder", RandomObject)

pcall(function() 
if syn and syn.protect_gui then
syn.protect_gui(RandomObject2)
end
end)

local CRandomObject2 = cloneref(RandomObject2)

pcall(function() 
if syn and syn.protect_gui then
syn.protect_gui(CRandomObject2)
end
end)
	
local Dex = cloneref(getobjects("rbxassetid://7995973532")[1])
ContentProvider:Preload("rbxassetid://7995973532")

pcall(function()
task.spawn(function()
for i,v in pairs(Dex:GetDescendants()) do
    pcall(function() syn.protect_gui(v) end)
    end
end)
end)

Dex.Name = "RobloxGui" -- bypass attempt??

Dex.Parent = gethiddengui and gethiddengui() or gethui and gethui() or CRandomObject2

local function Load(Obj, Url)
	local function GiveOwnGlobals(Func, Script)
		local Fenv, RealFenv, FenvMt = {}, {script = Script}, {}
		FenvMt.__index = function(a,b)
			return RealFenv[b] == nil and getgenv()[b] or RealFenv[b]
		end
		FenvMt.__newindex = function(a, b, c)
			if RealFenv[b] == nil then 
				getgenv()[b] = c
		else 
			RealFenv[b] = c 
			end
		end
		setmetatable(Fenv, FenvMt)
		pcall(setfenv, Func, Fenv)
		return Func
	end
	local function LoadScripts(_, Script)
		if Script:IsA("LocalScript") then
			task.spawn(function()
				GiveOwnGlobals(loadstring(Script.Source,"="..Script:GetFullName()), Script)()
			end)
		end
		table_foreach(Script:GetChildren(), LoadScripts)
	end
LoadScripts(nil, Obj)
end
Load(Dex)
coroutine.wrap(NSIK_fake_script)()
