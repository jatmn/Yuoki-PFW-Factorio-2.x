data:extend(
{  

	{ type = "recipe", name = "y-retrader-recipe", ingredients = {{"y-basic-t1-mf",2},{"y-bluegear",6}, {"y-stargate",1},}, result = "y-retrader-1", enabled = "true", result_count = 10, order="factory", subgroup = "yi-basic", },		
	
--	{ type = "recipe", name = "y-rich-1-recipe", ingredients = {{"y-stuff-6",250},}, result = "y-rich-1", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },		
--	{ type = "recipe", name = "y-rich-2-recipe", ingredients = {{"y-rich-1",4},{"y-stuff-6",250},}, result = "y-rich-2", enabled = "true", result_count = 1, order="factory", subgroup = "yi-basic", },		
	
	{ type = "item", name = "y-retrader-1", icon = "__yi_pfw__/graphics/entity/trade-node-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-retrader-1", stack_size = 50, },
	{ type = "item", name = "y-rich-1", icon = "__yi_pfw__/graphics/entity/profit-show-2-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-rich-1", stack_size = 5, },
	{ type = "item", name = "y-rich-2", icon = "__yi_pfw__/graphics/entity/profit-show-1-icon.png", flags = {"goes-to-quickbar"}, order = "a", place_result = "y-rich-2", stack_size = 5, },	
})	
	