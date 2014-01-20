local names = require( "names" )
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local WORLD_RADIUS = 32
local MIN_POP = 5000
local MAX_POP = 100000
-----------------------------------------------------------------------------------------
local world_array = {} -- = require( "dmc_autostore" ).data.worlds
-----------------------------------------------------------------------------------------
-- 48 - 57 -> 0 - 9
-- 65 - 90 -> A - Z uppercase
-- 97 - 122 -> a - z lowercase
local function random_letter()
	return string.char(math.random(65, 90)); -- 97 - 122 lower
end
local function random_planet_id()
	local str = ""
	for i = 1, 6 do 
		str = str .. random_letter()
	end 
	
	print( "World id:", str )
	
	return str
end 

-----------------------------------------------------------------------------------------
local function add()
	local world = {}
	world.population = math.random( MIN_POP, MAX_POP )
	world.color = {r=math.random(), g=math.random(), b=math.random()}
	world.name = names.random_name()
	world_array[ #world_array + 1 ] = world
	return world
end 
M.add = add 


local function get_name_at_index( index )
	return world_array[index].name
end 
M.get_name_at_index = get_name_at_index

local function get_color_at_index( index )
	return world_array[index].color
end 
M.get_color_at_index = get_color_at_index

local function get_population_at_index( index )
	return world_array[index].population
end 
M.get_population_at_index = get_population_at_index

local function iterate_worlds()
	local n = 0
	function iter()
		n = n + 1
		if n > #world_array then 
			return nil
		else
			return world_array[n]
		end
	end
	return iter
end
M.iterate_worlds = iterate_worlds

local function make( index )
	local world = display.newGroup()
	local world_sprite = display.newCircle( 0, 0, WORLD_RADIUS )
	
	world:insert( world_sprite )
	world_sprite:setFillColor( word_array[index].color.r, word_array[index].color.g, word_array[index].color.b )
	
	return world
end 
M.make = make

local function get_worlds()
	return worlds_array
end 
M.get_worlds = get_worlds
-----------------------------------------------------------------------------------------
return M







