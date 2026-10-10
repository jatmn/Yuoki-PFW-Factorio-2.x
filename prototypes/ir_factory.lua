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


	{ type = "recipe", name = "y-factory-1", main_product = "y-factory-1", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-1", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-factory-2", main_product = "y-factory-2", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-2", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-factory-3", main_product = "y-factory-3", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-3", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab4-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-4", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-factory-5", main_product = "y-factory-5", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-5", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab6-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-6", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
--	{ type = "recipe", name = "y-fab7-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-chip-1",4},}, result = "y-factory-7", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-factory-8", main_product = "y-factory-8", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-8", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-factory-9", main_product = "y-factory-9", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-chip-1", amount=4},}, results = {{type="item", name="y-factory-9", amount=1}}, enabled = true,  order="factory", subgroup = "yi-basic", },
	
	
	{ type = "item", name = "y-factory-1", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-ammo-icon.png", icon_size = 64, order = "a", place_result = "y-factory-1", stack_size = 20, },
	{ type = "item", name = "y-factory-2", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-weapons-icon.png", icon_size = 64, order = "a", place_result = "y-factory-2", stack_size = 20, },
	{ type = "item", name = "y-factory-3", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-bio-icon.png", icon_size = 64, order = "a", place_result = "y-factory-3", stack_size = 20, },
	{ type = "item", name = "y-factory-4", subgroup = "yi-basic", icon = "__yi_engines__/graphics/entity/science_gen_icon.png", icon_size = 32, order = "a", place_result = "y-factory-4", stack_size = 20, },
	{ type = "item", name = "y-factory-5", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-trucks-icon.png", icon_size = 64, order = "a", place_result = "y-factory-5", stack_size = 20, },
	{ type = "item", name = "y-factory-6", subgroup = "yi-basic", icon = "__yi_engines__/graphics/entity/science_gen_icon.png", icon_size = 32, order = "a", place_result = "y-factory-6", stack_size = 20, },
	{ type = "item", name = "y-factory-7", subgroup = "yi-basic", icon = "__yi_engines__/graphics/entity/science_gen_icon.png", icon_size = 32, order = "a", place_result = "y-factory-7", stack_size = 20, },
	{ type = "item", name = "y-factory-8", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-equip-icon.png", icon_size = 64, order = "a", place_result = "y-factory-8", stack_size = 20, },
	{ type = "item", name = "y-factory-9", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/fabrik-comp-icon.png", icon_size = 64, order = "a", place_result = "y-factory-9", stack_size = 20, },
	
})	
	