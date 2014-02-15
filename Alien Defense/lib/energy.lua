-- 
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
-- Variables 
local ENERGY_RECHARGE_RATE 	= 5 		-- Sets how much energy is added each interval
local ENERGY_TIMER_TIME 	= 1000		-- Sets the interval, in milliseconds 1000 = 1 sec

local energy = 0
local energy_timer 

-- Display Objects
local energy_text

-- Private methods
local function update()
	energy_text.text = energy
	energy_text.anchorX = 1
	Runtime:dispatchEvent( {name="energy", energy=energy} )
end 
-- Public methods
-----------------------------------------------------------------------------------------
local function get_view()
	return energy_text
end 
M.get_view = get_view

local function set_energy( n )
	energy = n
	update()
end
M.set_energy = set_energy

local function increment_energy( n )
	energy = energy + n
	update()
end 
M.increment_energy = increment_energy

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

local function start_timer()
	energy_timer = timer.performWithDelay( ENERGY_TIMER_TIME, function() 
		increment_energy( ENERGY_RECHARGE_RATE )
	end, -1 ) 
end 
M.start_timer = start_timer

local function stop_timer()
	timer.cancel( energy_timer )
end 
M.stop_timer = stop_timer

local function build()
	energy_text = display.newText( energy, 0, 0, "04B03", 24 )
	return energy_text
end 
M.build = build

local function destroy()
	stop_timer()
	display.remove( energy_text )
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M