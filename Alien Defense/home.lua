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
	storyboard.gotoScene( "game", {effect="slideRight", time=400} )
end 

local function tap_alien( event ) 
	storyboard.gotoScene( "info-alien", {effect="slideUp", time=400} )
end 

local function tap_base( event ) 
	storyboard.gotoScene( "info-base", {effect="slideUp", time=400} )
end 

local function tap_worlds( event ) 
	storyboard.gotoScene( "info-worlds", {effect="slideUp", time=400} )
end 

local function tap_send( event )
	
	-- print( require("S2T").tableToString( {a=123,b="Foo"} ) )
	
	local app_name 		= system.getInfo( "appName" )
	local version 		= system.getInfo( "appVersionString" )
	-- local alien_json 	= require( "json" ).encode( require( "alien" ).get_types() )
	-- local base_json 	= require( "json" ).encode( require( "defense" ).get_types() )
	local alien_json 	= require("S2T").tableToString( require( "alien" ).get_types() )
	local base_json 	= require("S2T").tableToString( require( "defense" ).get_types() )

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

	-- local sprite_sheet = graphics.newImageSheet( "Aliens-32.png", require( "Aliens-32" ).getSheetOptions() )	
	local sprite_sheet = graphics.newImageSheet( "Alien-All.png", {width=34, height=34, numFrames=80} )	
	local base_sheet = graphics.newImageSheet( "Satellites.png", {width=34, height=34, numFrames=25} )
	
	
	local play_text = display.newText( group, "PLAY", 0, 0, "04B03", 32 )
	play_text.x = display.contentCenterX
	play_text.y = display.contentCenterY - 80
	
	local back = display.newRoundedRect( 0, 0, 72, 72, 12 )
	back:setFillColor( 0.8, 0.8, 0.8 )
	back.strokeWidth = 4
	back:setStrokeColor( 0.7, 0.7, 0.7 )
	
	local sprite = display.newSprite( sprite_sheet, {frames={1,1,1,2,3,3,2,1,6,7,7,7,6,1,1,1,4,5,5,5,4,1,1,1,11,12,13,12,11, 8,9,10,9,8,9,10,9,8}, time=2500} )
	sprite:play()
	
	-- start_button = display.newGroup()
	start_button = display.newGroup() 
	start_button:insert( back )
	start_button:insert( sprite )
	
	start_button.x = display.contentCenterX
	start_button.y = display.contentCenterY
	
	group:insert( start_button )
	
	local edit_text = display.newText( group, "- EDIT -", 0, 0, "04B03", 16 )
	edit_text.x = display.contentCenterX
	edit_text.y = display.contentCenterY + 80
	
	alien_button = display.newGroup()
	local alien_back = display.newRoundedRect( 0, 0, 36, 36, 6 )
	alien_back:setFillColor( 0.8, 0.8, 0.8 )
	alien_back.strokeWidth = 2
	alien_back:setStrokeColor( 0.7, 0.7, 0.7 )
	
	local alien_sprite = display.newSprite( sprite_sheet, {frames={31,32,33,34,35,36,37,38,39,40,41,42,43,44,45, 46,47,48,49,50,49,48,47,46}, time=2500} )
	alien_sprite:play()
	alien_button:insert( alien_back )
	alien_button:insert( alien_sprite )
	
	alien_button.x = display.contentCenterX + 40
	alien_button.y = display.contentCenterY + 144
	
	group:insert( alien_button )
	
	base_button = display.newGroup()
	local base_back = display.newRoundedRect( 0, 0, 36, 36, 6 )
	base_back:setFillColor( 0.8, 0.8, 0.8 )
	base_back.strokeWidth = 2
	base_back:setStrokeColor( 0.7, 0.7, 0.7 )
	
	local base_sprite = display.newSprite( base_sheet, {frames={1}, time=2500} )
	base_sprite:play()
	base_button:insert( base_back )
	base_button:insert( base_sprite )
	
	base_button.x = display.contentCenterX - 40
	base_button.y = display.contentCenterY + 144
	
	group:insert( base_button )
	
	send_button = display.newText( "SEND INFO", 0, 0, "04B03", 24 )
	send_button.anchorX = 1
	send_button.anchorY = 0
	send_button.x = display.contentWidth - 10
	send_button.y = 10	
	send_button:setFillColor( 0.5, 0.5, 0.5 )
	group:insert( send_button )
	
	worlds_button = display.newGroup()
	local worlds_back = display.newRoundedRect( 0, 0, 36, 36, 6 )
	worlds_back:setFillColor( 0.8, 0.8, 0.8 )
	worlds_back.strokeWidth = 2
	worlds_back:setStrokeColor( 0.7, 0.7, 0.7 )
	worlds_button:insert( worlds_back )
	worlds_sprite = display.newCircle( 0, 0, 15 )
	worlds_button:insert( worlds_sprite )
	worlds_sprite:setFillColor( math.random(), math.random(), math.random() )
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