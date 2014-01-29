
------------------------------------------------------------------------------
local M = {}
------------------------------------------------------------------------------

local sprite_data = {
	explosion_small		={start=1, count=13}, 
	alien_brain			={frames={14,15,16,17,18,19,20,21,22,23,23}, time=1000},
	alien_gray			={frames={24,25,26,27,28,29,30,31}, time=1000},
	alien_green_1		={frames={32,33,34,35,36,37,38,56}, time=1000},
	alien_orange_1		={frames={57,68}, time=1000},
	alien_pink_1		={frames={69, 88}, time=1000},
	alien_red_1			={frames={89,105}, time=1000},
	alien_yellow		={frames={106,126}, time=1000},
	alien_purple		={frames={127,149}, time=1000},
	alien_small_blue_1	={frames={150,154}, time=1000},
	alien_small_red_1	={frames={155,158}, time=1000},
	alien_small_green_2	={frames={159,163}, time=1000},
	alien_small_black	={frames={164}, time=1000},
	alien_small_pink_2	={frames={165}, time=1000},
	
	buildings			={frames={166,178}, time=1000},
	
	alien_blue_1		={frames={179,193}, time=1000},
	alien_red_1			={frames={194,208}, time=1000},
	alien_green_2		={frames={209,228}, time=1000},
	alien_black			={frames={229,243}, time=1000},
	alien_pink_2		={frames={244,254}, time=1000},
	
	explosion_big		={start=255,count=13},
	
	people				={frames={268,269,270,271,272,273,274,275,276}, time=1000},
	
	satellite_1			={frames={277,281}, time=1000},
	satellite_2			={frames={282,286}, time=1000},
	satellite_3			={frames={287,291}, time=1000},
	satellite_4			={frames={292,296}, time=1000},
	satellite_5			={frames={297,301}, time=1000},
	satellite_6			={frames={302,306}, time=1000},
	satellite_7			={frames={307,311}, time=1000},
	satellite_8			={frames={312,318}, time=1000},
	satellite_9			={frames={319,326}, time=1000},
	satellite_10		={frames={327}, time=1000},
	satellite_11		={frames={328}, time=1000},
	satellite_12		={frames={329}, time=1000},
	satellite_13		={frames={330}, time=1000},
	satellite_14		={frames={331}, time=1000},
	satellite_15		={frames={332}, time=1000},
	satellite_16		={frames={333}, time=1000},
	satellite_17		={frames={334}, time=1000},
	satellite_18		={frames={335}, time=1000},
	satellite_19		={frames={336}, time=1000},
	satellite_20		={frames={337}, time=1000},
	satellite_21		={frames={338}, time=1000},
	satellite_22		={frames={339}, time=1000},
	satellite_23		={frames={340}, time=1000},
	
	worlds				={frames={341,342,343,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365}, time=1000},
	
	missile_1			={frames={366}, time=1000},
	missile_2			={frames={367}, time=1000},
	missile_3			={frames={368}, time=1000},
	missile_4			={frames={369}, time=1000},
	missile_5			={frames={370}, time=1000},
	missile_6			={frames={371}, time=1000},
	missile_7			={frames={372,376}, time=1000},
	missile_8			={frames={377,380}, time=1000},
	missile_9			={frames={381}, time=1000},
	missile_6			={frames={382,383,384}, time=1000},
	
	button_40			={frames={385}, time=1000},
	button_72			={frames={386}, time=1000},
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







