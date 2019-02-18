local function calculateTotalWaste(force)

    return force.fluid_production_statistics.get_input_count("waste") +
           force.item_production_statistics.get_input_count("compostwaste")

end

local MinHungerState = 1
local MaxHungerState = 5
local HungerTime = 3600 / 4

local function calculateHunger()

    local player = game.player[1]

    local totalWaste = calculateTotalWaste(player.force)
    local totalFoodNeeded = global.coli.housing

    global.coli.foodneeded = totalFoodNeeded

    global.coli.totalWasteLastPeriod = totalWaste
    global.coli.foodEaten = global.coli.totalWasteLastPeriod - totalWaste

    if global.coli.foodEaten < global.coli.foodneeded then

        -- todo: Eat Food rations

        -- hunger
        if global.coli.hungerstate > MinHungerState then
            global.coli.hungerstate = global.coli.hungerstate -1
        end

    else
        -- enough food
        if global.coli.hungerstate < MaxHungerState then
            global.coli.hungerstate = global.coli.hungerstate + 1
        end
    end

end

local FoodControl_tick = function()

    surface = game.surfaces[1]
    if game.tick % 20 ~= 0 then
        return
    end

    if game.tick % HungerTime == 0 then
        calculateHunger()
    end

end

local isLoad = false
function loadFood()
    if coli.ticks ~= nil and not isLoad then
        isLoad = true
        --table.insert(coli.ticks, FoodControl_tick)
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
