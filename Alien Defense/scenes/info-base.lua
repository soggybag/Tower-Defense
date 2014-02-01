----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local defense_types = require( "lib.defense" ).get_types()
local sprite_manager = require( "lib.sprite-manager" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
----------------------------------------------------------------------------------

local home_button
local list
local sprite_sheet
local ROW_COLOR = {default={0.2,0.2,0.2}, over={0,0,0}}
local NAME_COLOR = {0.6,0.6,0.6}
local SUB_COLOR = {0.8,0.8,0.8}

-----------------------------------------------------------------------------------------
local function tap_home( event ) 
	storyboard.gotoScene( "scenes.home", {effect="slideDown", time=400} )
	return true
end 

local function onRowRender( event )
	-- Get reference to the row group
    local row = event.row
    local index = row.index

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

	local str = "ROF: ".. defense_types[index].rof 
	str = str .. " DAM: ".. defense_types[index].damage
	str = str .. " COST: ".. defense_types[index].cost  

    local rowTitle = display.newText( row, defense_types[index].name, 0, 0, "04B03", 24 )
    rowTitle:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 50
    rowTitle.y = 16
    
    local subTitle = display.newText( row, str, 0, 0, "04B03", 16 )
    subTitle:setFillColor( SUB_COLOR[1], SUB_COLOR[2], SUB_COLOR[3] )
    -- Align the label left and vertically centered
    subTitle.anchorX = 0
    subTitle.x = 50
    subTitle.y = 36
    
    local rowSprite = sprite_manager.get_sprite_by_name( defense_types[index].id )
    row:insert( rowSprite )
    rowSprite:play()
    rowSprite.x = 25
    rowSprite.y = 25
    
    local arrow = display.newText( row, ">", 0, 0, "04B03", 24 )
    arrow:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    arrow.x = display.contentWidth - 12
    arrow.y = 25
end 

local function onRowTouch( event )
	if event.phase == "release" then 
		local data = defense_types[event.target.index]
		print( "On row touch data name:", data.name )
		storyboard.gotoScene( "scenes.base-details", {effect="slideUp", time=400, params={data=data}} )
	end 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	local list = widget.newTableView( {
		left = 0,
		top = 0,
		height = display.contentHeight,
		width = display.contentWidth,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		backgroundColor = { 0.3, 0.3, 0.3 },
		noLines = true,
		listener = scrollListener,
		scrollBarOptions = {
			sheet = scrollBarSheet,
			topFrame = 1,
			middleFrame = 2,
			bottomFrame = 3
		}
	} )
	
	group:insert( list )
	
	for i = 1, #defense_types do 
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