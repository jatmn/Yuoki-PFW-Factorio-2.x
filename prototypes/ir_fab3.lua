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
	
	{ type = "recipe", name = "y-fab3a-recipe", energy_required = 3, ingredients = {{type="item", name="y-biomass", amount=3},{type="item", name="y-combat-train", amount=1}, }, results = {{type="item", name="y-cyb-0", amount=1}}, enabled = true,  order="sm-0", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3b-recipe", energy_required = 3, ingredients = {{type="item", name="y-cyb-0", amount=1},  {type="item", name="submachine-gun", amount=1},{type="item", name="y-combat-armor-1", amount=1},{type="item", name="y-combat-train", amount=1}, }, results = {{type="item", name="y-cyb-1", amount=1}}, enabled = true,  order="sm-1", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3c-recipe", energy_required = 3, ingredients = {{type="item", name="y-cyb-0", amount=1},  {type="item", name="y-sm-0", amount=1},{type="item", name="yi_equip_shield_a", amount=1},{type="item", name="y-combat-train", amount=2}, }, results = {{type="item", name="y-cyb-2", amount=1}}, enabled = true,  order="sm-2", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3d-recipe", energy_required = 4, ingredients = {{type="item", name="y-biomass", amount=4},{type="item", name="yi_lasergun", amount=1},{type="item", name="y-combat-armor-1", amount=1},{type="item", name="y-combat-train", amount=2}, }, results = {{type="item", name="y-cyb-3", amount=1}}, enabled = true,  order="sm-3", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3e-recipe", energy_required = 4, ingredients = {{type="item", name="y-cyb-0", amount=1},{type="item", name="flamethrower", amount=1},{type="item", name="y-combat-armor-1", amount=1},{type="item", name="y-biomass", amount=1}, }, results = {{type="item", name="y-cyb-4", amount=1}}, enabled = true,  order="sm-4", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3f-recipe", energy_required = 4, ingredients = {{type="item", name="y-biomass", amount=5},{type="item", name="yi_minigun", amount=1},{type="item", name="yi_equip_shield_a", amount=1},{type="item", name="y-combat-train", amount=4}, }, results = {{type="item", name="y-cyb-5", amount=1}}, enabled = true,  order="sm-5", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3g-recipe", energy_required = 4, ingredients = {{type="item", name="y-biomass", amount=4},{type="item", name="y-sm-4", amount=1},{type="item", name="y-combat-armor-1", amount=1},{type="item", name="y-combat-train", amount=6}, }, results = {{type="item", name="y-cyb-6", amount=1}}, enabled = true,  order="sm-6", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3h-recipe", energy_required = 4, ingredients = {{type="item", name="y-biomass", amount=5},{type="item", name="y-medic", amount=1},{type="item", name="y-combat-train", amount=5}, }, results = {{type="item", name="y-cyb-7", amount=1}}, enabled = true,  order="sm-7", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3i-recipe", energy_required = 5, ingredients = {{type="item", name="y-basic-t1-mf", amount=2},{type="item", name="yi_lasergun", amount=2},{type="item", name="yi_equip_shield_a", amount=1},{type="item", name="y-chip-2", amount=1}, }, results = {{type="item", name="y-cyb-8", amount=1}}, enabled = true,  order="sm-8", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
	{ type = "recipe", name = "y-fab3k-recipe", energy_required = 5, ingredients = {{type="item", name="y-basic-t2-mf", amount=2},{type="item", name="yi_lasergun", amount=3},{type="item", name="yi_equip_shield_a", amount=1},{type="item", name="y-chip-2", amount=1}, }, results = {{type="item", name="y-cyb-9", amount=1}}, enabled = true,  order="sm-9", subgroup = "yi-cyborgs", categories={"yrcat-cyborgs"},},
		
	{ type = "item", name = "y-cyb-0", icon = "__yi_engines__/graphics/icons/brain-parasite-1.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-1", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-2", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-3", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-4", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-5", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-6", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-7", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-8", icon = "__Yuoki__/graphics/armor/neron_u3_32.png", icon_size = 64, order = "a", stack_size = 100, },
	{ type = "item", name = "y-cyb-9", icon = "__yi_engines__/graphics/icons/package_carni.png", icon_size = 32, order = "a", stack_size = 100, },
	
	-- Retrade !!!		
	{ type = "recipe", name = "y-rfab3a-recipe", ingredients = {{type="item", name="y-cyb-0", amount=9},}, results = {{type="item", name="y-unicomp-a2", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-0", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3b-recipe", ingredients = {{type="item", name="y-cyb-1", amount=5},}, results = {{type="item", name="y-unicomp-a2", amount=6,}, {type="item", name="y-stuff-2", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-1", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3c-recipe", ingredients = {{type="item", name="y-cyb-2", amount=6},}, results = {{type="item", name="y-unicomp-a2", amount=2,}, {type="item", name="y-stuff-1", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-2", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3d-recipe", ingredients = {{type="item", name="y-cyb-3", amount=5},}, results = {{type="item", name="y-unicomp-a2", amount=50,}, {type="item", name="y-grycoil", amount=25,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-3", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3e-recipe", ingredients = {{type="item", name="y-cyb-4", amount=7},}, results = {{type="item", name="y-unicomp-a2", amount=3,}, {type="item", name="y-stuff-5", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-4", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3f-recipe", ingredients = {{type="item", name="y-cyb-5", amount=3},}, results = {{type="item", name="y-unicomp-a2", amount=5,}, {type="item", name="y-stuff-1", amount=1,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-5", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3g-recipe", ingredients = {{type="item", name="y-cyb-6", amount=3},}, results = {{type="item", name="y-unicomp-a2", amount=3,}, {type="item", name="y-redcoil", amount=5,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-6", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3h-recipe", ingredients = {{type="item", name="y-cyb-7", amount=9},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-2", amount=2,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-7", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3i-recipe", ingredients = {{type="item", name="y-cyb-8", amount=2},}, results = {{type="item", name="y-stuff-4", amount=1,}, {type="item", name="y-stuff-3", amount=3,},{type="item", name="y-unicomp-a2", amount=10,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-8", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab3k-recipe", ingredients = {{type="item", name="y-cyb-9", amount=2},}, results = {{type="item", name="y-stuff-6", amount=1,}, {type="item", name="y-stuff-5", amount=4,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="cy-9", subgroup = "yi-retrade3", categories={"yrcat-retrade"}, },
	
})	
	