data:extend({

    {
        type = "item",
        name = "colonists-waste-disposal",
        icon = "__Colonists__/graphics/icons/waste-disposal.png",
        icon_size = 32,

        subgroup = "colonists-buildings-waste",
        order = "c[waste-disposal]",
        place_result = "colonists-waste-disposal",
        stack_size = 50
    },

    -- waste disposal
    {
        type = "furnace",
        name = "colonists-waste-disposal",
        icon = "__Colonists__/graphics/icons/waste-disposal.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "colonists-waste-disposal"},
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
        crafting_categories = {"colonists-waste-fluid"},
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

    {
        type = "recipe",
        name = "colonists-waste-disposal",
        energy_required = 15,
        ingredients =
        {
            {"chemical-plant", 1},
            {"colonists-waste-storage", 1},
        },
        result = "colonists-waste-disposal",
        enabled = false,
    },

})