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
	
	
	{ type = "recipe", name = "y-sm-0", main_product = "y-sm-0", ingredients = {{type="item", name="y-refined-yres1", amount=1},{type="item", name="steel-plate", amount=1}, }, results = {{type="item", name="y-sm-0", amount=1}}, enabled = true,  order="sm-0", subgroup = "yi-handwaffen", categories={"yrcat-handwaffen"},},
	-- Parent reference for future restoration: y-mun-2 -> yi_ammo_energie. Keep this declaration inactive.
	--{ type = "recipe", name = "y-fab2b-recipe", ingredients = {{"iron-plate",1},{"y-stuff-1",1},{"y-mun-2",1} }, result = "y-sm-1", enabled = "true", result_count = 1, order="sm-1", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	-- Parent reference for future restoration: y-mun-2 -> yi_ammo_energie. Keep this declaration inactive.
	--{ type = "recipe", name = "y-fab2c-recipe", ingredients = {{"y-refined-yres2",1},{"y-stuff-2",1}, {"y-mun-2",1}}, result = "y-sm-2", enabled = "true", result_count = 1, order="sm-2", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	{ type = "recipe", name = "y-sm-3", main_product = "y-sm-3", ingredients = {{type="item", name="y-refined-yres1", amount=1},{type="item", name="iron-plate", amount=5}, }, results = {{type="item", name="y-sm-3", amount=1}}, enabled = true,  order="sm-3", subgroup = "yi-handwaffen", categories={"yrcat-handwaffen"},},
	{ type = "recipe", name = "y-sm-4", main_product = "y-sm-4", ingredients = {{type="item", name="iron-plate", amount=4},{type="item", name="y-zielfern", amount=1},{type="item", name="y-grycoil", amount=1}, }, results = {{type="item", name="y-sm-4", amount=1}}, enabled = true,  order="sm-4", subgroup = "yi-handwaffen", categories={"yrcat-handwaffen"},},
	-- Parent reference for future restoration: y-sm-5 -> yi_minigun. Keep this declaration inactive.
	--{ type = "recipe", name = "y-fab2f-recipe", ingredients = {{"y-refined-yres1",1},{"y-redcoil",1}, }, result = "y-sm-5", enabled = "true", result_count = 1, order="sm-5", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	{ type = "recipe", name = "y-sm-6", main_product = "y-sm-6", ingredients = {{type="item", name="y-richdust", amount=1},{type="item", name="y-biomass", amount=7},{type="item", name="y-stuff-5", amount=1}, }, results = {{type="item", name="y-sm-6", amount=1}}, enabled = true,  order="sm-6", subgroup = "yi-handwaffen", categories={"yrcat-handwaffen"},},
	--{ type = "recipe", name = "y-fab2h-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-7", enabled = "true", result_count = 1, order="sm-7", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2i-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-8", enabled = "true", result_count = 1, order="sm-8", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
	--{ type = "recipe", name = "y-fab2k-recipe", ingredients = {{"y-unicomp-a2",1},{"iron-plate",1}, }, result = "y-sm-9", enabled = "true", result_count = 1, order="sm-9", subgroup = "yi-handwaffen", category="yrcat-handwaffen",},		
		
	{ type = "item", name = "y-sm-0", subgroup = "yi-handwaffen", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-1", icon = "__Yuoki__/graphics/armor/lasergun.png", icon_size = 64, flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-2", icon = "__yi_pfw__/graphics/fab2/plasma-gun.png", icon_size = 64, flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-3", subgroup = "yi-handwaffen", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-4", subgroup = "yi-handwaffen", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	-- Parent reference for future restoration: y-sm-5 -> yi_minigun. Keep this declaration inactive.
	--{ type = "item", name = "y-sm-5", icon = "__Yuoki__/graphics/armor/minigun.png", icon_size = 64, flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-sm-6", subgroup = "yi-handwaffen", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-7", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-8", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-sm-9", icon = "__yi_pfw__/graphics/fab1/ammo_acid_large.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },	
	
	-- Retrade !!!		
	{ type = "recipe", name = "y-rfab2a-recipe", ingredients = {{type="item", name="y-sm-0", amount=7},}, results = {{type="item", name="y-unicomp-a2", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-0", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2b-recipe", ingredients = {{type="item", name="yi_lasergun", amount=3},}, results = {{type="item", name="y-unicomp-a2", amount=41,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-1", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2c-recipe", ingredients = {{type="item", name="yi_lasergun", amount=6},}, results = {{type="item", name="y-unicomp-a2", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-2", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2d-recipe", ingredients = {{type="item", name="y-sm-3", amount=7},}, results = {{type="item", name="y-unicomp-a2", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-3", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2e-recipe", ingredients = {{type="item", name="y-sm-4", amount=5},}, results = {{type="item", name="y-unicomp-a2", amount=24,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-4", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2f-recipe", ingredients = {{type="item", name="yi_minigun", amount=4},}, results = {{type="item", name="y-unicomp-a2", amount=14,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-5", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	{ type = "recipe", name = "y-rfab2g-recipe", ingredients = {{type="item", name="y-sm-6", amount=2},}, results = {{type="item", name="y-unicomp-a2", amount=50,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="sm-6", subgroup = "yi-retrade2", categories={"yrcat-retrade"},},
	--{ type = "recipe", name = "y-rfab2h-recipe", ingredients = {{"y-sm-7",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-7", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	--{ type = "recipe", name = "y-rfab2i-recipe", ingredients = {{"y-sm-8",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-8", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	--{ type = "recipe", name = "y-rfab2k-recipe", ingredients = {{"y-sm-9",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-richdust", amount=1,},}, enabled = "true", order="sm-9", subgroup = "yi-retrade", icon = "__yi_pfw__/graphics/basic/coilsgo32.png" },	
	
})	
	