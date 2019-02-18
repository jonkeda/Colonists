local fi = data.raw["item-group"]["food-industry"]

if fi == nil then
    data:extend({

        {
            type = "autoplace-control",
            category = "resource",
            name = "food-plant",
            order = "w",
            richness = false,
        },
        {
            type = "fuel-category",
            name = "plant",
        },
        {
            type = "fuel-category",
            name = "humus"
        },

        {
            type = "item",
            name = "fertilizer",
            icon = "__Colonists__/graphics/icons/items/fertilizer.png",
            icon_size = 32,
            flags = {"goes-to-main-inventory"},
            subgroup = "colonists-food-items",
            order = "w-b-g",
            stack_size = 50
        },

        {
        type = "recipe",
        name = "fertilizer-from-waste",
        category = "chemistry",
        energy_required = 3,
        ingredients =
        {
            {type="fluid", name="waste", amount=10}
        },
        results=
        {
            {type="item", name="fertilizer", amount=1}
        },
        icon = "__Colonists__/graphics/icons/items/fertilizer.png",
        icon_size = 32,
        subgroup="colonists-waste",
        enabled = false,
        order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
        crafting_machine_tint =
        {
            primary = {r = 0.270, g = 0.122, b = 0.000, a = 0.000}, -- #441f0000
            secondary = {r = 0.735, g = 0.546, b = 0.325, a = 0.000}, -- #bb8b5200
            tertiary = {r = 0.610, g = 0.348, b = 0.000, a = 0.000}, -- #9b580000
        }
        },
        {
            type = "technology",
            name = "frying",
            icon = "__Colonists__/graphics/technology/frying.png",
            icon_size = 128,
            prerequisites = {},
            effects =
            {
            },
            unit =
            {
                time = 20,
                count = 30,
                ingredients =
                {
                    {"science-pack-1", 1}
                },
            },
            order = "w",
        },
        {
            type = "technology",
            name = "complex-foods",
            icon = "__Colonists__/graphics/technology/complex-foods.png",
            icon_size = 128,
            prerequisites = {},
            effects =
            {
            },
            unit =
            {
                time = 60,
                count = 200,
                ingredients =
                {
                    {"science-pack-1", 1},
                },
            },
            order = "w",
        },

    })
end