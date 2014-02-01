-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )

local storyboard = require( "storyboard" )

-- load scenetemplate.lua
storyboard.gotoScene( "scenes.home", {effect="slideRight", time=400} )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):


-----------------------------------------------------------------------------------------
local memory_text = display.newText( "Hello", 5, 5, 60, 0, "04B03", 16 )
memory_text:setFillColor( 1, 1, 1 )
memory_text.anchorX = 0
memory_text.x = display.contentWidth - 50
memory_text.y = display.contentHeight - 130
memory_text:setFillColor( 0.6, 0.3, 0 )

local monitorMem = function()
    collectgarbage()
	local textMem = math.round( system.getInfo( "textureMemoryUsed" ) / 1000000 )
	memory_text.text = "Mem:\n"..math.round( collectgarbage( "count" ) ) .. "\nTex:\n".. textMem
end
Runtime:addEventListener( "enterFrame", monitorMem )
-----------------------------------------------------------------------------------------
local function init_aliens_data()
	return { 
		{name="blue", 	speed=0.2, hits=5, damage=0.1, options={ frames={1,2,3,2,1,4,5,6,7,6,5,4,11,12,13,14,13,12,11,4,8,9,10,9,8 }, time=2000 } },
		{name="red",  	speed=1.0, hits=3, damage=0.1, options={ frames={16,17,18,19,18,17,16,21,16,25 }, time=1000 } },
		{name="green", 	speed=0.7, hits=4, damage=0.1, options={ frames={31,32,33,34,35,36,37,38,39,40,41,42,43,44,45 }, time=1000 } },
		{name="black", 	speed=0.3, hits=7, damage=0.1, options={ frames={51,52,53,54,55,54,53,52,51,56,57,56,51,58,59,58,51 }, time=2000 } },
		{name="pink", 	speed=2.0, hits=2, damage=0.1, options={ frames={66,67,68,69,70,69,68,67,66,71,66,72,66,73,66,74,75,76,75,74 }, time=2400} }
	}
end 

local function init_defenses_data()
	return {
		{name="04B",	rof=1000,	damage=1,	hits=10, cost=40, bullet_sprite=1, sprite={ start=1, count=1 }, frame=1 },
		{name="X97",	rof=500,	damage=0.5,	hits=10, cost=50, bullet_sprite=2, sprite={ start=2, count=1 }, frame=2 },
		{name="R37",	rof=2000,	damage=3,	hits=10, cost=60, bullet_sprite=3, sprite={ start=3, count=1 }, frame=3 },
		{name="8UL",	rof=1500,	damage=0.5,	hits=10, cost=70, bullet_sprite=4, sprite={ start=4, count=1 }, frame=4 }, 	-- Each line ends with a comma
		{name="G70",	rof=250,	damage=0.3, hits=10, cost=20, bullet_sprite=5, sprite={ start=5, count=1 }, frame=5 }  	-- No comma on the last line
	}
end 
-----------------------------------------------------------------------------------------
require( "lib.worlds" )

--[[
local AutoStore = require( "dmc_autostore" )

local function initializeAutoStore()
    if not AutoStore.is_new_file then return end
    --== new data file, initialize the data structure ==--
    local data = AutoStore.data
    -- add empty container to the tree in which to store our UFO objects
    data[ 'worlds' ] = init_worlds_data()
    data[ 'aliens' ] = init_aliens_data()
    data[ 'defenses' ] = init_defenses_data()
 	
    -- add some data to our new tree
    -- data.ufos[ '1' ] = { x=160, y=240, temperature='cold' }
    -- add some data to our new tree
    -- data.ufos[ '1' ] = { x=160, y=240, temperature='cold' }
 	
    -- save some app specific info
    -- perhaps our data version, eg, in case the structure needs to change in the future
    -- or a secret key, etc
    data[ 'app_info' ] = { data_version='1.0'}
    -- Yes, all of those changes will be automatically saved
    -- and there's no ".save()" in sight !
end
initializeAutoStore()
--]]
-----------------------------------------------------



-- local alien_type_array = require( "dmc_autostore" ).data.aliens
-- print( alien_type_array )
-- print( alien_type_array:len() )

-- print( init_aliens_data() )
-- print( #init_aliens_data() )


local function fix_frames( start, array )
	local str = ""
	for i = 1, #array do 
		str = str .. array[i] + start .. ","
	end 
	print( str )
end 

-- alien_2
-- fix_frames( 25, {1,2,3,4,5,6,6,6,6,6,5,4,7,8,9,9,9,9,8,7,10,11,12,11,10,3,2,1,13,14,15,16,17,18,19,20,21,22,23,24,25,24,23,22,21,20,19,18,17,16,15,14,13,2,10,11,12,11,10,2} )

-- alien_3
-- fix_frames( 50, {1,2,3,3,3,3,2,1,1,1,4,5,5,5,5,4,1,1,1,21,22,23,22,21,1,21,22,23,22,21,1,6,7,7,7,7,8,9,9,9,9,9,8,7,10,11,11,11,11,11,10,7,7,7,7,12,13,13,13,12,7,15,14,15,15,15,14,7,7,7,7,7,16,17,18,19,17,16,7,19,20,20,20,20,19,7,16,17,18,17,16,7,7,7,6,1} )

-- alien_5
-- fix_frames( 100, {1,2,3,4,5,5,5,4,3,6,6,6,6,3,7,7,7,7,7,3,2,8,8,8,8,2,9,9,9,9,10,11,12,11,10,13,14,13,2,21,22,23,22,21,2,3,16,17,18,19,20,19,18,17,16} )

-- alien_6
-- fix_frames( 125, {2,2,3,3,3,3,3,4,4,4,5,5,5,5,3,2,2,7,8,9,8,7,6,11,12,13,14,13,12,11} )

-- alien_7
-- fix_frames( 150, {1,3,4,5,6,6,6,6,6,5,4,3,1,7,8,9,10,10,10,9,8,11,12,13,13,13,13,12,11,1,14,15,16,17,18,19,20,19,18,17,16,15,14,1,22,23,24,23,22,21,22,23,24,23,22,21,22,23,24,23,22,21,22,23,24,23,22,21} )

-- alien_8
-- fix_frames( 175, {1,2,2,2,4,7,7,7,1,2,3,3,3,3,2,1,4,5,5,5,6,7,7,7,6,5,8,9,10,9,8,9,10,9,8,9,10,9,8,5,4,1,11,12,13,12,11,1,14,14,14,14,1,15,15,15,20,20,20,20,15,1,14,19,19,19,14,1} )

-- alien_9
-- fix_frames( 200, {1,2,3,4,5,4,3,2,1,6,7,7,7,6,1,1,1,1,8,9,9,9,9,8,1,2,3,4,5,4,3,2,1,10,11,11,11,12,12,12,11,13,13,13,10,1} )

-- alien_10
-- fix_frames( 225, {1,2,2,2,1,3,3,3,3,1,4,5,5,5,4,1,6,7,7,7,7,6,1,8,9,8,1,10,11,12,11,10,1,22,23,24,25,24,23,22,13,14,15,14,13} )

-- alien_11
-- fix_frames( 250, {20,21,20,22,23,23,23,23,22,20,20,20,21,20,20,20,24,25,25,25,25,25,24,20,19,18,17,16,1,15,2,3,2,3,2,1,4,5,6,6,6,8,8,8,9,9,9,8,8,8,6,5,4,10,11,12,12,12,12,13,13,13,14,14,14,12,11,10,1,15,2,3,2,1,16,17,18,19,20} )

-- alien_12
-- fix_frames( 275, {1,2,2,2,4,5,5,5,6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7} )

-- alien_13
-- fix_frames( 300, {15,14,13,12,11,1,11,12,13,14,15,14,13,12,11,1,4,5,4,1,6,6,6,6,6,1,7,7,7,7,7,1,8,8,8,8,9,9,9,8,10,1,10,10,10,16,1,22,23,24,25} )

-- alien_14
-- fix_frames( 325, {1,2,3,4,4,7,4,4,3,2,1,17,18,19,18,17,16,5,6,7,8,8,8,8,6,5,14,15,14,13,16,12,17,18,19,18,20,21,22,23,24,25,24,23,22,21} )

-- alien_15
-- fix_frames( 350, {1,2,3,3,3,3,2,1,4,5,5,5,5,4,1,6,7,7,7,7,6,1,8,9,9,9,9,8,1,6,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,6} )

-- alien_16
fix_frames( 375, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1,16,17,18,19,20,21,22,23,24,25,24,23,22,21,20,19,18,17,16,1} )





