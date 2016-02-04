----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget 			= require( "widget" )
local composer 		= require( "composer" )
local defense 			= require( "lib.defense" )
local sprite_manager 	= require( "lib.sprite-manager" )
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
local rof_slider
local damage_slider
local details_text
local cost_slider
local rof_text
local damage_text
local cost_text
local base_name
local base_rof
local base_damage
local base_cost
local base_sprite
local base_sheet
---------------------------------------------------------------------------------
local function tap_home( event )
	composer.gotoScene( "scenes.info-base", {effect="slideDown", time=400} )
	return true
end

local function on_rof_slider( event )
	if event.phase == "moved" then
		base_rof = math.round( (( event.value * 175 ) + 25 ) * 0.1)
		rof_text.text = "ROF: " .. base_rof
	elseif event.phase == "ended" then

	end
end

local function on_damage_slider( event )
	if event.phase == "moved" then
		base_damage = (( event.value * 9 ) + 1 ) * 0.01
		damage_text.text = "DAMAGE: " .. base_damage
	end
end

local function on_cost_slider( event )
	if event.phase == "moved" then
		base_cost = math.round( (( event.value * 95 ) + 5 ) * 0.01 )
		cost_text.text = "COST: " .. base_cost
	end
end
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view

	local back = display.newRect( display.contentCenterX, display.contentCenterY + 26, display.contentWidth, display.contentHeight - 55 )
	back:setFillColor( 0.232, 0.245, 0.271 )

	group:insert( back )

	-- Make Home button
	home_button = widget.newButton( {
		onRelease=tap_home,
		label="<",
		font="04B03",
		fontSize=24,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=sprite_manager.get_frames_by_name("button_40")[1],
		overFrame=sprite_manager.get_frames_by_name("button_40")[2]
	} )
	home_button.x = 28
	home_button.y = 28
	group:insert( home_button )

	---------------------------------------------------------------------------
	-- Base Name
	details_text = display.newText( "NAME:", 0, 0, "04B03", 24 )
	details_text.anchorX = 0
	details_text.x = 110
	details_text.y = 80
	group:insert( details_text )

	-----------------------------
	-- ROF Label
	rof_text = display.newText( "ROF: ", 0, 0, "04B03", 24 )
	rof_text.x = display.contentCenterX
	rof_text.y = 180
	group:insert( rof_text )
	-----------------------------
	-- ROF Slider
	rof_slider = widget.newSlider( {
		top = 150,
		left = 50,
		width = display.contentWidth - 100,
		value = 50,  --
		listener = on_rof_slider
	} )
	rof_slider.y = 230

	group:insert( rof_slider )
	----------------------------------------------------------------------------
	-- Damage label
	damage_text = display.newText( "DAMAGE: ", 0, 0, "04B03", 24 )
	damage_text.x = display.contentCenterX
	damage_text.y = 280
	group:insert( damage_text )

	-- Damager Slider
	damage_slider = widget.newSlider( {
		top = 250,
		left = 50,
		width = display.contentWidth - 100,
		height = 10,
		value = 50,  -- Start slider at 10% (optional)
		listener = on_damage_slider
	} )
	damage_slider.y = 330
	group:insert( damage_slider )
	-----------------------------------------------------------------
	-- Cost label
	cost_text = display.newText( "COST: ", 0, 0, "04B03", 24 )
	cost_text.x = display.contentCenterX
	cost_text.y = 380
	group:insert( cost_text )
	------------------------
	-- cost slider
	cost_slider = widget.newSlider( {
		top = 350,
		left = 50,
		width = display.contentWidth - 100,
		height = 10,
		value = 50,  -- Start slider at 10% (optional)
		listener = on_cost_slider
	} )
	cost_slider.y = 430
	group:insert( cost_slider )

end

function scene:show( event )
	local data = event.params.data

  if event.phase == "will" then
    display.remove( base_sprite )

    base_sprite = sprite_manager.get_sprite_by_name( data.id )
    base_sprite:play()
    self.view:insert( base_sprite )
    base_sprite.xScale = 2
    base_sprite.yScale = 2
    base_sprite.x = 60
    base_sprite.y = 100

    base_name 	= data.name
    base_damage = data.damage
    base_rof 	= data.rof
    base_cost 	= data.cost

    details_text.text 	= "NAME: " .. data.name
    rof_text.text 		= "ROF: " .. data.rof
    damage_text.text 	= "DAMAGE: " .. data.damage
    cost_text.text 		= "COST: " .. data.cost

    rof_slider:setValue( base_rof / 2000 * 100 ) 		-- range 250 to 2000
    damage_slider:setValue( base_damage / 10 * 100 )	-- 1 to 10
    cost_slider:setValue( base_cost / 100 * 100 )		-- 5 to 100
	end
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view

	if event.phase == "will" then
	  defense.set_props_by_name( base_name, base_rof, base_damage, base_cost )
  end
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
