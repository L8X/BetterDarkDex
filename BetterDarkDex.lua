getgenv().Services = setmetatable({},{__index=function(s,r) return game:service(r) end})
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

local assets = {
Dex,
"rbxassetid://6827450620"
}

math.randomseed(tick())
ContentProvider:PreloadAsync(assets)

syn.protect_gui(Dex)
task.spawn(function()
task.synchronize()
for i,v in pairs(Dex:GetDescendants()) do
    syn.protect_gui(v)
    end
math.randomseed(tick())
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
math.randomseed(tick())
    end
    for i,v in pairs(Script:GetChildren()) do
    LoadScripts(v)
    end
math.randomseed(tick())
end
math.randomseed(tick())
LoadScripts(Obj)
end
math.randomseed(tick())
Load(Dex)
ScriptContext:SetTimeout(2.5)
ScriptContext.ScriptsDisabled = true
