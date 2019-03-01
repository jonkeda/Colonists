data:extend({
    {
        type = "item-subgroup",
        name = "colonists-buildings-housing",
        group = "colonists",
        order = "d-d"
    },

    -- housing item
    {
        type = "item",
        name = "colonial-housing-1",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        subgroup = "colonists-buildings-housing",
        order = "a[colonial-housing-1]",
        place_result = "colonial-housing-1",
        stack_size = 20
    },
    {
        type = "item",
        name = "colonial-housing-2",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        subgroup = "colonists-buildings-housing",
        order = "a[colonial-housing-2]",
        place_result = "colonial-housing-2",
        stack_size = 20
    },
    {
        type = "item",
        name = "colonial-housing-3",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        subgroup = "colonists-buildings-housing",
        order = "a[colonial-housing-3]",
        place_result = "colonial-housing-3",
        stack_size = 20
    },

    -- housing entity
    -- colonial-housing-1
    {
        type = "assembling-machine",
        name = "colonial-housing-1",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonial-housing-1"},
        max_health = 200,
        corpse = "medium-remnants",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
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
        crafting_categories = {"void-air"},
        crafting_speed = 5,
        ingredient_count = 0,

        energy_usage = "1KW",
        darkness_for_all_lamps_on = 0.5,
        darkness_for_all_lamps_off = 0.3,
        light = {intensity = 0.9, size = 40, color = {r=1.0, g=1.0, b=1.0}},
        light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
        glow_size = 6,
        glow_color_intensity = 0.135,
        picture =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
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
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
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
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
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
        overlay =
        {
            filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
            width = 98,
            height = 87,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = 0.66,
            hr_version =
            {
                filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                width = 194,
                height = 174,
                frame_count = 33,
                line_length = 11,
                animation_speed = 1 / 3,
                shift = util.by_pixel(0, 1.5),
                scale = 0.33
            }
        },
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 0.01,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 0.01,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.33
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
                    width = 122,
                    height = 68,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 0.01,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
                        width = 242,
                        height = 136,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 33,
                        animation_speed = 0.01,
                        shift = util.by_pixel(13, 11),
                        scale = 0.33,
                        draw_as_shadow = true
                    }
                }
            }
        },
        height = 1,
        width = 1,
        --        signal_to_color_mapping =
        --        {
        --            {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
        --            {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
        --            {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
        --            {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
        --            {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
        --            {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}}
        --        },
        --
        --        circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
        --        circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
        --        circuit_wire_max_distance = default_circuit_wire_max_distance
        --production = "5kW"
    },

    -- colonial-housing-1
    {
        type = "solar-panel",
        name = "colonial-housing-2",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonial-housing-2"},
        max_health = 400,
        corpse = "medium-remnants",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        energy_source =
        {
            type = "electric",
            usage_priority = "solar"
        },
        --        energy_usage_per_tick = "5KW",
        darkness_for_all_lamps_on = 0.5,
        darkness_for_all_lamps_off = 0.3,
        light = {intensity = 0.9, size = 40, color = {r=1.0, g=1.0, b=1.0}},
        light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
        glow_size = 6,
        glow_color_intensity = 0.135,
        picture =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.5
                    }
                },
--                {
--                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
--                    width = 122,
--                    height = 68,
--                    frame_count = 1,
--                    line_length = 1,
--                    repeat_count = 33,
--                    animation_speed = 1 / 3,
--                    shift = util.by_pixel(13, 11),
--                    draw_as_shadow = true,
--                    hr_version =
--                    {
--                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
--                        width = 242,
--                        height = 136,
--                        frame_count = 1,
--                        line_length = 1,
--                        repeat_count = 33,
--                        animation_speed = 1 / 3,
--                        shift = util.by_pixel(13, 11),
--                        scale = 0.5,
--                        draw_as_shadow = true
--                    }
--                }
            }
        },
        overlay =
        {
            filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
            width = 98,
            height = 87,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            hr_version =
            {
                filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                width = 194,
                height = 174,
                frame_count = 33,
                line_length = 11,
                animation_speed = 1 / 3,
                shift = util.by_pixel(0, 1.5),
                scale = 0.5
            }
        },
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.5
                    }
                },
--                {
--                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
--                    width = 122,
--                    height = 68,
--                    frame_count = 1,
--                    line_length = 1,
--                    repeat_count = 33,
--                    animation_speed = 1 / 3,
--                    shift = util.by_pixel(13, 11),
--                    draw_as_shadow = true,
--                    hr_version =
--                    {
--                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
--                        width = 242,
--                        height = 136,
--                        frame_count = 1,
--                        line_length = 1,
--                        repeat_count = 33,
--                        animation_speed = 1 / 3,
--                        shift = util.by_pixel(13, 11),
--                        scale = 0.5,
--                        draw_as_shadow = true
--                    }
--                }
            }
        },
        --        signal_to_color_mapping =
        --        {
        --            {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
        --            {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
        --            {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
        --            {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
        --            {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
        --            {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}}
        --        },
        --
        --        circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
        --        circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
        --        circuit_wire_max_distance = default_circuit_wire_max_distance
        production = "10kW"
    },

    -- colonial-housing-1
    {
        type = "solar-panel",
        name = "colonial-housing-3",
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonial-housing-3"},
        max_health = 800,
        corpse = "medium-remnants",
        collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
        selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        energy_source =
        {
            type = "electric",
            usage_priority = "solar"
        },
        --        energy_usage_per_tick = "5KW",
        darkness_for_all_lamps_on = 0.5,
        darkness_for_all_lamps_off = 0.3,
        light = {intensity = 0.9, size = 40, color = {r=1.0, g=1.0, b=1.0}},
        light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
        glow_size = 6,
        glow_color_intensity = 0.135,
        picture =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 1.33,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.666
                    }
                },
--                {
--                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
--                    width = 122,
--                    height = 68,
--                    frame_count = 1,
--                    line_length = 1,
--                    repeat_count = 33,
--                    animation_speed = 1 / 3,
--                    shift = util.by_pixel(13, 11),
--                    draw_as_shadow = true,
--                    scale = 1.33,
--                    hr_version =
--                    {
--                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
--                        width = 242,
--                        height = 136,
--                        frame_count = 1,
--                        line_length = 1,
--                        repeat_count = 33,
--                        animation_speed = 1 / 3,
--                        shift = util.by_pixel(13, 11),
--                        scale = 0.666,
--                        draw_as_shadow = true
--                    }
--                }
            }
        },
        overlay =
        {
            filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
            width = 98,
            height = 87,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = 1.33,
            hr_version =
            {
                filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                width = 194,
                height = 174,
                frame_count = 33,
                line_length = 11,
                animation_speed = 1 / 3,
                shift = util.by_pixel(0, 1.5),
                scale = 0.666
            }
        },
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing.png",
                    width = 98,
                    height = 87,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 1.33,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                        width = 194,
                        height = 174,
                        frame_count = 33,
                        line_length = 11,
                        animation_speed = 1 / 3,
                        shift = util.by_pixel(0, 1.5),
                        scale = 0.666
                    }
                },
--                {
--                    filename = "__Colonists__/graphics/entity/colonial-housing/colonial-housing-shadow.png",
--                    width = 122,
--                    height = 68,
--                    frame_count = 1,
--                    line_length = 1,
--                    repeat_count = 33,
--                    animation_speed = 1 / 3,
--                    shift = util.by_pixel(13, 11),
--                    draw_as_shadow = true,
--                    scale = 1.33,
--                    hr_version =
--                    {
--                        filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing-shadow.png",
--                        width = 242,
--                        height = 136,
--                        frame_count = 1,
--                        line_length = 1,
--                        repeat_count = 33,
--                        animation_speed = 1 / 3,
--                        shift = util.by_pixel(13, 11),
--                        scale = 0.666,
--                        draw_as_shadow = true
--                    }
--                }
            }
        },
        height = 1,
        width = 1,
        --        signal_to_color_mapping =
        --        {
        --            {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
        --            {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
        --            {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
        --            {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
        --            {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
        --            {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}}
        --        },
        --
        --        circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
        --        circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
        --        circuit_wire_max_distance = default_circuit_wire_max_distance
        production = "20kW"
    },

    -- housing recipe
    {
        type = "recipe",
        name = "colonial-housing-1",
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 5},
            {"wood", 5},
            {"colonist", 4},
        },
        result = "colonial-housing-1",
        enabled = true,
    },
    {
        type = "recipe",
        name = "colonial-housing-2",
        energy_required = 1,
        ingredients =
        {
            {"steel-plate", 16},
            {"colonist", 8},
        },
        result = "colonial-housing-2",
        enabled = false,
    },
    {
        type = "recipe",
        name = "colonial-housing-3",
        energy_required = 1,
        ingredients =
        {
            {"steel-plate", 32},
            {"plastic-bar", 16},
            {"colonist", 16},
        },
        result = "colonial-housing-3",
        enabled = false,
    },

    {
        type = "arrow",
        name = "cold-arrow",
        flags = {"placeable-off-grid", "not-on-map"},
        blinking = true,
        arrow_picture =
        {
            filename = "__core__/graphics/empty.png",
            priority = "low",
            width = 1,
            height = 1
        },
        circle_picture =
        {
            filename = "__Colonists__/graphics/icons/housing/houseCold.png",
            priority = "low",
            width = 32,
            height = 32
        }
    },

    {
        type = "arrow",
        name = "inactive-arrow",
        flags = {"placeable-off-grid", "not-on-map"},
        blinking = true,
        arrow_picture =
        {
            filename = "__core__/graphics/empty.png",
            priority = "low",
            width = 1,
            height = 1
        },
        circle_picture =
        {
            filename = "__Colonists__/graphics/icons/housing/inactive-building.png",
            priority = "low",
            width = 32,
            height = 32
        }
    },
})