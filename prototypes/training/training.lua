data:extend({
    {
        type = "item-subgroup",
        name = "colonists-buildings-training",
        group = "colonists",
        order = "d-c"
    },

    -- training item
    {
        type = "item",
        name = "colonists-training-1",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "colonists-buildings-training",
        order = "a[colonists-training-1]",
        place_result = "colonists-training-1",
        stack_size = 20
    },
    {
        type = "item",
        name = "colonists-training-2",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "colonists-buildings-training",
        order = "b[colonists-training-1]",
        place_result = "colonists-training-2",
        stack_size = 20
    },
    {
        type = "item",
        name = "colonists-training-3",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "colonists-buildings-training",
        order = "b[colonists-training-1]",
        place_result = "colonists-training-3",
        stack_size = 20
    },

    -- training entity
    -- colonists training center
    {
        type = "assembling-machine",
        name = "colonists-training-1",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-training-1"},
        max_health = 100,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.33
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop-shadow.png",
                    width = 122,
                    height = 68,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop-shadow.png",
                        width = 242,
                        height = 136,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 33,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(13, 11),
                        scale = 0.33,
                        draw_as_shadow = true
                    }
                }
            }
        },
        crafting_categories = {"colonist-job-basic"},
        crafting_speed = 5,
        energy_source =
        {
            type = "burner",
            fuel_category = "chemical",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions = 0.01,
            smoke =
            {
                {
                    name = "smoke",
                    deviation = {0.1, 0.1},
                    frequency = 5,
                    position = {0.0, -0.8},
                    starting_vertical_speed = 0.08,
                    starting_frame_deviation = 60
                }
            }
        },
        energy_usage = "1kW",
        ingredient_count = 4,
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

    -- colonists school
    {
        type = "assembling-machine",
        name = "colonists-training-2",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-training-2"},
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
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.5
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop-shadow.png",
                    width = 122,
                    height = 68,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop-shadow.png",
                        width = 242,
                        height = 136,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 33,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(13, 11),
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        crafting_categories = {"colonist-job-basic", "colonist-job-advanced"},
        crafting_speed = 5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.05 / 1.5
        },
        energy_usage = "200kW",
        ingredient_count = 4,
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

    -- colonists university
    {
        type = "assembling-machine",
        name = "colonists-training-3",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-training-3"},
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
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.5
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/colonial-workshop/colonial-workshop-shadow.png",
                    width = 122,
                    height = 68,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-workshop/hr-colonial-workshop-shadow.png",
                        width = 242,
                        height = 136,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 33,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(13, 11),
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        crafting_categories = {"colonist-job-basic", "colonist-job-advanced", "colonist-job-expert"},
        crafting_speed = 5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.05 / 1.5
        },
        energy_usage = "200kW",
        ingredient_count = 4,
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

    -- training recipe

    {
        type = "recipe",
        name = "colonists-training-1",
        energy_required = 15,
        ingredients =
        {
            {"iron-plate", 1},
        },
        result = "colonists-training-1",
        enabled = false,
    },

    {
        type = "recipe",
        name = "colonists-training-2",
        energy_required = 15,
        ingredients =
        {
            {"iron-plate", 1},
        },
        result = "colonists-training-2",
        enabled = false,
    },

    {
        type = "recipe",
        name = "colonists-training-3",
        energy_required = 15,
        ingredients =
        {
            {"iron-plate", 1},
        },
        result = "colonists-training-3",
        enabled = false,
    },
})