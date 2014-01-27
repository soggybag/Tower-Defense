local M = {}

local getSheetOptions = function()
	local options = {
		frames = {
		
			{
				x = 507,
				y = 20,
				width = 3,
				height = 3
			},
		
			{
				x = 507,
				y = 0,
				width = 5,
				height = 5
			},
		
			{
				x = 492,
				y = 26,
				width = 8,
				height = 8
			},
		
			{
				x = 482,
				y = 26,
				width = 8,
				height = 8
			},
		
			{
				x = 498,
				y = 127,
				width = 11,
				height = 10
			},
		
			{
				x = 497,
				y = 115,
				width = 11,
				height = 10
			},
		
			{
				x = 498,
				y = 151,
				width = 10,
				height = 10
			},
		
			{
				x = 498,
				y = 139,
				width = 11,
				height = 10
			},
		
			{
				x = 131,
				y = 198,
				width = 11,
				height = 11
			},
		
			{
				x = 131,
				y = 211,
				width = 11,
				height = 11
			},
		
			{
				x = 180,
				y = 180,
				width = 12,
				height = 11
			},
		
			{
				x = 309,
				y = 270,
				width = 12,
				height = 11
			},
		
			{
				x = 295,
				y = 270,
				width = 12,
				height = 12
			},
		
			{
				x = 478,
				y = 362,
				width = 16,
				height = 16
			},
		
			{
				x = 258,
				y = 422,
				width = 16,
				height = 16
			},
		
			{
				x = 482,
				y = 324,
				width = 16,
				height = 16
			},
		
			{
				x = 90,
				y = 265,
				width = 16,
				height = 16
			},
		
			{
				x = 496,
				y = 342,
				width = 16,
				height = 16
			},
		
			{
				x = 482,
				y = 288,
				width = 16,
				height = 16
			},
		
			{
				x = 495,
				y = 82,
				width = 16,
				height = 16
			},
		
			{
				x = 240,
				y = 422,
				width = 16,
				height = 16
			},
		
			{
				x = 295,
				y = 252,
				width = 16,
				height = 16
			},
		
			{
				x = 478,
				y = 344,
				width = 16,
				height = 16
			},
		
			{
				x = 426,
				y = 384,
				width = 16,
				height = 16
			},
		
			{
				x = 222,
				y = 422,
				width = 16,
				height = 16
			},
		
			{
				x = 461,
				y = 116,
				width = 16,
				height = 16
			},
		
			{
				x = 120,
				y = 432,
				width = 16,
				height = 16
			},
		
			{
				x = 496,
				y = 360,
				width = 16,
				height = 16
			},
		
			{
				x = 360,
				y = 318,
				width = 16,
				height = 16
			},
		
			{
				x = 496,
				y = 396,
				width = 16,
				height = 16
			},
		
			{
				x = 482,
				y = 306,
				width = 16,
				height = 16
			},
		
			{
				x = 478,
				y = 380,
				width = 16,
				height = 16
			},
		
			{
				x = 482,
				y = 270,
				width = 16,
				height = 16
			},
		
			{
				x = 342,
				y = 318,
				width = 16,
				height = 16
			},
		
			{
				x = 313,
				y = 252,
				width = 16,
				height = 16
			},
		
			{
				x = 72,
				y = 265,
				width = 16,
				height = 16
			},
		
			{
				x = 102,
				y = 432,
				width = 16,
				height = 16
			},
		
			{
				x = 204,
				y = 422,
				width = 16,
				height = 16
			},
		
			{
				x = 408,
				y = 384,
				width = 16,
				height = 16
			},
		
			{
				x = 479,
				y = 116,
				width = 16,
				height = 16
			},
		
			{
				x = 496,
				y = 378,
				width = 16,
				height = 16
			},
		
			{
				x = 276,
				y = 422,
				width = 16,
				height = 16
			},
		
			{
				x = 205,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 95,
				y = 190,
				width = 34,
				height = 34
			},
		
			{
				x = 198,
				y = 216,
				width = 34,
				height = 34
			},
		
			{
				x = 50,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 446,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 385,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 144,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 139,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 319,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 220,
				width = 34,
				height = 34
			},
		
			{
				x = 355,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 95,
				y = 154,
				width = 34,
				height = 34
			},
		
			{
				x = 103,
				y = 82,
				width = 34,
				height = 34
			},
		
			{
				x = 14,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 266,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 324,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 234,
				y = 216,
				width = 34,
				height = 34
			},
		
			{
				x = 374,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 103,
				y = 118,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 269,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 256,
				width = 34,
				height = 34
			},
		
			{
				x = 211,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 97,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 355,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 144,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 277,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 175,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 338,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 233,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 184,
				width = 34,
				height = 34
			},
		
			{
				x = 319,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 270,
				y = 216,
				width = 34,
				height = 34
			},
		
			{
				x = 72,
				y = 229,
				width = 34,
				height = 34
			},
		
			{
				x = 175,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 169,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 410,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 139,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 122,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 457,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 36,
				y = 148,
				width = 34,
				height = 34
			},
		
			{
				x = 216,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 349,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 133,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 161,
				width = 34,
				height = 34
			},
		
			{
				x = 230,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 67,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 338,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 306,
				y = 216,
				width = 34,
				height = 34
			},
		
			{
				x = 247,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 288,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 421,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 241,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 158,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 230,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 197,
				width = 34,
				height = 34
			},
		
			{
				x = 194,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 108,
				y = 226,
				width = 34,
				height = 34
			},
		
			{
				x = 302,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 391,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 67,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 211,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 283,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 313,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 283,
				y = 72,
				width = 34,
				height = 34
			},
		
			{
				x = 247,
				y = 108,
				width = 34,
				height = 34
			},
		
			{
				x = 0,
				y = 125,
				width = 34,
				height = 34
			},
		
			{
				x = 360,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 86,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 302,
				y = 180,
				width = 34,
				height = 34
			},
		
			{
				x = 180,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 252,
				y = 144,
				width = 34,
				height = 34
			},
		
			{
				x = 194,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 61,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 25,
				y = 36,
				width = 34,
				height = 34
			},
		
			{
				x = 162,
				y = 216,
				width = 34,
				height = 34
			},
		
			{
				x = 266,
				y = 0,
				width = 34,
				height = 34
			},
		
			{
				x = 95,
				y = 144,
				width = 6,
				height = 6
			},
		
			{
				x = 408,
				y = 402,
				width = 10,
				height = 10
			},
		
			{
				x = 144,
				y = 216,
				width = 16,
				height = 15
			},
		
			{
				x = 493,
				y = 36,
				width = 18,
				height = 17
			},
		
			{
				x = 72,
				y = 208,
				width = 21,
				height = 19
			},
		
			{
				x = 72,
				y = 166,
				width = 21,
				height = 19
			},
		
			{
				x = 72,
				y = 187,
				width = 21,
				height = 19
			},
		
			{
				x = 72,
				y = 144,
				width = 21,
				height = 20
			},
		
			{
				x = 36,
				y = 124,
				width = 22,
				height = 22
			},
		
			{
				x = 0,
				y = 101,
				width = 22,
				height = 22
			},
		
			{
				x = 0,
				y = 53,
				width = 23,
				height = 22
			},
		
			{
				x = 0,
				y = 77,
				width = 23,
				height = 22
			},
		
			{
				x = 482,
				y = 0,
				width = 23,
				height = 24
			},
		
			{
				x = 103,
				y = 72,
				width = 7,
				height = 7
			},
		
			{
				x = 502,
				y = 26,
				width = 7,
				height = 7
			},
		
			{
				x = 99,
				y = 283,
				width = 7,
				height = 7
			},
		
			{
				x = 72,
				y = 283,
				width = 7,
				height = 7
			},
		
			{
				x = 112,
				y = 72,
				width = 7,
				height = 7
			},
		
			{
				x = 81,
				y = 283,
				width = 7,
				height = 7
			},
		
			{
				x = 121,
				y = 72,
				width = 7,
				height = 7
			},
		
			{
				x = 90,
				y = 283,
				width = 7,
				height = 7
			},
		
			{
				x = 130,
				y = 72,
				width = 7,
				height = 7
			},
		
			{
				x = 136,
				y = 364,
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
				x = 102,
				y = 398,
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
				x = 274,
				y = 318,
				width = 32,
				height = 32
			},
		
			{
				x = 448,
				y = 276,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 354,
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
				x = 240,
				y = 320,
				width = 32,
				height = 32
			},
		
			{
				x = 396,
				y = 142,
				width = 32,
				height = 32
			},
		
			{
				x = 410,
				y = 244,
				width = 32,
				height = 32
			},
		
			{
				x = 210,
				y = 252,
				width = 32,
				height = 32
			},
		
			{
				x = 342,
				y = 216,
				width = 32,
				height = 32
			},
		
			{
				x = 414,
				y = 312,
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
				x = 170,
				y = 364,
				width = 32,
				height = 32
			},
		
			{
				x = 376,
				y = 350,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 339,
				width = 32,
				height = 32
			},
		
			{
				x = 238,
				y = 388,
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
				x = 306,
				y = 386,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 388,
				width = 32,
				height = 32
			},
		
			{
				x = 206,
				y = 320,
				width = 32,
				height = 32
			},
		
			{
				x = 478,
				y = 236,
				width = 32,
				height = 32
			},
		
			{
				x = 108,
				y = 262,
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
				x = 461,
				y = 82,
				width = 32,
				height = 32
			},
		
			{
				x = 478,
				y = 202,
				width = 32,
				height = 32
			},
		
			{
				x = 138,
				y = 296,
				width = 32,
				height = 32
			},
		
			{
				x = 410,
				y = 210,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 180,
				width = 32,
				height = 32
			},
		
			{
				x = 444,
				y = 208,
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
				x = 70,
				y = 292,
				width = 32,
				height = 32
			},
		
			{
				x = 448,
				y = 310,
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
				x = 278,
				y = 284,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 420,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 418,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 176,
				width = 32,
				height = 32
			},
		
			{
				x = 410,
				y = 350,
				width = 32,
				height = 32
			},
		
			{
				x = 244,
				y = 252,
				width = 32,
				height = 32
			},
		
			{
				x = 308,
				y = 318,
				width = 32,
				height = 32
			},
		
			{
				x = 464,
				y = 134,
				width = 32,
				height = 32
			},
		
			{
				x = 342,
				y = 350,
				width = 32,
				height = 32
			},
		
			{
				x = 306,
				y = 352,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 398,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 414,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 330,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 414,
				width = 32,
				height = 32
			},
		
			{
				x = 142,
				y = 262,
				width = 32,
				height = 32
			},
		
			{
				x = 376,
				y = 214,
				width = 32,
				height = 32
			},
		
			{
				x = 340,
				y = 384,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 330,
				width = 32,
				height = 32
			},
		
			{
				x = 342,
				y = 250,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 384,
				width = 32,
				height = 32
			},
		
			{
				x = 272,
				y = 354,
				width = 32,
				height = 32
			},
		
			{
				x = 380,
				y = 282,
				width = 32,
				height = 32
			},
		
			{
				x = 430,
				y = 140,
				width = 32,
				height = 32
			},
		
			{
				x = 374,
				y = 418,
				width = 32,
				height = 32
			},
		
			{
				x = 427,
				y = 72,
				width = 32,
				height = 32
			},
		
			{
				x = 240,
				y = 286,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 305,
				width = 32,
				height = 32
			},
		
			{
				x = 376,
				y = 248,
				width = 32,
				height = 32
			},
		
			{
				x = 170,
				y = 330,
				width = 32,
				height = 32
			},
		
			{
				x = 444,
				y = 346,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 407,
				width = 32,
				height = 32
			},
		
			{
				x = 36,
				y = 292,
				width = 32,
				height = 32
			},
		
			{
				x = 380,
				y = 316,
				width = 32,
				height = 32
			},
		
			{
				x = 136,
				y = 398,
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
				x = 391,
				y = 108,
				width = 32,
				height = 32
			},
		
			{
				x = 442,
				y = 174,
				width = 32,
				height = 32
			},
		
			{
				x = 414,
				y = 278,
				width = 32,
				height = 32
			},
		
			{
				x = 176,
				y = 252,
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
				x = 104,
				y = 296,
				width = 32,
				height = 32
			},
		
			{
				x = 102,
				y = 364,
				width = 32,
				height = 32
			},
		
			{
				x = 476,
				y = 168,
				width = 32,
				height = 32
			},
		
			{
				x = 427,
				y = 106,
				width = 32,
				height = 32
			},
		
			{
				x = 346,
				y = 284,
				width = 32,
				height = 32
			},
		
			{
				x = 408,
				y = 414,
				width = 32,
				height = 32
			},
		
			{
				x = 312,
				y = 284,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 373,
				width = 32,
				height = 32
			},
		
			{
				x = 444,
				y = 380,
				width = 32,
				height = 32
			},
		
			{
				x = 206,
				y = 286,
				width = 32,
				height = 32
			},
		
			{
				x = 444,
				y = 242,
				width = 32,
				height = 32
			},
		
			{
				x = 172,
				y = 296,
				width = 32,
				height = 32
			},
		
			{
				x = 0,
				y = 441,
				width = 32,
				height = 32
			},
		
			{
				x = 507,
				y = 7,
				width = 4,
				height = 11
			},
		
			{
				x = 342,
				y = 336,
				width = 10,
				height = 11
			},
		
			{
				x = 495,
				y = 100,
				width = 12,
				height = 13
			},
		
			{
				x = 180,
				y = 193,
				width = 12,
				height = 14
			},
		
			{
				x = 323,
				y = 270,
				width = 11,
				height = 11
			},
		
			{
				x = 478,
				y = 398,
				width = 8,
				height = 11
			},
		
			{
				x = 420,
				y = 402,
				width = 8,
				height = 10
			},
		
			{
				x = 364,
				y = 336,
				width = 8,
				height = 11
			},
		
			{
				x = 354,
				y = 336,
				width = 8,
				height = 11
			},
		
			{
				x = 14,
				y = 36,
				width = 8,
				height = 12
			},
		
			{
				x = 331,
				y = 252,
				width = 8,
				height = 11
			},
		
			{
				x = 25,
				y = 72,
				width = 12,
				height = 50
			},
		
			{
				x = 0,
				y = 0,
				width = 12,
				height = 51
			},
		
			{
				x = 53,
				y = 72,
				width = 12,
				height = 49
			},
		
			{
				x = 39,
				y = 72,
				width = 12,
				height = 50
			},
		
			{
				x = 131,
				y = 154,
				width = 11,
				height = 42
			},
		
			{
				x = 278,
				y = 252,
				width = 15,
				height = 27
			},
		
			{
				x = 493,
				y = 55,
				width = 16,
				height = 25
			},
		
			{
				x = 144,
				y = 233,
				width = 16,
				height = 24
			},
		
		},
		
		sheetContentWidth = 512,
		sheetContentHeight = 512
	}

	return options
end
M.getSheetOptions = getSheetOptions

return M