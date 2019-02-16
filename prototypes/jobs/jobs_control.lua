local function isWorkerEntity(entity)
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

local jobs_added = function(event)
    local entity = event.created_entity
    if isWorkerEntity(entity) then
        local e = entity.prototype.max_health
        global.coli.jobs = global.coli.jobs + e
    end
end

local jobs_removed = function(event)
    local entity = event.entity
    if isWorkerEntity(entity) then
        local e = entity.prototype.max_health
        global.coli.jobs = global.coli.jobs - e
    end
end

local isInitJobs = false
function initJobs()
    if coli.ticks ~= nil and not isInitJobs then
        isInitJobs = true
        table.insert(coli.on_added, jobs_added)
        table.insert(coli.on_remove, jobs_removed)
    end
end