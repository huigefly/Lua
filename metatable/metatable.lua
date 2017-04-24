#!/usr/bin/env lua

print "metatable"

--[[
print "---------------------------------"
-- lua 默认不会为table 创建元表
local t = {"nihao", "hello"}
print (getmetatable (t)) 			-- nil

print "---------------------------------"
a = {}
b = {}
print (getmetatable (a))

setmetatable (a, b)

assert (getmetatable (a) == b)

-- string 类型，默认有元表，其它类型没有 --
print (getmetatable ("Hello World"))
print (getmetatable (10))
]]--

Set = {}
local mt = {} -- 集合的元表

-- 根据参数列表中的值创建一个新的集合
function Set.new(list)
	local set = {}
	setmetatable(set, mt)
	for _, v in pairs(list) do set[v] = true end
	return set
end

-- 并集操作
function Set.union(a, b)
    local retSet = Set.new{} -- 此处相当于Set.new({})
    for v in pairs(a) do retSet[v] = true end
    for v in pairs(b) do retSet[v] = true end
    return retSet
end

-- 交集操作
function Set.intersection(a, b)
    local retSet = Set.new{}
    for v in pairs(a) do retSet[v] = b[v] end
    return retSet
end

-- 打印集合的操作
function Set.toString(set)
     local tb = {}
     for e in pairs(set) do
          tb[#tb + 1] = e
     end
     return "{" .. table.concat(tb, ", ") .. "}"
end

function Set.print(s)
     print(Set.toString(s))
end

local set1 = Set.new ({10, 20, 30})
local set2 = Set.new ({1, 2})

print "-------------------------------------"
print (getmetatable (set1))
print (getmetatable (set2))
assert (getmetatable (set1) == getmetatable(set2))
print "-----------------set1 --------------------"

for i,v in pairs (set1) do
	print ("1:", v, i)
end 

print "-----------------set2 --------------------"
for g in pairs (set2) do
	print ("2:", g)
end 
print "-------------------------------------"

mt.__add = Set.union

local set3 = set1 + set2
Set.print (set3)

print "-----------------set3 --------------------"
for g in pairs (set3) do
	print ("3:", g)
end 
print "-------------------------------------"

print "-------------------------"

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