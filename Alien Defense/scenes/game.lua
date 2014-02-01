-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Todo: 


-----------------------------------------------------------------------------------------
local alien				= require( "lib.alien" )
local energy	 		= require( "lib.energy" )
local defense_buttons 	= require( "lib.defense_button_group" )
local grid				= require( "lib.grid" )
local bullet_manager	= require( "lib.bullet_manager" )
local collision_manager = require( "lib.collision_manager" )
local defense			= require( "lib.defense" )
local people 			= require( "lib.people" )
local worlds			= require( "lib.worlds" )
local sprite_manager	= require( "lib.sprite-manager" )
local widget			= require( "widget" )
-----------------------------------------------------------------------------------------
local controls_group
local defense_group
local back_group
local home_button
local sound 
-----------------------------------------------------------------------------------------
local function check_game_over() 
	-- print( "Game On Frame" )
	if people.get_people() < 1 then 
		-- Game Over 
		print( "Game on frame game over" )
		scene:destroyScene()
		storyboard.gotoScene( "scenes.game_over", {effect="slideUp", time=400} )
	end 
end 
-----------------------------------------------------------------------------------------
local function on_frame( event )
	bullet_manager.update()
	alien.update()
	collision_manager.update()
	people.update()
	check_game_over()
end 
-----------------------------------------------------------------------------------------
local function tap_home( event ) 
	print( "Game Tap Home" )
	storyboard.gotoScene( "scenes.home", {effect="slideLeft", time=400} )
	return true
end 

local function on_game_over( event )
	print( "Game On Game Over" )
	scene:destroyScene()
	storyboard.gotoScene( "scenes.game_over", {effect="slideUp", time=400} )
end 
-----------------------------------------------------------------------------------------
-- STORYBOARD HANDLERS
-----------------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	sound = audio.loadStream( "sound/RoccoW_-_DM1__LSDJ_Jam_Session.mp3" )
	
	-- Make display groups
	back_group = display.newGroup()
	defense_group = display.newGroup()
	controls_group = display.newGroup()
	
	group:insert( back_group )
	group:insert( defense_group )
	group:insert( controls_group )
	
	--[[
	background = display.newImageRect( "Background-2.png", 360, 570 )
	background.x = display.contentCenterX 
	background.y = display.contentCenterY
	--]]
	
	local world_index = 1
	if event.params ~= nil then
		world_index = event.params.world_index
	end  
	
	background = require( "lib.world_background" ).make( world_index )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local energy_view = energy.build()
	energy_view.x = display.contentWidth - 10
	energy_view.y = 20
	
	local grid_group = grid.build()
	
	bullet_manager.set_view( defense_group ) 
	alien.set_view( defense_group )
	
	home_button = widget.newButton( {
		onRelease=tap_home,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=sprite_manager.get_frames_by_name( "button_40" )[1],
		overFrame=sprite_manager.get_frames_by_name( "button_40" )[2],
		label="<",
		font="04B03",
		fontSize=24
	} )
	home_button.x = display.contentWidth - 30
	home_button.y = display.contentHeight - 30
	
	collision_manager.set_view( defense_group )
	
	local alien = alien.build()
	
	people.set_view( defense_group )
	
	back_group:insert( background )
	controls_group:insert( energy_view )
	defense_group:insert( grid_group )
	controls_group:insert( home_button )
	
end

function scene:willEnterScene( event )
	local defense_buttons_view = defense_buttons.build()
	controls_group:insert( defense_buttons_view )
	defense_buttons_view.x = display.contentWidth - 30
	defense_buttons_view.y = 65
	energy.set_energy( 50 )
	people.build()
	if event.params ~= nil then 
		people.set_people( worlds.get_population_at_index( event.params.world_index ) )
	end 
end 

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	energy.start_timer()
	alien.start_timer( 1000, -1 )
	Runtime:addEventListener( "enterFrame", on_frame )
	audio.play( sound, {loops=-1} )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	print( "Game Exit Scene" )
	alien.stop_timer()
	energy.stop_timer()
	defense.stop_timers()
	Runtime:removeEventListener( "enterFrame", on_frame )
	audio.stop()
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	print( "Game Destroy Scene" )
	alien.destroy()
	bullet_manager.destroy()
	energy.destroy()
	defense.destroy()
	defense_buttons.destroy()
	grid.destroy()
	people.destroy()
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "willEnterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene