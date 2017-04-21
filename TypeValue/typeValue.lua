#!/usr/bin/env lua

local iValue = 10
local fValue = 10.2
local strValue = "Hello World"
local funcValue = print
local bValue = true
local nilValue = nil
local tbValue = {}
local page = [[
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		   <title>xxxx</title>
		</head>
		<body>
		</body>
	</html>
]]

print (page)

if type(iValue) == "number" then
     print("It is a number")
end

if type(fValue) == "number" then
     print("It is a number")
end

if type(strValue) == "string" then
     print("It is a string")
end

if type(funcValue) == "function" then
     print("It is a function")
end

if type(bValue) == "boolean" then
     print("It is a boolean")
end

if type(nilValue) == "nil" then
     print("It is a nil")
end

if type(tbValue) == "table" then
     print("It is a table")
end


local a = {} -- 创建一个table，并将它的引用存储在a
a["x"] = 10
local b = a -- b与a引用同一个table
print(b["x"])

b["x"] = 20
print(a.x)

b = nil -- 现在只有a还在引用table
-- 错误：print(b["x"])
print(a["x"])
a = nil -- 现在不存在对table的引用

local a = {}
x= "y"
a[x] = 10
print(a[x])  -->10  相当于a["y"]
print(a.x)   -->nil 相当于a["x"]
print(a.y)   -->10  相当于a["y"]

local a = {}
a[1000] = 1
print(#a)

local ax = {}
ax[1000] = 1
print (table.maxn (ax)) -- 1000
 
