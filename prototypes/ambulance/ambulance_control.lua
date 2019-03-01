nextTickAmbulance = 0
local function on_changedPosition(event)
    if game.tick < nextTickAmbulance then return end
    nextTickAmbulance = game.tick + 30

    if event.player_index == nil then return end
    local player = game.players[event.player_index]
    if player.vehicle == nil then return end

    if player.vehicle.prototype.name ~= "ambulance" and player.vehicle.prototype.name ~= "ambulance_radar"  then return end


    -- type = "resource",
    if player.vehicle.prototype.name == "ambulance" then

        local tiles = 5
        local colonists = player.surface.find_entities_filtered(
            { name = "colonist", area = {{player.position.x-tiles, player.position.y-tiles}, {player.position.x+tiles, player.position.y+tiles}}})
        local inv = player.vehicle.get_inventory(defines.inventory.car_trunk)
        for i,c in pairs(colonists) do
            inv.insert({name="colonist", count=1})
            c.destroy()
        end

    else

        local force = player.force
        local tiles = 30
        local colonists = player.surface.find_entities_filtered(
            { name = "colonist", area = {{player.position.x-tiles, player.position.y-tiles}, {player.position.x+tiles, player.position.y+tiles}}})
        for i,c in pairs(colonists) do
            c.order_deconstruction(force, player)
        end

    end
end
--local on_jobs_tick = function()
--    if game.tick % 20 ~= 0 then return end
--    for i,player in pairs(game.players) do
--        if player.vehicle ~= nil then
--            if player.vehicle.prototype.name == "ambulance_radar"  then
--                if player.vehicle.relative_turret_orientation == nil then
--                    player.vehicle.relative_turret_orientation = 0
--                else
--                    player.vehicle.relative_turret_orientation = player.vehicle.relative_turret_orientation + 0.1
--                end
--                player_print(player.vehicle.relative_turret_orientation)
--
--            end
--        end
--    end
--end

local isLoad = false
function loadAmbulance()
    if not isLoad then
        isLoad = true

        --table.insert(coli.ticks, on_jobs_tick)
        table.insert(coli.on_changedPosition, on_changedPosition)
    end
end

local isInit = false
function initAmbulance()
    if isInit then
        return
    end
    isInit = true

    loadAmbulance()
end

