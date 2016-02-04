-----------------------------------------------------------------------------------------
-- 
-- sound_item.lua 
-- 
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
-- 
-- Private properties 
-- 
-----------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------
-- 
-- Public Methods 
-- 
-----------------------------------------------------------------------------------------

local function make( name, file_name, streaming )
	local item = {}
	item.name = name
	item.file_name = file_name
	item.streaming = streaming

	return item
end 
M.make = make 
-----------------------------------------------------------------------------------------
return M