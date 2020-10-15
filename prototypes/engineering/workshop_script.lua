local workshop = {}
workshop.metatable = {__index = workshop}

function workshop.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface
  entity.operable = false

  --local beacon = surface.create_entity{name = parameter.beacon, position = position, force = force, player = entity.last_user}

  local vehicle =
  {
    entity = entity,
    index = tostring(entity.unit_number),
    tiles = parameter.tiles,
    hasModule = false
  }

  setmetatable(vehicle, workshop.metatable)

  return vehicle

end

function workshop:setModule()

  if self.entity.active then

    if self.hasModule then 
      return
    end
    self.entity.get_module_inventory().insert({name = "colonists-speed-module-1", count=1})
    self.hasModule = true

  else

    if not self.hasModule then 
      return
    end
    self.entity.get_module_inventory().clear()
    self.hasModule = false

  end
end

function workshop:update()
  
  if not self.entity.valid then return end 
  self:setModule()
end

function workshop:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function workshop:on_removed(event)
  if event.name == defines.events.on_entity_died then
    self.entity.destroy()
  else
  end
end

function workshop:pre_player_mined_item(event)
  self.entity.get_module_inventory().clear()
end

function workshop:on_config_changed()
end

return workshop