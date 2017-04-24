#!/usr/bin/env lua

print "---------------------------"
co1 = coroutine.create(function(str)
	print (str);
	coroutine.yield ("nimeide")
	print (str);
	coroutine.yield ("shenmegui", "nani", "disange")
	print (str)
	coroutine.yield ("waht up")
	
	return "协同程序结束了"
end);

-- resume 的返回值：第一个为bool，第二个对应yield 的返回类型 --
flag,value = coroutine.resume (co1, "helloworld")
print ("1:", value)
flag,value,msg, msg2 = coroutine.resume (co1, "helloworld")
print ("2:", value .. ", msg:" .. msg .. ",msg2:" .. msg2)
flag,value = coroutine.resume (co1, "helloworld")
print ("3:", value)
flag,value = coroutine.resume (co1, "helloworld")
print ("4:", value)
flag,value = coroutine.resume (co1, "helloworld")
print ("5:", value)

print "---------------------------"

local co = coroutine.create(function(name)
	for i = 1, 2, 1 do
		print (name);
		print ("co:" .. coroutine.yield ("yield param"));
	end
end);

for i = 1, 2, 1 do
	print("=========第" .. i .. "次执行：")
	local result, msg = coroutine.resume(co, "resume param");
	print("msg:" .. msg);
end