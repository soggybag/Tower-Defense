
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local sprite_sheet = graphics.newImageSheet( "Satellites.png", {width=34, height=34, numFrames=25} )
-----------------------------------------------------------------------------------------
local function make( name, cost, frame )
	local button_group = display.newGroup()
	button_group.enabled = false 
	button_group.name = name
	button_group.cost = cost
	
	local button = display.newRoundedRect( 0, 0, 40, 40, 6 )
	button:setFillColor( 0.5, 0.5, 0.5, 0.5 )
	button:setStrokeColor( 0.8, 0.8, 0.8, 0.8 )
	
	local sprite = display.newImage( sprite_sheet, frame )
	
	local name_text = display.newText( name, 0, 0, "04B03", 16 ) 
	name_text.x = 0	
	name_text.y = 0
	
	-- Add a name label to each button
	local cost_text = display.newText( cost, 0, 0,"04B03", 8 )
	cost_text.x = 0
	cost_text.y = 12
	
	button_group:insert( button )
	button_group:insert( sprite ) 		
	button_group:insert( name_text ) 	
	button_group:insert( cost_text ) -- insert button into group
	
	button_group.button = button
	button_group.name_text = name_text   
	button_group.cost_text = cost_text  
	button_group.sprite = sprite    
	
	function button_group:enable()
		self.enabled = true
		self.alpha = 1
	end 
	
	function button_group:disable()
		self.enabled = false
		self.alpha = 0.5
	end
	
	function button_group:select()
		self.button.strokeWidth = 3
	end 
	
	function button_group:deselect()
		self.button.strokeWidth = 0
	end 
	
	function button_group:destroy()
		display.remove( self.button )
		display.remove( self.name_text )   
		display.remove( self.cost_text )  
		display.remove( self.sprite )  
	end
	
	button_group:disable()
	
	return button_group
end
M.make = make

-----------------------------------------------------------------------------------------
return M