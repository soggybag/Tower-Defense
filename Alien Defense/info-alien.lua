----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local alien_types = require( "alien" ).get_types()
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
----------------------------------------------------------------------------------

local home_button
local list
local sprite_sheet

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

	local str = alien_types[index].name
	str = str .. " SPEED: ".. alien_types[index].speed 
	str = str .. " HITS: ".. alien_types[index].hits 

    local rowTitle = display.newText( row, str, 0, 0, "04B03", 16 )
    rowTitle:setFillColor( 0 )
    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 40
    rowTitle.y = rowHeight * 0.5
    
    local rowSprite = display.newSprite( row, sprite_sheet, alien_types[index].options )
    rowSprite.x = 20
    rowSprite.y = 20
    rowSprite:play()
end 

local function onRowTouch( event )
	print( event.phase )
	if event.phase == "release" then 
		local data = alien_types[event.target.index]
		storyboard.gotoScene( "alien-details", {effect="slideUp", time=400, params={data=data}} )
	end 
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	sprite_sheet = graphics.newImageSheet( "Alien-All.png", {width=34, height=34, numFrames=80} )
	
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
	
	for i = 1, #alien_types do 
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