require("prototypes.scripts.util")

local function calculateTotalWaste(force)

    return force.fluid_production_statistics.get_input_count("waste") +
           force.item_production_statistics.get_input_count("compostwaste")

end

local MinHungerState = 1
local MaxHungerState = 5
local HungerTime = 60 * 60
local WasteMultiplier = 2

local function calculateHunger()

    local player = game.players[1]
    local totalWaste = calculateTotalWaste(player.force)
    local totalFoodNeeded = global.coli.housing

    global.coli.foodneeded = totalFoodNeeded
    global.coli.foodEaten = (totalWaste - global.coli.totalWasteLastPeriod) * WasteMultiplier

    if global.coli.foodEaten < global.coli.foodneeded then
        global.coli.hungerstate = global.coli.foodEaten / global.coli.foodneeded
    else
        global.coli.hungerstate = 1
    end

    if global.coli.NextHungerClick == nil then
        global.coli.NextHungerClick = HungerTime
    end

    if (game.tick + 1) > global.coli.NextHungerClick then
        global.coli.NextHungerClick = global.coli.NextHungerClick + HungerTime
        global.coli.totalWasteLastPeriod = totalWaste
    end

end

local FoodControl_tick = function()

    surface = game.surfaces[1]
    if game.tick % 20 ~= 0 then
        return
    end
    calculateHunger()
end

local isLoad = false
function loadFood()
    if coli.ticks ~= nil and not isLoad then
        isLoad = true
        table.insert(coli.ticks, FoodControl_tick)
    end
end

local isInit = false
function initFood()
    if isInit then
        return
    end
    isInit = true

    loadFood()
end
