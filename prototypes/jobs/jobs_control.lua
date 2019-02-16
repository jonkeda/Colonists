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

local on_jobs_tick = function()
    if game.tick % 20 ~= 0 then
        return
    end

    local player = game.players[1]

    if #global.coli.inActiveEnities > 0 then
        if global.coli.jobs <= global.coli.housing then
            for _,e in pairs(global.coli.inActiveEnities) do
                if e.valid then
                    e.active = true
                    player.remove_alert{entity = e, message = MESSAGE_INACTIVE_ALERT}
                end
                table.remove(global.coli.inActiveEnities, entity)
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
    local player = game.players[index]

    if isWorkerEntity(entity) and
        not isHousingEntity(entity) then
        global.coli.jobs = global.coli.jobs + calculate_jobs(entity)

        if global.coli.jobs > global.coli.housing then
            entity.active = false
            table.insert(global.coli.inActiveEnities, entity)

            player.add_custom_alert(entity, { type = "item", name = entity.name }, MESSAGE_INACTIVE_ALERT, true)
        end
    end
end

local jobs_removed = function(event)
    local entity = event.entity
    if isWorkerEntity(entity) and
        not isHousingEntity(entity) then
        global.coli.jobs = global.coli.jobs - calculate_jobs(entity)
    end
end

local isInitJobs = false
function initJobs()
    if not global.coli.jobs then global.coli.jobs = 0 end
    if not global.coli.inActiveEnities then global.coli.inActiveEnities = { } end

    if coli.ticks ~= nil and not isInitJobs then
        isInitJobs = true

        table.insert(coli.ticks, on_jobs_tick)
        table.insert(coli.on_added, jobs_added)
        table.insert(coli.on_remove, jobs_removed)
    end
end