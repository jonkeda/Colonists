local Colonists_died = function(event)
    local entity = event.entity
    local i = 1
    local inventory = entity.get_inventory(i)
    while inventory ~= nil do
        local colonists = inventory.get_item_count("colonist")

        local buildOutput = entity.force.entity_build_count_statistics.get_output_count("colonist")

        entity.force.entity_build_count_statistics.set_output_count("colonist", buildOutput + colonists)

        i = i + 1

        inventory = entity.get_inventory(i)
    end
end

local isLoad = false
function loadColonists()
    if coli.ticks ~= nil and not isLoad then
        isLoad = true
        table.insert(coli.on_entitydied, Colonists_died)
    end
end

local isInit = false
function initColonists()
    if isInit then
        return
    end
    isInit = true

    loadColonists()
end
