function isHousingEntity(entity)
    if entity.name == "colonial-housing-1" or
        entity.name == "colonial-housing-2" or
        entity.name == "colonial-housing-3" then
        return true
    else
        return false
    end
end
local housing_added = function(event)

    local entity = event.created_entity
    if isHousingEntity(entity) then
        local e = entity.prototype.max_health
        global.coli.housing = global.coli.housing + e
    end

end

local housing_removed = function(event)

    local entity = event.entity
    if isHousingEntity(entity) then
        local e = entity.prototype.max_health
        global.coli.housing = global.coli.housing - e
    end

end

local isInitHousing = false
function initHousing()
    if coli.ticks ~= nil and not isInitHousing then
        isInitHousing = true
        table.insert(coli.on_added, housing_added)
        table.insert(coli.on_remove, housing_removed)
    end
end