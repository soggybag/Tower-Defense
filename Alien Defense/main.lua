-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )

-- local storyboard = require( "storyboard" )
local composer = require("composer")

-- load scenetemplate.lua
composer.gotoScene( "scenes.home", {effect="slideRight", time=400} )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):


-----------------------------------------------------------------------------------------
-- Monitor memory
local memory_text = display.newText( "Hello", 5, 5, "04B03", 16 )
memory_text:setFillColor( 1, 1, 1 )
memory_text.anchorX = 0
memory_text.y = display.contentHeight - 24
memory_text:setFillColor( 0.6, 0.3, 0 )
memory_text.blendMode = "screen"

local monitorMem = function()
    collectgarbage()
	local textMem = math.round( system.getInfo( "textureMemoryUsed" ) / 1000000 )
	memory_text.text = "Mem: "..math.round( collectgarbage( "count" ) ) .. "\n Tex: ".. textMem
end
Runtime:addEventListener( "enterFrame", monitorMem )
-----------------------------------------------------------------------------------------
require( "lib.worlds" )





