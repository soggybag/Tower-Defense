-----------------------------------------------------------------------------------------
-- 
-- bullet_manager.lua 
-- 
-----------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local sprite_manager = require( "lib.sprite-manager" )
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- 
-- Private properties 
-- 
-----------------------------------------------------------------------------------------

local bullet_array = {}
local bullet_view
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- 
-- Private methods 
-- 
-----------------------------------------------------------------------------------------




-----------------------------------------------------------------------------------------
--
-- Public methods 
--
-----------------------------------------------------------------------------------------

-- set_view 
-- Sets the display group bullets will be added to. 
-----------------------------------------------------------------------------------------
local function set_view( view )
	bullet_view = view
end 
M.set_view = set_view



-- make
-- makes a new bullet at x, y, with damage, and type
-----------------------------------------------------------------------------------------
local function make( start_x, start_y, damage, bullet_type )
	local bullet = sprite_manager.get_sprite_by_name( bullet_type )
	
	bullet:play()
	bullet.x = start_x
	bullet.y = start_y - 15
	bullet.damage = damage
	bullet_view:insert( bullet )
	bullet.speed = 5
	bullet_array[ #bullet_array + 1 ] = bullet
end 
M.make = make


-- update
-- Updates all bullets on the screen
-----------------------------------------------------------------------------------------
local function update()
	for i = #bullet_array, 1, -1 do 
		local bullet = bullet_array[i]
		bullet.y = bullet.y - bullet.speed
		if bullet.y < 0 then 
			table.remove( bullet_array, i )
			display.remove( bullet )
		end 
	end 
end 
M.update = update


-- get_array
-- Returns bullet array. 
-----------------------------------------------------------------------------------------
local function get_array()
	return bullet_array
end
M.get_array = get_array


-- destroy
-- Destroy this module
-----------------------------------------------------------------------------------------
local function destroy()
	for i = 1, #bullet_array do 
		display.remove( table.remove( bullet_array ) )
	end 
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M