data:extend({

    -- waste item
    {
        type = "item",
        name = "colonists-waste-storage",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64, icon_mipmaps = 4,
    
        subgroup = "colonists-buildings-waste",
        order = "b[fluid]-a[waste-storage]",
        place_result = "colonists-waste-storage",
        stack_size = 50
    },

    -- Waste entity
    -- waste-storage
    {
        type = "storage-tank",
        name = "colonists-waste-storage",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 1.5, result = "colonists-waste-storage"},
        max_health = 500,
        corpse = "medium-remnants",
        collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        fluid_box =
        {
            base_area = 25,
            filter="colonists-waste",
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

        --        circuit_wire_connection_points = circuit_connector_definitions["colonists-waste-storage"].points,
        --        circuit_connector_sprites = circuit_connector_definitions["colonists-waste-storage"].sprites,
        --        circuit_wire_max_distance = default_circuit_wire_max_distance
    },

    -- waste recipe
    {
        type = "recipe",
        name = "colonists-waste-storage",
        energy_required = 3,
        enabled = false,
        ingredients =
        {
            {"storage-tank", 1},
        },
        result= "colonists-waste-storage"
    },


})