data:extend({  

	-- 1- munition
	-- 2- handwaffen
	-- 3- cyborgs
	-- 4- schwere waffen
	-- 5- fahrzeuge
	-- 6- panzer
	-- 7- support
	-- 8- ausrüstung/ material
		
	{ type = "recipe", name = "y-fab1a-recipe", ingredients = {{"y-ammo-hohlspitz",8},{"wooden-chest",1}}, result = "y-mun-0", enabled = "true", result_count = 1, order="mun-0", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1b-recipe", ingredients = {{"y-ammo-acid-2",6},{"iron-chest",1}, }, result = "y-mun-1", enabled = "true", result_count = 1, order="mun-1", subgroup = "yi-muntion", category="yrcat-munition",},		
	--{ type = "recipe", name = "y-fab1c-recipe", ingredients = {{"y-battery-single-use2",1},{"iron-plate",1}, }, result = "y-mun-2", enabled = "true", result_count = 1, order="mun-2", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1d-recipe", ingredients = {{"y-ammo-poison",5},{"y-grycoil",1},}, result = "y-mun-3", enabled = "true", result_count = 1, order="mun-3", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1e-recipe", ingredients = {{"rocket",3},{"wooden-chest",1}, }, result = "y-mun-4", enabled = "true", result_count = 1, order="mun-4", subgroup = "yi-muntion", category="yrcat-munition",},				
	{ type = "recipe", name = "y-fab1f-recipe", ingredients = {{"iron-plate",1},{"explosives",1}, }, result = "y-mun-5", enabled = "true", result_count = 1, order="mun-5", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1g-recipe", ingredients = {{"y-mun-5",1},{"y-chip-1",1},{"iron-plate",1},{"wooden-chest",1}, }, result = "y-mun-6", enabled = "true", result_count = 1, order="mun-6", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1h-recipe", ingredients = {{"y-mun-5",1},{"y-chip-1",1},{"y-biomass",1},{"iron-chest",1}, }, result = "y-mun-7", enabled = "true", result_count = 1, order="mun-7", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1i-recipe", ingredients = {{"y-mun-5",1},{"y-toxic-dust", 4},{"y-stuff-5", 1},{"y_sc11",1},}, result = "y-mun-8", enabled = "true", result_count = 1, order="mun-8", subgroup = "yi-muntion", category="yrcat-munition",},		
	{ type = "recipe", name = "y-fab1k-recipe", ingredients = {{"y-mun-5",1},{"y-stuff-1",1},{"y-stuff-6", 1},{"y_sc11",1},}, result = "y-mun-9", enabled = "true", result_count = 1, order="mun-9", subgroup = "yi-muntion", category="yrcat-munition",},		
		
	{ type = "item", name = "y-mun-0", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 5000, },
	{ type = "item", name = "y-mun-1", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 2500, },
	--{ type = "item", name = "y-mun-2", icon = "__yi_pfw__/graphics/fab1/bst_z1.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 5000, },
	{ type = "item", name = "y-mun-3", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 1000, },
	{ type = "item", name = "y-mun-4", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 1000, },
	{ type = "item", name = "y-mun-5", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-mun-6", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-mun-7", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-mun-8", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-mun-9", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },	
	
	-- Retrade !!!		
	{ type = "recipe", name = "y-rfab1a-recipe", ingredients = {{"y-mun-0",8},}, results = {{type="item", name="y-stuff-2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},},  	enabled = "true", order="mun-0", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png"},
	{ type = "recipe", name = "y-rfab1b-recipe", ingredients = {{"y-mun-1",4},}, results = {{type="item", name="y-redcoil", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,}, }, 	enabled = "true", order="mun-1", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1c-recipe", ingredients = {{"y-mun-2",7},}, results = {{type="item", name="y-unicomp-a2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-2", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab1/bst_z1.png" },	
	{ type = "recipe", name = "y-rfab1d-recipe", ingredients = {{"y-mun-3",2},}, results = {{type="item", name="y-unicomp-a2", amount=5,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-3", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1e-recipe", ingredients = {{"y-mun-4",4},}, results = {{type="item", name="y-grycoil", amount=9,},{type="item", name="ypfw_trader_sign", amount=1,}, }, enabled = "true", order="mun-4", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png", },	
	{ type = "recipe", name = "y-rfab1f-recipe", ingredients = {{"y-mun-5",15},}, results = {{type="item", name="y-unicomp-a2", amount=4,},{type="item", name="ypfw_trader_sign", amount=1,}, }, enabled = "true", order="mun-5", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1g-recipe", ingredients = {{"y-mun-6",8},}, results = {{type="item", name="y-unicomp-a2", amount=5,}, {type="item", name="y-richdust", amount=22,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-6", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1h-recipe", ingredients = {{"y-mun-7",4},}, results = {{type="item", name="y-unicomp-a2", amount=4,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-7", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1i-recipe", ingredients = {{"y-mun-8",2},}, results = {{type="item", name="y-unicomp-a2", amount=6,}, {type="item", name="y-stuff-5", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-8", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab1k-recipe", ingredients = {{"y-mun-9",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-4", amount=2,},{type="item", name="y-stuff-1", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="mun-9", subgroup = "yi-retrade1", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	
})