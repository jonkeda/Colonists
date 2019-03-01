local scale = 0.5
data:extend({
    {
        type = "item-subgroup",
        name = "colonists-vehicles",
        group = "colonists",
        order = "d-e"
    },

    {
        type = "item-with-entity-data",
        name = "ambulance",
        icon = "__Colonists__/graphics/icons/vehicles/ambulance.png",
        icon_size = 64,
        subgroup = "colonists-vehicles",
        order = "a[ambulance]",
        stack_size = 1,
        place_result = "ambulance",
    },
    {
        type = "car",
        name = "ambulance",
        order = "z[programmable]", -- programmable in programmable-vehicles
        icon = "__Colonists__/graphics/icons/vehicles/ambulance.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
        minable = {mining_time = 1, result = "ambulance"},
        max_health = 650,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        energy_per_hit_point = 0.5,
        resistances = {
            {
                type = "fire",
                decrease = 15,
                percent = 50
            },
            {
                type = "physical",
                decrease = 5,
                percent = 20
            },
            {
                type = "impact",
                decrease = 50,
                percent = 60
            },
        },
        selection_box = {{-2, -2.4}, {2, 2.4}},
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        burner =
        {
            effectivity = 2,
            fuel_inventory_size = 2,
            smoke = {
                {
                    name = "car-smoke",
                    deviation = {0.25, 0.25},
                    frequency = 50,
                    position = {0, 1.5},
                    starting_frame = 0,
                    starting_frame_deviation = 60
                }
            }
        },
        effectivity = 3,
        weight = 1500,
        consumption = "20kW",
        braking_power = "100kW",
        terrain_friction_modifier = 0.2,
        friction = 0.01,
        rotation_speed = 0.005,
        tank_driving = true,
        light =
        {
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture =
                {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {-0.6, -14},
                size = 2,
                intensity = 0.6
            },
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture =
                {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {0.6, -14},
                size = 2,
                intensity = 0.6
            }
        },
        animation =
        {
            layers =
            {
                {
                    width = 1788/6,
                    height = 1770/6,
                    frame_count = 3,
                    direction_count = 64,
                    scale = scale,
                    shift = {0, -0.28125},
                    animation_speed = 8,
                    max_advance = 1,
                    stripes = {
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-1.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-2.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-3.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-4.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-5.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-6.png",
                            width_in_frames = 6,
                            height_in_frames = 2,
                        },
                    }
                },
                {
                    --apply_runtime_tint = true,
                    width = 1788/6,
                    height = 1770/6,
                    frame_count = 3,
                    direction_count = 64,
                    scale = scale,
                    shift = {0, -0.28125},
                    animation_speed = 8,
                    max_advance = 1,
                    stripes = {
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-1.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-2.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-3.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-4.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-5.png",
                            width_in_frames = 6,
                            height_in_frames = 6,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-mask-6.png",
                            width_in_frames = 6,
                            height_in_frames = 2,
                        },
                    }
                },
                {
                    draw_as_shadow = true,
                    width = 2046/6,
                    height = 1930/10,
                    frame_count = 3,
                    direction_count = 64,
                    scale = scale * 377 / 341,
                    shift = {23/32, 16/32},
                    animation_speed = 8,
                    max_advance = 1,
                    line_length = 6,
                    stripes = {
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-shadow-1.png",
                            width_in_frames = 6,
                            height_in_frames = 10,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-shadow-2.png",
                            width_in_frames = 6,
                            height_in_frames = 10,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-shadow-3.png",
                            width_in_frames = 6,
                            height_in_frames = 10,
                        },
                        {
                            filename = "__Colonists__/graphics/entity/ambulance/warden-main-shadow-4.png",
                            width_in_frames = 6,
                            height_in_frames = 2,
                        },
                    }
                }
            }
        },
        turret_animation =
        {
            layers =
            {
--                {
--                    width = 1952/16,
--                    height = 440/4,
--                    frame_count = 1,
--                    direction_count = 64,
--                    scale = scale,
--                    shift = {0, -50/32},
--                    animation_speed = 8,
--                    line_length = 16,
--                    stripes = {{
--                        filename = "__Colonists__/graphics/entity/warden/warden-turret.png",
--                        width_in_frames = 16,
--                        height_in_frames = 4 }}
--                },
--                {
--                    width = 1952/16,
--                    height = 440/4,
--                    frame_count = 1,
--                    apply_runtime_tint = true,
--                    direction_count = 64,
--                    animation_speed = 8,
--                    line_length = 16,
--                    scale = scale,
--                    shift = {0, -50/32},
--                    stripes = {{
--                        filename = "__Colonists__/graphics/entity/warden/warden-turret-mask.png",
--                        width_in_frames = 16,
--                        height_in_frames = 4 }}
--                },
--                {
--                    width = 966/6,
--                    height = 1100/11,
--                    frame_count = 1,
--                    draw_as_shadow = true,
--                    direction_count = 64,
--                    scale = scale,
--                    shift = {0.98, 0.6},
--                    animation_speed = 8,
--                    stripes = {{
--                        filename = "__Colonists__/graphics/entity/warden/warden-turret-shadow.png",
--                        width_in_frames = 6,
--                        height_in_frames = 11 }}
--                }
            }
        },
--        turret_rotation_speed = 0.35 / 60,
--        turret_return_timeout = 150,
        stop_trigger_speed = 0.2,
        sound_no_fuel = { { filename = "__base__/sound/fight/car-no-fuel-1.ogg", volume = 0.6 }, },
        stop_trigger = { { type = "play-sound", sound = { { filename = "__base__/sound/car-breaks.ogg", volume = 0.6  }, } }, },
        sound_minimum_speed = 0.15;
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound = { filename = "__base__/sound/car-engine.ogg", volume = 0.6 },
            activate_sound = { filename = "__base__/sound/car-engine-start.ogg", volume = 0.6 },
            deactivate_sound = { filename = "__base__/sound/car-engine-stop.ogg", volume = 0.6 },
            match_speed_to_activity = true,
        },
        open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
        close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
        inventory_size = 20,
        guns={}
    },
    {
        type = "recipe",
        name = "ambulance",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {type="item", name="car", amount=1},
                {type="item", name="long-handed-inserter", amount=2},
            },
            results= { {type="item", name="ambulance", amount=1} },
        }
    },
    {
        type = "technology",
        name = "ambulance",
        icon = "__Colonists__/graphics/technology/ambulance.png",
        icon_size = 128,
        order = "c-m-a",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ambulance",
            },
        },
        prerequisites = {"automobilism"},
        unit = {
            count = 20,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            },
            time = 10
        },
    },
})