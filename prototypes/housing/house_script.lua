local house = {}
house.metatable = {__index = house}

function house.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local vehicle =
  {
    entity = entity,
    index = tostring(entity.unit_number),
    tiles = parameter.tiles
  }
  setmetatable(vehicle, house.metatable)

  return vehicle

end


function house:update()
    
end

function house:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function house:on_removed()
end

function house:on_config_changed()
end

return house