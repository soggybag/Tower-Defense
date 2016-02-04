----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

-- local storyboard = require( "storyboard" )
local composer = require("composer")
local widget = require( "widget" )
local scene = composer.newScene()

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
	composer.gotoScene( "scenes.game", {effect="slideRight", time=400} )
	return true
end

local function tap_alien( event )
	composer.gotoScene( "scenes.info-alien", {effect="slideUp", time=400} )
	return true
end

local function tap_base( event )
	composer.gotoScene( "scenes.info-base", {effect="slideUp", time=400} )
	return true
end

local function tap_worlds( event )
	composer.gotoScene( "scenes.info-worlds", {effect="slideUp", time=400} )
	return true
end

local function tap_send( event )
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
function scene:create( event )
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
	alien_button_group = sprite_manager.make_sprite_button( "alien_16", tap_alien )
	alien_button_group.x = display.contentCenterX
	alien_button_group.y = display.contentCenterY + 144
	group:insert( alien_button_group )
	-------------------------------------------------------------------------
	-- Make Satellite button
	base_button = sprite_manager.make_sprite_button( "satellite_1", tap_base )
	base_button.x = display.contentCenterX - 50
	base_button.y = display.contentCenterY + 144
	group:insert( base_button )
	-------------------------------------------------------------------------
	-- Make Worlds button
	worlds_button = sprite_manager.make_world_button( tap_worlds )
	worlds_button.x = display.contentCenterX + 50
	worlds_button.y = display.contentCenterY + 144
	group:insert( worlds_button )
	------------------------------------------------------------------------
	-- Make send info button
	send_button = sprite_manager.get_button( "SEND INFO", 142, 36, tap_send )
	group:insert( send_button )
	send_button.x = 74
	send_button.y = 21
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view

  if event.phase == "did" then
	  local prior_scene = composer.getPrevious()
	  composer.purgeScene( prior_scene )
	end
end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view

end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "create", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "show", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "hide", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
