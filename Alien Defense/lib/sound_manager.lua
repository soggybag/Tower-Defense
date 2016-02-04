-----------------------------------------------------------------------------------------
-- 
-- sound_manager.lua
-- 
-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------------------------------------------------
local sound_item = require( "lib.sound_item" )
-----------------------------------------------------------------------------------------
--
-- Private properties 
-- 
-----------------------------------------------------------------------------------------

local sound_files = {
	sound_item.make( "alien_destroyed", "alien-destroyed.wav", false ),
	sound_item.make( "blip", "blip.wav", false ),
	sound_item.make( "defense_selected", "defense-select.wav", false ),
	sound_item.make( "eat_person", "eat-person.wav", false ),
	sound_item.make( "explosion_1", "Explosion-1.wav", false ),
	sound_item.make( "explosion_2", "Explosion-2.wav", false ),
	sound_item.make( "not_placed_defense", "not-placed-defense.wav", false ),
	sound_item.make( "place_defense", "place-defense.wav", false ),
	sound_item.make( "background_music", "RoccoW_-_DM1__LSDJ_Jam_Session.mp3", false ),
	sound_item.make( "shoot_1", "shoot-1.wav", false ),
	sound_item.make( "shoot_2", "shoot-2.wav", false ),
	sound_item.make( "shoot_3", "shoot-3.wav", false ),
	sound_item.make( "shoot_4", "shoot-4.wav", false ),
}
local sounds = {}




-----------------------------------------------------------------------------------------
-- 
-- Public methods 
-- 
-----------------------------------------------------------------------------------------


-- build 
-----------------------------------------------------------------------------------------
local function build()
	for i = 1, #sound_files do 
		local item = sound_files[i]
		if item.streaming then 
			-- streaming sound
			sounds[item.name].sound = audio.loadSound( item.file_name )
		else 
			-- loaded sounds
			sounds[item.name].sound = audio.loadStream( item.file_name )
		end 
	end 
end 
M.build = build



-- destroy
-----------------------------------------------------------------------------------------
local function destroy()
	audio.stop()
	for s,v in pairs( sounds ) do
		audio.dispose( sounds[s] )
		sounds[s] = nil
	end
	sounds = {}
end 
M.destroy = destroy
-----------------------------------------------------------------------------------------
return M