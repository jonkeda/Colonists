local util = require("prototypes/utils/tf_util")

local function copyAsManned(type, oldname, newname)

    local entityCopy = util.table.deepcopy(data.raw[type][oldname])
    entityCopy.name = newname
    util.createMannedIcon(entityCopy)
    entityCopy.minable.result = entityCopy.name
    entityCopy.max_health = entityCopy.max_health / 2
    entityCopy.resistances = {}
    if (entityCopy.energy_source) then
        entityCopy.energy_source = { type = "void" }
    end
    --entityCopy.next_upgrade = oldname
    local itemCopy = util.table.deepcopy(data.raw["item"][oldname])
    data.raw["item"][oldname].order = itemCopy.order.."B"
    itemCopy.name = entityCopy.name
    itemCopy.icons = entityCopy.icons
    itemCopy.order = itemCopy.order.."A" 
    itemCopy.place_result = entityCopy.name

    local recipeCopy = util.table.deepcopy(data.raw["recipe"][oldname])
    recipeCopy.name = entityCopy.name
    recipeCopy.enabled = true
    if recipeCopy.result then
        recipeCopy.result = entityCopy.name
    end
    if recipeCopy.normal then
        recipeCopy.normal.result = entityCopy.name
    end
    if recipeCopy.expensive then
        recipeCopy.expensive.result = entityCopy.name
    end
    return entityCopy, itemCopy, recipeCopy
end

local inserter, itemCopy, recipeCopy = copyAsManned("inserter", "burner-inserter", "colonists-inserter")
inserter.extension_speed = inserter.extension_speed / 2
inserter.rotation_speed = inserter.rotation_speed / 2
recipeCopy.ingredients =
{
  {"wood", 2},
  {"iron-plate", 2},
  {"colonist", 1} 
}
data:extend({ inserter, itemCopy, recipeCopy })

local assembling_machine, itemCopy, recipeCopy = copyAsManned("assembling-machine", "assembling-machine-1", "colonists-assembling-machine")
assembling_machine.crafting_speed = assembling_machine.crafting_speed / 2
recipeCopy.ingredients =
{
  {"wood", 5},
  {"iron-plate", 4},
  {"stone", 2},
  {"colonist", 2} 
}
data:extend({ assembling_machine, itemCopy, recipeCopy })

local mining_drill, itemCopy, recipeCopy = copyAsManned("mining-drill", "burner-mining-drill", "colonists-mining-drill")
mining_drill.mining_speed = mining_drill.mining_speed / 2
recipeCopy.normal =
{
  energy_required = 2,
  ingredients =
  {
    {"iron-gear-wheel", 3},
    {"stone", 1},
    {"iron-plate", 2},
    {"colonist", 2} 
    },
  result = "colonists-mining-drill"
}

recipeCopy.expensive =
{
  energy_required = 2,
  ingredients =
  {
    {"iron-gear-wheel", 3},
    {"stone", 1},
    {"iron-plate", 2},
    {"colonist", 2} 
    },
  result = "colonists-mining-drill"
}

data:extend({ mining_drill, itemCopy, recipeCopy })

local lab, itemCopy, recipeCopy = copyAsManned("lab", "lab", "colonists-lab")
lab.researching_speed = lab.researching_speed / 2
recipeCopy.ingredients =
{
  {"wood", 10},
  {"stone", 8},
  {"iron-plate", 5},
  {"colonist", 2} 
}
data:extend({ lab, itemCopy, recipeCopy })

local reverse, itemCopy, recipeCopy = copyAsManned("furnace", "reverse-factory-1", "colonists-reverse-factory")
reverse.crafting_speed = reverse.crafting_speed / 2
recipeCopy.ingredients =
{
  {"wood", 5},
  {"stone", 4},
  {"iron-plate", 2},
  {"colonist", 1} 
}
data:extend({ reverse, itemCopy, recipeCopy })

local transport, itemCopy, recipeCopy = copyAsManned("transport-belt", "transport-belt", "colonists-transport-belt")
transport.speed = transport.speed / 2
recipeCopy.ingredients =
{
  {"wood", 1},
  {"stone", 1} 
}
data:extend({ transport, itemCopy, recipeCopy })


local splitter, itemCopy, recipeCopy = copyAsManned("splitter", "splitter", "colonists-splitter")
splitter.speed = splitter.speed / 2
recipeCopy.ingredients =
{
  {"wood", 4},
  {"stone", 4}, 
  {"colonist", 1} 
}
data:extend({ splitter, itemCopy, recipeCopy })

