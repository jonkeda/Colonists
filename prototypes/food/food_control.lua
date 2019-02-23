require("prototypes.scripts.util")

local function calculateTotalWaste(force)

    return force.fluid_production_statistics.get_input_count("waste") +
           force.item_production_statistics.get_input_count("compostwaste")

end

local MinHungerState = 1
local MaxHungerState = 5
local HungerTime = 60 * 60
local WasteMultiplier = 2

local function calculateHunger(player_index, player)

    local i = player_index
    local coli = global.coli[i]

    local totalWaste = calculateTotalWaste(player.force)
    local totalFoodNeeded = coli.housing

    coli.foodneeded = totalFoodNeeded
    coli.foodEaten = (totalWaste - coli.totalWasteLastPeriod) * WasteMultiplier

    if coli.foodEaten < coli.foodneeded then
        coli.hungerstate = coli.foodEaten / coli.foodneeded
    else
        coli.hungerstate = 1
    end

    if coli.NextHungerClick == nil then
        coli.NextHungerClick = HungerTime
    end

    if (game.tick + 1) > coli.NextHungerClick then
        coli.NextHungerClick = coli.NextHungerClick + HungerTime
        coli.totalWasteLastPeriod = totalWaste
    end

end

local FoodControl_tick = function()

    if game.tick % 20 ~= 0 then
        return
    end

    for i,player in pairs(game.players) do
        calculateHunger(i, player)
    end

end

function playerFood(player_index, player)
    local i = player_index
    local coli = global.coli[i]

    if not coli.totalWasteLastPeriod then coli.totalWasteLastPeriod = 0 end
    if not coli.totalFoodLastPeriod then coli.totalFoodLastPeriod = 0 end
    if not coli.foodneeded then coli.foodneeded = 0 end
    if not coli.foodeaten then coli.foodeaten = 0 end
    if not coli.hungerstate then coli.hungerstate = 5 end
    if not coli.housing then coli.housing = 0 end

    loadFood()
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
