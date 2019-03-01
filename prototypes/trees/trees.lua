local trees = {
--1			2		3			4		5		6		7			8		9			10		11		12			13			14				15		16		17		18
--name, 	time, 	to plant,	plants,	-,		seeds, 	stack size,	plant?,	seed?,	edible?,	straws,	compost,	type,	debug color,	starting,	size,	result,	chance
{"apple", 	1500, 	8,			9,		0,		2.6, 	10,			true,	true,		true,	0.0,	"3J",		"tree", {r=1,g=0.2,b=0},	20,		0.16,	5,		0.25},
}

for index, crop in pairs(trees) do
	data:extend({
		-- Fruits
		{
			type = "item",
			name = crop[1].."-"..crop[13],
			icon = "__Colonists__/graphics/icons/trees/"..crop[1].."-"..crop[13]..".png",
			icon_size = 32,

			subgroup = crop[1],
			order = "w-e-"..index.."-y",
			stack_size = 10
		},
		-- Fruit seeds recipe
		{
			type = "recipe",
			name = crop[1].."-pick",
			subgroup = crop[1],
			order = "w-e-b-y",
			enabled = false,
			icon = "__Colonists__/graphics/icons/foods/"..crop[1]..".png",
			icon_size = 32,
			category = "crafting",
			energy_required = 0.75,
			hidden = true,
			ingredients =
			{

			},
			results =
			{
				{type = "item", name = crop[1], amount_min = 1, amount_max = 2}
			}
		},
	})

	data:extend({
		-- Fruit as food
		{
			type = "capsule",
			name = crop[1],
			icon = "__Colonists__/graphics/icons/foods/"..crop[1]..".png",
			icon_size = 32,

			subgroup = crop[1],
			order = "w-d-"..index.."-x",
			stack_size = crop[7],
			capsule_action = {
				attack_parameters = {
					ammo_category = "capsule",
					ammo_type = {
						action = {
							action_delivery = {
								target_effects = {
									damage = {
										amount = 0,
										type = "physical"
									},
									type = "damage"
								},
								type = "instant"
							},
							type = "direct"
						},
						category = "capsule",
						target_type = "position"
					},
					cooldown = 30,
					range = 0,
					type = "projectile"
				},
				type = "use-on-self"
			},
			fuel_category = "plant",
			fuel_value = crop[12],
		},
	})

	data:extend({
		{
			type = "item-subgroup",
			name = crop[1],
			group = "colonists",
			order = "w-f-"..index,
		},
	})

	data:extend({

		{
			type = "tree",
			name = crop[1].."-wild-tree",
			order = "w",
			autoplace = {
				control = "food-plant",
				max_probability = 0.006,
				coverage = 0.0003,
				order = "c",
				peaks = {
					{
						noise_layer = "wild-"..crop[1],
						noise_octaves_difference = -0.85,
						noise_persistence = 0.4
					}
				},
				sharpness = 0.9375,
				starting_area_amount = 1600,
				starting_area_size = crop[15]
			},
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			darkness_of_burnt_tree = 0.5,
			emissions_per_tick = -0.001,
			flags = {
				"placeable-neutral",
				"placeable-off-grid",
				"breaths-air"
			},
			icon = "__Colonists__/graphics/icons/trees/"..crop[1].."-tree.png",
			icon_size = 32,
			max_health = 5,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				count = crop[17],
				mining_hardness = 0.1,
				mining_time = 0.5,
				results = {
					{type = "item", name = "wood", amount = 4 },
					{type = "item", name = crop[1], amount = 1, probability = crop[18] }
				},
			},
			selection_box = {
				{
					-0.4,
					-0.4
				},
				{
					0.4,
					0.4
				}
			},
			subgroup = "trees",
			pictures = {
				{
					filename = "__Colonists__/graphics/entity/trees/"..crop[1].."-wild-tree.png",
					priority = "high",
					width = 945,
					height = 771,
					scale = crop[16],
					shift = {0.89, -1.71},
				}
			},
			map_color = {r=0.1, g= 0.7, b=0}--[[crop[4]],
		},

		{
			type = "noise-layer",
			name = "wild-"..crop[1]
		}
	})
end

