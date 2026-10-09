data:extend(
{  
	
	--{ type = "item", name = "ypfw_trader_sign", icon = "__yi_pfw__/graphics/imports/trader_sign.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 900, },
	
	
	{ type = "recipe", name = "y-import1-recipe", ingredients = {{"y-unicomp-a2",3}, {"ypfw_trader_sign", 9},  }, result = "y-redcoil", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import2-recipe", ingredients = {{"y-unicomp-a2",1}, {"ypfw_trader_sign", 3},  }, result = "y-grycoil", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import3-recipe", ingredients = {{"y-unicomp-a2",12}, {"ypfw_trader_sign",36}, }, result = "y-stuff-1", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import4-recipe", ingredients = {{"y-unicomp-a2",7}, {"ypfw_trader_sign", 21},  }, result = "y-stuff-2", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import5-recipe", ingredients = {{"y-unicomp-a2",35}, {"ypfw_trader_sign", 105}, }, result = "y-stuff-3", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import6-recipe", ingredients = {{"y-unicomp-a2",50}, {"ypfw_trader_sign", 150}, }, result = "y-stuff-4", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import7-recipe", ingredients = {{"y-unicomp-a2",20}, {"ypfw_trader_sign", 60}, }, result = "y-stuff-5", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},		
	{ type = "recipe", name = "y-import8-recipe", ingredients = {{"y-unicomp-a2",100}, {"ypfw_trader_sign",300},}, result = "y-stuff-6", enabled = "true", result_count = 1, order="factory", subgroup = "yi-imports", category= "yrcat-retrade",},			
				
	{ type = "item", name = "y-redcoil", icon = "__yi_pfw__/graphics/imports/coilsr32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-grycoil", icon = "__yi_pfw__/graphics/imports/coilsgr32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-1", icon = "__yi_pfw__/graphics/imports/crystal_1.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-2", icon = "__yi_pfw__/graphics/imports/crystal_green.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-3", icon = "__yi_pfw__/graphics/imports/wire_2.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-4", icon = "__yi_pfw__/graphics/imports/uni-com-pro.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-5", icon = "__yi_pfw__/graphics/imports/barren_mixed_9.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	{ type = "item", name = "y-stuff-6", icon = "__yi_pfw__/graphics/imports/barren_mixed_11.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
		
	{ type = "recipe", name = "y-rimp1-recipe", ingredients = {{"y-redcoil",1},}, results = {{type="item", name="y-richdust", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-0", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/coilsr32-sell.png"},
	{ type = "recipe", name = "y-rimp2-recipe", ingredients = {{"y-grycoil",1},}, results = {{type="item", name="y-richdust", amount=16,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-1", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/coilsgr32-sell.png" },	
	{ type = "recipe", name = "y-rimp3-recipe", ingredients = {{"y-stuff-1",1},}, results = {{type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-2", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/crystal_1-sell.png" },	
	{ type = "recipe", name = "y-rimp4-recipe", ingredients = {{"y-stuff-2",1},}, results = {{type="item", name="y-unicomp-a2", amount=6,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-3", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/crystal_green-sell.png" },	
	{ type = "recipe", name = "y-rimp5-recipe", ingredients = {{"y-stuff-3",1},}, results = {{type="item", name="y-unicomp-a2", amount=31,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-4", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/wire_2-sell.png", },	
	{ type = "recipe", name = "y-rimp6-recipe", ingredients = {{"y-stuff-4",1},}, results = {{type="item", name="y-unicomp-a2", amount=45,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-5", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/uni-com-pro-sell.png" },	
	{ type = "recipe", name = "y-rimp7-recipe", ingredients = {{"y-stuff-5",1},}, results = {{type="item", name="y-unicomp-a2", amount=18,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-6", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/barren_mixed_9-sell.png" },	
	{ type = "recipe", name = "y-rimp8-recipe", ingredients = {{"y-stuff-6",1},}, results = {{type="item", name="y-unicomp-a2", amount=90,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-7", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/imports/barren_mixed_11-sell.png" },	
	
})	
	