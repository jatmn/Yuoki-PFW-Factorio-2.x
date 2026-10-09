data:extend(
{  

	-- 1- munition
	-- 2- handwaffen
	-- 3- cyborgs
	-- 4- schwere waffen 
	-- 5- fahrzeuge
	-- 6- panzer
	-- 7- support
	-- 8- ausrüstung	


	{ type = "recipe", name = "y-fab1-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-1", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },		
	{ type = "recipe", name = "y-fab2-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-2", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-fab3-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-3", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab4-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-4", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-fab5-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-5", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab6-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-6", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab7-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-7", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-fab8-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-8", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-fab9-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-9", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	
	
	{ type = "item", name = "y-factory-1", icon = "__yi_pfw__/graphics/entity/fabrik-ammo-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-1", stack_size = 20, },
	{ type = "item", name = "y-factory-2", icon = "__yi_pfw__/graphics/entity/fabrik-weapons-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-2", stack_size = 20, },
	{ type = "item", name = "y-factory-3", icon = "__yi_pfw__/graphics/entity/fabrik-bio-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-3", stack_size = 20, },
	{ type = "item", name = "y-factory-4", icon = "__yi_pfw__/graphics/entity/tut-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-4", stack_size = 20, },
	{ type = "item", name = "y-factory-5", icon = "__yi_pfw__/graphics/entity/fabrik-trucks-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-5", stack_size = 20, },
	{ type = "item", name = "y-factory-6", icon = "__yi_pfw__/graphics/entity/tut-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-6", stack_size = 20, },
	{ type = "item", name = "y-factory-7", icon = "__yi_pfw__/graphics/entity/tut-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-7", stack_size = 20, },
	{ type = "item", name = "y-factory-8", icon = "__yi_pfw__/graphics/entity/fabrik-equip-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-8", stack_size = 20, },
	{ type = "item", name = "y-factory-9", icon = "__yi_pfw__/graphics/entity/fabrik-comp-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-factory-9", stack_size = 20, },
	
})	
	