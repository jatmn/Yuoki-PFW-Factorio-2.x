-- First walker now belongs to Yuoki; the second armor mapping remains pending.
data:extend(
{

	-- Parent owner: Yuoki, equipment-grid y_walker_grid. Preserved inactive PFW definition.
	--[=[
	{
		type = "equipment-grid",
		name = "yi-pfw-walker-grid",
		width = 12,
		height = 12,
		equipment_categories = {"armor"},
	},
	]=]

	{
		type = "equipment-grid",
		name = "y_armor_grid",
		width = 14,
		height = 14,
		equipment_categories = {"armor"},
	},
	
	
	-- Parent armor: Yuoki yi_walker_a. This distinct conversion remains inactive.
	--{ type = "recipe", name = "y-fab3ix_y8-recipe", energy_required = 5, ingredients = {{"y-cyb-8",1},{"y-fame",1}, }, result = "y-cyb-8u", enabled = "true", result_count = 1, order="sm-8", subgroup = "yi-basic", },			
	--{ type = "recipe", name = "y-fab3ix_y9-recipe", energy_required = 5, ingredients = {{"y-cyb-9",1},{"y-fame",3}, }, result = "y-cyb-9u", enabled = "true", result_count = 1, order="sm-9", subgroup = "yi-basic", },		
	
	-- Parent owner: Yuoki, armor yi_walker_a. Preserved inactive PFW definition.
	--[=[
	{
		type = "armor",
		name = "y-cyb-8u",
		icon = "__yi_pfw__/graphics/fab3/neron_u3_32.png", icon_size = 32,
		resistances = 
		{
			{	type = "physical", decrease = 12, percent = 55 },
			{	type = "acid", decrease = 12, percent = 55 },
			{	type = "explosion", decrease = 20, percent = 55 }
		},
		durability = 25000,
		subgroup = "armor",
		order = "e[power-armor-mk2]",
		stack_size = 1,
		equipment_grid = "yi-pfw-walker-grid",
		inventory_size_bonus = 30						
	},
	]=]

	{
		type = "armor",
		name = "y-cyb-9u",
		icon = "__yi_pfw__/graphics/fab3/neron_u5_32.png", icon_size = 32,
		resistances = 
		{
			{	type = "physical", decrease = 14, percent = 75 },
			{	type = "acid", decrease = 14, percent = 75 },
			{	type = "explosion", decrease = 20, percent = 75 }
		},
		durability = 30000,
		subgroup = "armor",
		order = "e[power-armor-mk2]",
		stack_size = 1,
		equipment_grid = "y_armor_grid",
	}
	
	
})
