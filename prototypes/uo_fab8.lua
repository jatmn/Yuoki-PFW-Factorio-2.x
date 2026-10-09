data:extend(
{

	{
		type = "energy-shield-equipment",
		name = "y-combat-armor-2",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/panz_5-96be.png",
			width = 96,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 3,
			height = 2,
			type = "full"
		},
		max_shield_value = 120,
		energy_source =
		{
			type = "electric",
			buffer_capacity = "15kJ",
			input_flow_limit = "30kW",
			usage_priority = "primary-input"
		},
		energy_per_shield = "3kJ",
		categories = {"armor"},
	},
	
	{
		type = "energy-shield-equipment",
		name = "y-combat-armor-3",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/panz_4-96be.png",
			width = 96,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 3,
			height = 2,
			type = "full"
		},
		max_shield_value = 240,
		energy_source =
		{
			type = "electric",
			buffer_capacity = "25kJ",
			input_flow_limit = "50kW",
			usage_priority = "primary-input"
		},
		energy_per_shield = "5kJ",
		categories = {"armor"},
	},
	
	{
		type = "energy-shield-equipment",
		name = "y-equ-1",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/lfg13_64.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		max_shield_value = 240,
		energy_source =
		{
			type = "electric",
			buffer_capacity = "35kJ",
			input_flow_limit = "70kW",
			usage_priority = "primary-input"
		},
		energy_per_shield = "7kJ",
		categories = {"armor"},
	},	
	
	{
		type = "energy-shield-equipment",
		name = "y-equ-2",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/mfg28_96.png",
			width = 96,
			height = 96,
			priority = "medium"
		},
		shape =
		{
			width = 3,
			height = 3,
			type = "full"
		},
		max_shield_value = 630,
		energy_source =
		{
			type = "electric",
			buffer_capacity = "56kJ",
			input_flow_limit = "110kW",
			usage_priority = "primary-input"
		},
		energy_per_shield = "8kJ",
		categories = {"armor"},
	},
	
	{
		type = "battery-equipment",
		name = "y-zproduct-8",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/fusion-cell-64.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "15MJ",
			input_flow_limit = "15MW",
			output_flow_limit = "15MW",
			usage_priority = "tertiary"
		},
		categories = {"armor"},
	},
	
	-- Parent owner: Yuoki, generator-equipment yi_equip_generator_a. Preserved inactive PFW definition.
	--[=[
	{
		type = "generator-equipment",
		name = "y-equ-6",
		sprite = 
		{
			filename = "__yi_pfw__/graphics/equip/energy-128e.png",
			width = 128,
			height = 128,
			priority = "medium"
		},
		shape =
		{
			width = 4,
			height = 4,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "primary-output"
		},
		power = "15MW",
		categories = {"armor"},
	},
	]=]
	
	-- Parent owner: Yuoki, movement-bonus-equipment yi_equip_legs_a. Preserved inactive PFW definition.
	--[=[
	{
		type = "movement-bonus-equipment",
		name = "y-equ-9",
		sprite =
		{
			filename = "__yi_pfw__/graphics/equip/exo1_upgrade_e.png",
			width = 64,
			height = 96,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 3,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_consumption = "18kW",
		movement_bonus = 0.275,
		categories = {"armor"},
	},
	]=]
	
	
})
