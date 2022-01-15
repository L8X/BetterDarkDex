local str = string.rep(' ', 16384)
while task.wait() do 
task.spawn(coroutine.create(function()
for i = 1,10000 do
        print(str)
    end
end))
end
