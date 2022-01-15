local str = string.rep(' ', 16384)
while task.wait() do 
task.spawn(coroutine.create(function()
        print("Lua CPU Usage:", os.clock())
        print("Lua OS Time:", os.time())
        print("Distributed Game Time:", workspace.DistributedGameTime)
end))
end
