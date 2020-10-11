require("prototypes.engineering.workshop_furnace_data")
require("prototypes.engineering.workshop_beacon_data")
require("prototypes.engineering.wear_and_tear")

table.insert(data.raw["technology"]["automation"].effects, {type = "unlock-recipe", recipe = "colonists-workshop-furnace-1"})
table.insert(data.raw["technology"]["automation-2"].effects, {type = "unlock-recipe", recipe = "colonists-workshop-furnace-2"})
table.insert(data.raw["technology"]["automation-3"].effects, {type = "unlock-recipe", recipe = "colonists-workshop-furnace-3"})
