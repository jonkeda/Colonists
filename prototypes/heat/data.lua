require("prototypes.heat.heat_generator")


 
data:extend({

    {
        type = "item-subgroup",
        name = "colonists-heat",
        group = "colonists",
    },

    {
        type = "fuel-category",
        name = "colonists-heat"
    },

    {
    type = "recipe-category",
    name = "colonists-heat-processing"
    },

    {
        type = "fluid",
        name = "colonists-heat",
        default_temperature = 15,
        max_temperature = 100,
        heat_capacity = "0.2KJ",
        base_color = {r=0, g=0.34, b=0.6},
        flow_color = {r=0.7, g=0.7, b=0.7},
        icon = "__Colonists__/graphics/icons/fluid/heat.png",
        icon_size = 32, icon_mipmaps = 4,
        order = "a[fluid]-a[heat]",

        auto_barrel = false, 

        fuel_category = "colonists-heat",
        fuel_value = "4MJ",
    },
    
    {
        type = "recipe",
        name = "colonists-heat",
        category = "colonists-heat-processing",
        ingredients = { },
        results = {{type="fluid", name="colonists-heat", amount=25}},
        enabled = true,
        hide_from_player_crafting = true
    },     

    -- cold item
    {
        type = "item",
        name = "colonists-cold",
        icon = "__Colonists__/graphics/icons/housing/houseCold.png",
        icon_size = 32,
        flags = {"hidden"},
        subgroup="colonists-products",
        --subgroup = "void",
        order = "cold",
        stack_size = 100
    },

    -- {
    --     type = "arrow",
    --     name = "cold-arrow",
    --     flags = {"placeable-off-grid", "not-on-map"},
    --     blinking = true,
    --     arrow_picture =
    --     {
    --         filename = "__core__/graphics/empty.png",
    --         priority = "low",
    --         width = 1,
    --         height = 1
    --     },
    --     circle_picture =
    --     {
    --         filename = "__Colonists__/graphics/icons/housing/houseCold.png",
    --         priority = "low",
    --         width = 32,
    --         height = 32
    --     }
    -- },

}
)
    
table.insert(data.raw["technology"]["automation"].effects, {type = "unlock-recipe", recipe = "colonists-heat-generator"})
if data.raw["technology"]["electronics"].effects then
    table.insert(data.raw["technology"]["electronics"].effects, {type = "unlock-recipe", recipe = "colonists-electric-heat-generator"})
else
    data.raw["technology"]["electronics"].effects = { {type = "unlock-recipe", recipe = "colonists-electric-heat-generator" } }
end