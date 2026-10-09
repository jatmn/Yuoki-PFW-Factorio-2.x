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
	
	{ type = "recipe", name = "y-fab5a-recipe", ingredients = {{"y-veh-9",4},{"steel-plate",8}, }, result = "y-veh-0", enabled = "true", result_count = 1, order="veh-0", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	{ type = "recipe", name = "y-fab5b-recipe", ingredients = {{"y-veh-9",10},{"steel-plate",14},{"y-ffe",1},{"y_blocked_capa",2}, }, result = "y-veh-1", enabled = "true", result_count = 1, order="veh-1", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},			
	{ type = "recipe", name = "y-fab5c-recipe", ingredients = {{"y-basic-t2-mf",2},{"y-basic-t1-mf",4},{"y-seg",1},{"y-accumulator-b",4}, }, result = "y-veh-2", enabled = "true", result_count = 1, order="veh-2", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	{ type = "recipe", name = "y-fab5d-recipe", ingredients = {{"y-veh-0",1},{"wood",14}, }, result = "y-veh-3", enabled = "true", result_count = 1, order="veh-3", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	{ type = "recipe", name = "y-fab5e-recipe", ingredients = {{"y-veh-0",1},{"storage-tank",1}, }, result = "y-veh-4", enabled = "true", result_count = 1, order="veh-4", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},						
	{ type = "recipe", name = "y-fab5f-recipe", ingredients = {{"y-veh-1",1},{"storage-tank",1},{"wood",8},{"y-basic-t1-mf",2}}, result = "y-veh-5", enabled = "true", result_count = 1, order="veh-5", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},			
	{ type = "recipe", name = "y-fab5g-recipe", ingredients = {{"y-veh-1",1},{"steel-chest",3},{"y-basic-t1-mf",4},{"y-basic-t2-mf",1} }, result = "y-veh-6", enabled = "true", result_count = 1, order="veh-6", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	--{ type = "recipe", name = "y-fab5h-recipe", ingredients = {{"y-biomass",5},{"y-medic",1},{"y-combat-train",5}, }, result = "y-veh-7", enabled = "true", result_count = 1, order="veh-7", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	{ type = "recipe", name = "y-fab5i-recipe", ingredients = {{"y-veh-2",1},{"y-basic-t2-mf",1},{"y-tank-8000",1},{"y-chip-2",4}, }, result = "y-veh-8", enabled = "true", result_count = 1, order="veh-8", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},			
	{ type = "recipe", name = "y-fab5k-recipe", ingredients = {{"y-grycoil",3},{"iron-plate",4}, }, result = "y-veh-9", enabled = "true", result_count = 10, order="veh-9", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},			
		
	{ type = "item", name = "y-veh-0", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-1", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-2", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-3", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 50, },	
	{ type = "item", name = "y-veh-4", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 50, },
	{ type = "item", name = "y-veh-5", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 30, },
	{ type = "item", name = "y-veh-6", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 30, },
	--	{ type = "item", name = "y-veh-7", icon = "__yi_pfw__/graphics/fab5/mcb_sani_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-veh-8", icon = "__yi_pfw__/graphics/package_common.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 30, },	
	{ type = "item", name = "y-veh-9", icon = "__yi_pfw__/graphics/fab5/reifen.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 500, },	
		
	-- Retrade !!!		
	--{ type = "recipe", name = "y-rfab5a-recipe", ingredients = {{"y-veh-0",9},}, results = {{type="item", name="y-unicomp-a2", amount=2,},}, enabled = "true", order="veh-0", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab5/brain-parasite-1-sell.png" },		
	--{ type = "recipe", name = "y-rfab5b-recipe", ingredients = {{"y-veh-1",5},}, results = {{type="item", name="y-unicomp-a2", amount=6,}, {type="item", name="y-stuff-2", amount=1,},}, enabled = "true", order="veh-1", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab5/mcb_defender-sell.png" },	
	--{ type = "recipe", name = "y-rfab5c-recipe", ingredients = {{"y-veh-2",6},}, results = {{type="item", name="y-unicomp-a2", amount=2,}, {type="item", name="y-stuff-1", amount=1,},}, enabled = "true", order="veh-2", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab5/mcb_ranger-sell.png" },	
	{ type = "recipe", name = "y-rfab5d-recipe", ingredients = {{"y-veh-3",3},}, results = {{type="item", name="y-unicomp-a2", amount=11,}, {type="item", name="y-richdust", amount=20,},{type="item", name="ypfw_trader_sign", amount=1,},}, 	enabled = "true", order="veh-3", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },		
	{ type = "recipe", name = "y-rfab5e-recipe", ingredients = {{"y-veh-4",2},}, results = {{type="item", name="y-unicomp-a2", amount=12,}, {type="item", name="y-richdust", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, 	enabled = "true", order="veh-4", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab5f-recipe", ingredients = {{"y-veh-5",1},}, results = {{type="item", name="y-stuff-5", amount=1,}, {type="item", name="y-grycoil", amount=12,},{type="item", name="ypfw_trader_sign", amount=1,},}, 		enabled = "true", order="veh-5", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab5g-recipe", ingredients = {{"y-veh-6",1},}, results = {{type="item", name="y-stuff-5", amount=2,}, {type="item", name="y-unicomp-a2", amount=8,},{type="item", name="ypfw_trader_sign", amount=1,},}, 		enabled = "true", order="veh-6", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	--{ type = "recipe", name = "y-rfab5h-recipe", ingredients = {{"y-veh-7",9},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-2", amount=2,},}, enabled = "true", order="veh-7", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab5/mcb_sani-sell.png" },	
	{ type = "recipe", name = "y-rfab5i-recipe", ingredients = {{"y-veh-8",1},}, results = {{type="item", name="y-stuff-4", amount=2,}, {type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="veh-8", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/package_common_retrade.png" },	
	{ type = "recipe", name = "y-rfab5k-recipe", ingredients = {{"y-veh-9",3},}, results = {{type="item", name="y-unicomp-a2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = "true", order="veh-9", subgroup = "yi-retrade5", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab5/reifen-sell.png" },	
	
})	
	