#!/usr/bin/env lua

print "expression"

print (4 and 5)               	-- 5
print (nil and 13)          	-- nil
print (false and 13)     		-- false
print (4 or 5)               	-- 4
print (false or 5)          	-- 5

local tbDays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
tbDays["spec"] = "spec_day"

print '-----------------------'
print (tbDays[1])          		-- Sunday
print (tbDays[2])          		-- Monday
print (tbDays[3])          		-- Tuesday
print (tbDays[4])          		-- Wednesday
print (tbDays[5])          		-- Thursday
print (tbDays[6])          		-- Friday
print (tbDays[7])          		-- Saturday
print (tbDays.spec)

print '-----------------------'
local tb1 = {x=10, y=20}
print (tb1.x)          			-- 10
print (tb1["x"])          		-- 10

print '-----------------------'
local tb1 = {["+"] = "add", ["-"] = "sub", ["*"] = "mul", ["/"] = "div"}
print (tb1["+"])

print '-----------------------'


print '-----------------------'