

-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local energy 			= require( "lib.energy" )
local bullet_manager 	= require( "lib.bullet_manager" )
local sprite_manager	= require( "lib.sprite-manager" )
-----------------------------------------------------------------------------------------
local selected_defense = 1
local defense_array = {}

local defense_type_array = {
			{id="satellite_1", name="04B",	rof=1000,	damage=1,	hits=10, cost=40, bullet_sprite="missile_1", sprite={start=1, count=1}, frame=1 },
			{id="satellite_2", name="X97",	rof=500,	damage=0.5,	hits=10, cost=50, bullet_sprite="missile_2", sprite={start=2, count=1}, frame=2 },
			{id="satellite_3", name="R37",	rof=2000,	damage=3,	hits=10, cost=60, bullet_sprite="missile_3", sprite={start=3, count=1}, frame=3 },
			{id="satellite_4", name="8UL",	rof=1500,	damage=0.5,	hits=10, cost=70, bullet_sprite="missile_4", sprite={start=4, count=1}, frame=4 }, 	
			{id="satellite_5", name="G70",	rof=250,	damage=0.3, hits=10, cost=20, bullet_sprite="missile_5", sprite={start=5, count=1}, frame=5 },
			{id="satellite_6", name="Z44",	rof=1000,	damage=1,	hits=10, cost=40, bullet_sprite="missile_6", sprite={start=1, count=1}, frame=1 },
			{id="satellite_7", name="9QU",	rof=500,	damage=0.5,	hits=10, cost=50, bullet_sprite="missile_7", sprite={start=2, count=1}, frame=2 },
			{id="satellite_8", name="PPX",	rof=2000,	damage=3,	hits=10, cost=60, bullet_sprite="missile_8", sprite={start=3, count=1}, frame=3 },
			{id="satellite_9", name="99T",	rof=2000,	damage=3,	hits=10, cost=60, bullet_sprite="missile_9", sprite={start=3, count=1}, frame=3 }
		}


local function remove_defense( defense )
	defense.tile.has_defense = false
	local index = table.indexOf( defense_array, defense ) 
	timer.cancel( defense.timer )	
	table.remove( defense_array, index )				  
	display.remove( defense )
end 

-----------------------------------------------------------------------------------------
local function make( tile )
	local new_defense = nil
	if energy.get_energy( defense_type_array[selected_defense].cost ) then 
		local new_defense = sprite_manager.get_sprite_by_name( defense_type_array[selected_defense].id )
		
		new_defense:play()
	
		new_defense.tile 			= tile
		new_defense.rof 		 	= defense_type_array[selected_defense].rof
		new_defense.damage 		 	= defense_type_array[selected_defense].damage
		new_defense.hits 		 	= defense_type_array[selected_defense].hits
		new_defense.defense_name 	= defense_type_array[selected_defense].name
		new_defense.bullet_sprite	= defense_type_array[selected_defense].bullet_sprite
		
		new_defense.timer = timer.performWithDelay( new_defense.rof, function() 
			-- defense_defend( defense ) 
			bullet_manager.make( new_defense.x, new_defense.y, new_defense.damage, new_defense.bullet_sprite )
		end, -1 )
		defense_array[ #defense_array + 1 ] = new_defense
		
		function new_defense:hit( damage )
			self.hits = self.hits - damage
			if self.hits > 0 then 
				return false -- return false this defense was not removed
			else 
				remove_defense( self )
				return true -- return true this defense was removed
			end 
		end 
		
		return new_defense
	else 
		return nil 
	end 
end 
M.make = make


local function set_props_by_name( base_name, base_rof, base_damage, base_cost )
	for i = 1, #defense_type_array do 
		if defense_type_array[i].name == base_name then 
			defense_type_array[i].rof = base_rof
			defense_type_array[i].damage = base_damage
			defense_type_array[i].cost = base_cost
			break
		end 
	end 
end 
M.set_props_by_name = set_props_by_name

local function get_types()
	return defense_type_array
end 
M.get_types = get_types

local function get_cost()
	return defense_type_array[ selected_defense ].cost
end 
M.get_cost = get_cost

local function get_name()
	return defense_type_array[ selected_defense ].name
end 
M.get_name = get_name

local function get_rof()
	return defense_type_array[ selected_defense ].rof
end 
M.get_rof = get_rof

local function set_selected_defense( id )
	selected_defense = id
end
M.set_selected_defense = set_selected_defense

local function stop_timers()
	for i = #defense_array, 1, -1 do 
		timer.cancel( defense_array[i].timer )
	end 
end 
M.stop_timers = stop_timers

local function destroy()
	stop_timers()
	for i = #defense_array, 1, -1 do 
		display.remove( table.remove( defense_array[i] ) )
	end 
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M