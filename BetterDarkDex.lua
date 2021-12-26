if hookfunction and hookmetamethod and getrawmetatable then
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

local function get_proxy_game_metatable(x)
 local proxy = {}
  local mt_func_list = {
    
 }
 local proxy_mt = {
    __newindex = function(t,k,v)
       local old
       old = hookmetamethod(game,k,v)
       mt_func_list[k] = old
     end;
      __index = function(t,k)
         return function(...)
             local list_func =  mt_func_list[k]
              local unpack_pcall = {pcall(list_func,...)}
           if unpack_pcall[1] == true then
                 table.remove(unpack_pcall,1)
              return unpack(unpack_pcall)
                end
          end
        end
  }
 return setmetatable(proxy,proxy_mt)
end
--hookfunction(getrawmetatable,get_proxy_game_metatable)
end

getrenv().error = function() end
getrenv().warn = function() end
getrenv().print = function() end


getgenv().Services = setmetatable({},{__index=function(s,r) return game:service(r) end})

if hookfunction and hookmetamethod and getrawmetatable then
getgenv().Protector = loadstring(game:HttpGet("https://raw.githubusercontent.com/pamlib/prote.lua/ca01e9b8b3478762370d4a1d1ee65bae6ee881a3/main.lua", true, Enum.HttpRequestType.Analytics, true))
end

-- < Services > --
local InsertService = Services.InsertService
local CoreGui = Services.CoreGui
local ScriptContext = Services.ScriptContext
local ContentProvider = Services.ContentProvider

Services.HttpService:SetHttpEnabled(true)
settings()['Task Scheduler'].ThreadPoolConfig = Enum.ThreadPoolConfig.Threads16

ScriptContext:SetTimeout(5)
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

task.spawn(function()
task.synchronize()
for i,v in pairs(Dex:GetDescendants()) do
    pcall(function() syn.protect_gui(v) end)
    end
task.wait(0)
end)

Dex.Name = "RobloxGui"
pcall(function() syn.protect_gui(Dex) end)
if gethui then
Dex.Parent = gethui()
else
Dex.Parent = Services.CoreGui
end
pcall(function() Protector():ProtectInstance(Dex, true) end)
pcall(function() Protector():ProtectInstance(Dex.Parent, true) end)
pcall(function() Protector():SpoofInstance(Dex, Dex) end)
pcall(function() Protector():SpoofInstance(Dex.Parent, Dex.Parent) end)
pcall(function() syn.protect_gui(Dex.Parent) end)

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
          pcall(function() syn.protect_gui(v) end)
    LoadScripts(v)
    end
end
LoadScripts(Obj)
pcall(function() syn.protect_gui(Obj) end)
end
Load(Dex)
pcall(function() syn.protect_gui(Dex) end)
pcall(function() Protector():ProtectInstance(Dex, true) end)
pcall(function() Protector():SpoofInstance(Dex, Dex) end)

pcall(function()
for i, v in next, getconnections(Services.UserInputService.TextBoxFocused) do
    v:Disable()
end
for i, v in next, getconnections(Services.UserInputService.TextBoxFocusReleased) do
    v:Disable()
end 
end)

spawn(function()
pcall(function()
while Services.RunService.RenderStepped:Wait() do
for i, v in next, getconnections(Services.UserInputService.TextBoxFocused) do
    v:Disable()
end
for i, v in next, getconnections(Services.UserInputService.TextBoxFocusReleased) do
    v:Disable()
end
end
end)
end)

task.spawn(function()
task.synchronize()
pcall(function() Protector():ProtectInstance(Dex, true) end)
pcall(function() Protector():ProtectInstance(Dex, Dex) end)
task.wait()
end)


pcall(function() Protector():ProtectInstance(Dex) end)
pcall(function() Protector():ProtectInstance(Dex, true) end)


Inputting = false
ChatBar = nil
Current = nil

function Check()
	wait(.1)
	Inputting = false
	Disconnection:Disconnect()
end

function InputBegan()
	if game:GetService("UserInputService"):GetFocusedTextBox() then
		ChatBar = game:GetService("UserInputService"):GetFocusedTextBox()
		Inputting = true
		Current = ChatBar.FocusLost
		Disconnection = Current:Connect(Check)
	end
end
InputConnect = game:GetService("UserInputService").InputBegan:Connect(InputBegan)
