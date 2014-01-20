-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Todo: 
-- Reset game after leaving scene game 
-- Clean up timers after leaving scene game
-- Clean up other listeners after leaving game scene
-- wave_table seems to be missing after leaving and returning to game scene
-- 
-- Animated effect when removing aliens and defenses. 
-- Art for defenses 
-- Art for background
-- Art for explosions and effects
-- Art for bullet

-----------------------------------------------------------------------------------------
-- Use this to edit the color of the background squares. 
-- Set the color of the board 
local TILE_COLOR 		= { r=0, g=0, b=0, a=0.1 } 	-- Set the board tile colors RGBA 0 to 1
local TILE_STROKE_COLOR = {r=0, g=255, b=0, a=0.1 }	-- Set RGBA values for tiles 0 to 1
local TILE_STROKE_WIDTH = 1							-- Set the stroke width of tiles

-- Set the speed for bullets/missiles
local BULLET_SPEED = 5.5 	-- Larger numbers make slower bullets

-- Play with the energy economy
local ENERGY_RECHARGE_RATE 	= 5 		-- Sets how much energy is added each interval
local ENERGY_TIMER_TIME 	= 1000		-- Sets the interval, in milliseconds 1000 = 1 sec

-----------------------------------------------------------------------------------------
-- Define defense types and features 
-----------------------------------------------------------------------------------------
-- Modify the various defense types. 
-- name 	= label that appears below the button on the right that chooses this defense. 
-- rof 		= Rate Of Fire - determines how often a defense fire, in ms. 
-- damage 	= sets the damage inflicted on an enemy by this defense, compare this to life in enemy_array below
-- cost 	= Cost in energy to place this unit
-- size		= sets the size of bullets, this will change when art gets added
-- color	= color of bullets, this will change when art gets added   
-- ENERGY_TIMER_TIME, these set the rate at which energy is accrued over time. 
local defense_type_array = {
			{name="Basic",	rof=1000,	damage=1,	cost=40, size=3, color={r=1, g=1, b=0} },
			{name="Rapid",		rof=800,	damage=1,	cost=60, size=4, color={r=1, g=1, b=1} },
			{name="Heavy",		rof=2000,	damage=3,	cost=80, size=6, color={r=0, g=1, b=0} },
			{name="Stun",		rof=1200,	damage=0.5,	cost=70, size=3, color={r=0, g=1, b=1} }, 	-- Each line ends with a comma
			{name="vanilla",	rof=400,	damage=0.1, cost=20, size=1, color={r=1, g=0, b=1} }	-- No comma on the last line
		}
-- You can add more defenses to this list if you like. Follow the format above:
-- { name="", rof=000, damage=0, cost=000 }
-- You'll also need a comma at the end of the previous line!
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Alien invaders - define alien invader and their features
-----------------------------------------------------------------------------------------
-- here you can describe various alien invaders. 
-- name 	= A name to identify this type of invader. 
-- speed  	= Set the speed of aliens, in pixels per frame.
-- life 	= Sets the damage this alien will take, compare to damage applied by defense types above
-- sprite_options = Describe which sprite and how that sprite should play.
-- EITHER use start and count OR frame. Compare these to the file Alien-All.png
-- start 	= Sets the starting frame number in the sprite sheet
-- count 	= Sets the number of frames in the sequence
-- Or use frames to set an arbitrary sequence of frames
-- frames 	= an array {} of frames see the blue alien for an example of frames. 
-- time		= Sets the time in milliseconds to play the entire set of frames. 
local alien_type_array = 
{
	{ name="blue", 	speed=66.5, 	life=5, 	sprite_options={frames={8,9,10,10,10,9,8}, 	time=1200} }, -- each has a comma at the end
	{ name="red", 	speed=33.2, 	life=2, 	sprite_options={start=16, count=15, time=2000} },
	{ name="green", speed=123, 		life=10,	sprite_options={start=31, count=20, time=2000} },
	{ name="black", speed=13, 		life=1,		sprite_options={start=51, count=15, time=2000} },
	{ name="pink",  speed=250, 		life=20,	sprite_options={start=66, count=10, time=2000} }  -- No comma on the last one
}

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Aline attack waves -
-----------------------------------------------------------------------------------------
-- An array of tables. Each table defines one wave of aliens.  
-- Each eave is described with time, count, pool, and delay. 
-- time 	= sets the time between each new alien in the wave
-- count 	= sets the number of aliens in the wave
-- pool 	= An array of aliens to use. The numbers index the aliens from the alein_type_array above 
-- NOTE: the first alien (blue) is 1 
-- NOTE: Pool also determines the frequency of each type. A type that appears more 
-- than once will show up more often then others. 
-- delay  	= Sets the amount of time to wait when a wave is finished before starting the next wave. 
local alien_wave_array = { 
							{ 	time=3300, 			-- Time between enemies
								count=10, 			-- Number of enemies in wave
								pool={1,2,3,4,5}, 	-- Number and type of enemies in wave
								delay=3000
							},
							
							{ 	time=1500, 		-- Time between enemies
								count=10, 			-- Number of enemies in wave
								pool={1}, 			-- Number and type of enemies in wave
								delay=2000
							},
							
							{ 	time=1500, 		-- Time between enemies
								count=10, 			-- Number of enemies in wave
								pool={2}, 			-- Number and type of enemies in wave
								delay=2000
							},
							
							{ 	time=1500, 		-- Time between enemies
								count=10, 			-- Number of enemies in wave
								pool={3}, 			-- Number and type of enemies in wave
								delay=2000
							},
							
							 { 	time=1000, 		-- Time between enemies
								count=20, 			-- Number of enemies in wave
								pool={4}, 		-- Number and type of enemies in wave
								delay=2000
							},	-- Comma
							 { 	time=1000, 		-- Time between enemies
								count=20, 			-- Number of enemies in wave
								pool={5}, 		-- Number and type of enemies in wave
								delay=2000
							} -- No comma on the last table
							-- More tables would go here. 
						} -- Don't lose this last brace. 

-- You can add as many waves as you like to this list as long as you follow the format. 

-- You might tinker with some of these variables. Then again you might not...
local TILE_ROWS = 9
local TILE_COLS = 5
local TILE_SIZE = 48
local TILE_MARGIN = 1


local alien_timer
local wave_timer -- add a timer to hold the wave
local energy_timer 
local energy = 50 
local current_defense_type = 1 
local energy_text 
local alien_target_y = ( TILE_SIZE + TILE_MARGIN ) * TILE_ROWS 


-- ************************************************************************************
-- New Stuff 


-----------------------------------------------------------------------------------------
-- The first file name is the sprite sheet image file, the second is the sprite sheet options. 
-- local sprite_sheet = graphics.newImageSheet( "Aliens-32.png", require( "Aliens-32" ).getSheetOptions() )	
local sprite_sheet = graphics.newImageSheet( "Alien-All.png", {width=34, height=34, numFrames=80} )				


local home_button
local background

local alien_wave_index = 1 -- Use this to keep track of the current wave

-- Need a forward declaration
local next_wave

local defense_array = {} 	
local alien_array = {}		
local bullet_array = {}			

local defense_button_array = {} 

local game_group
local defense_group	
local alien_group
local tile_group
local control_group





-----------------------------------------------------------------------------------------
-- These functions run the game 
-----------------------------------------------------------------------------------------
-- You should probably not edit the material below here unless you have some experience. 
-- Of course if you make a copy you can do anything you like and know that that you can 
-- restore your work if something goes wrong. 
-----------------------------------------------------------------------------------------




local function remove_floating_text( floating_text )
	
end 

local function make_floating_text( str, x, y )
	local floating_text = display.newText( str, 0, 0, "04B03", 24 )
	control_group:insert( floating_text )
	floating_text.x = x
	floating_text.y = y
	transition.to( floating_text, {y=0, alpha=0, time=1500, delay=1000, onComplete=function(floating_text) 
		display.remove( floating_text )
	end } )
	
	return floating_text
end 

-----------------------------------------------------------------------------------------
local function select_defense_button()
	for i = 1, #defense_button_array, 1 do 
		local button = defense_button_array[i]
		if button.index == current_defense_type then 
			button.shape.strokeWidth = 3 
		else
			button.shape.strokeWidth = 0 
		end 
	end
end

local function enable_disable_buttons()
	for i = 1, #defense_button_array,1 do 
		local button = defense_button_array[i]
		local cost = button.cost
		if cost <= energy then 
			button.enabled = true
			button.alpha = 1.0
		else 
			button.enabled = false
			button.alpha = 0.5
		end 
	end
end 

local function touch_defense_button( event )
	local button = event.target
	current_defense_type = button.index
	select_defense_button()
end

local function make_defense_buttons()
	for i = 1, #defense_type_array, 1 do 
		local button_group = display.newGroup()
		
		local button = display.newRoundedRect( 0, 0, 40, 40, 6 )
		local r = 1 * ( i / #defense_type_array )
		button:setFillColor( r, 0, 0 )
		button:setStrokeColor( 1, 0.8, 0.8 )
		defense_type_array[i].red = r 
		
		button_group.cost = defense_type_array[i].cost 
		button_group.enabled = false 
		
		local button_text = display.newText( "0", 0, 0, "04B03", 16 ) 
		button_text.text = defense_type_array[i].cost 
		button_text.x = 0	
		button_text.y = 0
		
		-- Add a name label to each button
		local button_name_text = display.newText( "", 0, 0,"04B03", 8 )
		button_name_text.text = defense_type_array[i].name
		button_name_text.x = 0
		button_name_text.y = 12
		
		button_group:insert( button ) 		
		button_group:insert( button_text ) 	
		button_group:insert( button_name_text ) -- insert button into group
		
		button_group.shape = button  
		button_group.label = button_text 
		
		button_group.index = i
		button_group.x = display.contentWidth - 25 
		button_group.y = 40 + ( i * 50 )
		button_group:addEventListener( "touch", touch_defense_button )
		
		table.insert(defense_button_array, button_group ) 
		control_group:insert( button_group ) 
	end 
end



local function update_energy()
	energy_text.text = energy
	energy_text.anchorX = 1
	energy_text.x = display.contentWidth - 5
end 

local function energy_recharge()
	energy = energy + ENERGY_RECHARGE_RATE
	enable_disable_buttons() 
	update_energy()
end

-- Use this function to make explosions
local function make_explosion( x, y, size )
	local explosion = display.newCircle( 0, 0, 30 * size )
	game_group:insert( explosion )
	explosion.x = x 
	explosion.y = y
	explosion:setFillColor( 0, 1, 1, 0.3 )
	explosion.strokeWidth = 3
	explosion:setStrokeColor( 0, 1, 1, 0.5 )
	explosion.xScale = 0.1
	explosion.yScale = 0.1
	transition.to( explosion, {xScale=1, yScale=1, time=200, onComplete=function( explosion )
		display.remove( explosion )
	end} )
end 


local function remove_bullet( bullet )
	local index = table.indexOf( bullet_array, bullet )
	transition.cancel( bullet.transition )
	table.remove( bullet_array, index )
	display.remove( bullet )
end

local function make_bullet( x, y, size, color )
	local bullet = display.newCircle( 0, 0, size )
	game_group:insert( bullet )
	bullet:setFillColor( color.r, color.g, color.b )
	bullet.x = x
	bullet.y = y
	table.insert( bullet_array, bullet )
	
	local bt = y * BULLET_SPEED 
	bullet.transition = transition.to( bullet, {y=0, time=bt, onComplete=remove_bullet} )
	return bullet 
end

local function defense_defend( defense )
	for i = 1, #alien_array, 1 do 		
		local alien = alien_array[i]	
		if alien.col == defense.col then 
			local bullet = make_bullet( defense.x, defense.y, defense.size, defense.color  ) 
			bullet.damage = defense.damage 
			bullet.defense_name = defense.defense_name 	
			break
		end 
	end 
end

local function remove_defense( defense )
	defense.tile.has_defense = false
	local index = table.indexOf( defense_array, defense ) 
	timer.cancel( defense.timer )	
	table.remove( defense_array, index )				  
	display.remove( defense )
end 

local function make_defense( x, y )
	local defense = display.newRect( 0, 0, 32, 32 )
	
	defense.rof 		 	= defense_type_array[current_defense_type].rof
	defense.damage 		 	= defense_type_array[current_defense_type].damage
	defense.defense_name 	= defense_type_array[current_defense_type].name
	defense.red 		 	= defense_type_array[current_defense_type].red
	defense.size			= defense_type_array[current_defense_type].size
	defense.color			= defense_type_array[current_defense_type].color
	
	defense:setFillColor( defense.red, 0, 0 )
	defense_group:insert( defense ) 
	defense.x = x 
	defense.y = y
	table.insert( defense_array, defense ) 
	defense.timer = timer.performWithDelay( defense.rof, function() 
		defense_defend( defense ) 
	end, -1 )
	return defense
end

local function touch_tile( event )  
	local phase = event.phase
	local tile = event.target
	
	if phase == "began" and tile.has_defense == false then
		local tile_x = tile.x
		local tile_y = tile.y
		
		local cost = defense_type_array[current_defense_type].cost
				
		if energy >= cost then 
			tile.has_defense = true
			energy = energy - cost 
			local defense = make_defense( tile_x, tile_y ) 
			defense.col = tile.col 
			defense.tile = tile
		end 						  
	end
end

local function Tile()
	local tile = display.newRect( 0, 0, TILE_SIZE, TILE_SIZE )
	-- TILE_COLOR.r, g, b, a
	tile:setFillColor( TILE_COLOR.r, TILE_COLOR.g, TILE_COLOR.b, TILE_COLOR.a )
	tile.strokeWidth = TILE_STROKE_WIDTH
	tile:setStrokeColor( TILE_STROKE_COLOR.r, TILE_STROKE_COLOR.g, TILE_STROKE_COLOR.b, TILE_STROKE_COLOR.a )
	
	return tile 
end 

local function make_grid()
	for row = 1, TILE_ROWS, 1 do 
		 for col = 1, TILE_COLS, 1 do 
		 	local tile = Tile()
		 	tile.x = ( TILE_SIZE + TILE_MARGIN ) * col
		 	tile.y = ( TILE_SIZE + TILE_MARGIN ) * row 
		 	tile.col = col
		 	tile.has_defense = false  
		 	tile:addEventListener( "touch", touch_tile )
		 	tile_group:insert( tile ) 
		 end 
	end 
end

local function remove_alien( alien )
	local index = table.indexOf( alien_array, alien ) 
	transition.cancel( alien.transition )
	table.remove( alien_array, index )	
	display.remove( alien )
end 




-----------------------------------------------------------------------------------------
-- Make aliens 
-----------------------------------------------------------------------------------------
local function make_alien()
	
	print( "****************************" )
	print( "make alien", alien_wave_index )
	print( "****************************" )
	
	local alien_wave_pool = alien_wave_array[ alien_wave_index ].pool -- get the current pool of alien types
	local alien_type_index = alien_wave_pool[ math.random( 1, #alien_wave_pool ) ] 	-- Get a random type index
	local alien_type = alien_type_array[ alien_type_index ]			-- Get a random alien type
	
	local sprite_options = alien_type.sprite_options
	-- local alien = display.newRect( 0, 0, 32, 32 )
	local alien = display.newSprite( sprite_sheet, sprite_options )
	
	alien:play()
	
	alien.alien_type = alien_type					
	-- alien:setFillColor( 0, alien_type.green, 0 )	
	local col = math.random( 1, TILE_COLS )
	alien.col = col
	alien.x = col * ( TILE_SIZE + TILE_MARGIN ) 
	alien.y = 0
	alien.life = alien_type.life
	
	local t = alien_target_y * alien_type.speed
	alien.speed = alien_type.speed
	alien.transition = transition.to( alien, {y=alien_target_y, time=t, onComplete=remove_alien} )
	alien_group:insert( alien ) 
	table.insert( alien_array, alien )
end 



local function hit_test( x, y, bounds )
	return x > bounds.xMin 
		and x < bounds.xMax 
		and y > bounds.yMin 
		and y < bounds.yMax
end 

local function hit_test_bounds( bounds1, bounds2 )
    return bounds1.xMin < bounds2.xMax
        and bounds1.xMax > bounds2.xMin
        and bounds1.yMin < bounds2.yMax
        and bounds1.yMax > bounds2.yMin
end

local function check_bullets()
	for b = 1, #bullet_array, 1 do 
		local bullet = bullet_array[b]
		if b > #bullet_array then 
			return
		end
		for a = 1, #alien_array, 1 do
			local alien = alien_array[a]
			if hit_test( bullet.x, bullet.y, alien.contentBounds ) then
				if alien.life > 0 then 
					make_explosion( alien.x, alien.y, bullet.damage ) -- Add an explosion on a hit
					alien.life = alien.life - bullet.damage 
					local defense_name = bullet.defense_name
					
					if defense_name == "Stun" then	
						transition.cancel( alien.transition ) 				
						local t = ( alien_target_y - alien.y ) * alien.speed 
						
						alien.transition = transition.to( alien, { y=alien_target_y, 
																	time=t, 
																	delay=300,	
																	onComplete=remove_alien } )
					end 
					
				else
					remove_alien( alien )
				end 
				remove_bullet( bullet )
				break
			end 
		end 
	end 
end

local function check_enemies()
	for a = 1, #alien_array, 1 do 
		local alien = alien_array[a]
		for d = 1, #defense_array, 1 do 
			local defense = defense_array[d]
			if hit_test_bounds( alien.contentBounds, defense.contentBounds ) then 
				remove_defense( defense )	
				break
			end 
		end 
	end 
end

local function on_enterframe( event ) 
	check_bullets()
	check_enemies()
end

-- Add this function to mange creating enemies that attack in waves. 
local function make_wave()
	local wave_table = alien_wave_array[ alien_wave_index ]
	local wave_time = wave_table.time
	local wave_count = wave_table.count 
	local delay_after_wave = wave_table.delay
	
	local message = "Next Wave:" .. alien_wave_index
	if alien_wave_index == #alien_wave_array then 
		message = "Last Wave:".. alien_wave_index
	else 
		local time_til_next_wave = ( wave_time * wave_count ) + delay_after_wave
		wave_timer = timer.performWithDelay( time_til_next_wave, next_wave, 1 )
	end 
	
	make_floating_text( message, display.contentCenterX, display.contentCenterY )
	
	alien_timer = timer.performWithDelay( wave_time, make_alien, wave_count )
end 

-- Called at the end of each wave
function next_wave()
	alien_wave_index = alien_wave_index + 1
	if alien_wave_index > #alien_wave_array then 
		print( "ALL WAVES COMPLETE" )
	else 
		print( "Next wave:", alien_wave_index ) 
		make_wave()
	end 
end


---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local energy_thing
local defense_button_module = require( "defense_button_group" )

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	-----------------------------------------------------------------------------
	
	background = display.newImageRect( "Background-2.png", 360, 570 )
	background.x = display.contentCenterX 
	background.y = display.contentCenterY
	group:insert( background )
	
	game_group = display.newGroup()
	defense_group = display.newGroup() 	
	alien_group = display.newGroup()	
	tile_group = display.newGroup()
	control_group = display.newGroup() 
	
	make_grid()
	
	game_group:insert( tile_group )		
	game_group:insert( defense_group )	
	game_group:insert( alien_group )
	
	make_defense_buttons()
	select_defense_button()
	enable_disable_buttons() 
	 
	energy_text = display.newText( energy, 0, 0, "04B03", 24 )
	energy_text.anchorX = 1
	energy_text.x = display.contentWidth - 5
	control_group:insert( energy_text )
	energy_text:setFillColor( 0, 1, 0 )
	energy_text.y = 40
	
	--- *********** ---
	energy_thing = require( "energy" )
	control_group:insert( energy_thing.get_view() )
	energy_thing.get_view().x = display.contentWidth - 10
	energy_thing.get_view().y = 10
	energy_thing.set_energy( 50 )
	energy_thing.start_timer()
	
	defense_button_module.make_defense_buttons()
	control_group:insert( defense_button_module.get_view() )
	defense_button_module.get_view().x = 30
	defense_button_module.get_view().y = 30
	
	--- *********** ---
	
	home_button = display.newRoundedRect( 0, 0, 30, 30, 6 )
	home_button:setFillColor( 0.8, 0.8, 0.8 )
	home_button.x = display.contentWidth - 25
	home_button.y = 455
	
	group:insert( game_group )
	group:insert( control_group )
	group:insert( home_button )
end


local function tap_home( event ) 
	storyboard.gotoScene( "home", {effect="slideLeft", time=400} )
end 


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	-----------------------------------------------------------------------------
	
	energy_timer = timer.performWithDelay( ENERGY_TIMER_TIME, energy_recharge, -1 ) 
	Runtime:addEventListener( "enterFrame", on_enterframe )
	
	Runtime:addEventListener( "energy", function(e) 
		print( "Energy Event:", e.energy )
	end  )
	
	alien_wave_index = 1
	make_wave()
	
	energy = 50
	update_energy()
	
	
	home_button:addEventListener( "tap", tap_home )
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	timer.cancel( energy_timer ) 
	timer.cancel( alien_timer )
	timer.cancel( wave_timer )
	
	Runtime:removeEventListener( "enterFrame", on_enterframe )
	home_button:removeEventListener( "tap", tap_home )
	
	for i = #defense_array, 1, -1 do 
		remove_defense( defense_array[i] )
	end 
		
	for i = #alien_array, 1, -1 do 
		remove_alien( alien_array[i] )
	end 
	
	for i = #bullet_array, 1, -1 do 
		remove_bullet( bullet_array[i] )
	end	
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene