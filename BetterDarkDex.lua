getgenv().Services = setmetatable({},{__index=function(s,r) return game:service(r) end})
-- < Services > --
local InsertService = Services.InsertService
local CoreGui = Services.CoreGui
local ScriptContext = Services.ScriptContext
-- < Aliases > --
getobjects = function(a)
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
math.randomseed(tick())
syn.protect_gui(Dex)

task.spawn(function()
task.synchronize()
for i,v in pairs(Dex:GetDescendants()) do
    syn.protect_gui(v)
math.randomseed(tick())
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
            return getfenv()[b]
        else
            return RealFenv[b]
        end
    end
    FenvMt.__newindex = function(a, b, c)
        if RealFenv[b] == nil then
            getfenv()[b] = c
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
math.randomseed(tick())
    LoadScripts(v)
    end
end
math.randomseed(tick())
LoadScripts(Obj)
end
math.randomseed(tick())
Load(Dex)
ScriptContext:SetTimeout(2.5)
ScriptContext.ScriptsDisabled = true
math.randomseed(tick())
