-----------------------------------------------------------------------------------------
-- 
-- energy.lua
--
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------

local worlds = require( "lib.worlds" )



-----------------------------------------------------------------------------------------
--
-- Private properties 
--
-----------------------------------------------------------------------------------------

local ENERGY_RECHARGE_RATE 	= 5 		-- Sets how much energy is added each interval
local ENERGY_TIMER_TIME 	= 1000		-- Sets the interval, in milliseconds 1000 = 1 sec

local energy = 0
local energy_timer 

local world_index = 1

-- Display Objects
local energy_text


-----------------------------------------------------------------------------------------
--
-- Private methods
--
-----------------------------------------------------------------------------------------

local function update()
	energy_text.text = math.floor( energy )
	Runtime:dispatchEvent( {name="energy", energy=energy} )
end 

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
--
-- Public methods
--
-----------------------------------------------------------------------------------------


-- Get View 
-----------------------------------------------------------------------------------------
local function get_view()
	return energy_text
end 
M.get_view = get_view
-----------------------------------------------------------------------------------------


-- Set energy
-----------------------------------------------------------------------------------------
local function set_energy( n )
	energy = n
	update()
end
M.set_energy = set_energy
-----------------------------------------------------------------------------------------


-- Get Energy generated at world 
-----------------------------------------------------------------------------------------
local function get_energy_generated_at_world()
	-- get_population_at_index
	-- 
end 
M.get_energy_generated_at_world = get_energy_generated_at_world
-----------------------------------------------------------------------------------------


-- increment_energy
-----------------------------------------------------------------------------------------
local function increment_energy( n )
	local new_energy = worlds.generate_energy_at_index_world( world_index )
	energy = energy + new_energy
	
	print( "Energy:", energy, "new energy:", new_energy )
	update()
end 
M.increment_energy = increment_energy
-----------------------------------------------------------------------------------------


-- get_energy
-----------------------------------------------------------------------------------------
local function get_energy( n )
	if n <= energy then 
		energy = energy - n
		update()
		return energy
	else
		return nil
	end 
end 
M.get_energy = get_energy
-----------------------------------------------------------------------------------------


-- generate_energy_from_population
-----------------------------------------------------------------------------------------
local function generate_energy_from_population()
	-- get_population_at_index
	worlds.get_population_at_index( world_index )
end 
M.generate_energy_from_population = generate_energy_from_population


-- start_timer
-----------------------------------------------------------------------------------------
local function start_timer()
	energy_timer = timer.performWithDelay( ENERGY_TIMER_TIME, function() 
		increment_energy( ENERGY_RECHARGE_RATE )
	end, -1 ) 
end 
M.start_timer = start_timer
-----------------------------------------------------------------------------------------


-- stop_timer
-----------------------------------------------------------------------------------------
local function stop_timer()
	timer.cancel( energy_timer )
end 
M.stop_timer = stop_timer
-----------------------------------------------------------------------------------------


-- build 
-----------------------------------------------------------------------------------------
local function build( index )
	world_index = index
	energy_text = display.newText( energy, 0, 0, "04B03", 24 )
	energy_text.anchorX = 1
	return energy_text
end 
M.build = build
-----------------------------------------------------------------------------------------




-----------------------------------------------------------------------------------------
local function destroy()
	stop_timer()
	display.remove( energy_text )
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M