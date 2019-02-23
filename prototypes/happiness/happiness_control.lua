require("prototypes.scripts.util")

local MINIMUM_HAPPINESS = 1
local MAXIMUM_HAPPINESS = 100

local on_tick = function()
    if game.tick % (60 * 60) ~= 0 then
        return
    end
    for i,player in pairs(game.players) do

        local coli = global.coli[i]

        local happinessChange = 0
        if coli.coldhouses > 0 then
            happinessChange = happinessChange - 1
        end

        if coli.hungerstate < 1 then
            happinessChange = happinessChange - 1
        end

        if happinessChange == 0 then
            happinessChange = 1
        end

        coli.happiness = coli.happiness + happinessChange
        if coli.happiness < MINIMUM_HAPPINESS then
            coli.happiness = MINIMUM_HAPPINESS
        end
        if coli.happiness > MAXIMUM_HAPPINESS then
            coli.happiness = MAXIMUM_HAPPINESS
        end
    end
end

function playerHappiness(player_index, player)
    local i = player_index
    local coli = global.coli[i]

    if not coli.happiness then coli.happiness = 100 end
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

    loadHappiness()
end

