-- --------------------------------------------------------
--
-- alien-selector.lua
-- 
-- --------------------------------------------------------
local sprite_manager = require( "lib.sprite-manager" )
local alien = require( "lib.alien" )
-- --------------------------------------------------------
local M = display.newGroup()
-----------------------------------------------------------

local alien_button_array = {}


local function tap_alien( event )

end 


local function make()
	local alien_types = alien.get_types()
	
	for i = 1, #alien_types do
		local alien_type = alien_types[i]
		local button = sprite_manager.make_alien_toggle_button( alien_type.id, tap_alien )
		button.x = 20 + ((i-1) % 6) * 52
		button.y = 20 + math.floor((i-1)/6 ) * 52
		M:insert( button )
	end 
end 
make()

-----------------------------------------------------------
return M
