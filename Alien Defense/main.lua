-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )

local storyboard = require "storyboard"

-- load scenetemplate.lua
storyboard.gotoScene( "home", {effect="slideRight", time=400} )

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
local function init_worlds_data()
	local worlds = require( "worlds" )
	local worlds_array = {}
	for i = 1, 10 do 
		worlds_array[ #worlds_array + 1 ] = worlds.add()
	end 
	return worlds_array
end

init_worlds_data()

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
-----------------------------------------------------



-- local alien_type_array = require( "dmc_autostore" ).data.aliens
-- print( alien_type_array )
-- print( alien_type_array:len() )

-- print( init_aliens_data() )
-- print( #init_aliens_data() )















