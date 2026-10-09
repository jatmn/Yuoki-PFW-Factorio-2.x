data:extend(
{  

	-- 1- munition
	-- 2- handwaffen
	-- 3- cyborgs
	-- 4- schwere waffen
	-- 5- fahrzeuge
	-- 6- panzer
	-- 7- support
	-- 8- ausrÃ¼stung
	
	--[[
	y-sm-0=Close Combat Weapons
	y-sm-1=Lasergun
	y-sm-2=Plasmagun
	y-sm-3=Grenade Launcher
	y-sm-4=Sniper Rifle & Specials	
	y-sm-5=Miniguns
	y-sm-6=Feeder
	]]
	
	
	{ type = "recipe", name = "y-fab2a-recipe", ingredients = {{"y-refined-yres1",1},{"steel-plate",1}, }, result = "y-sm-0", enabled = "true", result_count = 1, order="sm-0", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2b-recipe", ingredients = {{"iron-plate",1},{"y-stuff-1",1},{"y-mun-2",1} }, result = "y-sm-1", enabled = "true", result_count = 1, order="sm-1", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2c-recipe", ingredients = {{"y-refined-yres2",1},{"y-stuff-2",1}, {"y-mun-2",1}}, result = "y-sm-2", enabled = "true", result_count = 1, order="sm-2", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	{ type = "recipe", name = "y-fab2d-recipe", ingredients = {{"y-refined-yres1",1},{"iron-plate",5}, }, result = "y-sm-3", enabled = "true", result_count = 1, order="sm-3", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	{ type = "recipe", name = "y-fab2e-recipe", ingredients = {{"iron-plate",4},{"y-zielfern",1},{"y-grycoil",1}, }, result = "y-sm-4", enabled = "true", result_count = 1, order="sm-4", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},			
	--{ type = "recipe", name = "y-fab2f-recipe", ingredients = {{"y-refined-yres1",1},{"y-redcoil",1}, }, result = "y-sm-5", enabled = "true", result_count = 1, order="sm-5", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	{ type = "recipe", name = "y-fab2g-recipe", ingredients = {{"y-richdust",1},{"y-biomass",7},{"y-stuff-5",1}, }, result = "y-sm-6", enabled = "true", result_count = 1, order="sm-6", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2h-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-7", enabled = "true", result_count = 1, order="sm-7", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2i-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-8", enabled = "true", result_count = 1, order="sm-8", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2k-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-9", enabled = "true", result_count = 1, order="sm-9", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
		
	{ type = "item", name = "y-sm-0", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-1", icon = "__yi_pfw__/graphics/fab2/lasergun.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-2", icon = "__yi_pfw__/graphics/fab2/plasma-gun.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-3", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-4", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-5", icon = "__yi_pfw__/graphics/fab2/minigun.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-6", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-7", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-8", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-9", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },	
	
	-- Retrade !!!		
	{ type = "recipe", name = "y-rfab2a-recipe", ingredients = {{"y-sm-0",7},}, results = {{type="item", name="y-unicomp-a2", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-0", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/package_common_retrade.png", category="yrcat-retrade",},		
	{ type = "recipe", name = "y-rfab2b-recipe", ingredients = {{"y-sm-1",3},}, results = {{type="item", name="y-unicomp-a2", amount=41,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-1", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/fab2/lasergun-sell.png", category="yrcat-retrade",},	
	{ type = "recipe", name = "y-rfab2c-recipe", ingredients = {{"y-sm-2",6},}, results = {{type="item", name="y-unicomp-a2", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-2", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/fab2/plasma-gun-sell.png", category="yrcat-retrade",},	
	{ type = "recipe", name = "y-rfab2d-recipe", ingredients = {{"y-sm-3",7},}, results = {{type="item", name="y-unicomp-a2", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-3", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/package_common_retrade.png", category="yrcat-retrade",},	
	{ type = "recipe", name = "y-rfab2e-recipe", ingredients = {{"y-sm-4",5},}, results = {{type="item", name="y-unicomp-a2", amount=24,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-4", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/package_common_retrade.png", category="yrcat-retrade",},	
	{ type = "recipe", name = "y-rfab2f-recipe", ingredients = {{"y-sm-5",4},}, results = {{type="item", name="y-unicomp-a2", amount=14,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-5", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/fab2/minigun-sell.png", category="yrcat-retrade",},	
	{ type = "recipe", name = "y-rfab2g-recipe", ingredients = {{"y-sm-6",2},}, results = {{type="item", name="y-unicomp-a2", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="sm-6", subgroup = "yi-retrade2", icon = "__yi_pfw__/graphics/package_common_retrade.png", category="yrcat-retrade",},	
	--{ type = "recipe", name = "y-rfab2h-recipe", ingredients = {{"y-sm-7",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-7", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	--{ type = "recipe", name = "y-rfab2i-recipe", ingredients = {{"y-sm-8",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-8", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	--{ type = "recipe", name = "y-rfab2k-recipe", ingredients = {{"y-sm-9",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-9", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	
})	
	