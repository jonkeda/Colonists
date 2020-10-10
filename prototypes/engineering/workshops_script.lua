local workshop_libs = {}

local required_interfaces = {
  metatable = "table",
  new = "function",
  on_removed = "function",
  update = "function"
}

local add_workshop_lib = function(entity_name, lib, parameters)
  for name, value_type in pairs(required_interfaces) do
    if not lib[name] or type(lib[name]) ~= value_type then
      error(
        "Trying to add lib without all required interfaces: " ..
          serpent.block(
            {
              entity_name = entity_name,
              missing_value_key = name,
              value_type = type(lib[name]),
              expected_type = value_type
            }
          )
      )
    end
  end
  workshop_libs[entity_name] = {lib = lib, parameters = parameters } 
end

add_workshop_lib("colonists-workshop-furnace-1", require("prototypes/engineering/workshop_script"), {radius = 3, beacon = "colonists-workshop-beacon-1"})
add_workshop_lib("colonists-workshop-furnace-2", require("prototypes/engineering/workshop_script"), {radius = 6, beacon = "colonists-workshop-beacon-2"})
add_workshop_lib("colonists-workshop-furnace-3", require("prototypes/engineering/workshop_script"), {radius = 12, beacon = "colonists-workshop-beacon-3"})

local script_data = {
  workshops = {},
  update_buckets = {},
  reset_to_be_taken_again = true,
  refresh_techs = true,
  update_rate = 60
}

local get_workshop_by_index = function(index)
  return script_data.workshops[index]
end

local get_workshop = function(entity)
  return get_workshop_by_index(tostring(entity.unit_number))
end

local get_corpse_position = function(entity, corpse_offsets)
  local position = entity.position
  local direction = entity.direction
  local offset = corpse_offsets[direction]
  return {position.x + offset[1], position.y + offset[2]}
end

local big = math.huge
local insert = table.insert
local add_to_update_bucket = function(index)
  local best_bucket
  local best_count = big
  local buckets = script_data.update_buckets
  for k = 1, script_data.update_rate do
    local bucket_index = k % script_data.update_rate
    local bucket = buckets[bucket_index]
    if not bucket then
      bucket = {}
      buckets[bucket_index] = bucket
      best_bucket = bucket
      best_count = 0
      break
    end
    local size = #bucket
    if size < best_count then
      best_bucket = bucket
      best_count = size
    end
  end
  best_bucket[best_count + 1] = index
end

local on_created_entity = function(event)
  local entity = event.entity or event.created_entity
  if not (entity and entity.valid) then
    return
  end

  local name = entity.name

  local workshop_lib = workshop_libs[name]
  if not workshop_lib then
    return
  end

  local workshop = workshop_lib.lib.new(entity, workshop_lib.parameters)
  script.register_on_entity_destroyed(entity)
  workshop.surface_index = entity.surface.index
  script_data.workshops[workshop.index] = workshop
  add_to_update_bucket(workshop.index)
end

local remove_workshop = function(workshop, event)
  -- local surface = workshop.surface_index
  local index = workshop.index
  -- local x, y = workshop.node_position[1], workshop.node_position[2]
  -- remove_workshop_from_node(surface, x, y, index)
  script_data.workshops[index] = nil
  workshop:on_removed(event)
end

local on_entity_removed = function(event)
  local entity = event.entity

  if not (entity and entity.valid) then
    return
  end

  local workshop = get_workshop(entity)
  if workshop then
    remove_workshop(workshop, event)
  end
end

local on_entity_destroyed = function(event)
  local unit_number = event.unit_number
  if not unit_number then
    return
  end

  local workshop = get_workshop_by_index(tostring(unit_number))
  if workshop then
    remove_workshop(workshop, event)
  end
end

local get_lib = function(workshop)
  local name = workshop.entity.name
  return workshop_libs[name]
end

local load_workshop = function(workshop)
  local lib = get_lib(workshop).lib
  if lib and lib.metatable then
    setmetatable(workshop, lib.metatable)
  end
end

local update_workshops = function(tick)
  local bucket_index = tick % script_data.update_rate
  local update_list = script_data.update_buckets[bucket_index]
  if not update_list then
    return
  end

  local workshops = script_data.workshops

  local k = 1
  while true do
    local workshop_index = update_list[k]
    if not workshop_index then
      return
    end
    local workshop = workshops[workshop_index]
    if not (workshop and workshop.furnace.valid) then
      workshops[workshop_index] = nil
      local last = #update_list
      if k == last then
        update_list[k] = nil
      else
        update_list[k], update_list[last] = update_list[last], nil
      end
    else
      workshop:update()
      k = k + 1
    end
  end
end

local on_tick = function(event)
  update_workshops(event.tick)
end

local setup_lib_values = function()
  for k, lib in pairs(workshop_libs) do
    lib.get_workshop = get_workshop_by_index
  end
end

local insert = table.insert
local refresh_update_buckets = function()
  local count = 1
  local interval = script_data.update_rate
  local buckets = {}
  for index, workshop in pairs(script_data.workshops) do
    local bucket_index = count % interval
    buckets[bucket_index] = buckets[bucket_index] or {}
    insert(buckets[bucket_index], index)
    count = count + 1
  end
  script_data.update_buckets = buckets
end

local refresh_update_rate = function()
  local update_rate = settings.global["transport-vehicle-update-interval"].value
  if script_data.update_rate == update_rate then
    return
  end
  script_data.update_rate = update_rate
  refresh_update_buckets()
  --game.print(script_data.update_rate)
end

local on_runtime_mod_setting_changed = function(event)
  refresh_update_rate()
end

local lib = {}

lib.events = {
  [defines.events.on_built_entity] = on_created_entity,
  [defines.events.on_robot_built_entity] = on_created_entity,
  [defines.events.script_raised_built] = on_created_entity,
  [defines.events.script_raised_revive] = on_created_entity,
  [defines.events.on_entity_died] = on_entity_removed,
  [defines.events.on_robot_mined_entity] = on_entity_removed,
  [defines.events.script_raised_destroy] = on_entity_removed,
  [defines.events.on_player_mined_entity] = on_entity_removed,
  [defines.events.on_entity_destroyed] = on_entity_destroyed,
  [defines.events.on_tick] = on_tick,
  [defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed
}

lib.on_init = function()
  global.transport_workshops = global.transport_workshops or script_data
  setup_lib_values()
  refresh_update_rate()
end

lib.on_load = function()
  script_data = global.transport_workshops or script_data
  setup_lib_values()
  for k, workshop in pairs(script_data.workshops) do
    load_workshop(workshop)
  end
end

lib.on_configuration_changed = function()
  global.transport_workshops = global.transport_workshops or script_data

  for k, workshop in pairs(script_data.workshops) do
    if not workshop.furnace.valid then
      script_data.workshops[k] = nil
    else
      script.register_on_entity_destroyed(workshop.furnace)
      workshop.surface_index = workshop.furnace.surface.index
      if workshop.on_config_changed then
        workshop:on_config_changed()
      end
    end
  end

  if not script_data.refresh_techs then
    script_data.refresh_techs = true
    for k, force in pairs(game.forces) do
      force.reset_technology_effects()
    end
  end

  refresh_update_rate()
end

lib.get_workshop = function(entity)
  return script_data.workshops[tostring(entity.unit_number)]
end

lib.get_workshop_by_index = get_workshop_by_index

return lib
