-- ======================================================================================
-- 
-- Collision Manager 
-- 
-- Checks collisions between bullets and aliens. 
-- Creates explosions 
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local alien = require( "lib.alien" )
local bullet_manager = require( "lib.bullet_manager" )
local sprite_manager = require( "lib.sprite-manager" )
-----------------------------------------------------------------------------------------
local explosion_type_array = {
	{start=1, count=13},	-- Small Explosion	
	{start=14, count=13}	-- Larger explosion
}

local collision_view


-----------------------------------------------------------------------------------------
local function make_explosion( x, y, explosion_type )
	local explosion = sprite_manager.get_sprite_by_name( explosion_type )
	collision_view:insert( explosion )
	explosion.x = x
	explosion.y = y
	explosion:play()
	explosion:addEventListener( "sprite", function( event ) 
		if event.phase == "loop" then 
			display.remove( event.target )
		end 
	end  )
end

local function make_explosion_multi( x, y, n )
	for i = 1, n do 
		timer.performWithDelay( 100 * i, function( event ) 
			make_explosion( x + math.random( 20 ) - 10, y + math.random( 20 ) - 10, "explosion_small" )
		end )
	end 
end 

local function hit_test( bullet, alien )
	local x, y = bullet.x, bullet.y
	local bounds = alien.contentBounds
	local l, t, r, b = bounds.xMin, bounds.yMin, bounds.xMax, bounds.yMax
	if x > l and x < r and y > t and y < b then 
		return true
	end 
	return false
end

-----------------------------------------------------------------------------------------
local function set_view( view )
	collision_view = view 
end 
M.set_view = set_view

local function update()
	local alien_array = alien.get_array()
	local bullet_array = bullet_manager.get_array()
	for a = #alien_array, 1, -1 do 
		local alien = alien_array[a]
		for b = #bullet_array, 1, -1 do 
			local bullet = bullet_array[b]
			if hit_test( bullet, alien ) then 
				if alien:hit( bullet.damage ) then 
					table.remove( alien_array, a )
					make_explosion( bullet.x, bullet.y, "explosion_big" )
					make_explosion_multi( bullet.x, bullet.y, 6 )
				else
					make_explosion( bullet.x, bullet.y, "explosion_small" )
				end 
				table.remove( bullet_array, b )
				display.remove( bullet )
			end 
		end 
	end 
end 
M.update = update
-----------------------------------------------------------------------------------------
return M