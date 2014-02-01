----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

local start_button
local alien_button
local base_button
local send_button
local worlds_button

local function tap_start( event ) 
	storyboard.gotoScene( "scenes.game", {effect="slideRight", time=400} )
	return true
end 

local function tap_alien( event ) 
	storyboard.gotoScene( "scenes.info-alien", {effect="slideUp", time=400} )
	return true
end 

local function tap_base( event ) 
	storyboard.gotoScene( "scenes.info-base", {effect="slideUp", time=400} )
	return true
end 

local function tap_worlds( event ) 
	storyboard.gotoScene( "scenes.info-worlds", {effect="slideUp", time=400} )
	return true
end 

local function tap_send( event )
	
	-- print( require("S2T").tableToString( {a=123,b="Foo"} ) )
	
	local app_name 		= system.getInfo( "appName" )
	local version 		= system.getInfo( "appVersionString" )
	-- local alien_json 	= require( "json" ).encode( require( "alien" ).get_types() )
	-- local base_json 	= require( "json" ).encode( require( "defense" ).get_types() )
	local alien_json 	= require("lib.S2T").tableToString( require( "lib.alien" ).get_types() )
	local base_json 	= require("lib.S2T").tableToString( require( "lib.defense" ).get_types() )

	local options = {
		to = "soggybag@gmail.com",
		subject = "Tower Defense settings:" .. app_name .. " " .. version ,
		body = "Settings from Tower Defense:\n\n" .. alien_json .. "\n\n" .. base_json
	}
	native.showPopup( "mail", options )
	
	-- native.showAlert( "Email sent", "Data sent via email" )
	print( options.subject )
	print( options.body )
	return true
end 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- Load Sprite Manager
	local sprite_manager = require( "lib.sprite-manager" )
	
	-- Make PLAY label text
	local play_text = display.newText( group, "PLAY", 0, 0, "04B03", 32 )
	play_text.x = display.contentCenterX
	play_text.y = display.contentCenterY - 80
	
	---------------------------------------------------------------------------------
	-- Make play button
	local play_button_frames = sprite_manager.get_frames_by_name( "button_72" )
	local play_button = widget.newButton( {
		onRelease=tap_start,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=play_button_frames[1],
		overFrame=play_button_frames[2],
		x=0,
		y=0
	} ) 
	
	local sprite = sprite_manager.get_sprite_by_name( "alien_16" )
	sprite:play()
	
	-- start_button = display.newGroup()
	start_button = display.newGroup() 
	start_button:insert( play_button )
	start_button:insert( sprite )
	
	start_button.x = display.contentCenterX 
	start_button.y = display.contentCenterY 
	
	group:insert( start_button )
	------------------------------------------------------------------------
	
	-- Make edit text label
	local edit_text = display.newText( group, "- EDIT -", 0, 0, "04B03", 16 )
	edit_text.x = display.contentCenterX
	edit_text.y = display.contentCenterY + 80
	
	-----------------------------------------------------------------------
	-- make Alien button
	alien_button_group = display.newGroup()
	local alien_button_frames = sprite_manager.get_frames_by_name( "button_40" )
	local alien_button = widget.newButton( {
		onRelease=tap_alien,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=alien_button_frames[1],
		overFrame=alien_button_frames[2],
		x = 0,
		y=0
	} )

	
	local alien_sprite = sprite_manager.get_sprite_by_name( "alien_16" )
	alien_sprite:play()
	
	alien_button_group:insert( alien_button )
	alien_button_group:insert( alien_sprite )
	
	alien_button_group.x = display.contentCenterX
	alien_button_group.y = display.contentCenterY + 144
	
	group:insert( alien_button_group )
	
	-------------------------------------------------------------------------
	-- Make Satellite button
	base_button = display.newGroup()
	local base_back = widget.newButton( {
		onRelease=tap_base,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=alien_button_frames[1],
		overFrame=alien_button_frames[2],
		x=0,
		y=0
	} )
	local base_sprite = sprite_manager.get_sprite_by_name( "satellite_1" )
	base_button:insert( base_back )
	base_button:insert( base_sprite )
	
	base_button.x = display.contentCenterX - 48
	base_button.y = display.contentCenterY + 144
	
	group:insert( base_button )
	
	-------------------------------------------------------------------------
	-- Make Worlds button
	worlds_button = display.newGroup()
	local worlds_back = widget.newButton( {
		onRelease=tap_worlds,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=alien_button_frames[1],
		overFrame=alien_button_frames[2],
		x=0,
		y=0
	} )
	worlds_button:insert( worlds_back )
	worlds_sprite = sprite_manager.get_random_world()
	worlds_button:insert( worlds_sprite )
	
	worlds_button.x = display.contentCenterX + 48
	worlds_button.y = display.contentCenterY + 144
	
	group:insert( worlds_button )
	------------------------------------------------------------------------
	-- Make send info button
	send_button = widget.newButton( {
		onRelease=tap_send,
		label="SEND INFO",
		font="04B03",
		fontSize=24,
		labelColor = { default={ 0, 0.5, 0 }, over={ 0, 1, 0, 1 } }
	} )
	group:insert( send_button )
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
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