require("prototypes.scripts.util")

require("prototypes.gui.gui_data")

require("prototypes.foodIndustry.foodIndustry")
require("prototypes.robotArmy.robotarmy")

require("prototypes.colonists.colonists")
require("prototypes.fluid.fluid")
local fi = data.raw["item-group"]["food-industry"]
if not fi then
    require("prototypes.trees.trees")
    require("prototypes.trees.fruit-scissors")
end
require("prototypes.food.food")
require("prototypes.food.foods")

require("prototypes.housing.housing")
require("prototypes.jobs.jobs")

require("prototypes.resource.resources")
require("prototypes.training.training")

require("prototypes.void.void")
require("prototypes.waste.waste")

require("prototypes.categories.groups")

require("prototypes.ambulance.ambulance_data")
require("prototypes.ambulance.ambulance_radar_data")

require("prototypes.colonists.clone_duplicator")

require("data_raw_edits")