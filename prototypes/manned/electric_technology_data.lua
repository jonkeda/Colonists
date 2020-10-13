data:extend({ {
    type = "technology",
    name = "colonists-electricity",
    icon_size = 128,
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "small-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "boiler"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-engine"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill"
      },
      {
        type = "unlock-recipe",
        recipe = "offshore-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "lab"
      },
      {
        type = "unlock-recipe",
        recipe = "electronic-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "radar"
      },
    },
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    order = "c-e-b"
  },
})

data.raw["recipe"]["inserter"].enabled = false
data.raw["recipe"]["transport-belt"].enabled = false
data.raw["recipe"]["small-electric-pole"].enabled = false
data.raw["recipe"]["boiler"].enabled = false
data.raw["recipe"]["steam-engine"].enabled = false
data.raw["recipe"]["electric-mining-drill"].enabled = false
data.raw["recipe"]["offshore-pump"].enabled = false
data.raw["recipe"]["lab"].enabled = false
data.raw["recipe"]["electronic-circuit"].enabled = false
data.raw["recipe"]["radar"].enabled = false

data.raw["technology"]["automation"].prerequisites = { "colonists-electricity" }
data.raw["technology"]["logistics"].prerequisites = { "colonists-electricity" }

