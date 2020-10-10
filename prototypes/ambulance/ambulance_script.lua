local ambulance = {}
ambulance.metatable = {__index = ambulance}

function ambulance.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local vehicle =
  {
    entity = entity,
    index = tostring(entity.unit_number),
    tiles = parameter.tiles
  }
  setmetatable(vehicle, ambulance.metatable)

  return vehicle

end

function ambulance:on_changedPosition(event)

    if event.player_index == nil then return end
    local player = game.players[event.player_index]
    if player.vehicle == nil then return end


    local tiles = self.tiles;
    local colonists = player.surface.find_entities_filtered(
        { name = "colonist", area = {{player.position.x-tiles, player.position.y-tiles}, {player.position.x+tiles, player.position.y+tiles}}})
    local inv = player.vehicle.get_inventory(defines.inventory.car_trunk)
    for i,c in pairs(colonists) do
        inv.insert({name="colonist", count=1})
        c.destroy()
    end

end

function ambulance:update()
    
end

function ambulance:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function ambulance:on_removed()
end

function ambulance:on_config_changed()
end

return ambulance