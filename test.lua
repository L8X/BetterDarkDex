local load_string = getrenv().loadstring or getfenv(0).loadstring
local shared_env = getrenv().shared
shared_env.loadstring = load_string

getgenv().new_ls = shared_env.loadstring

print(new_ls)



