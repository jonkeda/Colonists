require("prototypes.waste.waste-storage")
require("prototypes.waste.waste_disposal")

data:extend({
    {
        type = "item-subgroup",
        name = "colonists-buildings-waste",
        group = "colonists",
        order = "d-a"
    },

    -- waste recipe-category
    {
        type = "recipe-category",
        name = "colonists-waste-fluid"
    },

    -- waste
    {
        type = "fluid",
        name = "colonists-waste",
        subgroup = "colonists-fluids",
        default_temperature = 25,
        heat_capacity = "0.0KJ",
        base_color = {r=0.5, g=0.04, b=0},
        flow_color = {r=0.85, g=0.6, b=0.3},
        max_temperature = 100,
        icon = "__Colonists__/graphics/icons/fluid/oxygen.png",
        icon_size = 32,
        pressure_to_speed_ratio = 0.4,
        flow_to_energy_ratio = 0.59,
        order = "a[fluid]-x[waste]"
    },

    {
        type = "recipe",
        name = "colonists-void-waste",
        category = "void-fluid",
        hidden = "true",
        energy_required = 1,
        ingredients =
        {
            { type="fluid", name="colonists-waste", amount=25 }
        },
        results=
        {
            { type="item", name="void", amount=1, probability=0 },
        },
        subgroup = "void",
        icon = "__Colonists__/graphics/icons/fluid/oxygen.png",
        icon_size = 32,
        emissions_multiplier = -1,
        order = "colonists-waste"
    },

    {
        type = "recipe",
        name = "colonists-sulfur-from-waste",
        category = "chemistry",
        energy_required = 1,
        enabled = false,
        subgroup="colonists-products",
        ingredients =
        {
            {type="fluid", name="colonists-waste", amount=3},
        },
        results=
        {
            {type="item", name="sulfur", amount=2}
        },
        crafting_machine_tint =
        {
            primary = {r = 1.000, g = 0.659, b = 0.000, a = 0.000}, -- #ffa70000
            secondary = {r = 0.812, g = 1.000, b = 0.000, a = 0.000}, -- #cfff0000
            tertiary = {r = 0.960, g = 0.806, b = 0.000, a = 0.000}, -- #f4cd0000
        }
    },

    {
        type = "recipe",
        name = "colonists-compost-waste",
        category = "chemistry",
        energy_required = 1,
        enabled = false,
        subgroup="colonists-products",
        ingredients =
        {
            {type="fluid", name="colonists-waste", amount=1},
        },
        results=
        {
            {type="item", name="compost", amount=1}
        },
        crafting_machine_tint =
        {
            primary = {r = 1.000, g = 0.659, b = 0.000, a = 0.000}, -- #ffa70000
            secondary = {r = 0.812, g = 1.000, b = 0.000, a = 0.000}, -- #cfff0000
            tertiary = {r = 0.960, g = 0.806, b = 0.000, a = 0.000}, -- #f4cd0000
        }
    },

    {
        type = "recipe",
        name = "colonists-solid-fuel-from-waste",
        category = "chemistry",
        energy_required = 3,
        ingredients =
        {
            {type="fluid", name="colonists-waste", amount=10}
        },
        results=
        {
            {type="item", name="solid-fuel", amount=1}
        },
        icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
        icon_size = 32,
        subgroup="colonists-products",
        enabled = false,
        order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
        crafting_machine_tint =
        {
            primary = {r = 0.270, g = 0.122, b = 0.000, a = 0.000}, -- #441f0000
            secondary = {r = 0.735, g = 0.546, b = 0.325, a = 0.000}, -- #bb8b5200
            tertiary = {r = 0.610, g = 0.348, b = 0.000, a = 0.000}, -- #9b580000
        }
    },
})

table.insert(data.raw["technology"]["fluid-handling"].effects, {type = "unlock-recipe",recipe = "colonists-waste-storage"})
table.insert(data.raw["technology"]["oil-processing"].effects, {type = "unlock-recipe",recipe = "colonists-waste-disposal"})

table.insert(data.raw["technology"]["advanced-oil-processing"].effects, {type = "unlock-recipe",recipe = "colonists-solid-fuel-from-waste"})
table.insert(data.raw["technology"]["sulfur-processing"].effects, {type = "unlock-recipe",recipe = "colonists-sulfur-from-waste"})
table.insert(data.raw["technology"]["advanced-composting"].effects, {type = "unlock-recipe",recipe = "colonists-compost-waste"})
