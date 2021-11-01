local ls = getrenv().loadstring or getfenv(0)['loadstring'] 
_G.loadstr = ls 

local shared_env = getrenv().shared or shared 

shared_env.loadstr = _G.loadstr 
print(shared_env.loadstr)

local new_ls = shared_env.loadstr 
print(new_ls) 

local function newls(...) 
  return new_ls(...) 
end 

pcall(function() print(newls()) end)

getgenv().new_ls = shared_env.loadstr
print(new_ls)



