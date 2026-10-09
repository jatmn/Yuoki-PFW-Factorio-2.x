data:extend(
{  

	-- 1- munition
	-- 2- handwaffen
	-- 3- materials
	-- 4- schwere waffen 
	-- 5- fahrzeuge
	-- 6- panzer
	-- 7- material
	-- 8- ausrüstung	
	--[[
	y-equ-0=Shield Generator Basic Component
	y-equ-1=Shield Generator CF-56
	y-equ-2=Shield Generator KT-34
	y-equ-3=Advanced Targeting Device
	y-equ-4=Battlefield Energy Support
	y-equ-5=Battlefield Energy Stockpile
	y-equ-6=Mobile Energy Generator
	]]
	
	{ type = "recipe", name = "y-fab8a-recipe", energy_required = 3, ingredients = {{type="item", name="y-stuff-4", amount=1},{type="item", name="y-iron-case", amount=8},{type="item", name="y-refined-yres1", amount=8},{type="item", name="y-chip-1", amount=8},}, results = {{type="item", name="y-equ-0", amount=1}}, enabled = true,  order="equ-0", subgroup = "yi-material", categories={"yrcat-material"},},
	--{ type = "recipe", name = "y-fab8b-recipe", energy_required = 3, ingredients = {{"y-equ-0",1},{"y-stuff-5",2},{"y_blocked_capa",2},}, result = "y-equ-1", enabled = "true", result_count = 1, order="equ-1", subgroup = "yi-material", category="yrcat-material",},		
	--{ type = "recipe", name = "y-fab8c-recipe", energy_required = 3, ingredients = {{"y-equ-0",1},{"y-stuff-5",4},{"y-accumulator-m",6},}, result = "y-equ-2", enabled = "true", result_count = 1, order="equ-2", subgroup = "yi-material", category="yrcat-material",},		
	{ type = "recipe", name = "y-fab8d-recipe", energy_required = 3, ingredients = {{type="item", name="y-zielfern", amount=1},{type="item", name="y-equ-0", amount=1},{type="item", name="y-sm-1", amount=1},{type="item", name="y-cyb-0", amount=4},{type="item", name="y-iron-case", amount=1},{type="item", name="y-zproduct-8", amount=1},}, results = {{type="item", name="y-equ-3", amount=1}}, enabled = true,  order="equ-3", subgroup = "yi-material", categories={"yrcat-material"},},
	
	{ type = "recipe", name = "y-fab8e-recipe", energy_required = 3, ingredients = {{type="item", name="y-meg-s", amount=2},{type="item", name="y-beg", amount=1},{type="item", name="y-ups-flywheel-b", amount=2},{type="item", name="y-stirling-solar-dish", amount=8},{type="item", name="y-conductive-wire-1", amount=12},}, results = {{type="item", name="y-equ-4", amount=1}}, enabled = true,  order="equ-4", subgroup = "yi-material", categories={"yrcat-material"},},
	{ type = "recipe", name = "y-fab8f-recipe", energy_required = 3, ingredients = {{type="item", name="y-ups-flywheel-b", amount=4},{type="item", name="y-accumulator-b", amount=8},{type="item", name="y-stuff-3", amount=3},{type="item", name="y-conductive-wire-1", amount=14},{type="item", name="y-iron-case", amount=4}}, results = {{type="item", name="y-equ-5", amount=1}}, enabled = true,  order="equ-5", subgroup = "yi-material", categories={"yrcat-material"},},
	-- Parent reference for future restoration: y-equ-6 -> yi_equip_generator_a. Keep this declaration inactive.
	--{ type = "recipe", name = "y-fab8g-recipe", energy_required = 3, ingredients = {{"y-stuff-3",1},{"y-stuff-4",1},{"y-stuff-5",1},{"y-basic-t2-mf",1},{"y-iron-case",1} }, result = "y-equ-6", enabled = "true", result_count = 1, order="equ-6", subgroup = "yi-material", category="yrcat-material",},		
	
	--{ type = "recipe", name = "y-fab8h-recipe", energy_required = 2, ingredients = {{"y-biomass",5},{"y-medic",1},{"y-combat-train",5}, }, result = "y-equ-7", enabled = "true", result_count = 1, order="equ-7", subgroup = "yi-material", category="yrcat-material",},		
	--{ type = "recipe", name = "y-fab8i-recipe", energy_required = 2, ingredients = {{"y-basic-t1-mf",2},{"y-sm-1",2},{"y-combat-armor-3",1},{"y-chip-2",1}, }, result = "y-equ-8", enabled = "true", result_count = 1, order="equ-8", subgroup = "yi-material", category="yrcat-material",},		
	-- Parent recipe: Yuoki yi_equip_legs_a has the same materials, but 3s in yuoki-wonder.
	-- Preserve this distinct 2s war-factory access idea inactive; output would be yi_equip_legs_a.
	--{ type = "recipe", name = "y-fab8k-recipe", energy_required = 2, ingredients = {{"y-basic-t2-mf",8},{"y_structure_element",12},{"y-bluegear",8},{"y-chip-2",2}, }, result = "y-equ-9", enabled = "true", result_count = 1, order="equ-9", subgroup = "yi-material", category="yrcat-material",},		
		
		
	{ type = "item", name = "y-equ-0", icon = "__yi_pfw__/graphics/fab8/teil_04_32.png", icon_size = 64, order = "a", stack_size = 100, },
	{ type = "item", name = "y-equ-1", icon = "__Yuoki__/graphics/armor/lfg13.png", icon_size = 64, order = "a", stack_size = 100, place_as_equipment_result = "y-equ-1",},
	{ type = "item", name = "y-equ-2", icon = "__Yuoki__/graphics/armor/mfg28.png", icon_size = 64, order = "a", stack_size = 100, place_as_equipment_result = "y-equ-2",},
	{ type = "item", name = "y-equ-3", icon = "__yi_pfw__/graphics/fab8/msg-cb.png", icon_size = 64, order = "a", stack_size = 100, },
	{ type = "item", name = "y-equ-4", icon = "__yi_pfw__/graphics/fab8/sfg400.png", icon_size = 64, order = "a", stack_size = 100, },
	{ type = "item", name = "y-equ-5", icon = "__yi_pfw__/graphics/fab8/teil_02.png", icon_size = 64, order = "a", stack_size = 100, },
	-- Parent owner: Yuoki, item yi_equip_generator_a. Preserved inactive PFW definition.
	--[=[
	{ type = "item", name = "y-equ-6", icon = "__Yuoki__/graphics/armor/energy_icon.png", icon_size = 64, order = "a", stack_size = 100, place_as_equipment_result = "y-equ-6",},
	]=]
	--{ type = "item", name = "y-equ-7", icon = "__yi_pfw__/graphics/fab8/mcb_sani_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },
	--{ type = "item", name = "y-equ-8", icon = "__yi_pfw__/graphics/fab8/neron_u3_32.png", flags = {"goes-to-main-inventory"}, order = "a", stack_size = 100, },	
	-- Parent owner: Yuoki, item yi_equip_legs_a. Preserved inactive PFW definition.
	--[=[
	{ type = "item", name = "y-equ-9", icon = "__Yuoki__/graphics/armor/exo1_icon_e.png", icon_size = 64, order = "a", stack_size = 100, place_as_equipment_result = "y-equ-9",},
	]=]
	
	
	-- Retrade !!!		
	--{ type = "recipe", name = "y-rfab8a-recipe", ingredients = {{"y-equ-0",1},}, results = {{type="item", name="y-unicomp-a2", amount=1,},}, enabled = "true", order="equ-0", subgroup = "yi-retrade8", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-equ-0") },
	{ type = "recipe", name = "y-rfab8b-recipe", ingredients = {{type="item", name="y-equ-1", amount=1},}, results = {{type="item", name="y-stuff-1", amount=1,},{type="item", name="y-redcoil", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-1", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab8c-recipe", ingredients = {{type="item", name="y-equ-2", amount=1},}, results = {{type="item", name="y-stuff-4", amount=2,},{type="item", name="y-stuff-2", amount=4,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-2", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab8d-recipe", ingredients = {{type="item", name="y-equ-3", amount=1},}, results = {{type="item", name="y-stuff-2", amount=4,},{type="item", name="y-grycoil", amount=6,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-3", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	
	{ type = "recipe", name = "y-rfab8e-recipe", ingredients = {{type="item", name="y-equ-4", amount=1},}, results = {{type="item", name="y-stuff-4", amount=2,},{type="item", name="y-stuff-5", amount=3,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-4", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab8f-recipe", ingredients = {{type="item", name="y-equ-5", amount=1},}, results = {{type="item", name="y-stuff-6", amount=1,},{type="item", name="y-unicomp-a2", amount=245,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-5", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	{ type = "recipe", name = "y-rfab8g-recipe", ingredients = {{type="item", name="yi_equip_generator_a", amount=1},}, results = {{type="item", name="y-stuff-1", amount=8,},{type="item", name="y-stuff-2", amount=6,},{type="item", name="ypfw_trader_sign", amount=1,},}, enabled = true, order="equ-6", subgroup = "yi-retrade8", categories={"yrcat-retrade"}, },
	--{ type = "recipe", name = "y-rfab8h-recipe", ingredients = {{"y-equ-7",9},}, results = {{type="item", name="y-unicomp-a2", amount=1,}, {type="item", name="y-stuff-2", amount=2,},}, enabled = "true", order="equ-7", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-equ-7") },
	--{ type = "recipe", name = "y-rfab8i-recipe", ingredients = {{"y-equ-8",2},}, results = {{type="item", name="y-stuff-4", amount=1,}, {type="item", name="y-stuff-3", amount=3,},{type="item", name="y-unicomp-a2", amount=10,}}, enabled = "true", order="equ-8", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("y-equ-8") },
	-- Parent reference for future restoration: y-equ-9 -> yi_equip_legs_a. Keep this declaration inactive.
	--{ type = "recipe", name = "y-rfab8k-recipe", ingredients = {{"y-equ-9",2},}, results = {{type="item", name="y-stuff-6", amount=1,}, {type="item", name="y-stuff-5", amount=4,},}, enabled = "true", order="equ-9", subgroup = "yi-retrade", category="yrcat-retrade", icons = yi.lib.recipe.atomics.item_down("yi_equip_legs_a") },
	
})	
	