data:extend({
    -- {
    --     type = "item-subgroup",
    --     name = "colonists-buildings-training",
    --     group = "colonists",
    --     order = "d-c"
    -- },

    -- training item
    {
        type = "item",
        name = "colonists-research-1",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,
        order = "h[research]",
        subgroup = "production-machine",
        place_result = "colonists-research-1",
        stack_size = 20
    },

    {
        type = "furnace",
        name = "colonists-research-1",
        icon = "__Colonists__/graphics/icons/colonial-workshop.png",
        icon_size = 32,

        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-research-1"},
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
        source_inventory_size = 1,
        result_inventory_size = 1,
        crafting_categories = {"colonists-research-1"},
        crafting_speed = 5,
        energy_source =
        {
            type = "fluid",
            fuel_category = "colonists-heat",
            burns_fluid = true,
            scale_fluid_usage = true,
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions = 0.01,
             fluid_box = {
                production_type = "input",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-2.0, 1.0} }},
                secondary_draw_orders = { north = -1 }
            },

        },
        energy_usage = "20kW",
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
        allowed_effects = {}

        -- module_specification = { module_slots = 0 }
    },

    -- training recipe
    {
        type = "recipe",
        name = "colonists-research-1",
        energy_required = 15,
        ingredients =
        {
            {"lab", 1},
            {"colonist", 4},
        },
        result = "colonists-research-1",
        enabled = true,
    },
})