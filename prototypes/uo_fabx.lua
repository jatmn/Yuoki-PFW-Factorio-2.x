playeranimations = {
	idle =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_idle.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.15,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	idlewithgun =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_idle.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.15,
		shift = {0.13, -0.25},
		axially_symmetrical = fals
	},
	miningwithhands =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_dig.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.6,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	miningwithtool =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_dig.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.6,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	runningwithgun =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_walk_gun.png",
		priority = "very-low",
		width = 80,
		height = 100,
		frame_count = 1,
		direction_count = 18,
		shift = {0.13, -0.25},
	},
	running =
	{
		filename = "__yi_pfw__/graphics/armor/robo1_walk.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 22,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
}

data.raw.player.player.animations.level4addon = {
	armors =  {"y-cyb-8u"},
	idle =
	{
		layers =
		{
			playeranimations.idle
		}
	},
	idle_with_gun =
	{
		layers =
		{
			playeranimations.idlewithgun
		}
	},
	mining_with_hands =
	{
		layers =
		{
			playeranimations.miningwithhands
		}
	},
	mining_with_tool =
	{
		layers =
		{
			playeranimations.miningwithtool
		}
	},                        
	running_with_gun =
	{
		layers =
		{
			playeranimations.runningwithgun
		}
	},
	running =
	{
		layers =
		{
			playeranimations.running
		}
	}
}

playeranimations_y2 = {
	idle =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_idle_sheet.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.15,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	idlewithgun =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_idle_sheet.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 16,
		animation_speed = 0.15,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	miningwithhands =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_dig.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 1,
		animation_speed = 0.6,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	miningwithtool =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_dig.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 1,
		animation_speed = 0.6,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
	runningwithgun =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_walk_gun.png",
		priority = "very-low",
		width = 80,
		height = 100,
		frame_count = 1,
		direction_count = 18,
		shift = {0.13, -0.25},
	},
	running =
	{
		filename = "__yi_pfw__/graphics/armor/armor2_walk_sheet.png",
		priority = "very-low",
		width = 80,
		height = 100,
		direction_count = 8,
		frame_count = 22,
		shift = {0.13, -0.25},
		axially_symmetrical = false
	},
}

data.raw.player.player.animations.level5addon = {
	armors =  {"y-cyb-9u"},
	idle =
	{
		layers =
		{
			playeranimations_y2.idle
		}
	},
	idle_with_gun =
	{
		layers =
		{
			playeranimations_y2.idlewithgun
		}
	},
	mining_with_hands =
	{
		layers =
		{
			playeranimations_y2.miningwithhands
		}
	},
	mining_with_tool =
	{
		layers =
		{
			playeranimations_y2.miningwithtool
		}
	},                        
	running_with_gun =
	{
		layers =
		{
			playeranimations_y2.runningwithgun
		}
	},
	running =
	{
		layers =
		{
			playeranimations_y2.running
		}
	}
}

