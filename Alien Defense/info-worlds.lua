----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local worlds = require( "worlds" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
----------------------------------------------------------------------------------

local home_button
local list
local sprite_sheet
local world_array = {}

-----------------------------------------------------------------------------------------
local function tap_home( event ) 
	storyboard.gotoScene( "home", {effect="slideDown", time=400} )
end 

local function onRowRender( event )
	-- Get reference to the row group
    local row = event.row
    local index = row.index

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
    
    local name_text = display.newText( world_array[index].name, 0, 0, "04B03", 24 ) 
	name_text:setFillColor( 0 )
    
    name_text.anchorX = 0
    name_text.x = 44
    name_text.y = rowHeight * 0.5
    row:insert( name_text )
    
    
    local pop_text = display.newText( world_array[index].population, 0, 0, "04B03", 16 )
    row:insert( pop_text )
    pop_text.x = display.contentCenterX + 20
    pop_text.y = 20
    pop_text:setFillColor( 0 )
    
    local world_sprite = display.newCircle( 0, 0, 16 )
    world_sprite:setFillColor( world_array[index].color.r, world_array[index].color.g, world_array[index].color.b )
    row:insert( world_sprite )
    world_sprite.x = rowHeight / 2
    world_sprite.y = rowHeight / 2
    
    
end 

local function onRowTouch( event )
	if event.phase == "release" then 
		storyboard.gotoScene( "game", {effect="slideUp", time=400, params={world_index=event.row.index} } )
	end 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	sprite_sheet = graphics.newImageSheet( "Satellites.png", {width=34, height=34, numFrames=25} )
	
	local list = widget.newTableView( {
		left = 0,
		top = 0,
		height = display.contentHeight,
		width = display.contentWidth,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		listener = scrollListener,
		scrollBarOptions = {
			sheet = scrollBarSheet,
			topFrame = 1,
			middleFrame = 2,
			bottomFrame = 3
		}
	} )
	
	group:insert( list )
	
	for item in worlds.iterate_worlds() do 
		world_array[#world_array+1] = {name=item.name, population=item.population, color=item.color}
		list:insertRow( {} )
	end
	

	home_button = display.newRoundedRect( 0, 0, 40, 40, 6 )
	group:insert( home_button )
	home_button:setFillColor( 0.8, 0.8, 0.8 )
	home_button.x = display.contentWidth - 30
	home_button.y = display.contentHeight - 30
	
	
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	home_button:addEventListener( "tap", tap_home )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	home_button:removeEventListener( "tap", tap_home )
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