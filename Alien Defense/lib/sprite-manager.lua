
------------------------------------------------------------------------------
local M = {}
------------------------------------------------------------------------------

local sprite_data = {
	alien_1			={frames={ 1, 25}, time=1000},
	alien_2			={frames={26,50}, time=1000},
	alien_3			={frames={51,75}, time=1000},
	alien_4			={frames={76,100}, time=1000},
	alien_5			={frames={101,125}, time=1000},
	alien_6			={frames={126,150}, time=1000},
	alien_7			={frames={151,175}, time=1000},
	alien_8			={frames={176,200}, time=1000},
	alien_9			={frames={201,225}, time=1000},
	alien_10		={frames={226,250}, time=1000},
	alien_11		={frames={252,275}, time=1000},
	alien_12		={frames={276,300}, time=1000},
	alien_13		={frames={301,325}, time=1000},
	alien_14		={frames={326,350}, time=1000},
	alien_15		={frames={351,375}, time=1000},
	alien_16		={frames={376,400}, time=1000},
	
	people			={frames={401, 410}, time=1000},
	
	satellite_1		={frames={411,415}, time=1000},
	satellite_2		={frames={416,420}, time=1000},
	satellite_3		={frames={421,425}, time=1000},
	satellite_4		={frames={426,430}, time=1000},
	satellite_5		={frames={431,435}, time=1000},
	satellite_6		={frames={436,440}, time=1000},
	satellite_7		={frames={441,445}, time=1000},
	satellite_8		={frames={446,450}, time=1000},
	satellite_9		={frames={451,455}, time=1000},
	
	worlds			={frames={456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480}, time=1000},
	
	missile_1		={frames={481}, time=1000},
	missile_2		={frames={482}, time=1000},
	missile_3		={frames={483}, time=1000},
	missile_4		={frames={484}, time=1000},
	missile_5		={frames={485}, time=1000},
	missile_6		={frames={486}, time=1000},
	missile_7		={frames={487,491}, time=1000},
	missile_8		={frames={492,495}, time=1000},
	missile_9		={frames={496}, time=1000},
	missile_6		={frames={497,498,499}, time=1000},
	
	buildings		={frames={500,512}},
	
	explosion_big	={start=513,count=13},
	explosion_small	={start=526, count=13},
	
	button_40		={frames={539}, time=1000},
	button_72		={frames={540}, time=1000}, 
}

local sprite_sheet = graphics.newImageSheet( "images/TD-Sprites.png", require("lib.TD-Sprites").getSheetOptions() )
------------------------------------------------------------------------------
M.sprite_data = sprite_data
M.sprite_sheet = sprite_sheet
----------------------------------------------------------------------------------
local function get_image_by_name( name )
	return display.newImage( sprite_sheet, sprite_data[name].frame )
end 
M.get_image_by_name = get_image_by_name
------------------------------------------------------------------------------------
local function get_random_frame_from_set( name )
	local frames = sprite_data[name].frames
	return display.newImage( sprite_sheet, frames[math.random(#frames)] )
end 
M.get_random_frame_from_set = get_random_frame_from_set
---------------------------------------------------------------------------------------
local function get_random_person()
	return get_random_frame_from_set( "people" )
end 
M.get_random_person = get_random_person
-----------------------------------------------------------------------------------------
local function get_sprite_by_name( name )
	return display.newSprite( sprite_sheet, sprite_data[name] )
end 
M.get_sprite_by_name = get_sprite_by_name
-----------------------------------------------------------------------------------------
local function get_random_world_image()
	return get_random_frame_from_set( "worlds" )
end 
M.get_random_world_image = get_random_world_image
----------------------------------------------------------------------------------------
local function get_world_by_frame( n )
	return display.newImage( sprite_sheet, sprite_data.worlds.frames[n] ) 
end 
M.get_world_by_frame = get_world_by_frame
-----------------------------------
local function get_world_sprite( id )
	local world_array = require( "lib.worlds" ).get_worlds()[id]
	
	local world = display.newGroup()
	local back = get_world_by_frame( world_array.back )
	local front = get_world_by_frame( world_array.front )
	world:insert(back)
	world:insert(front)

	back:setFillColor( world_array.color.r, world_array.color.g, world_array.color.b )
	front:setFillColor( world_array.front_color.r, world_array.front_color.g, world_array.front_color.b )
	
	front.blendMode = world_array.mode

	return world
end 
M.get_world_sprite = get_world_sprite
-----------------------------------

local function get_random_world()
	local world = display.newGroup()
	local back = get_random_world_image()
	local front = get_random_world_image()
	world:insert(back)
	world:insert(front)

	if math.random(2) == 1 then 
		back.xScale = -1
	end

	if math.random(2) == 1 then 
		front.xScale = -1
	end

	back:setFillColor( math.random(), math.random(), math.random() )
	front:setFillColor( math.random(), math.random(), math.random() )
	
	local modes = {"add", "screen", "dst"}

	front.blendMode = modes[math.random( #modes )]

	return world
end 
M.get_random_world = get_random_world
------------------------------------------------------------------------------
return M 







