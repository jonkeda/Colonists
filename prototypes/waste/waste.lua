data:extend({

    {
        type = "item-subgroup",
        name = "colonists-buildings-waste",
        group = "colonists",
        order = "d-a"
    },

    {
        type = "item-subgroup",
        name = "colonists-food-items",
        group = "colonists",
        order = "g"
    },

    -- waste recipe-category
    {
        type = "recipe-category",
        name = "waste-fluid"
    },

    -- waste item
    {
        type = "item",
        name = "latrine",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 32,

        subgroup = "colonists-buildings-waste",
        order = "b[fluid]-a[latrine]",
        place_result = "latrine",
        stack_size = 50
    },

    {
        type = "item",
        name = "waste-disposal",
        icon = "__Colonists__/graphics/icons/waste-disposal.png",
        icon_size = 32,

        subgroup = "colonists-buildings-waste",
        order = "c[waste-disposal]",
        place_result = "waste-disposal",
        stack_size = 50
    },

    {
        type = "item",
        name = "compostwaste",
        icon = "__Colonists__/graphics/icons/items/compost.png",
        icon_size = 32,

        fuel_category = "humus", -- changed by Oceanel
        fuel_value = "100KJ",
        subgroup = "colonists-food-items",
        order = "w-b-d",
        stack_size = 200
    },

    -- Waste entity
    -- latrine
    {
        type = "storage-tank",
        name = "latrine",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 32,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 1.5, result = "latrine"},
        max_health = 500,
        corpse = "medium-remnants",
        collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        fluid_box =
        {
            base_area = 25,
            filter="waste",
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
                { position = {-1, -2} },
                { position = {2, 1} },
                { position = {1, 2} },
                { position = {-2, -1} }
            }
        },
        two_direction_only = true,
        window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
        pictures =
        {
            picture =
            {
                sheets =
                {
                    {
                        filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
                        priority = "extra-high",
                        frames = 2,
                        width = 110,
                        height = 108,
                        shift = util.by_pixel(0, 4),
                        hr_version =
                        {
                            filename = "__base__/graphics/entity/storage-tank/hr-storage-tank.png",
                            priority = "extra-high",
                            frames = 2,
                            width = 219,
                            height = 215,
                            shift = util.by_pixel(-0.25, 3.75),
                            scale = 0.5
                        }
                    },
                    {
                        filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
                        priority = "extra-high",
                        frames = 2,
                        width = 146,
                        height = 77,
                        shift = util.by_pixel(30, 22.5),
                        draw_as_shadow = true,
                        hr_version =
                        {
                            filename = "__base__/graphics/entity/storage-tank/hr-storage-tank-shadow.png",
                            priority = "extra-high",
                            frames = 2,
                            width = 291,
                            height = 153,
                            shift = util.by_pixel(29.75, 22.25),
                            scale = 0.5,
                            draw_as_shadow = true
                        }
                    }
                }
            },
            fluid_background =
            {
                filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
                priority = "extra-high",
                width = 32,
                height = 15
            },
            window_background =
            {
                filename = "__base__/graphics/entity/storage-tank/window-background.png",
                priority = "extra-high",
                width = 17,
                height = 24,
                hr_version =
                {
                    filename = "__base__/graphics/entity/storage-tank/hr-window-background.png",
                    priority = "extra-high",
                    width = 34,
                    height = 48,
                    scale = 0.5
                }
            },
            flow_sprite =
            {
                filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
                priority = "extra-high",
                width = 160,
                height = 20
            },
            gas_flow =
            {
                filename = "__base__/graphics/entity/pipe/steam.png",
                priority = "extra-high",
                line_length = 10,
                width = 24,
                height = 15,
                frame_count = 60,
                axially_symmetrical = false,
                direction_count = 1,
                animation_speed = 0.25,
                hr_version =
                {
                    filename = "__base__/graphics/entity/pipe/hr-steam.png",
                    priority = "extra-high",
                    line_length = 10,
                    width = 48,
                    height = 30,
                    frame_count = 60,
                    axially_symmetrical = false,
                    animation_speed = 0.25,
                    direction_count = 1
                }
            }
        },
        flow_length_in_ticks = 360,
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/storage-tank.ogg",
                volume = 0.8
            },
            match_volume_to_activity = true,
            apparent_volume = 1.5,
            max_sounds_per_type = 3
        },

        --        circuit_wire_connection_points = circuit_connector_definitions["latrine"].points,
        --        circuit_connector_sprites = circuit_connector_definitions["latrine"].sprites,
        --        circuit_wire_max_distance = default_circuit_wire_max_distance
    },

    -- waste disposal
    {
        type = "furnace",
        name = "waste-disposal",
        icon = "__Colonists__/graphics/icons/waste-disposal.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "waste-disposal"},
        max_health = 200,
        corpse = "big-remnants",
        repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
        mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
        working_sound =
        {
            sound = { filename = "__base__/sound/furnace.ogg", }
        },
        resistances =
        {
            {
                type = "fire",
                percent = 90
            },
            {
                type = "explosion",
                percent = 30
            },
            {
                type = "impact",
                percent = 30
            }
        },        fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0, -1.5} }},
            secondary_draw_orders = { north = -1 }
        },
        --        {
        --            production_type = "output",
        --            pipe_picture = assembler2pipepictures(),
        --            pipe_covers = pipecoverspictures(),
        --            base_area = 10,
        --            base_level = 1,
        --            pipe_connections = {{ type="output", position = {0, 2} }},
        --            secondary_draw_orders = { north = -1 }
        --        },
        off_when_no_fluid_recipe = false
    },
        collision_box = {{-1.35, -0.85}, {1.35, 0.85}},
        selection_box = {{-1.5, -1}, {1.5, 1}},
        crafting_categories = {"waste-fluid"},
        result_inventory_size = 1,
        energy_usage = "100kW",
        crafting_speed = 1,
        source_inventory_size = 1,
        energy_source =
        {
            type = "burner",
            fuel_category = "chemical",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions = 1,
            smoke =
            {
                {
                    name = "smoke",
                    deviation = {0.1, 0.1},
                    frequency = 5,
                    position = util.by_pixel(0, -90),
                    starting_vertical_speed = 0.08,
                    starting_frame_deviation = 60
                }
            }
        },
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/waste-disposal/waste-disposal.png",
                    priority = "extra-high",
                    width = 157,
                    height = 121,
                    frame_count = 1,
                    shift = util.by_pixel(32, -20)
                }
            }
        },
        working_visualisations =
        {
            {
                north_position = {0.0, 0.0},
                east_position = {0.0, 0.0},
                south_position = {0.0, 0.0},
                west_position = {0.0, 0.0},
                animation =
                {
                    filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
                    line_length = 10,
                    priority = "extra-high",
                    width = 20,
                    height = 40,
                    frame_count = 60,
                    animation_speed = 0.75,
                    shift = util.by_pixel(0, -90)
                }
            }
        }
    },

    -- waste recipe
    {
        type = "recipe",
        name = "Latrine",
        energy_required = 3,
        enabled = false,
        ingredients =
        {
            {"wood", 4},
            {"stone", 10}
        },
        result= "latrine"
    },

    {
        type = "recipe",
        name = "waste-disposal",
        energy_required = 15,
        ingredients =
        {
            {"iron-plate", 1},
        },
        result = "waste-disposal",
        enabled = false,
    },

    {
        type = "recipe",
        name = "void-waste",
        category = "void-fluid",
        hidden = "true",
        energy_required = 1,
        ingredients =
        {
            { type="fluid", name="waste", amount=25 }
        },
        results=
        {
            { type="item", name="void", amount=1, probability=0 },
        },
        subgroup = "void",
        icon = "__Colonists__/graphics/icons/fluid/oxygen.png",
        icon_size = 32,
        emissions_multiplier = -1,
        order = "waste"
    },

    {
        type = "recipe",
        name = "sulfur-from-waste",
        category = "chemistry",
        energy_required = 1,
        enabled = false,
        subgroup="colonists-products",
        ingredients =
        {
            {type="fluid", name="waste", amount=3},
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
        name = "solid-fuel-from-waste",
        category = "chemistry",
        energy_required = 3,
        ingredients =
        {
            {type="fluid", name="waste", amount=10}
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