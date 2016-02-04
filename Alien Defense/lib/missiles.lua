-----------------------------------------------------------------------------------------
-- 
-- missiles.lua
-- 
-----------------------------------------------------------------------------------------


local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 46,
				y = 29,
				width = 4,
				height = 11
			},
		
			{
				x = 46,
				y = 72,
				width = 10,
				height = 11
			},
		
			{
				x = 46,
				y = 44,
				width = 12,
				height = 13
			},
		
			{
				x = 14,
				y = 79,
				width = 12,
				height = 14
			},
		
			{
				x = 46,
				y = 59,
				width = 11,
				height = 11
			},
		
			{
				x = 14,
				y = 95,
				width = 8,
				height = 11
			},
		
			{
				x = 14,
				y = 108,
				width = 8,
				height = 10
			},
		
			{
				x = 48,
				y = 85,
				width = 8,
				height = 11
			},
		
			{
				x = 38,
				y = 85,
				width = 8,
				height = 11
			},
		
			{
				x = 28,
				y = 81,
				width = 8,
				height = 12
			},
		
			{
				x = 24,
				y = 95,
				width = 8,
				height = 11
			},
		
			{
				x = 32,
				y = 29,
				width = 12,
				height = 50
			},
		
			{
				x = 18,
				y = 26,
				width = 12,
				height = 51
			},
		
			{
				x = 0,
				y = 79,
				width = 12,
				height = 49
			},
		
			{
				x = 0,
				y = 27,
				width = 12,
				height = 50
			},
		
			{
				x = 53,
				y = 0,
				width = 11,
				height = 42
			},
		
			{
				x = 36,
				y = 0,
				width = 15,
				height = 27
			},
		
			{
				x = 0,
				y = 0,
				width = 16,
				height = 25
			},
		
			{
				x = 18,
				y = 0,
				width = 16,
				height = 24
			},
		
		},
		
		sheetContentWidth = 64,
		sheetContentHeight = 128
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M