local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 56,
				y = 17,
				width = 3,
				height = 3
			},
		
			{
				x = 47,
				y = 66,
				width = 11,
				height = 11
			},
		
			{
				x = 48,
				y = 24,
				width = 12,
				height = 11
			},
		
			{
				x = 67,
				y = 14,
				width = 12,
				height = 11
			},
		
			{
				x = 67,
				y = 0,
				width = 12,
				height = 12
			},
		
			{
				x = 49,
				y = 17,
				width = 5,
				height = 5
			},
		
			{
				x = 25,
				y = 64,
				width = 8,
				height = 8
			},
		
			{
				x = 35,
				y = 64,
				width = 8,
				height = 8
			},
		
			{
				x = 70,
				y = 40,
				width = 11,
				height = 10
			},
		
			{
				x = 60,
				y = 66,
				width = 11,
				height = 10
			},
		
			{
				x = 81,
				y = 24,
				width = 10,
				height = 10
			},
		
			{
				x = 81,
				y = 0,
				width = 11,
				height = 10
			},
		
			{
				x = 62,
				y = 27,
				width = 11,
				height = 11
			},
		
			{
				x = 48,
				y = 37,
				width = 6,
				height = 6
			},
		
			{
				x = 25,
				y = 0,
				width = 22,
				height = 22
			},
		
			{
				x = 0,
				y = 26,
				width = 23,
				height = 22
			},
		
			{
				x = 0,
				y = 50,
				width = 23,
				height = 22
			},
		
			{
				x = 0,
				y = 0,
				width = 23,
				height = 24
			},
		
			{
				x = 81,
				y = 12,
				width = 10,
				height = 10
			},
		
			{
				x = 49,
				y = 0,
				width = 16,
				height = 15
			},
		
			{
				x = 25,
				y = 45,
				width = 18,
				height = 17
			},
		
			{
				x = 47,
				y = 45,
				width = 21,
				height = 19
			},
		
			{
				x = 25,
				y = 24,
				width = 21,
				height = 19
			},
		
			{
				x = 0,
				y = 96,
				width = 21,
				height = 19
			},
		
			{
				x = 0,
				y = 74,
				width = 21,
				height = 20
			},
		
			{
				x = 23,
				y = 74,
				width = 22,
				height = 22
			},
		
		},
		
		sheetContentWidth = 128,
		sheetContentHeight = 128
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M