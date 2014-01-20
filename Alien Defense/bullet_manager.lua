

-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local sprite_sheet = graphics.newImageSheet( "missiles.png", require( "missiles" ).getSheetOptions() )

local bullet_type_array = { 
							{start=1, count=1},
							{start=2, count=1},
							{start=3, count=1},
							{start=17, count=3},
							{start=7, count=5}
						}

local bullet_array = {}
local bullet_view

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
local function set_view( view )
	bullet_view = view
end 
M.set_view = set_view

local function make( start_x, start_y, damage, bullet_type )
	print( start_x, start_y, damage, bullet_type )
	local bullet = display.newSprite( sprite_sheet, bullet_type_array[bullet_type] )
	bullet:play()
	bullet.x = start_x
	bullet.y = start_y - 15
	bullet.damage = damage
	bullet_view:insert( bullet )
	bullet.speed = 5
	bullet_array[ #bullet_array + 1 ] = bullet
end 
M.make = make

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

local function get_array()
	return bullet_array
end
M.get_array = get_array

local function destroy()
	for i = 1, #bullet_array do 
		display.remove( table.remove( bullet_array ) )
	end 
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M