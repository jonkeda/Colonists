local workshop = {}
workshop.metatable = {__index = workshop}

-- local MESSAGE_HOUSE_IS_COLD = {"description.house_is_cold"} 
-- local MESSAGE_COLONISTS_ARE_HUNGRY = {"description.colonists_are_hungry"}

function workshop.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface

  --local beacon = surface.create_entity{name = parameter.beacon, position = position, force = force, player = entity.last_user}

  local vehicle =
  {
    entity = entity,
    index = tostring(entity.unit_number),
    tiles = parameter.tiles,
    --beacon = beacon,
    coldArrow = nil,
    hungryArrow = nil,
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
    self.beacon.get_module_inventory().clear()
    self.hasModule = false

  end
end

-- function workshop:addHungryArrow()
--   if self.hungryArrow or self.coldArrow then
--     return
--   end
--   local player = self.entity.last_user
--   player.add_custom_alert(self.entity, { type = "item", name = "colonists-hungry" }, MESSAGE_COLONISTS_ARE_HUNGRY, true)
--   self.hungryArrow = rendering.draw_sprite{sprite = "item.colonists-hungry", target = self.entity, surface = player.surface}
-- end

-- function workshop:removeHungryArrow()
--   if self.hungryArrow then
--     local player = self.entity.last_user
--     player.remove_alert({ entity = self.entity, icon = { type = "item", name = "colonists-hungry" } })
--     rendering.destroy(self.hungryArrow)
--     self.hungryArrow = nil
--   end
-- end


-- function workshop:addColdArrow()
--   if self.coldArrow then
--     return
--   end
--   self:removeHungryArrow()
--   local player = self.entity.last_user
--   player.add_custom_alert(self.entity, { type = "item", name = "colonists-cold" }, MESSAGE_HOUSE_IS_COLD, true)
--   self.coldArrow = rendering.draw_sprite{sprite = "item.colonists-cold", target = self.entity, surface = player.surface}
-- end

-- function workshop:removeColdArrow()
--   if self.coldArrow then
--     local player = self.entity.last_user
--     player.remove_alert({ entity = self.entity, icon = { type = "item", name = "colonists-cold" } })
--     rendering.destroy(self.coldArrow)
--     self.coldArrow = nil
--   end
-- end


function workshop:update()
  
  if not self.entity.valid then return end 

  --self.beacon.active = self.entity.status == defines.entity_status.working
  
  -- if self.entity.status == defines.entity_status.no_power then
  --   self:addColdArrow()
  -- else
  --   self:removeColdArrow()
  -- end

  -- if self.entity.status ~= defines.entity_status.working then
  --   self:addHungryArrow()
  -- else
  --   self:removeHungryArrow()
  -- end

  self:setModule()
end

function workshop:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function workshop:on_removed(event)
  -- if self.beacon then
  --   self.beacon.destructible = true
  -- end
  if event.name == defines.events.on_entity_died then
    self.entity.destroy()
    -- if self.beacon then
    --   self.beacon.die()
    -- end
  else
    -- if self.beacon then
    --   self.beacon.destroy()
    -- end
  end
  -- self:removeColdArrow()
end

function workshop:on_config_changed()
end

return workshop