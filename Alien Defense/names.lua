
local M = {}


--[[
    Cheap Grammar
    A attempt to make a grammar with out the hard parsing programming.
--]]

math.randomseed(os.time());

local function Pick( t )
	return t[math.random(#t)]
end 

local function C()
    return Pick({"b","c","d","f","g","h","j","k","l","m","n","p","r","s","t","v","w","x","y","z"})
end

local function V()
    return Pick({"a","i","e","o","u"});
end

local function Ending()
    return Pick({"ith", "ton", "on", "field", "man"})
end

-- math.randomseed(os.time());
-- print(C() .. V() .. C() .. Ending());

local function random_name()
	local name = C() .. V() .. C() .. Ending()
	return string.upper( name )
end 
M.random_name = random_name

return M