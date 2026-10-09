-- Legacy emissions coefficient multiplied by rated kW gives pollution per minute.
data:extend(
{  

	-- ReTrader
	-- Parent owner: yi_engines, assembling-machine ye_trade_node. Preserved inactive PFW definition.
	--[=[
	{
		type = "assembling-machine",
		name = "y-retrader-1",
		icon = "__yi_pfw__/graphics/entity/trade-node-icon.png", icon_size = 32,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "y-retrader-1"},
		max_health = 350, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",

		graphics_set = { animation = {
			north= { 
				filename = "__yi_pfw__/graphics/entity/gate-node.png",			
				width = 128, height = 128, shift = {0.5, -0.25}, frame_count = 1, line_length = 1,},
			east= {	
				filename = "__yi_pfw__/graphics/entity/gate-node.png", 
				width = 128, height = 128, shift = {0.5, -0.25}, frame_count = 1, line_length = 1,},
			south= {
				filename = "__yi_pfw__/graphics/entity/gate-node.png",			
				width = 128, height = 128, shift = {0.5, -0.25}, frame_count = 1, line_length = 1,},
			west= {
				filename = "__yi_pfw__/graphics/entity/gate-node.png",			
				width = 128, height = 128, shift = {0.5, -0.25}, frame_count = 1, line_length = 1,},			
		} },
		crafting_categories = {"yrcat-retrade"}, crafting_speed = 2,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions_per_minute = { pollution = 0.04 / 2.5 * 1250 } },
		energy_usage = "1250kW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-basic",
	},
	]=]

	-- Rich-1
	{
		type = "assembling-machine",
		name = "y-rich-1",
		icon = "__yi_pfw__/graphics/entity/profit-show-2-icon.png", icon_size = 32,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 3, result = "y-rich-1"},
		max_health = 750, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
		selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
		fast_replaceable_group = "assembling-machine",

		graphics_set = { animation = {
			filename = "__yi_pfw__/graphics/entity/profit-show-2.png",			
			width = 160, height = 160, shift = {0.5, -0.25}, frame_count = 1, line_length = 1,
		} },
		crafting_categories = {"yuoki-fame"}, crafting_speed = 6,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions_per_minute = { pollution = 0.04 / 2.5 * 10000 } },
		energy_usage = "10MW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-basic",
	},	

	-- Rich-2
	{
		type = "assembling-machine",
		name = "y-rich-2",
		icon = "__yi_pfw__/graphics/entity/profit-show-1-icon.png", icon_size = 32,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 5, result = "y-rich-2"},
		max_health = 1000, corpse = "big-remnants", resistances = {{type = "physical",percent = 60},},
		collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
		selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
		fast_replaceable_group = "assembling-machine",
		graphics_set = { animation = {
			filename = "__yi_pfw__/graphics/entity/profit-show-1.png",			
			width = 160, height = 160, shift = {1.0, -0.25}, frame_count = 1, line_length = 1,
		} },
		crafting_categories = {"yuoki-fame"}, crafting_speed = 18,
		energy_source = {type = "electric", usage_priority = "secondary-input", emissions_per_minute = { pollution = 0.04 / 2.5 * 25000 } },
		energy_usage = "25MW",
		ingredient_count = 5,		
		order="a",
		subgroup = "yi-basic",
	},	

	
})	
	