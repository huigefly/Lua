#!/usr/bin/env lua

print "funciton"

function foo0() end                         -- 无返回值
function foo1() return "a" end          -- 返回一个结果
function foo2() return "a", "b" end     -- 返回两个结果

-- 在多重赋值时，如果一个函数调用是最后，或仅有的一个表达式，
-- 那么Lua会保留其尽可能多的返回值，用于匹配赋值变量
x, y = foo2()               -- x = "a", y = "b"
x = foo2()                    -- x = "a", "b"被丢弃
x, y, z = 10, foo2()     -- x = 10, y = "a", z = "b"

-- 如果一个函数没有返回值或者没有足够多的返回值，那么Lua会用
-- nil来补充缺失的值
x, y = foo0()               -- x = nil, y = nil
x, y = foo1()               -- x = "a", y = nil
x, y, z = foo2()          -- x = "a", y = "b", z = nil

-- 如果一个函数调用不是一系列表达式的最后一个元素，那么将只产生一个值：
x, y = foo2(), 20          -- x = "a", y = 20
x, y = foo0(), 20, 30     -- x = nil, y = 20, 30则被丢弃

-- table构造式可以完整的接收一个函数调用的所有结果，即不会有任何数量
-- 方面的调整
local t = {foo0()}          -- t = {}(一个空的table)
local t = {foo1()}          -- t = {"a"}
local t = {foo2()}          -- t = {"a", "b"}

-- 但是，对于上述的行为，只有当一个函数调用作为最后一个元素时才会发生，
-- 而在其他位置上的函数调用总是只产生一个结果值
local t = {foo0(), foo2(), 4}          -- t[1] = nil, t[2] = "a", t[3] = 4

-- 我们也可以在一个函数中，使用return返回另一个函数的返回值
function MyFunc()          -- 返回a
     return foo1()          -- 注：这里是return foo1()，而不是return (foo1())
end

-- return foo1()和return (foo1())是两个完全不同的意思
-- 将一个函数调用放入一对圆括号中，从而迫使它只返回一个结果
print((foo0()))          -- nil
print((foo1()))          -- a
print((foo2()))          -- a

print ("-------------------------------------")
-- 打印所有的参数
function VarArguments(...)
     for i, v in ipairs{...} do
          print(v)
     end
end

VarArguments(1, 2, 3)

print ("-----------------inline func --------------------")
function newCounter()
     local i = 0
     return function () -- 匿名函数
          i = i + 1
          return i
     end
end

c1 = newCounter()
print(c1())     -->输出什么？
print(c1())     -->又输出什么？

function newCounter2(i)
     return function () -- 匿名函数
          i = i + 1
          return i
     end
end

c2 = newCounter2(10)
print(c2())     -->输出什么？
print(c2())     -->又输出什么？

print ("----------------- no globa func --------------------")

-- 函数存储在table 中
Lib = {}
Lib.foo = function (x, y) return x + y end
Lib.goo = function (x, y) return x - y end

local f, g

function f()
     -- do something
     g()
end

function g()
     -- do something
     f()
end