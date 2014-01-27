
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local worlds = require( "lib.worlds" )
-----------------------------------------------------------------------------------------

local function make( world_index )
	local group = display.newGroup()
	local sky = display.newImageRect( group, "images/Background-2.png", 360, 570 )
	
	local color = worlds.get_color_at_index( world_index )
	sky:setFillColor( color.r, color.g, color.b )
	
	-- worlds.get_name_at_index( world_index )
	local planet_name = display.newText( group,  worlds.get_name_at_index( world_index ), 0, 0, "04B03", 32 )
	planet_name.x = -40
	planet_name.y = 160
	planet_name:setFillColor( 1, 1, 1, 0.2 )
	
	return group
end 
M.make = make

-----------------------------------------------------------------------------------------
return M