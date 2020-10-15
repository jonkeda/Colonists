local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects.lua")
local sounds = require("__base__/prototypes/entity/demo-sounds.lua")

local createHousing = function(name, collision_box, selection_box, scale, fluid_position_out, fluid_position_in, 
  crafting_speed, recipe_enabled, ingredients, crafting_categories)
    data:extend({
      {
        type = "item",
        name = name,
        icon = "__Colonists__/graphics/icons/colonial-housing.png",
        icon_size = 32,
        subgroup = "colonists-buildings-housing",
        order = "a[colonial-housing-1]",
        place_result = name,
        stack_size = 20
    },

    {
      type = "recipe",
      name = name,
      energy_required = 1,
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
                scale = scale,
                hr_version =
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                    width = 194,
                    height = 174,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = scale / 2
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
                scale = scale,
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
                    scale = scale / 2,
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
        scale = scale,
        hr_version =
        {
            filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
            width = 194,
            height = 174,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = scale / 2
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
                scale = scale,
                hr_version =
                {
                    filename = "__Colonists__/graphics/entity/colonial-housing/hr-colonial-housing.png",
                    width = 194,
                    height = 174,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 0.01,
                    shift = util.by_pixel(0, 1.5),
                    scale = scale / 2
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
                scale = scale,
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
                    scale = scale / 2,
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
    allowed_effects = {}
  } ,
    
});    
  end

  --             name               collision_box,              selection_box,     scale, crafting_speed, recipe_enabled, crafting_speed, ingredients, crafting_categories, 
createHousing("colonists-housing-1", {{-0.8, -0.8}, {0.8, 0.8}}, {{-1.0, -1.0}, {1.0, 1.0}},  0.66,     {-1.5, -0.5},       {1.5, 0.5}, 0.1,                 true,           { {"iron-plate", 5}, {"wood", 5}, {"colonist", 4} }, {"colonist-food-1", "colonist-food-2" , "colonist-food-3"} );
createHousing("colonists-housing-2", {{-1.2, -1.2}, {1.2, 1.2}}, {{-1.5, -1.5}, {1.5, 1.5}},  1.0,      {-2.0, 1.0},        {2.0, 1.0}, 0.2,                 false,          { {"steel-plate", 16}, {"colonist", 8} }, {"colonist-food-2", "colonist-food-3" });
createHousing("colonists-housing-3", {{-1.6, -1.6}, {1.6, 1.6}}, {{-2.0, -2.0}, {2.0, 2.0}},  1.33,     {-2.5, 0.5},        {2.5, 0.5}, 0.4,                false,          { {"steel-plate", 32}, {"plastic-bar", 16}, {"colonist", 16} }, {"colonist-food-3" } );


data:extend({
    {
        type = "item-subgroup",
        name = "colonists-buildings-housing",
        group = "colonists",
        order = "d-d"
    },
})

table.insert(data.raw["technology"]["steel-processing"].effects, {type = "unlock-recipe",recipe = "colonists-housing-2"})
table.insert(data.raw["technology"]["plastics"].effects, {type = "unlock-recipe",recipe = "colonists-housing-3"})

