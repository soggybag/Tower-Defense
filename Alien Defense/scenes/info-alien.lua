----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local widget = require( "widget" )
local alien_types = require( "lib.alien" ).get_types()
local composer = require( "composer" )
local sprite_manager = require( "lib.sprite-manager" )
local scene = composer.newScene()
----------------------------------------------------------------------------------

local home_button
local list
local sprite_sheet

local ROW_COLOR = {default={0.2,0.2,0.2}, over={0,0,0}}
local NAME_COLOR = {0.6,0.6,0.6}
local SUB_COLOR = {0.8,0.8,0.8}

-----------------------------------------------------------------------------------------
local function tap_home( event )
	composer.gotoScene( "scenes.home", {effect="slideDown", time=400} )
	return true
end

local function onRowRender( event )
	-- Get reference to the row group
    local row = event.row
    local index = row.index

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

	-- Make row title
    local rowTitle = display.newText( row, string.upper(alien_types[index].name), 0, 0, "04B03", 24 )
    rowTitle:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 50
    rowTitle.y = 16

    local str = " SPEED: ".. alien_types[index].speed
	str = str .. " HITS: ".. alien_types[index].hits

	-- make row sub text
	local subTitle = display.newText( row, str, 0, 0, "04B03", 16 )
    subTitle:setFillColor( SUB_COLOR[1], SUB_COLOR[2], SUB_COLOR[3] )
    -- Align the label left and vertically centered
    subTitle.anchorX = 0
    subTitle.x = 40
    subTitle.y = 36

    -- Make row sprite
    local rowSprite = sprite_manager.get_sprite_by_name( alien_types[index].id )
    row:insert( rowSprite )
    rowSprite.x = 25
    rowSprite.y = 25
    rowSprite:play()

    local arrow = display.newText( row, ">", 0, 0, "04B03", 24 )
    arrow:setFillColor( NAME_COLOR[1], NAME_COLOR[2], NAME_COLOR[3] )
    arrow.x = display.contentWidth - 12
    arrow.y = 25
end

local function onRowTouch( event )
	if event.phase == "release" then
		local data = alien_types[event.target.index]
		composer.gotoScene( "scenes.alien-details", {effect="slideUp", time=400, params={data=data}} )
	end
end

---------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view

	local list = widget.newTableView( {
		left = 0,
		top = 55,
		height = display.contentHeight - 55,
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

	for i = 1, #alien_types do
		list:insertRow( {
			rowColor=ROW_COLOR,
			rowHeight=50
		} )
	end

	home_button = widget.newButton({
		onRelease=tap_home,
		label="<",
		font="04B03",
		fontSize=24,
		sheet=sprite_manager.sprite_sheet,
		defaultFrame=sprite_manager.get_frames_by_name("button_40")[1],
		overFrame=sprite_manager.get_frames_by_name("button_40")[2]
	})
	group:insert( home_button )
	home_button.x = 28
	home_button.y = 28

end
----------------------------------------------------------------------------------

-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view

end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view

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
