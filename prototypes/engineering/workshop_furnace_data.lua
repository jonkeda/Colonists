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
})

local function createWorkShopFurnace(name, collision_box, selection_box, scale, fluid_position_out, fluid_position_in, 
    recipe_enabled,  ingredients, crafting_speed, crafting_categories)

data:extend({

    -- food building item
    {
        type = "item",
        name = name,
        icon = "__Colonists__/graphics/icons/atmospheric-sequestor.png",
        icon_size = 32,

        subgroup = "colonists-buildings-food",
        order = "a["..name.."]",
        place_result = name,
        stack_size = 50
    },

    {
        type = "recipe",
        name = name,
        ingredients = ingredients,
        result = name,
        enabled = recipe_enabled,
    },

    -- Food entity
    {
        type = "furnace",
        name = name,
        icon = "__Colonists__/graphics/icons/atmospheric-sequestor.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = name},
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
            {
                production_type = "output",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = fluid_position_in }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        },
        collision_box = collision_box,
        selection_box = selection_box,
        animation =
        {
            layers =
            {
                {
                    filename = "__Colonists__/graphics/entity/atmospheric-sequestor/atmospheric-sequestor.png",
                    width = 90,
                    height = 97,
                    frame_count = 1,
                    repeat_count = 9,
                    -- animation_speed = 1/10,
                    shift = util.by_pixel(0, 0),
                    scale = scale,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/atmospheric-sequestor/hr-atmospheric-sequestor.png",
                        width = 180,
                        height = 194,
                        frame_count = 1,
                        repeat_count = 9,
                        -- animation_speed = 1/10,
                        shift = util.by_pixel(0, 0),
                        scale = scale,
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/atmospheric-sequestor/atmospheric-sequestor-fan.png",
                    width = 90,
                    height = 97,
                    frame_count = 9,
                    line_length = 3,
                    animation_speed = 1/10,
                    shift = util.by_pixel(0, 0),
                    scale = 0.66,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/atmospheric-sequestor/hr-atmospheric-sequestor-fan.png",
                        width = 180,
                        height = 194,
                        frame_count = 9,
                        line_length = 3,
                        animation_speed = 1/10,
                        shift = util.by_pixel(0, 0),
                        scale = scale
                    }
                },
                {
                    filename = "__Colonists__/graphics/entity/atmospheric-sequestor/atmospheric-sequestor-shadow.png",
                    width = 124,
                    height = 64,
                    frame_count = 1,
                    repeat_count = 9,
                    shift = util.by_pixel(20.5, 10.5),
                    draw_as_shadow = true,
                    scale = scale,
                    hr_version =
                    {
                        filename = "__Colonists__/graphics/entity/atmospheric-sequestor/hr-atmospheric-sequestor-shadow.png",
                        width = 248,
                        height = 128,
                        frame_count = 1,
                        repeat_count = 9,
                        shift = util.by_pixel(20.5, 10.5),
                        scale = scale,
                        draw_as_shadow = true
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
        crafting_categories = crafting_categories,
        source_inventory_size = 1,
        crafting_speed = crafting_speed,
        result_inventory_size = 1,
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
                pipe_connections = {{ type="input", position = fluid_position_out }},
                secondary_draw_orders = { north = -1 }
            },

        },
        energy_usage = "10kW",
        ingredient_count = 4,
        allowed_effects = {"speed"}
    },
})

end

local function createWorkShopFurnaces()

      --                         name,              collision_box,              selection_box,              scale, fluid_position_out, fluid_position_in, recipe_enabled,  ingredients, crafting_speed, crafting_categories
    createWorkShopFurnace("colonists-workshop-furnace-1", {{-0.8, -0.8}, {0.8, 0.8}}, {{-1.0, -1.0}, {1.0, 1.0}},  0.33,  {-1.5, -0.5},       {1.5, 0.5},        true,            { {"iron-plate", 5}, {"wood", 5}, {"colonist", 4} },            1, {"colonists-waste-fluid", "colonist-food-1"});
    createWorkShopFurnace("colonists-workshop-furnace-2", {{-1.2, -1.2}, {1.2, 1.2}}, {{-1.5, -1.5}, {1.5, 1.5}},  0.49,  {-2.0, 1.0},        {2.0, 1.0},        true,            { {"steel-plate", 16}, {"colonist", 8} },                       2, {"colonists-waste-fluid", "colonist-food-1", "colonist-food-2" });
    createWorkShopFurnace("colonists-workshop-furnace-3", {{-1.6, -1.6}, {1.6, 1.6}}, {{-2.0, -2.0}, {2.0, 2.0}},  0.66,  {-2.5, 0.5},        {2.5, 0.5},        true,            { {"steel-plate", 32}, {"plastic-bar", 16}, {"colonist", 16} }, 3, {"colonists-waste-fluid", "colonist-food-1", "colonist-food-2" , "colonist-food-3" });

end

createWorkShopFurnaces()