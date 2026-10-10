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
	
	{ type = "recipe", name = "y-veh-0", main_product = "y-veh-0", ingredients = {{type="item", name="y-veh-9", amount=4},{type="item", name="steel-plate", amount=8}, }, results = {{type="item", name="y-veh-0", amount=1}}, enabled = true,  order="veh-0", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-1", main_product = "y-veh-1", ingredients = {{type="item", name="y-veh-9", amount=10},{type="item", name="steel-plate", amount=14},{type="item", name="y-ffe", amount=1},{type="item", name="y_blocked_capa", amount=2}, }, results = {{type="item", name="y-veh-1", amount=1}}, enabled = true,  order="veh-1", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-2", main_product = "y-veh-2", ingredients = {{type="item", name="y-basic-t2-mf", amount=2},{type="item", name="y-basic-t1-mf", amount=4},{type="item", name="y-seg", amount=1},{type="item", name="y-accumulator-b", amount=4}, }, results = {{type="item", name="y-veh-2", amount=1}}, enabled = true,  order="veh-2", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-3", main_product = "y-veh-3", ingredients = {{type="item", name="y-veh-0", amount=1},{type="item", name="wood", amount=14}, }, results = {{type="item", name="y-veh-3", amount=1}}, enabled = true,  order="veh-3", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-4", main_product = "y-veh-4", ingredients = {{type="item", name="y-veh-0", amount=1},{type="item", name="storage-tank", amount=1}, }, results = {{type="item", name="y-veh-4", amount=1}}, enabled = true,  order="veh-4", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-5", main_product = "y-veh-5", ingredients = {{type="item", name="y-veh-1", amount=1},{type="item", name="storage-tank", amount=1},{type="item", name="wood", amount=8},{type="item", name="y-basic-t1-mf", amount=2}}, results = {{type="item", name="y-veh-5", amount=1}}, enabled = true,  order="veh-5", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-6", main_product = "y-veh-6", ingredients = {{type="item", name="y-veh-1", amount=1},{type="item", name="steel-chest", amount=3},{type="item", name="y-basic-t1-mf", amount=4},{type="item", name="y-basic-t2-mf", amount=1} }, results = {{type="item", name="y-veh-6", amount=1}}, enabled = true,  order="veh-6", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	--{ type = "recipe", name = "y-fab5h-recipe", ingredients = {{"y-biomass",5},{"y-medic",1},{"y-combat-train",5}, }, result = "y-veh-7", enabled = "true", result_count = 1, order="veh-7", subgroup = "yi-fahrzeuge", category="yrcat-fahrzeuge",},		
	{ type = "recipe", name = "y-veh-8", main_product = "y-veh-8", ingredients = {{type="item", name="y-veh-2", amount=1},{type="item", name="y-basic-t2-mf", amount=1},{type="item", name="y-tank-8000", amount=1},{type="item", name="y-chip-2", amount=4}, }, results = {{type="item", name="y-veh-8", amount=1}}, enabled = true,  order="veh-8", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
	{ type = "recipe", name = "y-veh-9", main_product = "y-veh-9", ingredients = {{type="item", name="y-grycoil", amount=3},{type="item", name="iron-plate", amount=4}, }, results = {{type="item", name="y-veh-9", amount=10}}, enabled = true,  order="veh-9", subgroup = "yi-fahrzeuge", categories={"yrcat-fahrzeuge"},},
		
	{ type = "item", name = "y-veh-0", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-1", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-2", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 150, },
	{ type = "item", name = "y-veh-3", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 50, },
	{ type = "item", name = "y-veh-4", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 50, },
	{ type = "item", name = "y-veh-5", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 30, },
	{ type = "item", name = "y-veh-6", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 30, },
	--	{ type = "item", name = "y-veh-7", icon = "__yi_pfw__/graphics/fab5/mcb_sani_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	{ type = "item", name = "y-veh-8", subgroup = "yi-fahrzeuge", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 30, },
	{ type = "item", name = "y-veh-9", subgroup = "yi-fahrzeuge", icon = "__yi_pfw__/graphics/fab5/reifen.png", icon_size = 64, order = "a", stack_size = 500, },
		
	-- Retrade !!!		
	--{ type = "recipe", name = "y-rfab5a-recipe", ingredients = {{"y-veh-0",9},}, results = {{type="item", name="y-unicomp-a2", amount=2,},}, enabled = "true", order="veh-0", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-veh-0") },
	--{ type = "recipe", name = "y-rfab5b-recipe", ingredients = {{"y-veh-1",5},}, results = {{type="item", name="y-unicomp-a2", amount=6,}, {type="item", name="y-stuff-2", amount=1,},}, enabled = "true", order="veh-1", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-veh-1") },
	--{ type = "recipe", name = "y-rfab5c-recipe", ingredients = {{"y-veh-2",6},}, results = {{type="item", name="y-unicomp-a2", amount=2,}, {type="item", name="y-stuff-1", amount=1,},}, enabled = "true", order="veh-2", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-veh-2") },
	{ type = "recipe", name = "y-rfab5d-recipe", ingredients = {{type="item", name="y-veh-3", amount=3},}, results = {{type="item", name="y-unicomp-a2", amount=11,}, {type="item", name="y-richdust", amount=20,},{type="item", name="ypfw_trader_sign", amount=1,},}, 	enabled = true, order="veh-3", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab5e-recipe", ingredients = {{type="item", name="y-veh-4", amount=2},}, results = {{type="item", name="y-unicomp-a2", amount=12,}, {type="item", name="y-richdust", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, 	enabled = true, order="veh-4", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab5f-recipe", ingredients = {{type="item", name="y-veh-5", amount=1},}, results = {{type="item", name="y-stuff-5", amount=1,}, {type="item", name="y-grycoil", amount=12,},{type="item", name="ypfw_trader_sign", amount=1,},}, 		enabled = true, order="veh-5", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab5g-recipe", ingredients = {{type="item", name="y-veh-6", amount=1},}, results = {{type="item", name="y-stuff-5", amount=2,}, {type="item", name="y-unicomp-a2", amount=8,},{type="item", name="ypfw_trader_sign", amount=1,},}, 		enabled = true, order="veh-6", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	--{ type = "recipe", name = "y-rfab5h-recipe", ingredients = {{"y-veh-7",9},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-2", amount=2,},}, enabled = "true", order="veh-7", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-veh-7") },
	{ type = "recipe", name = "y-rfab5i-recipe", ingredients = {{type="item", name="y-veh-8", amount=1},}, results = {{type="item", name="y-stuff-4", amount=2,}, {type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="veh-8", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab5k-recipe", ingredients = {{type="item", name="y-veh-9", amount=3},}, results = {{type="item", name="y-unicomp-a2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="veh-9", subgroup = "yi-retrade5", categories={"yrcat-retrade"}, },
	
})	
	