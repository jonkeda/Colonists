local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects.lua")
local sounds = require("__base__/prototypes/entity/demo-sounds.lua")

local createWorkshop = function(name, collision_box, selection_box, scale, supply_area_distance, recipe_enabled, ingredients)
    data:extend({

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

    {
        type = "beacon",
        name = name,
        icon = "__base__/graphics/icons/beacon.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = name},
        max_health = 200,
        corpse = "beacon-remnants",
        dying_explosion = "beacon-explosion",
        collision_box = collision_box,
        selection_box = selection_box,
        damaged_trigger_effect = hit_effects.entity(),
        --drawing_box = {{-1.5, -2.2}, {1.5, 1.3}},
        allowed_effects = {"consumption", "speed", "pollution"},

        radius_visualisation_picture =
        {
          filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
          priority = "extra-high-no-scale",
          width = 10,
          height = 10
        },
        selection_priority = 10,
        supply_area_distance = supply_area_distance,
        energy_source =
        {
          type = "void",
        },
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound =
        {
          sound =
          {
            {
              filename = "__base__/sound/beacon-1.ogg",
              volume = 0.2
            },
            {
              filename = "__base__/sound/beacon-2.ogg",
              volume = 0.2
            }
          },
          audible_distance_modifier = 0.33,
          max_sounds_per_type = 3
          -- fade_in_ticks = 4,
          -- fade_out_ticks = 60
        },
        energy_usage = "480kW",
        distribution_effectivity = 0.5,
        module_specification =
        {
          module_slots = 2,
          module_info_icon_shift = {0, 0},
          module_info_multi_row_initial_height_modifier = -0.3,
          module_info_max_icons_per_row = 2,
        },

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

        water_reflection =
        {
          pictures =
          {
            filename = "__base__/graphics/entity/beacon/beacon-reflection.png",
            priority = "extra-high",
            width = 24,
            height = 28,
            shift = util.by_pixel(0, 55),
            variation_count = 1,
            scale = 5,
          },
          rotate = false,
          orientation_to_variation = false
        }
      },
        
    });    
  end

  --             name                         collision_box,              selection_box,              scale, supply_area_distance, recipe_enabled, ingredients
createWorkshop("colonists-workshop-beacon-1", {{-0.8, -0.8}, {0.8, 0.8}}, {{-1.0, -1.0}, {1.0, 1.0}},  0.33,     3,                 true,           { {"iron-plate", 5}, {"wood", 5}, {"colonist", 4} });
createWorkshop("colonists-workshop-beacon-2", {{-1.2, -1.2}, {1.2, 1.2}}, {{-1.5, -1.5}, {1.5, 1.5}},  0.5,      6,                 false,          { {"steel-plate", 16}, {"colonist", 8} });
createWorkshop("colonists-workshop-beacon-3", {{-1.6, -1.6}, {1.6, 1.6}}, {{-2.0, -2.0}, {2.0, 2.0}},  0.66,     12,                false,          { {"steel-plate", 32}, {"plastic-bar", 16}, {"colonist", 16} });


data:extend({
    {
        type = "item-subgroup",
        name = "colonists-buildings-workshop",
        group = "colonists",
        order = "d-d"
    },
})

-- table.insert(data.raw["technology"]["steel-processing"].effects, {type = "unlock-recipe",recipe = "colonists-workshop-beacon-2"})
-- table.insert(data.raw["technology"]["plastics"].effects, {type = "unlock-recipe",recipe = "colonists-workshop-beacon-3"})

