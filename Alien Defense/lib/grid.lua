
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local defense = require( "lib.defense" )
-----------------------------------------------------------------------------------------
local TILE_ROWS = 9
local TILE_COLS = 5
local TILE_SIZE = 48
local TILE_HALF_SIZE = TILE_SIZE / 2
local TILE_MARGIN = 1
local TILE_OFFSET_X = -15
local TILE_OFFSET_Y = -15
local TILE_COLOR = {r=1, g=1, b=1, a=0.1}
local TILE_STROKE_COLOR = {r=0, g=0, b=0, a=0}

local grid_group
local grid_array = {}
local place_sound
local not_placed_sound

local function touch_tile( event )  
	local phase = event.phase
	local tile = event.target
	if phase == "began" and tile.has_defense == false then
		local new_defense = defense.make( tile )
		if new_defense then 
			local tile_x = tile.x
			local tile_y = tile.y
			tile.has_defense = true
			tile.defense = new_defense
			new_defense.col = tile.col
			new_defense.row = tile.row
			new_defense.x = tile_x
			new_defense.y = tile_y
			grid_group:insert( new_defense )
			audio.play( place_sound ) 
		else 
			audio.play( not_placed_sound ) 
		end 				  
	end
	return true
end

local function Tile()
	local tile = display.newRect( 0, 0, TILE_SIZE, TILE_SIZE )
	-- TILE_COLOR.r, g, b, a
	tile:setFillColor( TILE_COLOR.r, TILE_COLOR.g, TILE_COLOR.b, TILE_COLOR.a )
	tile.strokeWidth = TILE_STROKE_WIDTH
	tile:setStrokeColor( TILE_STROKE_COLOR.r, TILE_STROKE_COLOR.g, TILE_STROKE_COLOR.b, TILE_STROKE_COLOR.a )
	tile.blendMode = "add"
	return tile 
end 

-----------------------------------------------------------------------------------------
local function alien_in_tile( alien )
	
	-- print( "Alien in Tile", alien.x, alien.y )
	
	local x = alien.x + TILE_OFFSET_X
	local y = alien.y + TILE_OFFSET_Y
	local col = math.floor( x / ( TILE_SIZE + TILE_MARGIN ) )
	local row = math.floor( y / ( TILE_SIZE + TILE_MARGIN ) )
	
	local index = ( row * TILE_COLS ) + col + 1
	
	-- print( "col, row, index", col, row, index )
	if row > 0 and row <= #grid_array then 
		return grid_array[ index ]
	else 
		return nil
	end
end 
M.alien_in_tile = alien_in_tile

local function point_in_tile( point )
	local x = point.x
	local y = point.y
	for i = 1, #grid_array do 
		local tile = grid_array[i]
		local xMin = tile.x - TILE_HALF_SIZE
		local xMax = tile.x + TILE_HALF_SIZE
		local yMin = tile.y - TILE_HALF_SIZE
		local yMax = tile.y + TILE_HALF_SIZE
		
		if x == nil or y == nil or xMin == nil or xMax == nil or yMin == nil or yMax == nil then 
			print( x, y, xMin, xMax, yMin, yMax )
			print( "Point ??? ", point )
			local alien_array = require( "alien" ).get_array()
			for i = 1, #alien_array do 
				print( alien_array[i] )
			end 
		end
		
		if x > xMin and x < xMax and y > yMin and y < yMax then 
			-- tile:set_color(1,0,0,1)
			return tile
		else 
			-- tile:set_color( TILE_COLOR.r, TILE_COLOR.g, TILE_COLOR.b, TILE_COLOR.a	)
		end 
	end 
	return nil
end 
M.point_in_tile = point_in_tile

local function make()
	for row = 1, TILE_ROWS, 1 do 
		 for col = 1, TILE_COLS, 1 do 
		 	local tile = Tile()
		 	tile.x = ( ( TILE_SIZE + TILE_MARGIN ) * col ) + TILE_OFFSET_X
		 	tile.y = ( ( TILE_SIZE + TILE_MARGIN ) * row ) + TILE_OFFSET_Y
		 	
		 	function tile:set_color( r, g, b, a )
		 		self:setFillColor( r,g,b,a )
		 	end 
		 	
		 	tile.col = col
		 	tile.row = row
		 	tile.has_defense = false  
		 	tile:addEventListener( "touch", touch_tile )
		 	grid_group:insert( tile )
		 	grid_array[ #grid_array + 1 ] = tile
		 end 
	end 
end
M.make = make

local function get_view()
	return grid_group
end
M.get_view = get_view

local function build()
	grid_group = display.newGroup()
	make()
	place_sound = audio.loadSound( "sound/place-defense.wav" )
	not_placed_sound = audio.loadSound( "sound/not-placed-defense.wav" )
	return grid_group
end
M.build = build

local function get_rows_cols()
	return TILE_ROWS, TILE_COLS
end
M.get_rows_cols = get_rows_cols

local function get_tile_size()
	return TILE_SIZE + TILE_MARGIN
end
M.get_tile_size = get_tile_size

local function destroy()
	for i = #grid_array, 1, -1 do 
		grid_array[i]:removeEventListener( "touch", touch_tile )
		display.remove( table.remove( grid_array ) )
	end 
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M