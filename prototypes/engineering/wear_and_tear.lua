local math3d = require "math3d"

data:extend(
{
  {
    type = "module-category",
    name = "repair"
  },

  -- {
  --   type = "item",
  --   name = "colonists-repair-module-1",
  --   icon = "__Colonists__/graphics/icons/speedworker.png",
  --   icon_size = 32,

  --   subgroup = "colonists-buildings-workshop",
  --   order = "a[colonists-training-1]",
  --   place_result = "colonists-training-1",
  --   stack_size = 20
  -- },

  {
    type = "module",
    name = "colonists-repair-module-1",
    icon = "__Colonists__/graphics/icons/speedworker.png",
    icon_size = 32,

    subgroup = "colonists-colonist",
    category = "repair",
    tier = 1,
    order = "a[speed]-a[speed-module-1]",
    stack_size = 5,
    default_request_amount = 1,
    effect = { repair = {bonus = 1.0}, consumption = {bonus = 0.0}}
  },

  {
    type = "sticker",
    name = "wear-and-tear",
    flags = {"not-on-map"},

    animation =
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.2,
      tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1)
    },

    duration_in_ticks = 4294967295,
    damage_interval = 10,
    target_movement_modifier = 0.8,
    damage_per_tick = { amount = 10 * 100 / 60, type = "fire" },
    --spread_fire_entity = "fire-flame-on-tree",
    fire_spread_cooldown = 30,
    fire_spread_radius = 0.75
  }
})