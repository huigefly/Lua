#!/usr/bin/env lua

print "iterator and for"

print "-----------------------------------"

function values(tb)
     local i = 0
     return function ()
          i = i + 1
          return tb[i]
     end
end

local testTb = {10, 20, 30}
for value in values(testTb) do
     print(value)
end

print "-----------------------------------"

local aTb = {"One", "Two", "Three"}
local bTb = {"111", "222", "333"}
for i, v in ipairs(aTb) do
     print (i, v)
     for j, k in ipairs (bTb) do
     	if (i == j)
     	then
     		print (j, k)
     	end
     end 
end

print "-----------------------------------"

local tabFiles = {   
	[3] = "test2",   
	[6] = "test3",   
	[4] = "test1", 
	[10] = "test10"
}

for k, v in pairs(tabFiles) do  
    print(k, v)   
end  

print "-----------------------------------"
for k, v in ipairs (tabFiles) do  
    print (k, v)   					-- ipairs 遇nil 直接返回，结果并无任何输出
end 

print "-----------------------------------"

local tt =   
{   
    [1] = "test3",
    [4] = "test4",
    [5] = "test5" 
}   

print "--------------- pairs tt --------------------"
for i,v in pairs(tt) do     -- 输出 "test4" "test3" "test5"  
    print( tt[i] )   
end


print "--------------- ipairs tt --------------------"  
for i,v in ipairs(tt) do    -- 输出 "test3" k=2时断开   
    print( tt[i] )   
end   


-- [[示例2.]] --   
tbl = {"alpha", "beta", [3] = "uno", ["two"] = "dos"}   

print "------------- ipaits tbl ----------------------"
for i,v in ipairs(tbl) do    --输出前三个   
    print( tbl[i] )   
end   

print "-------------- pait tbl ---------------------"
for i,v in pairs(tbl) do    --全部输出   
    print( tbl[i] )   
end 