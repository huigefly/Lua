#!/usr/bin/env lua

print "closure"

print "-----------------------------------"

function newCounter()
	local i = 0
	return function ()
		i = i + 1
		return i
	end
end

c1 = newCounter()
print (c1 ()) 			--> 1
print (c1 ())			--> 2

print "-----------------------------------"

function Fun1()
     local iVal = 10          		-- upvalue
     function InnerFunc1()    	 	-- 内嵌函数
          print(iVal)          		--
     end

     function InnerFunc2()     		-- 内嵌函数
          iVal = iVal + 10
     end

     return InnerFunc1, InnerFunc2
end

-- 将函数赋值给变量，此时变量a绑定了函数InnerFunc1, b绑定了函数InnerFunc2
local a, b = Fun1()

-- 调用a
a ()          -->10

-- 调用b
b ()          -->在b函数中修改了upvalue iVal

-- 调用a打印修改后的upvalue
a ()          -->20
