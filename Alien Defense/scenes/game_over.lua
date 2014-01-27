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

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local back
local game_over_text
local message_text

local function tap_back( event )
	storyboard.gotoScene( "scenes.home", {effect="slideDown", time=400} )
end 

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	back = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	group:insert( back )
	back:setFillColor( 0 )
	
	game_over_text = display.newText( "GAME OVER", 0, 0, "04B03", 32 )
	group:insert( game_over_text )
	game_over_text.x = display.contentCenterX
	game_over_text.y = display.contentCenterY
	
	message_text = display.newText( "The people of the planet of Fruitopia were eaten by hungry alien hordes", 0, 0, 200, 0, "04B03", 16 )
	group:insert( message_text )
	message_text.x = display.contentCenterX
	message_text.y = 400
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	
	back:addEventListener( "tap", tap_back )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	back:removeEventListener( "tap", tap_back )
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
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