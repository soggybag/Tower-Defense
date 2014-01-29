----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
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
end 

local function tap_alien( event ) 
	storyboard.gotoScene( "scenes.info-alien", {effect="slideUp", time=400} )
end 

local function tap_base( event ) 
	storyboard.gotoScene( "scenes.info-base", {effect="slideUp", time=400} )
end 

local function tap_worlds( event ) 
	storyboard.gotoScene( "scenes.info-worlds", {effect="slideUp", time=400} )
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
	
	-- Make play button
	local back = sprite_manager.get_sprite_by_name( "button_72" )
	
	local sprite = sprite_manager.get_sprite_by_name( "alien_blue_1" )
	sprite:play()
	
	-- start_button = display.newGroup()
	start_button = display.newGroup() 
	start_button:insert( back )
	start_button:insert( sprite )
	
	start_button.x = display.contentCenterX
	start_button.y = display.contentCenterY
	
	group:insert( start_button )
	
	-- Make edit text label
	local edit_text = display.newText( group, "- EDIT -", 0, 0, "04B03", 16 )
	edit_text.x = display.contentCenterX
	edit_text.y = display.contentCenterY + 80
	
	
	-- make Alien button
	alien_button = display.newGroup()
	local alien_back = sprite_manager.get_sprite_by_name( "button_40" )
	local alien_sprite = sprite_manager.get_sprite_by_name( "alien_red_1" )
	alien_sprite:play()
	alien_button:insert( alien_back )
	alien_button:insert( alien_sprite )
	
	alien_button.x = display.contentCenterX + 40
	alien_button.y = display.contentCenterY + 144
	
	group:insert( alien_button )
	
	-- Make Satellite button
	base_button = display.newGroup()
	local base_back = sprite_manager.get_sprite_by_name( "button_40" )
	local base_sprite = sprite_manager.get_sprite_by_name( "satellite_1" )
	base_sprite:play()
	base_button:insert( base_back )
	base_button:insert( base_sprite )
	
	base_button.x = display.contentCenterX - 40
	base_button.y = display.contentCenterY + 144
	
	group:insert( base_button )
	
	-- Make send info button
	send_button = display.newText( "SEND INFO", 0, 0, "04B03", 24 )
	send_button.anchorX = 1
	send_button.anchorY = 0
	send_button.x = display.contentWidth - 10
	send_button.y = 10	
	send_button:setFillColor( 0.5, 0.5, 0.5 )
	group:insert( send_button )
	
	-- Make Worlds button
	worlds_button = display.newGroup()
	local worlds_back = sprite_manager.get_sprite_by_name( "button_40" )
	worlds_button:insert( worlds_back )
	worlds_sprite = sprite_manager.get_random_world()
	worlds_button:insert( worlds_sprite )
	worlds_button.y = display.contentCenterY + 144
	
	group:insert( worlds_button )
	
	base_button.x = display.contentCenterX - 48
	alien_button.x = display.contentCenterX
	worlds_button.x = display.contentCenterX + 48
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	start_button:addEventListener( "tap", tap_start )
	alien_button:addEventListener( "tap", tap_alien )
	base_button:addEventListener( "tap", tap_base )
	send_button:addEventListener( "tap", tap_send )
	worlds_button:addEventListener( "tap", tap_worlds )
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	start_button:removeEventListener( "tap", tap_start )
	alien_button:removeEventListener( "tap", tap_alien )
	base_button:removeEventListener( "tap", tap_base )
	send_button:removeEventListener( "tap", tap_send )
	worlds_button:removeEventListener( "tap", tap_worlds )
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