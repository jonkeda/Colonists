local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects.lua")
local sounds = require("__base__/prototypes/entity/demo-sounds.lua")

local function createHeatGenerator(name, energy_usage, energy_source)
  
  data:extend({
  
    {
      type = "item",
      name = name,
      icon = "__base__/graphics/icons/chemical-plant.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "colonists-heat",
      order = "b[fluids]-a[heat-generator]",
      place_result = name,
      stack_size = 20
    },

    {
      type = "recipe",
      name = name,
      ingredients =
      {
        --{"electronic-circuit", 2},
        {"pipe", 1},
        {"iron-gear-wheel", 1}
      },
      result = name,
      enabled = false
    },

    {
      type = "assembling-machine",
      name = name,
      crafting_categories = {"colonists-heat-processing"},
      fixed_recipe = "colonists-heat",
      icon = "__base__/graphics/icons/chemical-plant.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral","placeable-player", "player-creation"},
      minable = {mining_time = 0.1, result = name},
      max_health = 300,
      corpse = "chemical-plant-remnants",
      dying_explosion = "chemical-plant-explosion",
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      drawing_box = {{-0.5, -1.9}, {0.5, 0.5}},
  
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
          width = 108,
          height = 148,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(1, -9),
          scale = 1 / 3,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
            width = 220,
            height = 292,
            frame_count = 24,
            line_length = 12,
            shift = util.by_pixel(0.5, -9),
            scale = 0.5 / 3
            }
        },
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
          width = 154,
          height = 112,
          repeat_count = 24,
          frame_count = 1,
          shift = util.by_pixel(28, 6),
          draw_as_shadow = true,
          scale = 1 /3,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
            width = 312,
            height = 222,
            repeat_count = 24,
            frame_count = 1,
            shift = util.by_pixel(27, 6),
            draw_as_shadow = true,
            scale = 0.5 / 3
            }
        }
      }}),
      working_visualisations =
      {
        {
          apply_recipe_tint = "primary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 32,
            height = 24,
            shift = util.by_pixel(24, 14),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-north.png",
              frame_count = 24,
              line_length = 6,
              width = 66,
              height = 44,
              shift = util.by_pixel(23, 15),
              scale = 0.5 / 3
            }
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 36,
            height = 18,
            shift = util.by_pixel(0, 22),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-east.png",
              frame_count = 24,
              line_length = 6,
              width = 70,
              height = 36,
              shift = util.by_pixel(0, 22),
              scale = 0.5 / 3
            }
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 34,
            height = 24,
            shift = util.by_pixel(0, 16),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-south.png",
              frame_count = 24,
              line_length = 6,
              width = 66,
              height = 42,
              shift = util.by_pixel(0, 17),
              scale = 0.5 / 3
            }
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
            frame_count = 24,
            line_length = 6,
            width = 38,
            height = 20,
            shift = util.by_pixel(-10, 12),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-west.png",
              frame_count = 24,
              line_length = 6,
              width = 74,
              height = 36,
              shift = util.by_pixel(-10, 13),
              scale = 0.5 / 3
            }
          }
        },
        {
          apply_recipe_tint = "secondary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 32,
            height = 22,
            shift = util.by_pixel(24, 14),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-north.png",
              frame_count = 24,
              line_length = 6,
              width = 62,
              height = 42,
              shift = util.by_pixel(24, 15),
              scale = 0.5 / 3
            }
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 34,
            height = 18,
            shift = util.by_pixel(0, 22),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-east.png",
              frame_count = 24,
              line_length = 6,
              width = 68,
              height = 36,
              shift = util.by_pixel(0, 22),
              scale = 0.5 / 3
            }
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 32,
            height = 18,
            shift = util.by_pixel(0, 18),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-south.png",
              frame_count = 24,
              line_length = 6,
              width = 60,
              height = 40,
              shift = util.by_pixel(1, 17),
              scale = 0.5 / 3
            }
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
            frame_count = 24,
            line_length = 6,
            width = 36,
            height = 16,
            shift = util.by_pixel(-10, 14),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-west.png",
              frame_count = 24,
              line_length = 6,
              width = 68,
              height = 28,
              shift = util.by_pixel(-9, 15),
              scale = 0.5 / 3
            }
          }
        },
        {
          apply_recipe_tint = "tertiary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 46,
            height = 94,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.5,
              shift = util.by_pixel(-2, -40),
              scale = 0.5 / 3
            }
          }
        },
        {
          apply_recipe_tint = "quaternary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 20,
            height = 42,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            scale = 1 / 3,
            hr_version =
            {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-inner.png",
              frame_count = 47,
              line_length = 16,
              width = 40,
              height = 84,
              animation_speed = 0.5,
              shift = util.by_pixel(0, -14),
              scale = 0.5 / 3
            }
          }
        }
      },
      vehicle_impact_sound = sounds.generic_impact,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound =
      {
        sound =
        {
          {
            filename = "__base__/sound/chemical-plant-1.ogg",
            volume = 0.5,
          },
          {
            filename = "__base__/sound/chemical-plant-2.ogg",
            volume = 0.5,
          },
          {
            filename = "__base__/sound/chemical-plant-3.ogg",
            volume = 0.5,
          }
        },
        --max_sounds_per_type = 3,
        --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
        apparent_volume = 1.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
      },
      crafting_speed = 1,
      energy_source = energy_source,
      energy_usage = energy_usage,
      fluid_boxes =
      {
        {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {0, 1} }}
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
          priority = "extra-high",
          width = 28,
          height = 36,
          shift = util.by_pixel(5, 60),
          variation_count = 4,
          scale = 5 / 3,
        },
        rotate = false,
        orientation_to_variation = true
      }
    },
  })

end

createHeatGenerator("colonists-heat-generator", "210kW",
{
  type = "burner",
  fuel_category = "chemical",
  effectivity = 1,
  fuel_inventory_size = 1,
  emissions_per_minute = 2,
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
})
createHeatGenerator("colonists-electric-heat-generator", "210kW",
  {
    type = "electric",
    usage_priority = "secondary-input",
  }
)
