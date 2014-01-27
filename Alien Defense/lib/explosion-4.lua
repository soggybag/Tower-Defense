local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 40,
				y = 62,
				width = 3,
				height = 3
			},
		
			{
				x = 33,
				y = 62,
				width = 5,
				height = 5
			},
		
			{
				x = 23,
				y = 62,
				width = 8,
				height = 8
			},
		
			{
				x = 13,
				y = 62,
				width = 8,
				height = 8
			},
		
			{
				x = 0,
				y = 62,
				width = 11,
				height = 10
			},
		
			{
				x = 113,
				y = 48,
				width = 11,
				height = 10
			},
		
			{
				x = 101,
				y = 48,
				width = 10,
				height = 10
			},
		
			{
				x = 88,
				y = 48,
				width = 11,
				height = 10
			},
		
			{
				x = 75,
				y = 48,
				width = 11,
				height = 11
			},
		
			{
				x = 62,
				y = 48,
				width = 11,
				height = 11
			},
		
			{
				x = 48,
				y = 48,
				width = 12,
				height = 11
			},
		
			{
				x = 34,
				y = 48,
				width = 12,
				height = 11
			},
		
			{
				x = 20,
				y = 48,
				width = 12,
				height = 12
			},
		
			{
				x = 12,
				y = 48,
				width = 6,
				height = 6
			},
		
			{
				x = 0,
				y = 48,
				width = 10,
				height = 10
			},
		
			{
				x = 112,
				y = 26,
				width = 16,
				height = 15
			},
		
			{
				x = 92,
				y = 26,
				width = 18,
				height = 17
			},
		
			{
				x = 69,
				y = 26,
				width = 21,
				height = 19
			},
		
			{
				x = 46,
				y = 26,
				width = 21,
				height = 19
			},
		
			{
				x = 23,
				y = 26,
				width = 21,
				height = 19
			},
		
			{
				x = 0,
				y = 26,
				width = 21,
				height = 20
			},
		
			{
				x = 99,
				y = 0,
				width = 22,
				height = 22
			},
		
			{
				x = 75,
				y = 0,
				width = 22,
				height = 22
			},
		
			{
				x = 50,
				y = 0,
				width = 23,
				height = 22
			},
		
			{
				x = 25,
				y = 0,
				width = 23,
				height = 22
			},
		
			{
				x = 0,
				y = 0,
				width = 23,
				height = 24
			},
		
		},
		
		sheetContentWidth = 128,
		sheetContentHeight = 128
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M