local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 0,
				y = 0,
				width = 3,
				height = 3
			},
		
			{
				x = 5,
				y = 0,
				width = 5,
				height = 5
			},
		
			{
				x = 12,
				y = 0,
				width = 8,
				height = 8
			},
		
			{
				x = 22,
				y = 0,
				width = 8,
				height = 8
			},
		
			{
				x = 32,
				y = 0,
				width = 11,
				height = 10
			},
		
			{
				x = 45,
				y = 0,
				width = 11,
				height = 10
			},
		
			{
				x = 58,
				y = 0,
				width = 10,
				height = 10
			},
		
			{
				x = 70,
				y = 0,
				width = 11,
				height = 10
			},
		
			{
				x = 83,
				y = 0,
				width = 11,
				height = 11
			},
		
			{
				x = 96,
				y = 0,
				width = 11,
				height = 11
			},
		
			{
				x = 109,
				y = 0,
				width = 12,
				height = 11
			},
		
			{
				x = 123,
				y = 0,
				width = 12,
				height = 11
			},
		
			{
				x = 137,
				y = 0,
				width = 12,
				height = 12
			},
		
			{
				x = 151,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 185,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 219,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 253,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 287,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 321,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 355,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 389,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 423,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 457,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 491,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 525,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 559,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 593,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 627,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 661,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 695,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 729,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 763,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 797,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 831,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 865,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 899,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 933,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 967,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 732,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 750,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 768,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 786,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 804,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 822,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 840,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 858,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 876,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 894,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 912,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 930,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 948,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 966,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 984,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 1002,
				y = 136,
				width = 16,
				height = 16
			},
		
			{
				x = 0,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 18,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 36,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 54,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 72,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 90,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 108,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 126,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 144,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 162,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 180,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 198,
				y = 170,
				width = 16,
				height = 16
			},
		
			{
				x = 216,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 252,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 288,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 324,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 360,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 396,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 432,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 468,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 504,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 540,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 576,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 612,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 648,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 684,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 720,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 756,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 792,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 828,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 864,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 900,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 936,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 972,
				y = 170,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 72,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 108,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 144,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 180,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 216,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 252,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 288,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 324,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 360,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 396,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 432,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 468,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 504,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 540,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 576,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 612,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 648,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 684,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 720,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 756,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 792,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 828,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 864,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 900,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 936,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 972,
				y = 206,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 72,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 108,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 144,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 180,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 216,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 252,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 288,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 324,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 360,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 396,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 432,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 468,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 504,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 540,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 576,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 612,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 648,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 684,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 720,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 756,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 792,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 828,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 864,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 900,
				y = 242,
				width = 34,
				height = 34
			},
		
			{
				x = 936,
				y = 242,
				width = 6,
				height = 6
			},
		
			{
				x = 944,
				y = 242,
				width = 10,
				height = 10
			},
		
			{
				x = 956,
				y = 242,
				width = 16,
				height = 15
			},
		
			{
				x = 974,
				y = 242,
				width = 18,
				height = 17
			},
		
			{
				x = 994,
				y = 242,
				width = 21,
				height = 19
			},
		
			{
				x = 0,
				y = 278,
				width = 21,
				height = 19
			},
		
			{
				x = 23,
				y = 278,
				width = 21,
				height = 19
			},
		
			{
				x = 46,
				y = 278,
				width = 21,
				height = 20
			},
		
			{
				x = 69,
				y = 278,
				width = 22,
				height = 22
			},
		
			{
				x = 93,
				y = 278,
				width = 22,
				height = 22
			},
		
			{
				x = 117,
				y = 278,
				width = 23,
				height = 22
			},
		
			{
				x = 142,
				y = 278,
				width = 23,
				height = 22
			},
		
			{
				x = 167,
				y = 278,
				width = 23,
				height = 24
			},
		
			{
				x = 192,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 201,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 210,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 219,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 228,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 237,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 246,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 255,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 264,
				y = 278,
				width = 7,
				height = 7
			},
		
			{
				x = 273,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 307,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 341,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 375,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 409,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 443,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 477,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 511,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 545,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 579,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 613,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 647,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 681,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 715,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 749,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 783,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 817,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 851,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 885,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 919,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 953,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 987,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 312,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 380,
				width = 4,
				height = 11
			},
		
			{
				x = 244,
				y = 380,
				width = 10,
				height = 11
			},
		
			{
				x = 256,
				y = 380,
				width = 12,
				height = 13
			},
		
			{
				x = 270,
				y = 380,
				width = 12,
				height = 14
			},
		
			{
				x = 284,
				y = 380,
				width = 11,
				height = 11
			},
		
			{
				x = 297,
				y = 380,
				width = 8,
				height = 11
			},
		
			{
				x = 307,
				y = 380,
				width = 8,
				height = 10
			},
		
			{
				x = 317,
				y = 380,
				width = 8,
				height = 11
			},
		
			{
				x = 327,
				y = 380,
				width = 8,
				height = 11
			},
		
			{
				x = 337,
				y = 380,
				width = 8,
				height = 12
			},
		
			{
				x = 347,
				y = 380,
				width = 8,
				height = 11
			},
		
			{
				x = 357,
				y = 380,
				width = 12,
				height = 50
			},
		
			{
				x = 371,
				y = 380,
				width = 12,
				height = 51
			},
		
			{
				x = 385,
				y = 380,
				width = 12,
				height = 49
			},
		
			{
				x = 399,
				y = 380,
				width = 12,
				height = 50
			},
		
			{
				x = 413,
				y = 380,
				width = 11,
				height = 42
			},
		
			{
				x = 426,
				y = 380,
				width = 15,
				height = 27
			},
		
			{
				x = 443,
				y = 380,
				width = 16,
				height = 25
			},
		
			{
				x = 461,
				y = 380,
				width = 16,
				height = 24
			},
		
			{
				x = 479,
				y = 380,
				width = 40,
				height = 40
			},
		
			{
				x = 521,
				y = 380,
				width = 72,
				height = 72
			},
		
		},
		
		sheetContentWidth = 1024,
		sheetContentHeight = 512
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M