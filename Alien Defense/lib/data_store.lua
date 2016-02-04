-----------------------------------------------------------------------------------------
-- 
-- data_store.lua 
-- 
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
local M = {}
-----------------------------------------------
local json = require( "json" )
-----------------------------------------------------------------------------------------
local FILE_NAME = "game_settings"
-----------------------------------------------




-----------------------------------------------------------------------------------------
-- 
-- Public methods 
-- 
-----------------------------------------------------------------------------------------


-- saveTable 
-- Saves game data as json 
-----------------------------------------------------------------------------------------
function saveTable( t )
    local path = system.pathForFile( FILE_NAME, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end

M.saveTable = saveTable



-- loadTable 
-- Loads game data as JSON
-----------------------------------------------------------------------------------------
function loadTable()
    local path = system.pathForFile( FILE_NAME, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then
         -- read all contents of file into a string
         local contents = file:read( "*a" )
         myTable = json.decode(contents)
         io.close( file )
         return myTable 
    end
    return nil
end
M.loadTable = loadTable
------------------------------------------------



-- load_settings 
-- Loads game settings 
-----------------------------------------------------------------------------------------
local function load_settings()
	return loadTable( FILE_NAME )
end 
M.load_settings = load_settings

-----------------------------------------------
return M