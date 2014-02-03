----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local alien = require( "lib.alien" )
local sprite_manager = require( "lib.sprite-manager" ) 
local scene = storyboard.newScene()
----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------
local home_button
local speed_slider
local hits_slider
local speed_text
local details_text
local hits_text
local alien_name 
local alien_speed
local alien_hits
local alien_sprite
local sprite_sheet
---------------------------------------------------------------------------------
local function tap_home( event ) 
	storyboard.gotoScene( "scenes.info-alien", {effect="slideDown", time=400} )
	return true
end 

local function on_speed_slider( event ) 
	if event.phase == "moved" then 
		alien_speed = (( event.value * .49 ) + 1 ) * 0.1
		speed_text.text = "SPEED:" .. alien_speed
	elseif event.phase == "ended" then 
		
	end 
end

local function on_hits_slider( event ) 
	if event.phase == "moved" then 
		alien_hits = math.round( (( event.value * .9 ) + 10 ) * 0.1 )
		hits_text.text = "HITS:" .. alien_hits
	end 
end
-----------------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	local back = display.newRect( display.contentCenterX, display.contentCenterY + 26, display.contentWidth, display.contentHeight - 55 )
	back:setFillColor( 0.232, 0.245, 0.271 )
	group:insert( back )
	----------------------------------------
	home_button = widget.newButton( {
		onRelease=tap_home,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=sprite_manager.get_frames_by_name( "button_40" )[1],
		overFrame=sprite_manager.get_frames_by_name( "button_40" )[2],
		label="<",
		font="04B03",
		fontSize=24
	} )
	home_button.x = 28
	home_button.y = 28
	group:insert( home_button )
	-----------------------------------------------------------------
	-- Name Text
	details_text = display.newText( "NAME:", 0, 0, "04B03", 24 )
	details_text.anchorX = 0
	details_text.x = 110
	details_text.y = 80
	
	group:insert( details_text )
	
	-----------------------------------------------------------------
	-- Speed label
	speed_text = display.newText( "SPEED:", 0, 0, "04B03", 24 )
	speed_text.x = display.contentCenterX
	speed_text.y = 180
	group:insert( speed_text )
	-----------------------------------------------------------------
	-- Speed Slider
	speed_slider = widget.newSlider( {
		top = 150,
		left = 50,
		width = display.contentWidth - 100,
		value = 50,  -- 
		listener = on_speed_slider
	} )
	speed_slider.y = 230
	group:insert( speed_slider )
	----------------------------------------------------------------
	-- Hits text
	hits_text = display.newText( "HITS:", 0, 0, "04B03", 24 )
	hits_text.x = display.contentCenterX
	hits_text.y = 280
	group:insert( hits_text )
	-- Hits slider 
	hits_slider = widget.newSlider( {
		top = 250,
		left = 50,
		width = display.contentWidth - 100,
		height = 10,
		value = 50,  -- Start slider at 10% (optional)
		listener = on_hits_slider
	} )
	hits_slider.y = 330
	group:insert( hits_slider )
end
-----------------------------------------------------------------------------------------

-- Will EnterScene 
function scene:willEnterScene( event ) 
	local data = event.params.data
	alien_name = data.name
	alien_hits = data.hits
	alien_speed = data.speed
	
	speed_slider:setValue( alien_speed / 5 * 100 )
	hits_slider:setValue( alien_hits / 10 * 100 )

	display.remove( alien_sprite ) 
	alien_sprite = sprite_manager.get_sprite_by_name( data.id )
	alien_sprite:play()
	self.view:insert( alien_sprite )
	alien_sprite.xScale = 2
	alien_sprite.yScale = 2
	alien_sprite.x = 60
	alien_sprite.y = 100
	
	details_text.text = "NAME: " .. alien_name
	speed_text.text = "SPEED: " .. alien_speed
	hits_text.text = "HITS: " .. alien_hits
	
end 


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	alien.set_speed_hits_by_name( alien_name, alien_speed, alien_hits )
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
scene:addEventListener( "willEnterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene