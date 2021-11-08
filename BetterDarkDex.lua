getgenv().Services = setmetatable({},{__index=function(s,r) return game:service(r) end})

getgenv().Protector = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/pamlib/prote.lua/ca01e9b8b3478762370d4a1d1ee65bae6ee881a3/main.lua"))


local OldIndex
OldIndex = hookmetamethod(game, "__index", function(Self, Index)
    return OldIndex(Self, Index)
end)

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    return OldNewIndex(Self, Index, Value)
end)

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    return OldNamecall(Self, ...)
end)

-- < Services > --
local InsertService = Services.InsertService
local CoreGui = Services.CoreGui
local ScriptContext = Services.ScriptContext
local ContentProvider = Services.ContentProvider
-- < Aliases > --
getgenv().getobjects = function(a)
    local Objects = {}
    if a then
        local b = InsertService:LoadLocalAsset(a)
        if b then 
            table.insert(Objects, b) 
        end
    end
    return Objects
end

local Dex = getobjects("rbxassetid://6827450620")[1]

ContentProvider:Preload("rbxassetid://6827450620")

syn.protect_gui(Dex)
Protector():ProtectInstance(Dex)
Protector():SpoofInstance(Dex)

task.spawn(function()
task.synchronize()
for i,v in pairs(Dex:GetDescendants()) do
    syn.protect_gui(v)
Protector():ProtectInstance(v)
Protector():SpoofInstance(v)
    end
task.wait(0)
end)

Dex.Name = "RobloxGui"
Dex.Parent = Services.CoreGui

local function Load(Obj, Url)
local function GiveOwnGlobals(Func, Script)
    local Fenv = {}
    local RealFenv = {script = Script}
    local FenvMt = {}
    FenvMt.__index = function(a,b)
        if RealFenv[b] == nil then
            return getgenv()[b]
        else
            return RealFenv[b]
        end
    end
    FenvMt.__newindex = function(a, b, c)
        if RealFenv[b] == nil then
            getgenv()[b] = c
        else
            RealFenv[b] = c
        end
    end
    setmetatable(Fenv, FenvMt)
    setfenv(Func, Fenv)
    return Func
end
local function LoadScripts(Script)
    if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
        spawn(function()
            GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script)()
        end)
    end
    for i,v in pairs(Script:GetChildren()) do
    LoadScripts(v)
    end
end
LoadScripts(Obj)
end
Load(Dex)
ScriptContext:SetTimeout(2.5)
ScriptContext.ScriptsDisabled = true
