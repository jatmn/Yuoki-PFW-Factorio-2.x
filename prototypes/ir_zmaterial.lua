data:extend(
{  

	-- Zwischenprodukte
	
	-- Biomasse-1	
	{ type = "recipe", name = "y-zproduct-1-recipe", 
		energy_required= 10,
		ingredients = {{type="item", name="wood", amount=1},{type="item", name="y-dirt", amount=10},{type="fluid", name="water", amount=25,}, },
		results = {{type="item", name="wood", amount=1,}, {type="item", name="y-biomass", amount=2,},},
		enabled = true, order="factory", subgroup = "yi-component",
		categories={"chemistry"},
		icon = "__yi_pfw__/graphics/zmaterial/biomass-icon.png", icon_size = 32
	},					
	{ type = "item", name = "y-biomass", icon = "__yi_pfw__/graphics/zmaterial/biomass-icon.png", icon_size = 32, order = "a", stack_size = 250, },
	
	-- Combat Armor 1
	--[[
	{ type = "recipe", name = "y-zproduct-2-recipe", 
		energy_required= 1, 
		ingredients = {{"y-refined-yres1",2},{"iron-plate",4},}, 
		results = {{type="item", name="y-combat-armor-1", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-material", 
		category= "yrcat-material",
		icon = "__yi_pfw__/graphics/zmaterial/panz1_32.png"
	},	
	]]	
	{ type = "item", name = "y-combat-armor-1", icon = "__yi_pfw__/graphics/zmaterial/panz1_32.png", icon_size = 32, order = "a", stack_size = 250, },

	-- Combat Armor 2
	--[[
	{ type = "recipe", name = "y-zproduct-3-recipe", 
		energy_required= 1, 
		ingredients = {{"y-grycoil",2},{"iron-plate",4},}, 
		results = {{type="item", name="y-combat-armor-2", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-material", 
		category= "yrcat-material",
		icon = "__Yuoki__/graphics/armor/panz5_32.png", icon_size = 64
	},	
	]]	
	{ type = "item", name = "y-combat-armor-2", icon = "__Yuoki__/graphics/armor/panz5_32.png", icon_size = 64, order = "a", stack_size = 250, place_as_equipment_result = "y-combat-armor-2",},

	-- Combat Armor 3
	--[[
	{ type = "recipe", name = "y-zproduct-4-recipe", 
		energy_required= 1, 
		ingredients = {{"y-redcoil",2},{"y-stuff-3",2},}, 
		results = {{type="item", name="y-combat-armor-3", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-material", 
		category= "yrcat-material",
		icon = "__Yuoki__/graphics/armor/panz4_32.png", icon_size = 64
	},	
	]]	
	{ type = "item", name = "y-combat-armor-3", icon = "__Yuoki__/graphics/armor/panz4_32.png", icon_size = 64, order = "a", stack_size = 250, place_as_equipment_result = "y-combat-armor-3",},

	{ type = "recipe", name = "y-zproduct-5-recipe", 
		energy_required= 4, 
		ingredients = {{type="item", name="y-chip-1", amount=1},},
		results = {{type="item", name="y-combat-train", amount=6,},}, 
		enabled = true, order="factory", subgroup = "yi-component",
		categories={"yrcat-component"},
		icon = "__yi_pfw__/graphics/zmaterial/combattrain-icon.png", icon_size = 32
	},						
	{ type = "item", name = "y-combat-train", icon = "__yi_pfw__/graphics/zmaterial/combattrain-icon.png", icon_size = 32, order = "a", stack_size = 2500, },

	{ type = "recipe", name = "y-zproduct-6-recipe", 
		energy_required= 4, 
		ingredients = {{type="item", name="y-biomass", amount=2},{type="item", name="y-basic-t1-mf", amount=1},},
		results = {{type="item", name="y-medic", amount=6,},}, 
		enabled = true, order="factory", subgroup = "yi-component",
		categories={"yrcat-component"},
		icon = "__yi_pfw__/graphics/zmaterial/medic-icon.png", icon_size = 32,
	},						
	{ type = "item", name = "y-medic", icon = "__yi_pfw__/graphics/zmaterial/medic-icon.png", icon_size = 32, order = "a", stack_size = 2500, },

	{ type = "recipe", name = "y-zproduct-7-recipe", 
		energy_required= 4, 
		ingredients = {{type="item", name="y-chip-1", amount=2},{type="item", name="y-stuff-1", amount=1},{type="item", name="iron-plate", amount=4},},
		results = {{type="item", name="y-zielfern", amount=4,},}, 
		enabled = true, order="factory", subgroup = "yi-component",
		categories={"yrcat-component"},
		icon = "__yi_pfw__/graphics/zmaterial/zielfern-icon.png", icon_size = 32,
	},						
	{ type = "item", name = "y-zielfern", icon = "__yi_pfw__/graphics/zmaterial/zielfern-icon.png", icon_size = 32, order = "a", stack_size = 2500, },
	
	
	{ type = "recipe", name = "y-zproduct-8-recipe", energy_required = 2, ingredients = {{type="item", name="y-iron-case", amount=2},{type="item", name="y-refined-yres1", amount=6},{type="item", name="y-infused-uca2", amount=3}, }, results = {{type="item", name="y-zproduct-8", amount=1}}, enabled = true,  order="y-zproduct-8", subgroup = "yi-component", categories={"yrcat-component"},},
	{ type = "recipe", name = "y-zproduct-8charge-recipe", energy_required = 2, ingredients = {{type="item", name="y-zproduct-8-empty", amount=1},{type="item", name="y-infused-uca2", amount=3}, }, results = {{type="item", name="y-zproduct-8", amount=1}}, enabled = true,  order="y-zproduct-8", subgroup = "yi-component", categories={"yrcat-component"}, icon = "__yi_pfw__/graphics/fab8/fusion-cell-empty.png", icon_size = 32,},
	
	{ type = "item", name = "y-zproduct-8", icon = "__yi_pfw__/graphics/fab8/fusion-cell.png", icon_size = 64, order = "a", stack_size = 100, fuel_value="12GJ", fuel_categories={"chemical"}, place_as_equipment_result = "y-zproduct-8",},
	{ type = "item", name = "y-zproduct-8-empty", icon = "__yi_pfw__/graphics/fab8/fusion-cell-empty.png", icon_size = 32, order = "a", stack_size = 400,},
	{ type = "recipe", name = "y-rzproduct-8-recipe", ingredients = {{type="item", name="y-zproduct-8", amount=1},}, results = {{type="item", name="y-stuff-2", amount=1,},{type="item", name="y-redcoil", amount=3,},{type="item", name="y-grycoil", amount=3,},{type="item", name="y-zproduct-8-empty", amount=1,},}, enabled = true, order="y-zproduct-8", subgroup = "yi-retrade", categories={"yrcat-retrade"}, icon = "__yi_pfw__/graphics/fab8/fusion-cell-sell.png", icon_size = 32 },
	
})	
	