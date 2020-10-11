data:extend({

    -- LANDING SITE
    {
        type = "assembling-machine",
        name = "colonists-landing-site",
        fixed_recipe = "landing-colonists",
        icon = "__Colonists__/graphics/icons/landing-site.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-landing-site"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        resistances =
        {
            {
                type = "fire",
                percent = 70
            }
        },
        collision_box = {{-4.2, -4.7}, {4.2, 4.7}},
        selection_box = {{-4.5, -5}, {4.5, 5}},
        alert_icon_shift = util.by_pixel(-3, -12),

        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/landing-site/landing-site-night.png",
                    width = 352,
                    height = 384,
                    frame_count = 1,
                    repeat_count = 16,
                    shift = {0, 0}
                    -- frame_count = 18,
                    -- line_length = 8,
                    -- shift = util.by_pixel(0, 2),
                },
            }
        },
        working_visualisations =
        {
            {
                animation =
                {
                    filename = "__Colonists__/graphics/entity/landing-site/smoke-animation.png",
                    -- 352,352,16
                    line_length = 4,
                    width = 352,
                    height = 352,
                    frame_count = 16,
                    animation_speed = 0.8,
                    -- animation_speed = 1 / crafting_speed,
                    -- shift = util.by_pixel(0, -15),
                },
            },
        },
        crafting_categories = {"colonists-landing"},
        crafting_speed = 0.5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 0.05 / 1.5
        },
        energy_usage = "90kW",
        ingredient_count = 1,
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/assembling-machine-t1-1.ogg",
                    volume = 0.8
                },
                {
                    filename = "__base__/sound/assembling-machine-t1-2.ogg",
                    volume = 0.8
                }
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5
        }
    },

    {
        type = "recipe-category",
        name = "colonists-landing"
    },
    {
        type = "item-subgroup",
        name = "colonists-buildings",
        group = "colonists",
    },
    {
        type = "item",
        name = "colonists-landing-site",
        icon = "__Colonists__/graphics/icons/landing-site.png",
        icon_size = 32,
        subgroup = "colonists-buildings",
        order = "g[items]-e[landing-site]",
        place_result = "colonists-landing-site",
        stack_size = 20
    },

    {
        type = "recipe",
        name = "colonists-landing-site",
        energy_required = 5,
        ingredients =
        {
            {"steel-plate", 30},
            {"radar", 2},
            --{"s ", 40},
        },
        result = "colonists-landing-site",
        enabled = false,
    },

    {
        type = "recipe",
        name = "landing-colonists",
        icon = "__Colonists__/graphics/icons/landing-colonists.png",
        icon_size = 32,
        energy_required = 10,
        main_product = "",
        ingredients =
        {
            {"colonist-arrival-data", 10},
        },
        results =
        {
            {
                name = "colonist",
                amount = 6
            }
        },
        allow_decomposition = false,
        category = "colonists-landing",
        subgroup = "colonists-products",
        enabled = true,
        hide_from_player_crafting = true
    },

    -- {
    --     type = "technology",
    --     name = "colonists-landing",
    --     icon_size = 128,
    --     icon = "__Colonists__/graphics/technology/colonists-coms.png",
    --     --prerequisites = {"basic-mapping"},
    --     effects =
    --     {
    --         {type = "unlock-recipe",  recipe = "colonists-landing-site"},
    --         {type = "unlock-recipe",  recipe = "landing-colonists"},
    --         {type = "unlock-recipe",  recipe = "colonists-coms-dish"},
    --         {type = "unlock-recipe",  recipe = "colonist-arrival-data"},
    --     },
    --     unit =
    --     {
    --         count = 80,
    --         ingredients =
    --         {
    --             {"automation-science-pack", 1},
    --             {"logistic-science-pack", 1},
    --         },
    --         time = 15
    --     },
    --     order = "k-b"
    -- },

})

table.insert(data.raw["technology"]["advanced-electronics-2"].effects, {type = "unlock-recipe",recipe = "colonists-landing-site"})
