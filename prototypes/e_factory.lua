data:extend(
{  

	-- factorys	
	{
		type = "assembling-machine",
		name = "y-factory-1",
		icon = "__yi_pfw__/graphics/entity/fabrik-ammo-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-1"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/fab-ammo-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/fab-ammo-sheet.png", 
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/fab-ammo-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/fab-ammo-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-munition"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-muntion",
	},	
	-- small arms weapons
	{
		type = "assembling-machine",
		name = "y-factory-2",
		icon = "__yi_pfw__/graphics/entity/fabrik-weapons-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-2"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/fab-weapons-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/fab-weapons-sheet.png", 
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/fab-weapons-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/fab-weapons-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-handwaffen"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-handwaffen",
	},	
	-- cyborgs
	{
		type = "assembling-machine",
		name = "y-factory-3",
		icon = "__yi_pfw__/graphics/entity/fabrik-bio-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-3"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			filename = "__yi_pfw__/graphics/entity/fab-bio-sheet.png",			
			width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16, animation_speed=0.2;
		},		
		crafting_categories = {"yrcat-cyborgs"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-cyborgs",
	},	

	-- heavy weapons
	{
		type = "assembling-machine",
		name = "y-factory-4",
		icon = "__yi_pfw__/graphics/entity/tut-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-4"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/tut-hai1.png", 
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/tut-hai1.png",			
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-swwaffen"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-swwaffen",
	},	
	-- trucks
	{
		type = "assembling-machine",
		name = "y-factory-5",
		icon = "__yi_pfw__/graphics/entity/fabrik-trucks-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-5"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/fab-trucks-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/fab-trucks-sheet.png", 
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/fab-trucks-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/fab-trucks-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-fahrzeuge"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-fahrzeuge",
	},	
	-- tank
	{
		type = "assembling-machine",
		name = "y-factory-6",
		icon = "__yi_pfw__/graphics/entity/tut-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-6"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/tut-hai1.png", 
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/tut-hai1.png",			
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-panzer"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-panzer",
	},	
	-- supply
	{
		type = "assembling-machine",
		name = "y-factory-7",
		icon = "__yi_pfw__/graphics/entity/tut-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-7"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/tut-hai1.png", 
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/tut-vai1.png",			
				width = 120, height = 128, shift = {0.3, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/tut-hai1.png",			
				width = 120, height = 120, shift = {0.3, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-support"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-support",
	},	
	-- war material
	{
		type = "assembling-machine",
		name = "y-factory-8",
		icon = "__yi_pfw__/graphics/entity/fabrik-equip-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-8"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			north= { filename = "__yi_pfw__/graphics/entity/fab-equip-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			east= {	filename = "__yi_pfw__/graphics/entity/fab-equip-sheet.png", 
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			south= {
				filename = "__yi_pfw__/graphics/entity/fab-equip-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},
			west= {
				filename = "__yi_pfw__/graphics/entity/fab-equip-sheet.png",			
				width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,},			
		},		
		crafting_categories = {"yrcat-material"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "3000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-material",
	},	
	
	-- Component Factory
	{
		type = "assembling-machine",
		name = "y-factory-9",
		icon = "__yi_pfw__/graphics/entity/fabrik-comp-icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-factory-9"},
		max_health = 300, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		animation =
		{
			filename = "__yi_pfw__/graphics/entity/fab-comp-sheet.png",			
			width = 128, height = 128, shift = {0.5, 0}, frame_count = 16, line_length = 16,			
			animation_speed=0.2;		
		},		
		crafting_categories = {"yrcat-component"}, crafting_speed = 1.0,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions = 0.04 / 2.5 },
		energy_usage = "2000kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-component",
	},	

	
})	
	