data:extend(
{

	-- Grenade Launcher
	--[[
	{
		type = "gun",
		name = "y-sm-3",
		icon = "__yi_pfw__/graphics/fab2/grenade-gun.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "a[basic-clips]-b[submachine-gun]",
		attack_parameters =
		{
			ammo_category = "capsule",
			cooldown = 12,
			movement_slow_down_factor = 0.8,
			shell_particle =
			{
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.5,
				speed_deviation = 0.03,
				center = {0, 0.6},
				creation_distance = 0.6,
				starting_frame_speed = 0.4,
				starting_frame_speed_deviation = 0.1
			},
			projectile_creation_distance = 0.6,
			range = 18,
			sound =
			{
				{
					filename = "__base__/sound/railgun.ogg",
					volume = 0.2
				}
			}
		},
		stack_size = 100
	},
	]]
	
	-- Minigun
	{
		type = "gun",
		name = "y-sm-5",
		icon = "__yi_pfw__/graphics/fab2/minigun.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "a[basic-clips]-b[submachine-gun]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 2,
			movement_slow_down_factor = 0.8,
			damage_modifier = 2,
			shell_particle =
			{
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.1,
				speed_deviation = 0.03,
				center = {0, 0.6},
				creation_distance = 0.6,
				starting_frame_speed = 0.4,
				starting_frame_speed_deviation = 0.1
			},
			projectile_creation_distance = 0.6,
			range = 18,
			sound =
			{
				{
					filename = "__base__/sound/railgun.ogg",
					volume = 0.2
				}
			}
		},
		stack_size = 100
	},

	-- Lasergun
	{
		type = "gun",
		name = "y-sm-1",
		icon = "__yi_pfw__/graphics/fab2/lasergun.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "c[railgun]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "railgun",
			cooldown = 20,
			movement_slow_down_factor = 0.0,
			projectile_creation_distance = 0.6,
			range = 40,
			damage_modifier = 4,
			sound =
			{
				{
					filename = "__base__/sound/fight/laser-1.ogg",
					volume = 0.2
				}
			}
		},
		stack_size = 100
	},

	-- Plasmagun
	{
		type = "gun",
		name = "y-sm-2",
		icon = "__yi_pfw__/graphics/fab2/plasma-gun.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "c[railgun]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "railgun",
			cooldown = 7,
			movement_slow_down_factor = 0.2,
			projectile_creation_distance = 0.6,
			range = 16,
			damage_modifier = 4,
			sound =
			{
				{
					filename = "__base__/sound/fight/laser-1.ogg",
					volume = 0.2
				}
			}
		},
		stack_size = 100
	},

	{
		type = "ammo",
		name = "y-mun-2",
		icon = "__yi_pfw__/graphics/fab1/bst_z1.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			category = "railgun",
			target_type = "direction",
			
			action =
			{
				type = "direct",
				repeat_count = 16,
				action_delivery =
				{
					type = "projectile",
					projectile = "p2",
					--projectile = "piercing-shotgun-pellet",
					starting_speed = 1.5,
					direction_deviation = 0.0,
					range_deviation = 0.0,
					max_range = 20,
					target_effects =
					{
						type = "damage",
						damage = { amount = 20, type="fire"}
					}					
				}
			}

		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "c[railgun]",
		stack_size = 1000
	},	
	
	
	{
		type = "projectile",
		name = "p2",
		flags = {"not-on-map"},
		collision_box = {{-0.05, -1}, {0.05, 1}},
		acceleration = 0,
		direction_only = true,
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					type = "damage",
					damage = {amount = 6, type = "physical"}
				}
			}
		},
		animation =
		{
			filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
			tint = {r=0.0, g=1.0, b=0.0},
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		},
	},	
}
)
