
-------------------------------------------------------------------------------
local M = {}
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
local sprite_sheet = graphics.newImageSheet( "images/Alien-All.png", {width=34, height=34, numFrames=80} )
local eat_person_sound
-------------------------------------------------------------------------------
local PEOPLE_SIZE = {width=3, height=6}
local PEOPLE_SCALE = 0.5

local people = 10000
local people_array = {}
local people_alien_array = {}

local people_view 
local people_text
local people_limit_left = 10
local people_limit_right = display.contentWidth - 60
------------------------------------------------------------------------------
local function update_people_count()
	if people_text ~= nil then 
		people_text.text = people
	end 
end 

local function eat_person()
	-- play munching sound
	-- display an animation at the location of person eaten
	people = people - 1000
	update_people_count()
	if #people_array > 0 then 
		audio.play( eat_person_sound )
		display.remove( table.remove( people_array, math.random( #people_array ) ) )
	else 
		
	end 
end 

local function person()
	local p = display.newRect( 0, 0, PEOPLE_SIZE.width, PEOPLE_SIZE.height )
	if math.random( 2 ) > 1 then 
		p.direction = 1
	else 
		p.direction = -1
	end 
	
	function p:move()
		self.x = self.x + self.direction
		if self.x < people_limit_left or self.x > people_limit_right then 
			self.direction = self.direction * -1
		end
	end 
	
	people_array[ #people_array + 1 ] = p
	return p 
end 

local function make_alien( alien_options )
	local a = display.newSprite( sprite_sheet, alien_options )
	a:play()
	people_view:insert( a )
	people_alien_array[ #people_alien_array+1 ] = a
	a.x = -16
	a.y = display.contentHeight - PEOPLE_SIZE.height * 3
	a.xScale = PEOPLE_SCALE
	a.yScale = PEOPLE_SCALE
	a.direction = 1
	a.target_x = math.random( people_limit_left, people_limit_right )
	
	function a:move() 
		if self.direction == 1 then 
			self.x = self.x + 1
			if self.x >= self.target_x then 
				-- remove person
				self.direction = -1
				eat_person()
			end 
		else 
			self.x = self.x - 1
			if self.x < -10 then 
				return true -- return true Yes remove this alien 
			end 
		end 
	end 
	return false -- return false do not remove this yet
end 
M.make_alien = make_alien
------------------------------------------------------------------------------
local function get_people()
	return people
end 
M.get_people = get_people 
local function update()
	for i = #people_array, 1, -1 do 
		people_array[i]:move()
	end 
	
	for i = #people_alien_array, 1, -1 do 
		if people_alien_array[i]:move() then -- move returned true remove this 
			display.remove( table.remove( people_alien_array, i ) )
		end 
	end 
end 
M.update = update

local function make()
	local count = math.ceil( people / 1000 )
	for i = 1, count do 
		local p = person()
		people_view:insert( p )
		p.x = math.random( people_limit_left, people_limit_right ) 
		p.y = display.contentHeight - PEOPLE_SIZE.height
	end 
end 
M.make = make

local function set_people( n )
	people = n
	update_people_count()
	-- need to update people on ground **********
end 
M.set_people = set_people

local function build()
	eat_person_sound = audio.loadSound( "sound/eat-person.wav" )
	people_text = display.newText( people, 0, 0, "04B03", 16 )
	people_text.anchorX = 1
	people_text.x = display.contentWidth - 60
	people_text.y = display.contentHeight - PEOPLE_SIZE.height * 3 
	set_people( 10000 )
	make()
end 
M.build = build

local function set_view( view )
	people_view = view
end 
M.set_view = set_view 
local function clear_people()
	for i = #people_array, 1, -1 do 
		display.remove( table.remove( people_array, i ) )
	end 
end 
M.clear_people = clear_people
local function clear_aliens()
	for i = #people_alien_array, 1, -1 do 
		display.remove( table.remove( people_alien_array, i ) )
	end 
end 
M.clear_aliens = clear_aliens
local function destroy()
	clear_aliens()
	clear_people()
	display.remove( people_text )
end 
M.destroy = destroy
------------------------------------------------------------------------------
return M