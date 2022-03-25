if (getgenv().DEX_LOADED) then return; end

getgenv().DEX_LOADED = true

local cloneref = cloneref or function(ref)
return ref
end

local Rand = math.random(1e9, 2e9)
math.randomseed(tick())
warn(Rand)

pcall(function()
if identifyexecutor() == "ScriptWare" then
local function decomp(a)
    return tostring(disassemble(getscriptbytecode(a)))
end

getgenv().decompile = decomp
end
end)

pcall(function()
if hookmetamethod and hookfunction then
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

local mt = getrawmetatable(game)

local old
old = hookfunction(mt.__namecall, function(...)
   return old(...)
end)
end
end)

pcall(function()
if hookfunction and getrenv then
local memCheckBypass

memCheckBypass = hookfunction(getrenv().gcinfo, function(...)
   --warn("Script tried to memory check, PATH: \n"..debug.traceback())
   return tonumber(math.random(55-math.random(1,45), 110-math.random(1,35)*0.215-math.random(1, 45)))
end)
end
end)

local Services = setmetatable({},{__index=function(s,r) return game:service(r) end})
getgenv().Services = Services

-- < Services > --
local InsertService = cloneref(Services.InsertService)
local CoreGui = cloneref(Services.CoreGui)
local ScriptContext = cloneref(Services.ScriptContext)
local ContentProvider = cloneref(Services.ContentProvider)

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

local Dex = getobjects("rbxassetid://8555825815")[1]

pcall(function() if syn then syn.protect_gui(Dex) end end)

Dex.Name = "RobloxGui" -- Bypass attempt for a few vulnerabilities

pcall(function()
if gethui and identifyexecutor() == "ScriptWare" then
Dex.Parent = gethui()
else
Dex.Parent = CoreGui
end
end)

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
