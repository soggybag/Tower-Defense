local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 238,
				y = 340,
				width = 32,
				height = 32
			},
		
			{
				x = 482,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 320,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 850,
				width = 32,
				height = 32
			},
		
			{
				x = 150,
				y = 184,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 374,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 794,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 493,
				width = 32,
				height = 32
			},
		
			{
				x = 95,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 762,
				width = 32,
				height = 32
			},
		
			{
				x = 490,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 626,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 935,
				width = 32,
				height = 32
			},
		
			{
				x = 129,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 550,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 612,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 624,
				width = 32,
				height = 32
			},
		
			{
				x = 252,
				y = 111,
				width = 32,
				height = 32
			},
		
			{
				x = 422,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 864,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 78,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 938,
				width = 32,
				height = 32
			},
		
			{
				x = 286,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 326,
				width = 32,
				height = 32
			},
		
			{
				x = 27,
				y = 74,
				width = 32,
				height = 32
			},
		
			{
				x = 61,
				y = 74,
				width = 32,
				height = 32
			},
		
			{
				x = 184,
				y = 183,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 714,
				width = 32,
				height = 32
			},
		
			{
				x = 686,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 830,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 163,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 680,
				width = 32,
				height = 32
			},
		
			{
				x = 74,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 82,
				y = 185,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 870,
				width = 32,
				height = 32
			},
		
			{
				x = 958,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 979,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 598,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 459,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 284,
				width = 32,
				height = 32
			},
		
			{
				x = 414,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 435,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 700,
				width = 32,
				height = 32
			},
		
			{
				x = 490,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 970,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 564,
				width = 32,
				height = 32
			},
		
			{
				x = 945,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 244,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 592,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 765,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 768,
				width = 32,
				height = 32
			},
		
			{
				x = 367,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 530,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 850,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 360,
				width = 32,
				height = 32
			},
		
			{
				x = 48,
				y = 220,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 918,
				width = 32,
				height = 32
			},
		
			{
				x = 952,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 734,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 800,
				width = 32,
				height = 32
			},
		
			{
				x = 150,
				y = 116,
				width = 32,
				height = 32
			},
		
			{
				x = 354,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 318,
				width = 32,
				height = 32
			},
		
			{
				x = 180,
				y = 274,
				width = 32,
				height = 32
			},
		
			{
				x = 482,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 524,
				width = 32,
				height = 32
			},
		
			{
				x = 864,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 490,
				width = 32,
				height = 32
			},
		
			{
				x = 278,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 333,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 388,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 392,
				width = 32,
				height = 32
			},
		
			{
				x = 707,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 762,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 320,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 116,
				y = 116,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 442,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 391,
				width = 32,
				height = 32
			},
		
			{
				x = 660,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 741,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 694,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 612,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 428,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 938,
				width = 32,
				height = 32
			},
		
			{
				x = 380,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 762,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 14,
				y = 186,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 796,
				width = 32,
				height = 32
			},
		
			{
				x = 558,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 663,
				width = 32,
				height = 32
			},
		
			{
				x = 986,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 74,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 592,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 394,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 969,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 428,
				width = 32,
				height = 32
			},
		
			{
				x = 884,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 833,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 488,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 476,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 864,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 782,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 326,
				width = 32,
				height = 32
			},
		
			{
				x = 898,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 278,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 830,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 666,
				width = 32,
				height = 32
			},
		
			{
				x = 728,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 346,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 592,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 176,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 632,
				width = 32,
				height = 32
			},
		
			{
				x = 843,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 462,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 830,
				width = 32,
				height = 32
			},
		
			{
				x = 456,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 214,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 142,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 496,
				width = 32,
				height = 32
			},
		
			{
				x = 558,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 936,
				width = 32,
				height = 32
			},
		
			{
				x = 388,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 884,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 972,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 836,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 964,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 320,
				width = 32,
				height = 32
			},
		
			{
				x = 639,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 822,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 666,
				width = 32,
				height = 32
			},
		
			{
				x = 414,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 352,
				width = 32,
				height = 32
			},
		
			{
				x = 108,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 966,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 836,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 870,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 556,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 306,
				width = 32,
				height = 32
			},
		
			{
				x = 320,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 354,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 952,
				width = 32,
				height = 32
			},
		
			{
				x = 510,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 323,
				width = 32,
				height = 32
			},
		
			{
				x = 890,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 503,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 828,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 510,
				width = 32,
				height = 32
			},
		
			{
				x = 524,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 422,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 626,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 82,
				y = 151,
				width = 32,
				height = 32
			},
		
			{
				x = 728,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 938,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 694,
				width = 32,
				height = 32
			},
		
			{
				x = 244,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 629,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 306,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 680,
				width = 32,
				height = 32
			},
		
			{
				x = 932,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 822,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 286,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 748,
				width = 32,
				height = 32
			},
		
			{
				x = 14,
				y = 220,
				width = 32,
				height = 32
			},
		
			{
				x = 728,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 734,
				width = 32,
				height = 32
			},
		
			{
				x = 210,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 788,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 346,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 728,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 816,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 116,
				y = 184,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 360,
				width = 32,
				height = 32
			},
		
			{
				x = 218,
				y = 114,
				width = 32,
				height = 32
			},
		
			{
				x = 456,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 592,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 816,
				width = 32,
				height = 32
			},
		
			{
				x = 754,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 809,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 422,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 176,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 660,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 82,
				y = 117,
				width = 32,
				height = 32
			},
		
			{
				x = 796,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 732,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 595,
				width = 32,
				height = 32
			},
		
			{
				x = 830,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 558,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 358,
				width = 32,
				height = 32
			},
		
			{
				x = 516,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 82,
				y = 219,
				width = 32,
				height = 32
			},
		
			{
				x = 48,
				y = 118,
				width = 32,
				height = 32
			},
		
			{
				x = 680,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 630,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 564,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 340,
				width = 32,
				height = 32
			},
		
			{
				x = 14,
				y = 118,
				width = 32,
				height = 32
			},
		
			{
				x = 864,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 802,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 626,
				width = 32,
				height = 32
			},
		
			{
				x = 231,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 388,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 728,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 524,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 380,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 564,
				width = 32,
				height = 32
			},
		
			{
				x = 584,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 578,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 904,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 766,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 324,
				width = 32,
				height = 32
			},
		
			{
				x = 354,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 265,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 788,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 864,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 428,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 734,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 460,
				width = 32,
				height = 32
			},
		
			{
				x = 775,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 184,
				y = 217,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 697,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 986,
				width = 32,
				height = 32
			},
		
			{
				x = 694,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 836,
				width = 32,
				height = 32
			},
		
			{
				x = 490,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 796,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 652,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 286,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 561,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 972,
				width = 32,
				height = 32
			},
		
			{
				x = 898,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 700,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 760,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 768,
				width = 32,
				height = 32
			},
		
			{
				x = 830,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 714,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 496,
				width = 32,
				height = 32
			},
		
			{
				x = 197,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 802,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 632,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 666,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 528,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 938,
				width = 32,
				height = 32
			},
		
			{
				x = 48,
				y = 152,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 802,
				width = 32,
				height = 32
			},
		
			{
				x = 660,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 802,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 898,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 530,
				width = 32,
				height = 32
			},
		
			{
				x = 44,
				y = 280,
				width = 32,
				height = 32
			},
		
			{
				x = 286,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 428,
				width = 32,
				height = 32
			},
		
			{
				x = 694,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 530,
				width = 32,
				height = 32
			},
		
			{
				x = 932,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 490,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 394,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 522,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 494,
				width = 32,
				height = 32
			},
		
			{
				x = 146,
				y = 276,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 562,
				width = 32,
				height = 32
			},
		
			{
				x = 354,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 870,
				width = 32,
				height = 32
			},
		
			{
				x = 856,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 320,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 422,
				width = 32,
				height = 32
			},
		
			{
				x = 112,
				y = 277,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 456,
				width = 32,
				height = 32
			},
		
			{
				x = 646,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 720,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 388,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 462,
				width = 32,
				height = 32
			},
		
			{
				x = 720,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 986,
				width = 32,
				height = 32
			},
		
			{
				x = 924,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 658,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 868,
				width = 32,
				height = 32
			},
		
			{
				x = 469,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 312,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 626,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 306,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 862,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 904,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 904,
				width = 32,
				height = 32
			},
		
			{
				x = 992,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 612,
				width = 32,
				height = 32
			},
		
			{
				x = 218,
				y = 182,
				width = 32,
				height = 32
			},
		
			{
				x = 150,
				y = 150,
				width = 32,
				height = 32
			},
		
			{
				x = 524,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 850,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 728,
				width = 32,
				height = 32
			},
		
			{
				x = 762,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 527,
				width = 32,
				height = 32
			},
		
			{
				x = 890,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 834,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 972,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 700,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 425,
				width = 32,
				height = 32
			},
		
			{
				x = 578,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 592,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 248,
				y = 250,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 930,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 646,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 698,
				width = 32,
				height = 32
			},
		
			{
				x = 966,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 116,
				y = 218,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 884,
				width = 32,
				height = 32
			},
		
			{
				x = 918,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 618,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 150,
				y = 218,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 870,
				width = 32,
				height = 32
			},
		
			{
				x = 605,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 898,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 966,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 286,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 796,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 646,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 564,
				width = 32,
				height = 32
			},
		
			{
				x = 524,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 516,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 992,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 496,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 904,
				width = 32,
				height = 32
			},
		
			{
				x = 388,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 537,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 571,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 867,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 726,
				width = 32,
				height = 32
			},
		
			{
				x = 924,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 394,
				width = 32,
				height = 32
			},
		
			{
				x = 932,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 544,
				width = 32,
				height = 32
			},
		
			{
				x = 544,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 796,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 898,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 877,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 252,
				y = 179,
				width = 32,
				height = 32
			},
		
			{
				x = 584,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 598,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 408,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 632,
				width = 32,
				height = 32
			},
		
			{
				x = 422,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 354,
				width = 32,
				height = 32
			},
		
			{
				x = 686,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 496,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 734,
				width = 32,
				height = 32
			},
		
			{
				x = 456,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 754,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 626,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 796,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 558,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 476,
				width = 32,
				height = 32
			},
		
			{
				x = 456,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 462,
				width = 32,
				height = 32
			},
		
			{
				x = 210,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 184,
				y = 115,
				width = 32,
				height = 32
			},
		
			{
				x = 448,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 490,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 911,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 598,
				width = 32,
				height = 32
			},
		
			{
				x = 898,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 664,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 306,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 388,
				width = 32,
				height = 32
			},
		
			{
				x = 116,
				y = 150,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 578,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 902,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 510,
				width = 32,
				height = 32
			},
		
			{
				x = 652,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 626,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 401,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 184,
				y = 149,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 918,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 816,
				width = 32,
				height = 32
			},
		
			{
				x = 354,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 966,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 426,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 386,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 524,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 592,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 692,
				width = 32,
				height = 32
			},
		
			{
				x = 550,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 901,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 694,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 360,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 320,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 590,
				width = 32,
				height = 32
			},
		
			{
				x = 252,
				y = 145,
				width = 32,
				height = 32
			},
		
			{
				x = 142,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 252,
				y = 213,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 374,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 357,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 748,
				width = 32,
				height = 32
			},
		
			{
				x = 218,
				y = 216,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 768,
				width = 32,
				height = 32
			},
		
			{
				x = 830,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 72,
				y = 108,
				width = 5,
				height = 7
			},
		
			{
				x = 89,
				y = 108,
				width = 3,
				height = 7
			},
		
			{
				x = 79,
				y = 108,
				width = 3,
				height = 7
			},
		
			{
				x = 241,
				y = 102,
				width = 3,
				height = 7
			},
		
			{
				x = 65,
				y = 108,
				width = 5,
				height = 7
			},
		
			{
				x = 251,
				y = 102,
				width = 3,
				height = 7
			},
		
			{
				x = 84,
				y = 108,
				width = 3,
				height = 7
			},
		
			{
				x = 236,
				y = 102,
				width = 3,
				height = 7
			},
		
			{
				x = 94,
				y = 108,
				width = 3,
				height = 7
			},
		
			{
				x = 246,
				y = 102,
				width = 3,
				height = 7
			},
		
			{
				x = 0,
				y = 462,
				width = 32,
				height = 32
			},
		
			{
				x = 448,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 530,
				width = 32,
				height = 32
			},
		
			{
				x = 856,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 864,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 748,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 952,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 714,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 660,
				width = 32,
				height = 32
			},
		
			{
				x = 673,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 326,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 326,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 632,
				width = 32,
				height = 32
			},
		
			{
				x = 966,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 700,
				width = 32,
				height = 32
			},
		
			{
				x = 422,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 544,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 558,
				width = 32,
				height = 32
			},
		
			{
				x = 299,
				y = 68,
				width = 32,
				height = 32
			},
		
			{
				x = 618,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 799,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 972,
				width = 32,
				height = 32
			},
		
			{
				x = 932,
				y = 102,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 408,
				width = 32,
				height = 32
			},
		
			{
				x = 694,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 14,
				y = 152,
				width = 32,
				height = 32
			},
		
			{
				x = 218,
				y = 148,
				width = 32,
				height = 32
			},
		
			{
				x = 204,
				y = 932,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 454,
				width = 32,
				height = 32
			},
		
			{
				x = 558,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 666,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 896,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 596,
				width = 32,
				height = 32
			},
		
			{
				x = 48,
				y = 186,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 731,
				width = 32,
				height = 32
			},
		
			{
				x = 456,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 312,
				y = 0,
				width = 32,
				height = 32
			},
		
			{
				x = 782,
				y = 272,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 598,
				width = 32,
				height = 32
			},
		
			{
				x = 34,
				y = 360,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 394,
				width = 32,
				height = 32
			},
		
			{
				x = 660,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 660,
				y = 170,
				width = 32,
				height = 32
			},
		
			{
				x = 762,
				y = 136,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 442,
				width = 32,
				height = 32
			},
		
			{
				x = 762,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 836,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 782,
				width = 32,
				height = 32
			},
		
			{
				x = 932,
				y = 204,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 420,
				width = 32,
				height = 32
			},
		
			{
				x = 966,
				y = 238,
				width = 32,
				height = 32
			},
		
			{
				x = 108,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 958,
				y = 34,
				width = 32,
				height = 32
			},
		
			{
				x = 68,
				y = 768,
				width = 32,
				height = 32
			},
		
			{
				x = 760,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 664,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 792,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 472,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 696,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 408,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 856,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 632,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 728,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 504,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 600,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 440,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 536,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 824,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 568,
				y = 306,
				width = 30,
				height = 30
			},
		
			{
				x = 207,
				y = 102,
				width = 4,
				height = 11
			},
		
			{
				x = 155,
				y = 102,
				width = 10,
				height = 11
			},
		
			{
				x = 99,
				y = 102,
				width = 12,
				height = 13
			},
		
			{
				x = 219,
				y = 250,
				width = 12,
				height = 14
			},
		
			{
				x = 159,
				y = 310,
				width = 11,
				height = 11
			},
		
			{
				x = 187,
				y = 102,
				width = 8,
				height = 11
			},
		
			{
				x = 226,
				y = 102,
				width = 8,
				height = 10
			},
		
			{
				x = 197,
				y = 102,
				width = 8,
				height = 11
			},
		
			{
				x = 177,
				y = 102,
				width = 8,
				height = 11
			},
		
			{
				x = 145,
				y = 102,
				width = 8,
				height = 12
			},
		
			{
				x = 167,
				y = 102,
				width = 8,
				height = 11
			},
		
			{
				x = 0,
				y = 179,
				width = 12,
				height = 50
			},
		
			{
				x = 0,
				y = 74,
				width = 12,
				height = 51
			},
		
			{
				x = 0,
				y = 231,
				width = 12,
				height = 49
			},
		
			{
				x = 0,
				y = 127,
				width = 12,
				height = 50
			},
		
			{
				x = 14,
				y = 74,
				width = 11,
				height = 42
			},
		
			{
				x = 1000,
				y = 102,
				width = 15,
				height = 27
			},
		
			{
				x = 14,
				y = 254,
				width = 16,
				height = 25
			},
		
			{
				x = 57,
				y = 254,
				width = 16,
				height = 24
			},
		
			{
				x = 113,
				y = 102,
				width = 16,
				height = 12
			},
		
			{
				x = 188,
				y = 1003,
				width = 14,
				height = 14
			},
		
			{
				x = 27,
				y = 108,
				width = 16,
				height = 8
			},
		
			{
				x = 90,
				y = 1006,
				width = 14,
				height = 16
			},
		
			{
				x = 124,
				y = 1006,
				width = 16,
				height = 14
			},
		
			{
				x = 209,
				y = 308,
				width = 10,
				height = 6
			},
		
			{
				x = 87,
				y = 312,
				width = 16,
				height = 12
			},
		
			{
				x = 56,
				y = 1006,
				width = 16,
				height = 16
			},
		
			{
				x = 38,
				y = 1006,
				width = 16,
				height = 16
			},
		
			{
				x = 20,
				y = 1006,
				width = 16,
				height = 16
			},
		
			{
				x = 74,
				y = 1006,
				width = 14,
				height = 16
			},
		
			{
				x = 44,
				y = 314,
				width = 14,
				height = 10
			},
		
			{
				x = 60,
				y = 314,
				width = 12,
				height = 10
			},
		
			{
				x = 74,
				y = 68,
				width = 3,
				height = 3
			},
		
			{
				x = 188,
				y = 1019,
				width = 5,
				height = 5
			},
		
			{
				x = 55,
				y = 108,
				width = 8,
				height = 8
			},
		
			{
				x = 45,
				y = 108,
				width = 8,
				height = 8
			},
		
			{
				x = 172,
				y = 310,
				width = 11,
				height = 10
			},
		
			{
				x = 74,
				y = 314,
				width = 11,
				height = 10
			},
		
			{
				x = 197,
				y = 308,
				width = 10,
				height = 10
			},
		
			{
				x = 213,
				y = 102,
				width = 11,
				height = 10
			},
		
			{
				x = 146,
				y = 310,
				width = 11,
				height = 11
			},
		
			{
				x = 133,
				y = 311,
				width = 11,
				height = 11
			},
		
			{
				x = 119,
				y = 311,
				width = 12,
				height = 11
			},
		
			{
				x = 105,
				y = 312,
				width = 12,
				height = 11
			},
		
			{
				x = 131,
				y = 102,
				width = 12,
				height = 12
			},
		
			{
				x = 221,
				y = 306,
				width = 6,
				height = 6
			},
		
			{
				x = 185,
				y = 308,
				width = 10,
				height = 10
			},
		
			{
				x = 106,
				y = 1006,
				width = 16,
				height = 15
			},
		
			{
				x = 0,
				y = 1006,
				width = 18,
				height = 17
			},
		
			{
				x = 142,
				y = 1004,
				width = 21,
				height = 19
			},
		
			{
				x = 196,
				y = 251,
				width = 21,
				height = 19
			},
		
			{
				x = 165,
				y = 1004,
				width = 21,
				height = 19
			},
		
			{
				x = 173,
				y = 252,
				width = 21,
				height = 20
			},
		
			{
				x = 125,
				y = 252,
				width = 22,
				height = 22
			},
		
			{
				x = 149,
				y = 252,
				width = 22,
				height = 22
			},
		
			{
				x = 75,
				y = 254,
				width = 23,
				height = 22
			},
		
			{
				x = 100,
				y = 253,
				width = 23,
				height = 22
			},
		
			{
				x = 32,
				y = 254,
				width = 23,
				height = 24
			},
		
			{
				x = 0,
				y = 282,
				width = 42,
				height = 42
			},
		
			{
				x = 0,
				y = 0,
				width = 72,
				height = 72
			},
		
		},
		
		sheetContentWidth = 1024,
		sheetContentHeight = 1024
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M