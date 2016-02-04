----------------------------------------------------------------------------------
--
-- world-details.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local composer = require( "composer" )
local worlds = require( "lib.worlds" )
local sprite_manager = require( "lib.sprite-manager" )
local scene = composer.newScene()
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
local population_text
local name_text
local tech_text
local world_name
local world_population
local world_tech
local world_sprite
local sprite_sheet
---------------------------------------------------------------------------------
local function tap_home( event )
	composer.gotoScene( "scenes.info-worlds", {effect="slideDown", time=400} )
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
function scene:create( event )
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
	name_text = display.newText( "NAME:", 0, 0, "04B03", 24 )
	name_text.anchorX = 0
	name_text.x = 110
	name_text.y = 80

	group:insert( name_text )

	-----------------------------------------------------------------
	-- Population label
	population_text = display.newText( "POPULATION:", 0, 0, "04B03", 24 )
	population_text.x = display.contentCenterX
	population_text.y = 180
	group:insert( population_text )
	-----------------------------------------------------------------
	-- Speed Slider
	--[[
	speed_slider = widget.newSlider( {
		top = 150,
		left = 50,
		width = display.contentWidth - 100,
		value = 50,  --
		listener = on_speed_slider
	} )
	speed_slider.y = 230
	group:insert( speed_slider )
	--]]
	----------------------------------------------------------------
	-- Hits text
	tech_text = display.newText( "TECH:", 0, 0, "04B03", 24 )
	tech_text.x = display.contentCenterX
	tech_text.y = 280
	group:insert( tech_text )

	-- Hits slider
	--[[
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
	--]]


	local alien_selector = require( "lib.alien-selector" )
	group:insert( alien_selector )
	alien_selector.x = 10
	alien_selector.y = 300
end
-----------------------------------------------------------------------------------------

-- Will EnterScene
function scene:show( event )

  if event.phase == "will" then
    local world_index = event.params.world_index
    world_name = worlds.get_name_at_index( world_index )
    world_population = worlds.get_population_at_index( world_index )
    world_tech = worlds.get_tech_at_index( world_index )

    --[[
    speed_slider:setValue( alien_speed / 5 * 100 )
    hits_slider:setValue( alien_hits / 10 * 100 )
    --]]

    display.remove( world_sprite )
    world_sprite = sprite_manager.get_world_sprite( world_index )
    self.view:insert( world_sprite )
    world_sprite.xScale = 2
    world_sprite.yScale = 2
    world_sprite.x = 60
    world_sprite.y = 100

    name_text.text = "NAME: " .. world_name
    population_text.text = "POPULATION: " .. world_population
    tech_text.text = "TECH: " .. world_tech
  end
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	if event.phase == "did" then
	  -- alien.set_speed_hits_by_name( alien_name, alien_speed, alien_hits )
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
