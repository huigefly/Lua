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


local a = {} -- ����һ��table�������������ô洢��a
a["x"] = 10
local b = a -- b��a����ͬһ��table
print(b["x"])

b["x"] = 20
print(a.x)

b = nil -- ����ֻ��a��������table
-- ����print(b["x"])
print(a["x"])
a = nil -- ���ڲ����ڶ�table������

local a = {}
x= "y"
a[x] = 10
print(a[x])  -->10  �൱��a["y"]
print(a.x)   -->nil �൱��a["x"]
print(a.y)   -->10  �൱��a["y"]

local a = {}
a[1000] = 1
print(#a)

local ax = {}
ax[1000] = 1
print (table.maxn (ax)) -- 1000
 
