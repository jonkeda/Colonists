data:extend({

    -- food recipe-category
    {
        type = "recipe-category",
        name = "colonist-food-1"
    },
    {
        type = "recipe-category",
        name = "colonist-food-2"
    },
    {
        type = "recipe-category",
        name = "colonist-food-3"
    },

    {
        type = "item-subgroup",
        name = "colonists-buildings-food",
        group = "colonists",
        order = "d-b"
    },

    -- food item
    {
        type = "item",
        name = "colonists-building-food-1",
        icon = "__base__/graphics/icons/assembling-machine-1.png",
        icon_size = 32,

        subgroup = "colonists-buildings-food",
        order = "a[colonists-building-food-1]",
        place_result = "colonists-building-food-1",
        stack_size = 50
    },
    {
        type = "item",
        name = "colonists-building-food-2",
        icon = "__base__/graphics/icons/assembling-machine-2.png",
        icon_size = 32,

        subgroup = "colonists-buildings-food",
        order = "b[colonists-building-food-2]",
        place_result = "colonists-building-food-2",
        stack_size = 50
    },
    {
        type = "item",
        name = "colonists-building-food-3",
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 32,

        subgroup = "colonists-buildings-food",
        order = "c[colonists-building-food-3]",
        place_result = "colonists-building-food-3",
        stack_size = 50
    },

    -- Food entity
    -- colonists-building-food-1 chop house
    {
        type = "furnace",
        name = "colonists-building-food-1",
        icon = "__base__/graphics/icons/assembling-machine-1.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-building-food-1"},
        max_health = 100,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        alert_icon_shift = util.by_pixel(-3, -12),
        resistances =
        {
            {
                type = "fire",
                percent = 70
            }
        },
        fluid_boxes =
        {
            --            {
            --                production_type = "input",
            --                pipe_picture = assembler2pipepictures(),
            --                pipe_covers = pipecoverspictures(),
            --                base_area = 10,
            --                base_level = -1,
            --                pipe_connections = {{ type="input", position = {0, -2} }},
            --                secondary_draw_orders = { north = -1 }
            --            },
            {
                production_type = "output",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, 1} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        },
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
        fast_replaceable_group = "assembling-machine",
        animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
                    priority = "high",
                    width = 108,
                    height = 114,
                    frame_count = 32,
                    line_length = 8,
                    --shift = util.by_pixel(0, 4),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
                        priority = "high",
                        width = 214,
                        height = 226,
                        frame_count = 32,
                        line_length = 8,
                        --shift = util.by_pixel(0, 4),
                        scale = 0.33
                    }
                },
                {
                    filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
                    priority = "high",
                    width = 95,
                    height = 83,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    --shift = util.by_pixel(12, 5),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
                        priority = "high",
                        width = 190,
                        height = 165,
                        frame_count = 32,
                        line_length = 8,
                        draw_as_shadow = true,
                        --shift = util.by_pixel(12, 4.75),
                        scale = 0.33
                    }
                }
            }
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/assembling-machine-t2-1.ogg",
                    volume = 0.8
                },
                {
                    filename = "__base__/sound/assembling-machine-t2-2.ogg",
                    volume = 0.8
                }
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5
        },
        crafting_categories = {"waste-fluid", "colonist-food-1" },
        source_inventory_size = 1,
        crafting_speed = 0.75,
        result_inventory_size = 1,
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
        energy_usage = "10kW",
        ingredient_count = 4,
        module_specification =
        {
            module_slots = 1
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    },

    -- colonists-building-food-2 cantine
    {
        type = "assembling-machine",
        name = "colonists-building-food-2",
        icon = "__base__/graphics/icons/assembling-machine-2.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-building-food-2"},
        max_health = 350,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        alert_icon_shift = util.by_pixel(-3, -12),
        resistances =
        {
            {
                type = "fire",
                percent = 70
            }
        },
        fluid_boxes =
        {
            --            {
            --                production_type = "input",
            --                pipe_picture = assembler2pipepictures(),
            --                pipe_covers = pipecoverspictures(),
            --                base_area = 10,
            --                base_level = -1,
            --                pipe_connections = {{ type="input", position = {0, -2} }},
            --                secondary_draw_orders = { north = -1 }
            --            },
            {
                production_type = "output",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, 2} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        fast_replaceable_group = "assembling-machine",
        animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
                    priority = "high",
                    width = 108,
                    height = 110,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
                        priority = "high",
                        width = 214,
                        height = 218,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, 4),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
                    priority = "high",
                    width = 98,
                    height = 82,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(12, 5),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
                        priority = "high",
                        width = 196,
                        height = 163,
                        frame_count = 32,
                        line_length = 8,
                        draw_as_shadow = true,
                        shift = util.by_pixel(12, 4.75),
                        scale = 0.5
                    }
                }
            }
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/assembling-machine-t2-1.ogg",
                    volume = 0.8
                },
                {
                    filename = "__base__/sound/assembling-machine-t2-2.ogg",
                    volume = 0.8
                }
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5
        },
        crafting_categories = {"waste-fluid", "colonist-food-1" , "colonist-food-2" },
        crafting_speed = 0.75,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 0.04 / 2.5
        },
        energy_usage = "150kW",
        ingredient_count = 4,
        module_specification =
        {
            module_slots = 2
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    },

    -- colonists-building-food-3 restaurant
    {
        type = "assembling-machine",
        name = "colonists-building-food-3",
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-building-food-3"},
        max_health = 350,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        alert_icon_shift = util.by_pixel(-3, -12),
        resistances =
        {
            {
                type = "fire",
                percent = 70
            }
        },
        fluid_boxes =
        {
            --            {
            --                production_type = "input",
            --                pipe_picture = assembler2pipepictures(),
            --                pipe_covers = pipecoverspictures(),
            --                base_area = 10,
            --                base_level = -1,
            --                pipe_connections = {{ type="input", position = {0, -2} }},
            --                secondary_draw_orders = { north = -1 }
            --            },
            {
                production_type = "output",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, 2} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        fast_replaceable_group = "assembling-machine",
        animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
                    priority = "high",
                    width = 108,
                    height = 119,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.5),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
                        priority = "high",
                        width = 214,
                        height = 237,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, -0.75),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
                    priority = "high",
                    width = 130,
                    height = 82,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28, 4),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
                        priority = "high",
                        width = 260,
                        height = 162,
                        frame_count = 32,
                        line_length = 8,
                        draw_as_shadow = true,
                        shift = util.by_pixel(28, 4),
                        scale = 0.5
                    }
                }
            }
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/assembling-machine-t2-1.ogg",
                    volume = 0.8
                },
                {
                    filename = "__base__/sound/assembling-machine-t2-2.ogg",
                    volume = 0.8
                }
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5
        },
        crafting_categories = {"waste-fluid", "colonist-food-1" , "colonist-food-2" , "colonist-food-3" },
        crafting_speed = 0.75,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 0.04 / 2.5
        },
        energy_usage = "150kW",
        ingredient_count = 4,
        module_specification =
        {
            module_slots = 2
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    },

    -- food recipe
    {
        type = "recipe",
        name = "colonists-building-food-1",
        ingredients =
        {
            {"wood", 4},
            {"iron-plate", 2},
        },
        result = "colonists-building-food-1",
        enabled = false,
    },
    {
        type = "recipe",
        name = "colonists-building-food-2",
        ingredients =
        {
            {"wood", 1},
            {"iron-plate", 1},
        },
        result = "colonists-building-food-2",
        enabled = false,
    },
    {
        type = "recipe",
        name = "colonists-building-food-3",
        ingredients =
        {
            {"wood", 1},
            {"iron-plate", 1},
        },
        result = "colonists-building-food-3",
        enabled = false,
    },

    -- Food technology
--    {
--        type = "technology",
--        name = "colonist-food-b",
--        icon = "__Colonists__/graphics/technology/colonists-charter.png",
--        icon_size = 128,
--        prerequisites =
--        {
--            "frying"
--        },
--        effects =
--        {
--            {type = "unlock-recipe", recipe = "colonists-building-food-2"},
--        },
--        unit =
--        {
--            time = 60,
--            count = 150,
--            ingredients =
--            {
--                {"science-pack-1", 1},
--                {"science-pack-2", 1},
--            },
--        },
--        order = "w",
--    },
--    {
--        type = "technology",
--        name = "colonist-food-c",
--        icon = "__Colonists__/graphics/technology/colonists-charter.png",
--        icon_size = 128,
--        prerequisites =
--        {
--            "complex-foods"
--        },
--        effects =
--        {
--            {type = "unlock-recipe", recipe = "colonists-building-food-3"},
--        },
--        unit =
--        {
--            time = 60,
--            count = 150,
--            ingredients =
--            {
--                {"science-pack-1", 1},
--                {"science-pack-2", 1},
--            },
--        },
--        order = "w",
--    },
})