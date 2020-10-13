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

function house:addHungryArrow()
  if self.hungryArrow or self.coldArrow then
    return
  end
  local player = self.entity.last_user
  player.add_custom_alert(self.entity, { type = "item", name = "colonists-hungry" }, MESSAGE_COLONISTS_ARE_HUNGRY, true)
  self.hungryArrow = rendering.draw_sprite{sprite = "item.colonists-hungry", target = self.entity, surface = player.surface}
end

function house:removeHungryArrow()
  if self.hungryArrow then
    local player = self.entity.last_user
    player.remove_alert({ entity = self.entity, icon = { type = "item", name = "colonists-hungry" } })
    rendering.destroy(self.hungryArrow)
    self.hungryArrow = nil
  end
end


function house:addColdArrow()
  if self.coldArrow then
    return
  end
  self:removeHungryArrow()
  local player = self.entity.last_user
  player.add_custom_alert(self.entity, { type = "item", name = "colonists-cold" }, MESSAGE_HOUSE_IS_COLD, true)
  self.coldArrow = rendering.draw_sprite{sprite = "item.colonists-cold", target = self.entity, surface = player.surface}
end

function house:removeColdArrow()
  if self.coldArrow then
    local player = self.entity.last_user
    player.remove_alert({ entity = self.entity, icon = { type = "item", name = "colonists-cold" } })
    rendering.destroy(self.coldArrow)
    self.coldArrow = nil
  end
end


function house:update()
  
  if not self.entity.valid then return end 

  if self.entity.status == defines.entity_status.no_power then
    self:addColdArrow()
  else
    self:removeColdArrow()
  end

  if self.entity.status ~= defines.entity_status.working then
    self:addHungryArrow()
  else
    self:removeHungryArrow()
  end

 -- self:setModule()
end

function house:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function house:on_removed()
end

function house:on_config_changed()
end

return house