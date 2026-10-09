data:extend(
{  

	-- Zwischenprodukte
	
	-- Biomasse-1	
	{ type = "recipe", name = "y-zproduct-1-recipe", 
		energy_required= 10,
		ingredients = {{"wood",1},{"y-dirt",10},{type="fluid", name="water", amount=25,}, }, 
		results = {{type="item", name="raw-wood", amount=1,}, {type="item", name="y-biomass", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-component", 
		category= "chemistry",
		icon = "__yi_pfw__/graphics/zmaterial/biomass-icon.png"
	},					
	{ type = "item", name = "y-biomass", icon = "__yi_pfw__/graphics/zmaterial/biomass-icon.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },
	
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
	{ type = "item", name = "y-combat-armor-1", icon = "__yi_pfw__/graphics/zmaterial/panz1_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, },

	-- Combat Armor 2
	--[[
	{ type = "recipe", name = "y-zproduct-3-recipe", 
		energy_required= 1, 
		ingredients = {{"y-grycoil",2},{"iron-plate",4},}, 
		results = {{type="item", name="y-combat-armor-2", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-material", 
		category= "yrcat-material",
		icon = "__yi_pfw__/graphics/zmaterial/panz5_32.png"
	},	
	]]	
	{ type = "item", name = "y-combat-armor-2", icon = "__yi_pfw__/graphics/zmaterial/panz5_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, placed_as_equipment_result = "y-combat-armor-2",},

	-- Combat Armor 3
	--[[
	{ type = "recipe", name = "y-zproduct-4-recipe", 
		energy_required= 1, 
		ingredients = {{"y-redcoil",2},{"y-stuff-3",2},}, 
		results = {{type="item", name="y-combat-armor-3", amount=2,},}, 
		enabled = "true", order="factory", subgroup = "yi-material", 
		category= "yrcat-material",
		icon = "__yi_pfw__/graphics/zmaterial/panz4_32.png"
	},	
	]]	
	{ type = "item", name = "y-combat-armor-3", icon = "__yi_pfw__/graphics/zmaterial/panz4_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 250, placed_as_equipment_result = "y-combat-armor-3",},

	{ type = "recipe", name = "y-zproduct-5-recipe", 
		energy_required= 4, 
		ingredients = {{"y-chip-1",1},}, 
		results = {{type="item", name="y-combat-train", amount=6,},}, 
		enabled = "true", order="factory", subgroup = "yi-component", 
		category= "yrcat-component",
		icon = "__yi_pfw__/graphics/zmaterial/combattrain-icon.png"
	},						
	{ type = "item", name = "y-combat-train", icon = "__yi_pfw__/graphics/zmaterial/combattrain-icon.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 2500, },

	{ type = "recipe", name = "y-zproduct-6-recipe", 
		energy_required= 4, 
		ingredients = {{"y-biomass",2},{"y-basic-t1-mf",1},}, 
		results = {{type="item", name="y-medic", amount=6,},}, 
		enabled = "true", order="factory", subgroup = "yi-component", 
		category= "yrcat-component",
		icon = "__yi_pfw__/graphics/zmaterial/medic-icon.png",
	},						
	{ type = "item", name = "y-medic", icon = "__yi_pfw__/graphics/zmaterial/medic-icon.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 2500, },

	{ type = "recipe", name = "y-zproduct-7-recipe", 
		energy_required= 4, 
		ingredients = {{"y-chip-1",2},{"y-stuff-1",1},{"iron-plate",4},}, 
		results = {{type="item", name="y-zielfern", amount=4,},}, 
		enabled = "true", order="factory", subgroup = "yi-component", 
		category= "yrcat-component",
		icon = "__yi_pfw__/graphics/zmaterial/zielfern-icon.png",
	},						
	{ type = "item", name = "y-zielfern", icon = "__yi_pfw__/graphics/zmaterial/zielfern-icon.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 2500, },
	
	
	{ type = "recipe", name = "y-zproduct-8-recipe", energy_required = 2, ingredients = {{"y-iron-case",2},{"y-refined-yres1",6},{"y-infused-uca2",3}, }, result = "y-zproduct-8", enabled = "true", result_count = 1, order="y-zproduct-8", subgroup = "yi-component", category="yrcat-component",},		
	{ type = "recipe", name = "y-zproduct-8charge-recipe", energy_required = 2, ingredients = {{"y-zproduct-8-empty",1},{"y-infused-uca2",3}, }, result = "y-zproduct-8", enabled = "true", result_count = 1, order="y-zproduct-8", subgroup = "yi-component", category="yrcat-component", icon = "__yi_pfw__/graphics/fab8/fusion-cell-empty.png",},		
	
	{ type = "item", name = "y-zproduct-8", icon = "__yi_pfw__/graphics/fab8/fusion-cell.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, fuel_value="12GJ", placed_as_equipment_result = "y-zproduct-8",},
	{ type = "item", name = "y-zproduct-8-empty", icon = "__yi_pfw__/graphics/fab8/fusion-cell-empty.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 400,},
	{ type = "recipe", name = "y-rzproduct-8-recipe", ingredients = {{"y-zproduct-8",1},}, results = {{type="item", name="y-stuff-2", amount=1,},{type="item", name="y-redcoil", amount=3,},{type="item", name="y-grycoil", amount=3,},{type="item", name="y-zproduct-8-empty", amount=1,},}, enabled = "true", order="y-zproduct-8", subgroup = "yi-retrade", category="yrcat-retrade", icon = "__yi_pfw__/graphics/fab8/fusion-cell-sell.png" },	
	
})	
	