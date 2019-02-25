-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
require("prototypes.scripts.util")

require("persistance")
require("prototypes.food.food_control")
require("prototypes.housing.housing_control")
require("prototypes.jobs.jobs_control")
require("prototypes.colonists.colonists_control")
require("prototypes.happiness.happiness_control")
require("prototypes.trees.fruit-scissors-control")
require("prototypes.gui.gui")
require("prototypes.gui.gui_control")

local debug = false
local debugset = false

function OnInit()
    if not global.coli then global.coli = {} end
    for i=1,#game.players do
        if not global.coli[i] then global.coli[i] = {} end
    end

    initColi()
    initFood()
    initColonists()
    initHousing()
    initJobs()
    initHappiness()
    initGui()
    initFruitScissors()
end

function OnLoad()
    loadColi()
    loadFood()
    loadColonists()
    loadHousing()
    loadJobs()
    loadHappiness()
    loadGui()
    loadFruitScissors()
    CreateGuis()
end

function OnPlayerCreated(event)
    local index = event.player_index
    local player = game.players[index]

    if not global.coli then global.coli = {} end
    if not global.coli[index] then global.coli[index] = {} end

    playerFood(index, player)
    playerHousing(index, player)
    playerJobs(index, player)
    playerHappiness(index, player)

    CreateGui(index)

    local player = game.players[index]



    player.insert({name="burner-mining-drill", count=2})
    player.insert({name="colonial-housing-1", count=2})
    player.insert({name="colonists-building-food-1", count=1})

    player.insert({name="fruit-scissor", count=1})

end

local function migrate080()

    if not global.coli then global.coli = {} end
    if  global.coli[1] ~= nil then
        return
    end

    local coli = {}

    if not coli.totalWasteLastPeriod then coli.totalWasteLastPeriod = global.coli.totalWasteLastPeriod end
    if not coli.totalFoodLastPeriod then coli.totalFoodLastPeriod = global.coli.totalFoodLastPeriod end
    if not coli.foodneeded then coli.foodneeded = global.coli.foodneeded end
    if not coli.foodeaten then coli.foodeaten = global.coli.foodeaten end
    if not coli.hungerstate then coli.hungerstate = global.coli.hungerstate end
    if not coli.housing then coli.housing = global.coli.housing end

    if not coli.coldhouses then coli.coldhouses = global.coli.coldhouses end

    if not coli.jobs then coli.jobs = global.coli.jobs end
    if not coli.inActiveEnities then coli.inActiveEnities = global.coli.inActiveEnities end

    if not coli.happiness then coli.happiness = global.coli.happiness end

    global.coli[1] = coli
end

function OnModInit(event)

    migrate080()

    CreateGuis()

    script.on_event(defines.events.on_tick, OnTick)

    OnTick(event)

end

function OnTick(event)

    if debug then
        if not debugset then
            debugset = true
            for i,player in pairs(game.players) do
                player.force.research_all_technologies()
                player.cheat_mode=true
            end
        end
    end

    for k=1, #coli.ticks do
        local v = coli.ticks[k]
        v()
    end

end

function OnEntityDied(event)
    for k=1, #coli.on_entitydied do
        local v = coli.on_entitydied[k]
        v(entity)
    end
end

function OnPlayerRespawned(event)

end

function OnPlayerMinedTile(event)

end

function OnPlayerJoinedGame(event)

end

function OnPlayerLeftGame(event)

end


local local_on_added = function(event)
    for k=1, #coli.on_added do
        local v = coli.on_added[k]
        v(event)
    end
end
local local_on_removed = function(event)
    for k=1, #coli.on_remove do
        local v = coli.on_remove[k]
        v(event)
    end
end

script.on_init(OnInit)
script.on_load(OnLoad)

script.on_event(defines.events.on_tick, OnModInit)

script.on_event(defines.events.on_entity_died, OnEntityDied)
script.on_event(defines.events.on_player_created, OnPlayerCreated)
script.on_event(defines.events.on_player_respawned, OnPlayerRespawned)
script.on_event(defines.events.on_player_joined_game, OnPlayerJoinedGame)
script.on_event(defines.events.on_player_left_game, OnPlayerLeftGame)

local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}-- defines.events.on_player_built_tile, defines.events.on_robot_built_tile}
local remove_events = {defines.events.on_entity_died,defines.events.on_robot_pre_mined,defines.events.on_robot_mined_entity,defines.events.on_pre_player_mined_entity,defines.events.on_player_mined_entity}

script.on_event(build_events, local_on_added)
script.on_event(remove_events, local_on_removed)
