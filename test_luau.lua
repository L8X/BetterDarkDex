local ls = getfenv(0)['loadstring'] 
_G.loadstr = ls 

shared.loadstr = _G.loadstr
print(shared.loadstr) 

local new_ls = shared.loadstr
print(new_ls) 

local function newls(...) return new_ls(...) end print(newls())
