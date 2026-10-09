data:extend(
{  
	
	--{ type = "item", name = "ypfw_trader_sign", icon = "__Yuoki__/graphics/icons/trader_sign_x.png", icon_size = 64, flags = {"goes-to-main-inventory"}, order = "a", stack_size = 900, },
	
	
	{ type = "recipe", name = "y-import1-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=3}, {type="item", name="ypfw_trader_sign", amount=9},  }, results = {{type="item", name="y-redcoil", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import2-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=1}, {type="item", name="ypfw_trader_sign", amount=3},  }, results = {{type="item", name="y-grycoil", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import3-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=12}, {type="item", name="ypfw_trader_sign", amount=36}, }, results = {{type="item", name="y-stuff-1", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import4-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=7}, {type="item", name="ypfw_trader_sign", amount=21},  }, results = {{type="item", name="y-stuff-2", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import5-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=35}, {type="item", name="ypfw_trader_sign", amount=105}, }, results = {{type="item", name="y-stuff-3", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import6-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=50}, {type="item", name="ypfw_trader_sign", amount=150}, }, results = {{type="item", name="y-stuff-4", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import7-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=20}, {type="item", name="ypfw_trader_sign", amount=60}, }, results = {{type="item", name="y-stuff-5", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-import8-recipe", ingredients = {{type="item", name="y-unicomp-a2", amount=100}, {type="item", name="ypfw_trader_sign", amount=300},}, results = {{type="item", name="y-stuff-6", amount=1}}, enabled = true,  order="factory", subgroup = "yi-imports", categories={"yrcat-retrade"},},
				
	{ type = "item", name = "y-redcoil", icon = "__yi_pfw__/graphics/imports/coilsr32.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-grycoil", icon = "__yi_pfw__/graphics/imports/coilsgr32.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-1", icon = "__yi_pfw__/graphics/imports/crystal_1.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-2", icon = "__yi_pfw__/graphics/imports/crystal_green.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-3", icon = "__yi_pfw__/graphics/imports/wire_2.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-4", icon = "__yi_pfw__/graphics/imports/uni-com-pro.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-5", icon = "__yi_pfw__/graphics/imports/barren_mixed_9.png", icon_size = 32, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-6", icon = "__yi_pfw__/graphics/imports/barren_mixed_11.png", icon_size = 32, order = "a", stack_size = 250, },
		
	{ type = "recipe", name = "y-rimp1-recipe", ingredients = {{type="item", name="y-redcoil", amount=1},}, results = {{type="item", name="y-richdust", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-0", subgroup = "yi-retrade", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rimp2-recipe", ingredients = {{type="item", name="y-grycoil", amount=1},}, results = {{type="item", name="y-richdust", amount=16,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-1", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp3-recipe", ingredients = {{type="item", name="y-stuff-1", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-2", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp4-recipe", ingredients = {{type="item", name="y-stuff-2", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=6,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-3", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp5-recipe", ingredients = {{type="item", name="y-stuff-3", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=31,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-4", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp6-recipe", ingredients = {{type="item", name="y-stuff-4", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=45,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-5", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp7-recipe", ingredients = {{type="item", name="y-stuff-5", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=18,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-6", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rimp8-recipe", ingredients = {{type="item", name="y-stuff-6", amount=1},}, results = {{type="item", name="y-unicomp-a2", amount=90,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="mun-7", subgroup = "yi-retrade", categories={"yrcat-retrade"}, },
	
})	
	