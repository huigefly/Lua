#!/usr/bin/env lua

print "-----------------------------"

Windows = {} -- 创建一个命名空间

-- 创建默认值表
Windows.default = {x = 0, y = 0, width = 100, height = 100, color = {r = 255, g = 255, b = 255}}

Windows.mt = {} -- 创建元表

-- 声明构造函数
function Windows.new(list)
     setmetatable(list, Windows.mt)
     return list
end

-- 定义__index元方法
Windows.mt.__index = function (table, key)
     return Windows.default[key]
end

local win = Windows.new({x = 10, y = 10})

print(win.x)              	 -- >10 访问自身已经拥有的值
print(win.width)         	 -- >100 访问default表中的值
print(win.color.r)           -- >255 访问default表中的值

print "--------------------- other example ------------------------"
local t = {
	name = "hehe",
}

local mt = {
	__index = function(table, key)
		print("虽然你调用了我不存在的字段，不过没关系，我能探测出来：" .. key);
	end
}
setmetatable (t, mt);

print (t.money);
print (t.name);
