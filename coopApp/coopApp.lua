#!/usr/bin/env lua

print "cooperator app"

print "------------- base use ----------------------"
local co1 = coroutine.create(function () print("Hello WOrld") end)

-- 查看协同程序的状态 --
print (coroutine.status (co1))     	-- suspended

-- 用于启动或再次启动一个协同程序 --
coroutine.resume (co1)          		-- Hello World
print (coroutine.status (co1))     	-- suspended

print ""
print "------------- use ----------------------"

local co = coroutine.create(function ()
     for i = 1, 10 do
          print("co", i)
          coroutine.yield()
     end
end)

-- 打印初始状态
print(coroutine.status(co))     -- suspended

-- 唤醒协同程序co
coroutine.resume(co)     -- 打印co 1

-- 打印协同程序的状态
print(coroutine.status(co))     -- suspended

-- 再次唤醒协同程序co
coroutine.resume(co)     -- 打印co 2

-- 打印协同程序的状态
print(coroutine.status(co))     -- suspended

coroutine.resume(co)     -- 打印co 3
coroutine.resume(co)     -- 打印co 4
coroutine.resume(co)     -- 打印co 5
coroutine.resume(co)     -- 打印co 6
coroutine.resume(co)     -- 打印co 7
coroutine.resume(co)     -- 打印co 8
coroutine.resume(co)     -- 打印co 9
coroutine.resume(co)     -- 打印co 10
coroutine.resume(co)     -- 什么都不打印

print(coroutine.status(co))     -- dead
coroutine.resume(co)


print ""
print "------------- yiled resume example ----------------------"

function foo (a)
    print ("foo", a)  						-- foo 2
    return coroutine.yield (2 * a) 			-- return 2 * a
end

co = coroutine.create (function (a, b)
    print ("co-body", a, b) -- co-body 1 10
    local r = foo (a + 1)

    print ("co-body2", r)
    local r, s = coroutine.yield (a + b, a - b)

    print ("co-body3", r, s)
    return b, "end"
end)

print ("main", coroutine.resume (co, 1, 10)) 		-- true, 4
print ("--- 2 resume ---")
print ("main", coroutine.resume (co, "r")) 			-- true 11 -9
print ("--- 3 resume ---")
print ("main", coroutine.resume (co, "x", "y")) 	-- true 10 end
print ("--- 4 resume ---")
print ("main", coroutine.resume (co, "x", "y")) 	-- false cannot resume dead coroutine
print ("------")
--[[]]--