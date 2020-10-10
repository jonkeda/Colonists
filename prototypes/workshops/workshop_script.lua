local workshop = {}
workshop.metatable = {__index = workshop}

function workshop.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface

  local beacon = surface.create_entity{name = parameter.beacon, position = position, force = force, player = entity.last_user}

  local vehicle =
  {
    entity = entity,
    index = tostring(entity.unit_number),
    tiles = parameter.tiles,
    beacon = beacon
  }

  beacon.get_module_inventory().insert({name="colonists-repair-module-1", count=1})

  setmetatable(vehicle, workshop.metatable)

  return vehicle

end


function workshop:update()
    
  local s = self;

end

function workshop:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function workshop:on_removed()
end

function workshop:on_config_changed()
end

return workshop