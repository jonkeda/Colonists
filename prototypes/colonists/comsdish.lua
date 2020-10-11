data:extend({

    -- COMS DISH
    {
        type = "assembling-machine",
        name = "colonists-coms-dish",
        fixed_recipe = "colonist-arrival-data",
        icon = "__Colonists__/graphics/icons/coms-dish.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-coms-dish"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        -- light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
        -- alert_icon_shift = util.by_pixel(-3, -12),
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/coms-dish/coms-dish.png",
                    width = 171,
                    height = 190,
                    frame_count = 5,
                    line_length = 5,
                    animation_speed = 1 / 90,
                    -- 135 38 - I have no idea how this shift thing works, or what the units are
                    shift = util.by_pixel(18, -47),
                    run_mode = "forward-then-backward",
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/coms-dish/hr-coms-dish.png",
                        width = 343,
                        height = 381,
                        frame_count = 5,
                        line_length = 5,
                        animation_speed = 1 / 90,
                        shift = util.by_pixel(18, -47),
                        run_mode = "forward-then-backward",
                        scale = 0.5
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/coms-dish/coms-dish-shadow.png",
                    width = 289,
                    height = 122,
                    frame_count = 5,
                    line_length = 5,
                    animation_speed = 1 / 90,
                    --214 53
                    shift = util.by_pixel(110, 19),
                    run_mode = "forward-then-backward",
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/coms-dish/hr-coms-dish-shadow.png",
                        width = 578,
                        height = 244,
                        frame_count = 5,
                        line_length = 5,
                        animation_speed = 1 / 90,
                        shift = util.by_pixel(110, 19),
                        run_mode = "forward-then-backward",
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        crafting_categories = {"colonist-coms"},
        crafting_speed = 5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.05 / 1.5
        },
        energy_usage = "2800kW",
        ingredient_count = 1,
        -- open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        -- close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/lab.ogg",
                volume = 0.7
            },
            apparent_volume = 1
        },
        -- module_specification = { module_slots = 0 }
    },

    {
        type = "recipe-category",
        name = "colonist-coms"
    },

    {
        type = "item-subgroup",
        name = "colonist-coms",
        group = "colonists",
    },

    {
        type = "item",
        name = "colonists-coms-dish",
        icon = "__Colonists__/graphics/icons/coms-dish.png",
        icon_size = 32,
        subgroup = "colonists-buildings",
        order = "a[items]-c[coms-dish]",
        place_result = "colonists-coms-dish",
        stack_size = 20
    },

    {
        type = "item",
        name = "colonist-arrival-data",
        icon = "__Colonists__/graphics/icons/colonist-arrival-data.png",
        icon_size = 32,
        subgroup = "colonists-products",
        order = "f[arrival-data]",
        stack_size = 100
    },

    {
        type = "recipe",
        name = "colonists-coms-dish",
        energy_required = 15,
        ingredients =
        {
            {"radar", 2},
            {"processing-unit", 10},
        },
        result = "colonists-coms-dish",
        enabled = false,
    },

    {
        type = "recipe",
        name = "colonist-arrival-data",
        category = "colonist-coms",
        energy_required = 15,
        ingredients =
        {
            -- {"electronic-circuit", 1}
        },
        result= "colonist-arrival-data",
        -- allow_decomposition = false,
        enabled = true,
        subgroup = "colonist-coms",
        hide_from_player_crafting = true
    },
})

table.insert(data.raw["technology"]["advanced-electronics-2"].effects, {type = "unlock-recipe",recipe = "colonists-coms-dish"})