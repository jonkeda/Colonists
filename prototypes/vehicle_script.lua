local vehicle_libs = {}

local required_interfaces =
{
  metatable = "table",
  new = "function",
  on_removed = "function",
  update = "function"
}

local add_vehicle_lib = function(entity_name, lib, parameters)
  for name, value_type in pairs (required_interfaces) do
    if not lib[name] or type(lib[name]) ~= value_type then
      error("Trying to add lib without all required interfaces: "..serpent.block(
        {
          entity_name = entity_name,
          missing_value_key = name,
          value_type = type(lib[name]),
          expected_type = value_type
        }))
    end
  end
  vehicle_libs[entity_name] = lib
  lib.parameters = parameters
end

add_vehicle_lib("colonists-ambulance", require("prototypes/ambulance/ambulance_script"), { tiles = 5 })
add_vehicle_lib("colonists-ambulance-radar", require("prototypes/ambulance/ambulance_script"), { tiles = 30 })

local script_data =
{
  vehicles = {},
  update_buckets = {},
  reset_to_be_taken_again = true,
  refresh_techs = true,
  update_rate = 60
}

local get_vehicle_by_index = function(index)
  return script_data.vehicles[index]
end

local get_vehicle = function(entity)
  return get_vehicle_by_index(tostring(entity.unit_number))
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
  if not (entity and entity.valid) then return end

  local name = entity.name

  local vehicle_lib = vehicle_libs[name]
  if not vehicle_lib then
    return
  end

  local vehicle = vehicle_lib.new(entity, vehicle_lib.parameters)
  script.register_on_entity_destroyed(entity)
  vehicle.surface_index = entity.surface.index
  script_data.vehicles[vehicle.index] = vehicle
  add_to_update_bucket(vehicle.index)

end

local remove_vehicle = function(vehicle, event)
  local surface = vehicle.surface_index
  local index = vehicle.index
  --local x, y = vehicle.node_position[1], vehicle.node_position[2]
  --remove_vehicle_from_node(surface, x, y, index)
  script_data.vehicles[index] = nil
  vehicle:on_removed(event)
end

local on_entity_removed = function(event)
  local entity = event.entity

  if not (entity and entity.valid) then return end

  local vehicle = get_vehicle(entity)
  if vehicle then
    remove_vehicle(vehicle, event)
  end

end

local on_player_changed_position = function(event)
  if event.player_index == nil then return end
  local player = game.players[event.player_index]
  if player.vehicle == nil then return end
  local entity = player.vehicle
  if not (entity and entity.valid) then return end

  local vehicle = get_vehicle(entity)
  if vehicle then
    vehicle:on_changedPosition(event)
  end

end

local on_entity_destroyed = function(event)
  local unit_number = event.unit_number
  if not unit_number then return end

  local vehicle = get_vehicle_by_index(tostring(unit_number))
  if vehicle then
    remove_vehicle(vehicle, event)
  end
end

local get_lib = function(vehicle)
  local name = vehicle.entity.name
  return vehicle_libs[name]
end

local load_vehicle = function(vehicle)
  local lib = get_lib(vehicle)
  if lib and lib.metatable then
    setmetatable(vehicle, lib.metatable)
  end
end

local update_vehicles = function(tick)
  local bucket_index = tick % script_data.update_rate
  local update_list = script_data.update_buckets[bucket_index]
  if not update_list then return end

  local vehicles = script_data.vehicles

  local k = 1
  while true do
    local vehicle_index = update_list[k]
    if not vehicle_index then return end
    local vehicle = vehicles[vehicle_index]
    if not (vehicle and vehicle.entity.valid) then
      vehicles[vehicle_index] = nil
      local last = #update_list
      if k == last then
        update_list[k] = nil
      else
        update_list[k], update_list[last] = update_list[last], nil
      end
    else
      vehicle:update()
      k = k + 1
    end
  end

end

local on_tick = function(event)
  update_vehicles(event.tick)
end

local setup_lib_values = function()

  for k, lib in pairs (vehicle_libs) do
    lib.get_vehicle = get_vehicle_by_index
  end

end

local insert = table.insert
local refresh_update_buckets = function()
  local count = 1
  local interval = script_data.update_rate
  local buckets = {}
  for index, vehicle in pairs (script_data.vehicles) do
    local bucket_index = count % interval
    buckets[bucket_index] = buckets[bucket_index] or {}
    insert(buckets[bucket_index], index)
    count = count + 1
  end
  script_data.update_buckets = buckets
end

local refresh_update_rate = function()
  local update_rate = settings.global["colonists-update-interval"].value
  if script_data.update_rate == update_rate then return end
  script_data.update_rate = update_rate
  refresh_update_buckets()
  --game.print(script_data.update_rate)
end

local on_runtime_mod_setting_changed = function(event)
  refresh_update_rate()
end

local lib = {}

lib.events =
{
  [defines.events.on_built_entity] = on_created_entity,
  [defines.events.on_robot_built_entity] = on_created_entity,
  [defines.events.script_raised_built] = on_created_entity,
  [defines.events.script_raised_revive] = on_created_entity,

  [defines.events.on_entity_died] = on_entity_removed,
  [defines.events.on_robot_mined_entity] = on_entity_removed,
  [defines.events.script_raised_destroy] = on_entity_removed,
  [defines.events.on_player_mined_entity] = on_entity_removed,
  [defines.events.on_entity_destroyed] = on_entity_destroyed,

  [defines.events.on_player_changed_position] = on_player_changed_position,
  
  [defines.events.on_tick] = on_tick,
  [defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed,
}

lib.on_init = function()
  global.transport_vehicles = global.transport_vehicles or script_data
  setup_lib_values()
  refresh_update_rate()
end

lib.on_load = function()
  script_data = global.transport_vehicles or script_data
  setup_lib_values()
  for k, vehicle in pairs (script_data.vehicles) do
    load_vehicle(vehicle)
  end
end

lib.on_configuration_changed = function()

  global.transport_vehicles = global.transport_vehicles or script_data

  for k, vehicle in pairs (script_data.vehicles) do
    if not vehicle.entity.valid then
      script_data.vehicles[k] = nil
    else
      script.register_on_entity_destroyed(vehicle.entity)
      vehicle.surface_index = vehicle.entity.surface.index
      if vehicle.on_config_changed then
        vehicle:on_config_changed()
      end
    end
  end

  if not script_data.refresh_techs then
    script_data.refresh_techs = true
    for k, force in pairs (game.forces) do
      force.reset_technology_effects()
    end
  end

  refresh_update_rate()
end

lib.get_vehicle = function(entity)
  return script_data.vehicles[tostring(entity.unit_number)]
end

lib.get_vehicle_by_index = get_vehicle_by_index

return lib