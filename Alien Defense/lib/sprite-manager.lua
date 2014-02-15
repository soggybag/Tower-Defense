
------------------------------------------------------------------------------
local M = {}
------------------------------------------------------------------------------
local widget = require( "widget" )
------------------------------------------------------------------------------
local sprite_data = {
	-- Start 1, end 25
	alien_1			={
		frames={6,7,7,7,7,8,8,6,9,9,9,9,9,10,6,6,11,12,13,14,15,14,13,12,11,10,6,5,4,3,3,3,3,2,2,2,1,16,1,2,3,3,3,4,5,6,17,18,19,20,20,20,21,22,23,24,23,22,21,25,25,25,25,21,20,19,18,17}, 
		time=3500
	},
	alien_2			={
		frames={26,27,28,29,30,31,31,31,31,31,30,29,32,33,34,34,34,34,33,32,35,36,37,36,35,28,27,26,38,39,40,41,42,43,44,45,46,47,48,49,50,49,48,47,46,45,44,43,42,41,40,39,38,27,35,36,37,36,35,27}, 
		time=3200
	},
	alien_3			={
		frames={51,52,53,53,53,53,52,51,51,51,54,55,55,55,55,54,51,51,51,71,72,73,72,71,51,71,72,73,72,71,51,56,57,57,57,57,58,59,59,59,59,59,58,57,60,61,61,61,61,61,60,57,57,57,57,62,63,63,63,62,57,65,64,65,65,65,64,57,57,57,57,57,66,67,68,69,67,66,57,69,70,70,70,70,69,57,66,67,68,67,66,57,57,57,56,51}, 
		time=6400
	},
	alien_4			={
		frames={76,77,78,79,80,79,78,77,76,81,81,76,82,82,82,82,76,81,81,81,76,83,83,83,76,83,83,84,85,87,86,84,77,78,79,80,80,80,80,80,80,79,78,77,78,79,80,79,78,77}, 
		time=4000
	},
	alien_5			={
		frames={101,102,103,104,105,105,105,104,103,106,106,106,106,103,107,107,107,107,107,103,102,108,108,108,108,102,109,109,109,109,110,111,112,111,110,113,114,113,102,121,122,123,122,121,102,103,116,117,118,119,120,119,118,117,116}, 
		time=3500
	},
	alien_6			={
		frames={127,127,128,128,128,128,128,129,129,129,130,130,130,130,128,127,127,132,133,134,133,132,131,136,137,138,139,138,137,136}, 
		time=3000
	},
	alien_7			={
		frames={151,153,154,155,156,156,156,156,156,155,154,153,151,157,158,159,160,160,160,159,158,161,162,163,163,163,163,162,161,151,164,165,166,167,168,169,170,169,168,167,166,165,164,151,172,173,174,173,172,171,172,173,174,173,172,171,172,173,174,173,172,171,172,173,174,173,172,171}, 
		time=5000
	},
	alien_8			={
		frames={176,177,177,177,179,182,182,182,176,177,178,178,178,178,177,176,179,180,180,180,181,182,182,182,181,180,183,184,185,184,183,184,185,184,183,184,185,184,183,180,179,176,186,187,188,187,186,176,189,189,189,189,176,190,190,190,195,195,195,195,190,176,189,194,194,194,189,176}, 
		time=4000
	},
	alien_9			={
		frames={201,202,203,204,205,204,203,202,201,206,207,207,207,206,201,201,201,201,208,209,209,209,209,208,201,202,203,204,205,204,203,202,201,210,211,211,211,212,212,212,211,213,213,213,210,201}, 
		time=3000
	},
	alien_10		={
		frames={226,227,227,227,226,228,228,228,228,226,229,230,230,230,229,226,231,232,232,232,232,231,226,233,234,233,226,235,236,237,236,235,226,247,248,249,250,250,250,250,249,248,247,238,239,240,239,238}, 
		time=4000
	},
	alien_11		={
		frames={270,271,270,272,273,273,273,273,272,270,270,270,271,270,270,270,274,275,275,275,275,275,274,270,269,268,267,266,251,265,252,253,252,253,252,251,254,255,256,256,256,258,258,258,259,259,259,258,258,258,256,255,254,260,261,262,262,262,262,263,263,263,264,264,264,262,261,260,251,265,252,253,252,251,266,267,268,269,270}, 
		time=7500
	},
	alien_12		={
		frames={276,277,277,277,279,280,280,280,281,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,299,298,297,296,295,294,293,292,291,290,289,288,287,286,285,284,283,282}, 
		time=1500
	},
	alien_13		={
		frames={315,314,313,312,311,301,311,312,313,314,315,314,313,312,311,301,304,305,304,301,306,306,306,306,306,301,307,307,307,307,307,301,308,308,308,308,309,309,309,308,310,301,310,310,310,316,301,322,323,324,325}, 
		time=5000
	},
	alien_14		={
		frames={326,327,328,329,329,332,329,329,328,327,326,342,343,344,343,342,341,330,331,332,333,333,333,333,331,330,339,340,339,338,341,337,342,343,344,343,345,346,347,348,349,350,349,348,347,346}, 
		time=4000
	},
	alien_15		={
		frames={351,352,353,353,353,353,352,351,354,355,355,355,355,354,351,356,357,357,357,357,356,351,358,359,359,359,359,358,351,356,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,374,373,372,371,370,369,368,367,366,365,364,363,362,361,356}, 
		time=3000
	},
	alien_16		={
		frames={376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,376,391,392,393,394,395,396,397,398,399,400,399,398,397,396,395,394,393,392,391,376}, 
		time=5000
	},
	
	people			={frames={401,402,403,404,405,406,407,408,409,410}, time=1000},
	
	satellite_1		={frames={411,412,413,414,415}, time=1000},
	satellite_2		={frames={416,417,418,419,420}, time=1000},
	satellite_3		={frames={421,422,423,424,425}, time=1000},
	satellite_4		={frames={426,427,428,429,430}, time=1000},
	satellite_5		={frames={431,432,433,434,435}, time=1000},
	satellite_6		={frames={436,437,438,439,440}, time=1000},
	satellite_7		={frames={441,442,443,444,445}, time=1000},
	satellite_8		={frames={446,447,448,449,450}, time=1000},
	satellite_9		={frames={451,452,453,454,455}, time=1000},
	
	worlds			={frames={456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480}, time=1000},
	
	missile_1		={frames={481}},
	missile_2		={frames={482}},
	missile_3		={frames={483}},
	missile_4		={frames={484}},
	missile_5		={frames={485}},
	missile_6		={frames={486}},
	missile_7		={frames={487,488,489,490,491}},
	missile_8		={frames={492,493,494,495}},
	missile_9		={frames={496}},
	missile_6		={frames={497,498,499}},
	
	buildings		={frames={500,501,502,503,504,505,506,507,508,509,510,511,512}},
	
	explosion_big	={start=513,count=13},
	explosion_small	={start=526, count=13},
	
	button_40		={frames={540,539}},
	button_slices	={frames={541,542,543,544,545,546,547,548,549}},
	button_72		={frames={551,550}}, 
}

local sprite_sheet = graphics.newImageSheet( "images/TD-Sprites.png", require("lib.TD-Sprites").getSheetOptions() )
------------------------------------------------------------------------------
M.sprite_data = sprite_data
M.sprite_sheet = sprite_sheet
----------------------------------------------------------------------------------
local function get_frames_by_name( name )
	return  sprite_data[name].frames
end 
M.get_frames_by_name = get_frames_by_name
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
local function get_random_building()
	return get_random_frame_from_set( "buildings" ) 
end 
M.get_random_building = get_random_building
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
---------------------------------------
local function get_button( label, width, height, onRelease )
	local frames = sprite_data.button_slices.frames
	return widget.newButton( {
		sheet=sprite_sheet,
		width=width,
		height=height,
		topLeftFrame=frames[1],
		topMiddleFrame=frames[2],
		topRightFrame=frames[3],
		middleLeftFrame=frames[4],
		middleFrame=frames[5],
		middleRightFrame=frames[6],
		bottomLeftFrame=frames[7],
		bottomMiddleFrame=frames[8],
		bottomRightFrame=frames[9],
		
		topLeftOverFrame=frames[1],
		topMiddleOverFrame=frames[2],
		topRightOverFrame=frames[3],
		middleLeftOverFrame=frames[4],
		middleOverFrame=frames[5],
		middleRightOverFrame=frames[6],
		bottomLeftOverFrame=frames[7],
		bottomMiddleOverFrame=frames[8],
		bottomRightOverFrame=frames[9],
		label=label,
		font="04B03",
		fontSize=24,
		onRelease=onRelease
	} )
end 
M.get_button = get_button
------------------------------------------------------------------------------
return M 







