----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget 			= require( "widget" )
local worlds 			= require( "lib.worlds" )
local storyboard 		= require( "storyboard" )
local sprite_manager 	= require( "lib.sprite-manager" )
local scene = storyboard.newScene()
----------------------------------------------------------------------------------

local home_button
local list
local sprite_sheet
local world_array = {}

local ROW_COLOR = {default={0.2,0.2,0.2}, over={0,0,0}}
local NAME_COLOR = {0.6,0.6,0.6}
local SUB_COLOR = {0.8,0.8,0.8}

-----------------------------------------------------------------------------------------
local function tap_home( event ) 
	storyboard.gotoScene( "scenes.home", {effect="slideDown", time=400} )
end 

local function onRowRender( event )
	-- Get reference to the row group
    local row = event.row
    local index = row.index

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
    
    local name_text = display.newText( row, world_array[index].name, 0, 0, "04B03", 24 ) 
	name_text:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    
    name_text.anchorX = 0
    name_text.x = 50
    name_text.y = 16
    
    local pop_text = display.newText( row, "POPULATION: " .. world_array[index].population, 0, 0, "04B03", 16 )
    pop_text.anchorX = 0
    pop_text.x = 50
    pop_text.y = 36
    pop_text:setFillColor( SUB_COLOR[1], SUB_COLOR[2], SUB_COLOR[3] )
    
    local world_sprite = sprite_manager.get_world_sprite( index )
    world_sprite.x = rowHeight / 2
    world_sprite.y = rowHeight / 2
    row:insert( world_sprite )
    
    local arrow = display.newText( row, ">", 0, 0, "04B03", 24 )
    arrow:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    arrow.x = display.contentWidth - 12
    arrow.y = 25
end 

local function onRowTouch( event )
	if event.phase == "release" then 
		storyboard.gotoScene( "scenes.game", {effect="slideUp", time=400, params={world_index=event.row.index} } )
	end 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	sprite_sheet = graphics.newImageSheet( "images/Satellites.png", {width=34, height=34, numFrames=25} )
	
	local list = widget.newTableView( {
		left = 0,
		top = 0,
		height = display.contentHeight,
		width = display.contentWidth,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		listener = scrollListener,
		backgroundColor = { 0.3, 0.3, 0.3 },
		noLines = true,
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
		list:insertRow( {
			rowColor=ROW_COLOR,
			rowHeight=50
		} )
	end
	

	home_button = sprite_manager.get_sprite_by_name( "button_40" )
	group:insert( home_button )
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