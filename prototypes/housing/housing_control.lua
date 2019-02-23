require("prototypes.scripts.util")

local HOUSING_1 = "colonial-housing-1"
local HOUSING_2 = "colonial-housing-2"
local HOUSING_3 = "colonial-housing-3"

local housing = {
    [HOUSING_1] = { name = HOUSING_1, colonists = 4 },
    [HOUSING_2] = { name = HOUSING_2, colonists = 8 },
    [HOUSING_3] = { name = HOUSING_3, colonists = 16 },
}

local MESSAGE_HOUSE_IS_COLD = {"description.house_is_cold"} -- "house is cold"


function isHousingEntity(entity)
    if housing[entity.name] ~= nil then
        return true
    else
        return false
    end
end

local function getColdHouseEntity(entity, coli)
    for i,e in pairs(coli.coldhouseentities) do
        if e.entity == entity then
            return i, e
        end
    end
    return nil
end

local function removeArrow(e, player, coli)
    player.remove_alert({ entity = e, icon = { type = "item", name = "cold" } })
    local index, coldHouse = getColdHouseEntity(e, coli)
    if coldHouse ~= nil then
        coldHouse.arrow.destroy()
        table.remove(coli.coldhouseentities, index)
    end
end

local function count_housing(house, player, surface, coli)
    local coldhouses = 0
    local entities = surface.find_entities_filtered{name=house.name, force=player.force }
    if not coli.coldhouseentities then coli.coldhouseentities = {} end
    for _,e in pairs(entities) do
        if e.valid then
            if e.energy == 0 then
                player.add_custom_alert(e, { type = "item", name = "cold" }, MESSAGE_HOUSE_IS_COLD, true)
                local coldHouse = getColdHouseEntity(e, coli)
                if coldHouse == nil then
                    local arrow = surface.create_entity({ name = "cold-arrow", position = e.position })
                    coldHouse = { entity = e, arrow = arrow }
                    table.insert(coli.coldhouseentities, coldHouse)
                end
                coldhouses = coldhouses + house.colonists
            else
                removeArrow(e, player, coli)
            end
        else
            removeArrow(e, player, coli)
        end
    end
    return coldhouses
end

local on_housing_tick = function()
    if game.tick % 20 ~= 0 then
        return
    end

    for i,player in pairs(game.players) do
        local coli = global.coli[i]

        local surface = player.surface

        local coldhouses = 0
        for i,h in pairs(housing) do
            coldhouses = coldhouses + count_housing(h, player, surface, coli)
        end
        coli.coldhouses = coldhouses

    end
end


local function calculate_housing(entity)

    return math.floor(entity.prototype.max_health / 50)

end

local housing_added = function(event)

    local coli = global.coli[event.player_index]
    local entity = event.created_entity
    if isHousingEntity(entity) then
        coli.housing = coli.housing + calculate_housing(entity)

        entity.set_recipe("free-air")
    end

end

local housing_removed = function(event)

    local coli = global.coli[event.player_index]
    local entity = event.entity
    if isHousingEntity(entity) then
        coli.housing = coli.housing - calculate_housing(entity)
    end

    removeArrow(entity, game.players[event.player_index], coli)

end

function playerHousing(player_index, player)
    local i = player_index
    local coli = global.coli[i]

    if not coli.coldhouses then coli.coldhouses = 0 end
end


local isLoad = false
function loadHousing()
    if coli.ticks ~= nil and not isLoad then
        isLoad = true

        table.insert(coli.ticks, on_housing_tick)
        table.insert(coli.on_added, housing_added)
        table.insert(coli.on_remove, housing_removed)
    end
end
local isInit = false
function initHousing()
    if isInit then
        return
    end
    isInit = true

    loadHousing()
end

