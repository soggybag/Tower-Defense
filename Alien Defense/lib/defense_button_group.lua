

-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local energy = require( "lib.energy" )
local defense = require( "lib.defense" )
local defense_button = require( "lib.defense_button" )

local defense_button_array = {}
local index = 1
local select_sound

local defense_button_group


local function enable_disable_buttons( event )
	for i = 1, #defense_button_array,1 do 
		local button = defense_button_array[i]
		local cost = button.cost
		if cost <= event.energy then 
			button:enable()
		else 
			button:disable()
		end 
	end
end 
Runtime:addEventListener( "energy", enable_disable_buttons )

local function select_defense_button()
	for i = 1, #defense_button_array, 1 do 
		local button = defense_button_array[i]
		if button.index == current_defense_type then 
			button.shape.strokeWidth = 3 
			defense.set_selected_defense( i )
		else
			button.shape.strokeWidth = 0 
		end 
	end
end

local function on_touch( event )
	if event.phase == "began" then 
		audio.play( select_sound )
		for i = 1, #defense_button_array do 
			if defense_button_array[i] == event.target then 
				defense_button_array[i]:select()
				defense.set_selected_defense( i )
			else
				defense_button_array[i]:deselect()
			end 
		end 
	end
	return true 
end 

local function make_defense_buttons()
	local defense_type_array = defense.get_types()
	for i = 1, #defense_type_array do 
		local button = defense_button.make( defense_type_array[i].name, 
											defense_type_array[i].cost, 
											defense_type_array[i].id )
		button.y = ( i - 1 ) * ( button.contentHeight + 10 )
		defense_button_group:insert( button )
		button:addEventListener( "touch", on_touch )
		defense_button_array[ #defense_button_array + 1 ] = button
	end 
	defense_button_array[1]:select()
end
-----------------------------------------------------------------------------------------
local function get_selected_defense()
	return selected_defense
end 
M.get_selected_defense = get_selected_defense

local function get_view()
	return defense_button_group
end 
M.get_view = get_view

local function get_selected()
	return selected_defense
end 
M.get_selected = get_selected

local function build()
	defense_button_group = display.newGroup()
	make_defense_buttons()
	select_sound = audio.loadSound( "sound/defense-select.wav" )
	return defense_button_group
end 
M.build = build

local function destroy()
	for i = #defense_button_array, 1, -1 do 
		defense_button_array[i]:destroy()
		defense_button_array[i]:removeEventListener( "touch", on_touch )
		display.remove( table.remove( defense_button_array ) )
	end 
end 
M.destroy = destroy 
-----------------------------------------------------------------------------------------
return M 

