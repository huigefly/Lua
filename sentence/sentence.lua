#!/usr/bin/env lua

print "sentence"

print '-----------------------'
local x1, x2 = 2, 4
print (x1)     -- 2
print (x2)     -- 4

print '-----------------------'
local x1, x2 = 2, 4
x1, x2 = x2, x1
print (x1)     -->4
print (x2)     -->2

print '-----------------------'
i = 10     			-- 全局变量
local i = 10     	-- 局部变量

do
     local a1 = 10
     local a2 = 10
end          		-->a1和a2的作用域到此结束
print (a1)			-->nil

print '-----------------------'
a=1000
b=99
if a < 0 then a = 0 end
if a < b then 
	-- return a 
else 
	-- return b
end

if op == "+" then
     r = a + b
elseif op == "-" then
     r = a - b
elseif op == "*" then
     r = a * b
elseif op == "/" then
     r = a / b
end

print '------------ while -----------'
local a = 10
while a > 0 do
     a = a - 1
     -- Do something else
     -- print (a)
end

print '------------ for -----------'
-- 默认+1, 数值型
for var = 1, 10 do
     print (var)
end

for var = 10, 1, -1 do
     print (var)
end