data:extend({ {
    type = "technology",
    name = "colonists-burner",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "burner-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "burner-mining-drill"
      }
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


data.raw["recipe"]["burner-inserter"].enabled = false
data.raw["recipe"]["burner-mining-drill"].enabled = false

