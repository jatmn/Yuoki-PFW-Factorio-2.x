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
	
	{ type = "recipe", name = "y-fab3a-recipe", energy_required = 3, ingredients = {{"y-biomass",3},{"y-combat-train",1}, }, result = "y-cyb-0", enabled = "true", result_count = 1, order="sm-0", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3b-recipe", energy_required = 3, ingredients = {{"y-cyb-0",1},  {"submachine-gun",1},{"y-combat-armor-1",1},{"y-combat-train",1}, }, result = "y-cyb-1", enabled = "true", result_count = 1, order="sm-1", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3c-recipe", energy_required = 3, ingredients = {{"y-cyb-0",1},  {"y-sm-0",1},{"y-combat-armor-2",1},{"y-combat-train",2}, }, result = "y-cyb-2", enabled = "true", result_count = 1, order="sm-2", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3d-recipe", energy_required = 4, ingredients = {{"y-biomass",4},{"y-sm-1",1},{"y-combat-armor-1",1},{"y-combat-train",2}, }, result = "y-cyb-3", enabled = "true", result_count = 1, order="sm-3", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3e-recipe", energy_required = 4, ingredients = {{"y-cyb-0",1},{"flame-thrower",1},{"y-combat-armor-1",1},{"y-biomass",1}, }, result = "y-cyb-4", enabled = "true", result_count = 1, order="sm-4", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},			
	{ type = "recipe", name = "y-fab3f-recipe", energy_required = 4, ingredients = {{"y-biomass",5},{"y-sm-5",1},{"y-combat-armor-2",1},{"y-combat-train",4}, }, result = "y-cyb-5", enabled = "true", result_count = 1, order="sm-5", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3g-recipe", energy_required = 4, ingredients = {{"y-biomass",4},{"y-sm-4",1},{"y-combat-armor-1",1},{"y-combat-train",6}, }, result = "y-cyb-6", enabled = "true", result_count = 1, order="sm-6", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3h-recipe", energy_required = 4, ingredients = {{"y-biomass",5},{"y-medic",1},{"y-combat-train",5}, }, result = "y-cyb-7", enabled = "true", result_count = 1, order="sm-7", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3i-recipe", energy_required = 5, ingredients = {{"y-basic-t1-mf",2},{"y-sm-1",2},{"y-combat-armor-3",1},{"y-chip-2",1}, }, result = "y-cyb-8", enabled = "true", result_count = 1, order="sm-8", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
	{ type = "recipe", name = "y-fab3k-recipe", energy_required = 5, ingredients = {{"y-basic-t2-mf",2},{"y-sm-2",3},{"y-combat-armor-3",1},{"y-chip-2",1}, }, result = "y-cyb-9", enabled = "true", result_count = 1, order="sm-9", subgroup = "yi-cyborgs", category="yrcat-cyborgs",},		
		
	{ type = "item", name = "y-cyb-0", icon = "__yi_pfw__/graphics/fab3/brain-parasite-1.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-1", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-2", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-3", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-4", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-5", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-6", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-7", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-8", icon = "__yi_pfw__/graphics/fab3/neron_u3_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-9", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },	
	
	-- Retrade !!!		
	{ type = "recipe", name = "y-rfab3a-recipe", ingredients = {{"y-cyb-0",9},}, results = {{type="item", name="y-unicomp-a2", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-0", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab3/brain-parasite-1-sell.png" },		
	{ type = "recipe", name = "y-rfab3b-recipe", ingredients = {{"y-cyb-1",5},}, results = {{type="item", name="y-unicomp-a2", amount=6,}, {type="item", name="y-stuff-2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-1", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3c-recipe", ingredients = {{"y-cyb-2",6},}, results = {{type="item", name="y-unicomp-a2", amount=2,}, {type="item", name="y-stuff-1", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-2", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3d-recipe", ingredients = {{"y-cyb-3",5},}, results = {{type="item", name="y-unicomp-a2", amount=50,}, {type="item", name="y-grycoil", amount=25,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-3", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3e-recipe", ingredients = {{"y-cyb-4",7},}, results = {{type="item", name="y-unicomp-a2", amount=3,}, {type="item", name="y-stuff-5", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-4", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3f-recipe", ingredients = {{"y-cyb-5",3},}, results = {{type="item", name="y-unicomp-a2", amount=5,}, {type="item", name="y-stuff-1", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-5", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3g-recipe", ingredients = {{"y-cyb-6",3},}, results = {{type="item", name="y-unicomp-a2", amount=3,}, {type="item", name="y-redcoil", amount=5,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-6", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3h-recipe", ingredients = {{"y-cyb-7",9},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-2", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-7", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3i-recipe", ingredients = {{"y-cyb-8",2},}, results = {{type="item", name="y-stuff-4", amount=1,}, {type="item", name="y-stuff-3", amount=3,},{type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-8", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab3k-recipe", ingredients = {{"y-cyb-9",2},}, results = {{type="item", name="y-stuff-6", amount=1,}, {type="item", name="y-stuff-5", amount=4,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="cy-9", subgroup = "yi-retrade3", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	
})	
	