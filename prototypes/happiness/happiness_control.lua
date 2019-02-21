require("prototypes.scripts.util")

local MINIMUM_HAPPINESS = 1
local MAXIMUM_HAPPINESS = 100

local on_tick = function()
    if game.tick % (60 * 60) ~= 0 then
        return
    end

    local happinessChange = 0
    if global.coli.coldhouses > 0 then
        happinessChange = happinessChange - 1
    end

    if global.coli.hungerstate < 1 then
        happinessChange = happinessChange - 1
    end

    if happinessChange == 0 then
        happinessChange = 1
    end

    global.coli.happiness = global.coli.happiness + happinessChange
    if global.coli.happiness < MINIMUM_HAPPINESS then
        global.coli.happiness = MINIMUM_HAPPINESS
    end
    if global.coli.happiness > MAXIMUM_HAPPINESS then
        global.coli.happiness = MAXIMUM_HAPPINESS
    end
end

local isLoad = false
function loadHappiness()
    if not isLoad then
        isLoad = true

        table.insert(coli.ticks, on_tick)
    end
end

local isInit = false
function initHappiness()
    if isInit then
        return
    end
    isInit = true

    if not global.coli.happiness then global.coli.happiness = 100 end

    loadHappiness()
end

