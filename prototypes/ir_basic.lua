data:extend(
{  

	-- Distinct PFW construction contract: retain original costs and ten-node yield.
	{ type = "recipe", name = "y-retrader-recipe", ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="y-bluegear", amount=6}, {type="item", name="y-stargate", amount=1},}, results = {{type="item", name="ye_trade_node", amount=10}}, enabled = true,  order="factory", subgroup = "yi-basic", },
	
	{ type = "recipe", name = "y-rich-1", main_product = "y-rich-1", ingredients = {{type="item", name="y-stuff-6", amount=250}}, results = {{type="item", name="y-rich-1", amount=1}}, enabled = true, order="factory", subgroup = "yi-basic", },
	{ type = "recipe", name = "y-rich-2", main_product = "y-rich-2", ingredients = {{type="item", name="y-rich-1", amount=4},{type="item", name="y-stuff-6", amount=250}}, results = {{type="item", name="y-rich-2", amount=1}}, enabled = true, order="factory", subgroup = "yi-basic", },
	
	-- Parent owner: yi_engines, item ye_trade_node. Preserved inactive PFW definition.
	--[=[
	{ type = "item", name = "y-retrader-1", icon = "__yi_pfw__/graphics/entity/trade-node-icon.png", icon_size = 32, order = "a", place_result = "y-retrader-1", stack_size = 50, },
	]=]
	{ type = "item", name = "y-rich-1", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/profit-show-2-icon.png", icon_size = 64, order = "a", place_result = "y-rich-1", stack_size = 5, },
	{ type = "item", name = "y-rich-2", subgroup = "yi-basic", icon = "__yi_pfw__/graphics/entity/profit-show-1-icon.png", icon_size = 64, order = "a", place_result = "y-rich-2", stack_size = 5, },
})	
	