
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local grid = require( "lib.grid" )
local people = require( "lib.people" )  
-----------------------------------------------------------------------------------------
local sprite_sheet = graphics.newImageSheet( "images/Alien-All.png", {width=34, height=34, numFrames=80} )
-----------------------------------------------------------------------------------------

-- local alien_type_array = require( "dmc_autostore" ).data.aliens

local alien_type_array = { 
	{name="blue", 	speed=0.2, hits=5, damage=0.1, options={frames={1,2,3,2,1,4,5,6,7,6,5,4,11,12,13,14,13,12,11,4,8,9,10,9,8}, time=2000} },
	{name="red",  	speed=1.0, hits=3, damage=0.1, options={frames={16,17,18,19,18,17,16,21,16,25}, time=1000} },
	{name="green", 	speed=0.7, hits=4, damage=0.1, options={frames={31,32,33,34,35,36,37,38,39,40,41,42,43,44,45}, time=1000} },
	{name="black", 	speed=0.3, hits=7, damage=0.1, options={frames={51,52,53,54,55,54,53,52,51,56,57,56,51,58,59,58,51}, time=2000} },
	{name="pink", 	speed=2.0, hits=2, damage=0.1, options={frames={66,67,68,69,70,69,68,67,66,71,66,72,66,73,66,74,75,76,75,74}, time=2400} }
} 

-----------------------------------------------------------------------------------------
local alien_array = {}
local alien_view
local alien_timer
local rows, cols = grid.get_rows_cols()
local tile_size = grid.get_tile_size()
local end_y = display.contentHeight -- + 17
local destroyed_sound
-----------------------------------------------------------------------------------------
local function make()
	-- local n = math.random( alien_type_array:len() )
	local n = math.random( #alien_type_array )
	print( n )
	-- local n = 1
	local alien = display.newSprite( sprite_sheet, alien_type_array[n].options )
	
	alien:play()
	
	alien_view:insert( alien )
	alien.speed 	= alien_type_array[n].speed
	alien.name 		= alien_type_array[n].name
	alien.hits 		= alien_type_array[n].hits
	alien.damage 	= alien_type_array[n].damage
	alien.grid 		= nil 
	alien.alien_type = n
	
	alien.x = math.random( cols ) * tile_size -9
	alien.y = -16
	
	function alien:remove()
		display.remove( self )
	end
	
	function alien:hit( damage )
		self.hits = self.hits - damage
		if self.hits <= 0 then
			audio.play( destroyed_sound ) 
			self:remove()
			return true
		end 
		return false
	end
	
	-- Not yet implemented... 
	function alien:move()
		self.y = self.y + self.speed
		if self.y > end_y then
			return true -- Yes remove this it's moved off the screen
		end 
		return false -- No don't remove it hasn't moved off the screen
	end
	alien_array[#alien_array+1] = alien
end 

-----------------------------------------------------------------------------------------
local function set_view( view )
	alien_view = view
end 
M.set_view = set_view

-- Alien update each frame -- 
local function update()
	for i = #alien_array, 1, -1 do 
		local alien = alien_array[i]
		
		if alien ~= nil then
			-- check tile 
			-- local tile = grid.point_in_tile( alien )
			local tile = grid.alien_in_tile( alien )
		
			if tile ~= nil and tile.has_defense then -- munch 
				tile.defense:hit( alien.damage )
			
			else -- move alien 
				if alien:move() then -- Move and check if this has moved off screen 
					people.make_alien( alien_type_array[ alien.alien_type ].options ) -- Make alien that will eat some people 
					table.remove( alien_array, i )	-- remove this alien from the table
					alien:remove()	-- remove this alien from the display group
				end
			end 
			
		end
	end 
end 
M.update = update
------------------------------

local function start_timer( delay, count )
	alien_timer = timer.performWithDelay( delay, make, count )
end 
M.start_timer = start_timer

local function stop_timer()
	timer.cancel( alien_timer )
end 
M.stop_timer = stop_timer

local function get_array()
	return alien_array
end
M.get_array = get_array

local function get_types()
	return alien_type_array
end
M.get_types = get_types

local function clear_aliens()
	for i = 1, #alien_array do 
		display.remove( table.remove( alien_array ) )
	end 
end 
M.clear_aliens = clear_aliens

local function build()
	destroyed_sound = audio.loadSound( "sound/alien-destroyed.wav" )
	return true 
end 
M.build = build

local function set_speed_hits_by_name( name, speed, hits )
	for i = 1, #alien_type_array do 
		if alien_type_array[i].name == name then 
			alien_type_array[i].speed = speed
			alien_type_array[i].hits = hits
			break
		end 
	end 
end 
M.set_speed_hits_by_name = set_speed_hits_by_name

local function destroy()
	stop_timer()
	clear_aliens()
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M
