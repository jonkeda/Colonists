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

local function count_housing(house, player, surface)
    local coldhouses = 0
    local entities = surface.find_entities_filtered{name=house.name, force=player.force}
    for _,e in pairs(entities) do
        if e.valid then
            if e.energy == 0 then
                player.add_custom_alert(e, { type = "item", name = "cold" }, MESSAGE_HOUSE_IS_COLD, true)

                coldhouses = coldhouses + house.colonists
            end
        end
    end
    return coldhouses
end

local on_housing_tick = function()
    if game.tick % 20 ~= 0 then
        return
    end

    local player = game.players[1]
    local surface = player.surface

    local coldhouses = 0
    for i,h in pairs(housing) do
        coldhouses = coldhouses + count_housing(h, player, surface)
    end
    global.coli.coldhouses = coldhouses

end


local function calculate_housing(entity)

    return math.floor(entity.prototype.max_health / 50)

end

local housing_added = function(event)

    local entity = event.created_entity
    if isHousingEntity(entity) then
        global.coli.housing = global.coli.housing + calculate_housing(entity)
    end

end

local housing_removed = function(event)

    local entity = event.entity
    if isHousingEntity(entity) then
        global.coli.housing = global.coli.housing - calculate_housing(entity)
    end

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

    if not global.coli.coldhouses then global.coli.coldhouses = 0 end

    loadHousing()
end

