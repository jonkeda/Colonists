require("prototypes.scripts.util")


local MESSAGE_INACTIVE_ALERT = {"description.building_is_inactive"} -- "Building is inactive"
local MESSAGE_INACTIVE = "Building is inactive"

function isWorkerEntity(entity)
    if entity.type == "lab" or

        entity.type == "assembling-machine" or
        entity.type == "furnace" or
        entity.type == "mining-drill" or

        entity.type == "reactor" or
        entity.type == "roboport" or

        entity.type == "radar" or
        entity.type == "ammo-turret" or
        entity.type == "electric-turret" or
        entity.type == "fluid-turret" or

        entity.type == "locomotive" or

        entity.type == "rocket-silo" then
        return true
    else
        return false
    end
end

local function getInactiveHouseEntity(entity, coli)
    for i,e in pairs(coli.inActiveEnities) do
        if e.entity == entity then
            return i, e
        end
    end
    return nil
end


local function removeArrow(entity, player, coli)
    player.remove_alert{entity = entity, message = MESSAGE_INACTIVE_ALERT}
    local index, house = getInactiveHouseEntity(entity, coli)
    if house ~= nil then
        house.arrow.destroy()
        table.remove(coli.inActiveEnities, index)
    end
end

local on_jobs_tick = function()
    if game.tick % 20 ~= 0 then return end

    for i,player in pairs(game.players) do
        local coli = global.coli[i]

        if #coli.inActiveEnities > 0 then
            if coli.jobs <= coli.housing then
                for i,e in pairs(coli.inActiveEnities) do
                    local entity = e
                    if e.arrow ~= nil then
                        entity = e.entity
                        e.arrow.destroy()
                    end
                    if entity.valid then
                        entity.active = true
                        player.remove_alert{entity = entity, message = MESSAGE_INACTIVE_ALERT}
                    end
                    table.remove(coli.inActiveEnities, i)
                end
            end
        end
    end
end

local function calculate_jobs(entity)

    return math.floor(entity.prototype.max_health / 100)

end


local jobs_added = function(event)
    local entity = event.created_entity
    local index = event.player_index
    if index == nil then return end

    local player = game.players[index]

    if isWorkerEntity(entity) and
        not isHousingEntity(entity) then

        local coli = global.coli[index]

        coli.jobs = coli.jobs + calculate_jobs(entity)

        if coli.jobs > coli.housing then
            entity.active = false

            player.add_custom_alert(entity, { type = "item", name = entity.name }, MESSAGE_INACTIVE_ALERT, true)

            local arrow = entity.surface.create_entity({ name = "inactive-arrow", position = entity.position })
            table.insert(coli.inActiveEnities, { entity = entity, arrow = arrow } )

        end
    end
end

local jobs_removed = function(event)
    local entity = event.entity
    local index = event.player_index
    if index == nil then return end

    local coli = global.coli[index]
    if isWorkerEntity(entity) and
        not isHousingEntity(entity) then
        coli.jobs = coli.jobs - calculate_jobs(entity)
    end
    removeArrow(entity, game.players[index], coli)
end

function playerJobs(player_index, player)
    local i = player_index
    local coli = global.coli[i]

    if not coli.jobs then coli.jobs = 0 end
    if not coli.inActiveEnities then coli.inActiveEnities = { } end

end

local isLoad = false
function loadJobs()
    if not isLoad then
        isLoad = true

        table.insert(coli.ticks, on_jobs_tick)
        table.insert(coli.on_added, jobs_added)
        table.insert(coli.on_remove, jobs_removed)
    end
end

local isInit = false
function initJobs()
    if isInit then
        return
    end
    isInit = true

    loadJobs()
end

