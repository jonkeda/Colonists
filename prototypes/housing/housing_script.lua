local housing_libs = {}

local MESSAGE_ENTITY_SET_TO_INACTIVE = { "description.entity_set_to_inactive" }

local entity_cost = {}
----  base --------------------------------------------------------------------
entity_cost["inserter"]  = 0.1 
entity_cost["fast-inserter"]  = 0.1 
entity_cost["filter-inserter"]  = 0.1 
entity_cost["long-handed-inserter"]  = 0.1 
entity_cost["burner-inserter"]  = 0.1 
entity_cost["stack-inserter"]  = 0.1 
entity_cost["stack-filter-inserter"]  = 0.1 

-- furnace
entity_cost["stone-furnace"]  = 1
entity_cost["electric-furnace"]  = 2 
entity_cost["steel-furnace"]  = 3

-- transport-belt
entity_cost["transport-belt"]  = 0.1 
entity_cost["fast-transport-belt"]  = 0.1 
entity_cost["express-transport-belt"]  = 0.1 

entity_cost["boiler"]  = 0.25
entity_cost["steam-engine"]  = 0.025
entity_cost["steam-turbine"]  = 1
entity_cost["heat-exchanger"]  = 0.1
entity_cost["reactor"]  = 10
entity_cost["burner-generator"]  = 0.5

entity_cost["offshore-pump"]  = 0.5
entity_cost["radar"]  = 1

entity_cost["assembling-machine-1"]  = 1
entity_cost["assembling-machine-2"]  = 2
entity_cost["assembling-machine-3"]  = 3
entity_cost["oil-refinery"]  = 5
entity_cost["chemical-plant"]  = 5
entity_cost["centrifuge"]  = 8

entity_cost["lab"]  = 1

entity_cost["splitter"]  = 0.1
entity_cost["fast-splitter"]  = 0.1
entity_cost["express-splitter"]  = 0.1

entity_cost["underground-belt"]  = 0.1
entity_cost["fast-underground-belt"]  = 0.1
entity_cost["express-underground-belt"]  = 0.1

-- entity_cost["solar-panel"]  = 0.5

entity_cost["loader"]  = 0.1
entity_cost["loader-1x1"]  = 0.1
entity_cost["fast-loader"]  = 0.1
entity_cost["express-loader"]  = 0.1

entity_cost["car"]  = 1
entity_cost["tank"]  = 2
entity_cost["spidertron"]  = 4

entity_cost["locomotive"]  = 1
entity_cost["cargo-wagon"]  = 0.25
entity_cost["fluid-wagon"]  = 0.25
entity_cost["artillery-wagon"]  = 0.5

entity_cost["rocket-silo"]  = 10

entity_cost["roboport"]  = 2
entity_cost["pump"]  = 0.1
entity_cost["market"]  = 0.1
entity_cost["beacon"]  = 1


---  COLONISTS  ----------------------------------------------
entity_cost["colonists-inserter"]  = 0.1 
entity_cost["colonists-assembling-machine"]  = 0.5 
entity_cost["colonists-mining-drill"]  = 0.5
entity_cost["colonists-lab"]  = 0.5
entity_cost["colonists-reverse-factory"]  = 0.5 
entity_cost["colonists-splitter"]  = 0.1

entity_cost["colonists-workshop-beacon-1"]  = 1 
entity_cost["colonists-workshop-beacon-2"]  = 2 
entity_cost["colonists-workshop-beacon-3"]  = 3 

-- entity_cost["colonists-heat-generator"]  = 0.2
-- entity_cost["colonists-electric-heat-generator"]  = 0.2
entity_cost["colonists-generator"]  = 0.2

entity_cost["colonists-workshop-beacon-3"]  = 3 


---  REVERSE FACTORY  ----------------------------------------------
entity_cost["reverse-factory-1"] = 1
entity_cost["reverse-factory-2"] = 2
entity_cost["reverse-factory-3"] = 3
entity_cost["reverse-factory-4"] = 4


-- FOOD INDUSTRY ---------------------------------------------------
entity_cost["fi-basic-farmland"] = 1
entity_cost["fi-greenhouse"] = 1
entity_cost["fi-big-greenhouse"] = 2
entity_cost["fi-incubator"] = 1
entity_cost["fi-composter"] = 0.5
entity_cost["fi-electric-composter"] = 1
entity_cost["burner-cooker"] = 0.5
entity_cost["electric-cooker"] = 0.5

entity_cost["cattle-grabber"] = 0.1
entity_cost["cattle-spawner"] = 1
entity_cost["cattle-butcher"] = 1

entity_cost["fish-farm"] = 1
entity_cost["burner-fishing-inserter"] = 0.1
entity_cost["fishing-inserter"] = 0.1
entity_cost["sturgeon-farm"] = 1

entity_cost["burner-food-picker"] = 0.1
entity_cost["food-picker"] = 0.1

entity_cost["fi-hydroponics-building"] = 1
entity_cost["fi-tree-greenhouse"] = 1



local required_interfaces = {
  metatable = "table",
  new = "function",
  on_removed = "function",
  update = "function"
}

local add_housing_lib = function(entity_name, lib, parameters)
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
  housing_libs[entity_name] = {lib = lib, parameters = parameters } 
end

add_housing_lib("colonists-housing-1", require("prototypes/housing/house_script"), { colonists = 4 })
add_housing_lib("colonists-housing-2", require("prototypes/housing/house_script"), { colonists = 8 })
add_housing_lib("colonists-housing-3", require("prototypes/housing/house_script"), { colonists = 16 })

local script_data = {
  housings = {},
  update_buckets = {},
  reset_to_be_taken_again = true,
  refresh_techs = true,
  update_rate = 60,
  forces = {}
}

local function get_force_data_by_force(force)
  local force_data = script_data.forces[force.index]
  if not force_data then
    force_data = {
      force = force,
      housings = {},
    }
    script_data.forces[force.index] = force_data
  end
  return force_data
end

local function get_force_data(entity)
  return get_force_data_by_force(entity.force)
end


local function count_active_houses(force_data)
    local active_houses = 0
    local ok_colonists = 0
    local nok_colonists = 0

      for i, h in pairs(force_data.housings) do
        active_houses = active_houses + 1
        local ok, colonists = h:check_status()
        if ok then
            ok_colonists = ok_colonists + colonists
        else
          nok_colonists = nok_colonists + colonists
        end
      end

    return active_houses, ok_colonists, nok_colonists
end

local function update_working_colonists()

  for fi, force_data in pairs(script_data.forces) do 

    local active_houses, ok_colonists, nok_colonists = count_active_houses(force_data)
    local surfaces = game.surfaces
    local total_cost = 0
    for si, surface in pairs(surfaces) do

      local entities = surface.find_entities_filtered{ force = force_data.force }
      for _, entity in pairs(entities) do
      
        local amount = entity_cost[entity.name]
        if amount then
          total_cost = total_cost + amount
          entity.active = total_cost < ok_colonists
          local player = entity.last_user
          if player then
            if entity.active then
              player.remove_alert({ entity = entity, icon = { type = "item", name = "colonists-hungry" } })
            else
              player.add_custom_alert(entity, { type = "item", name = "colonists-hungry" }, {"description.entity_set_to_inactive", entity.localised_name }, true)
            end
          end
        end
      end
    end

  end  

end

local get_housing_by_index = function(index)
  return script_data.housings[index]
end

local get_housing = function(entity)
  return get_housing_by_index(tostring(entity.unit_number))
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

  local housing_lib = housing_libs[name]
  if not housing_lib then
    return
  end

  local housing = housing_lib.lib.new(entity, housing_lib.parameters)
  script.register_on_entity_destroyed(entity)
  housing.surface_index = entity.surface.index
  script_data.housings[housing.index] = housing
  
  local force_data = get_force_data(entity)
  force_data.housings[housing.index] = housing
  
  add_to_update_bucket(housing.index)
end

local remove_housing = function(housing, event)
  -- local surface = housing.surface_index
  local index = housing.index
  -- local x, y = housing.node_position[1], housing.node_position[2]
  -- remove_housing_from_node(surface, x, y, index)
  script_data.housings[index] = nil
  local force_data = get_force_data(housing.entity)
  force_data.housings[housing.index] = nil
 
  housing:on_removed(event)
end

local on_entity_removed = function(event)
  local entity = event.entity

  if not (entity and entity.valid) then
    return
  end

  local housing = get_housing(entity)
  if housing then
    remove_housing(housing, event)
  end
end

local on_entity_destroyed = function(event)
  local unit_number = event.unit_number
  if not unit_number then
    return
  end

  local housing = get_housing_by_index(tostring(unit_number))
  if housing then
    remove_housing(housing, event)
  end
end

local get_lib = function(housing)
  local name = housing.entity.name
  return housing_libs[name]
end

local load_housing = function(housing)
  local lib = get_lib(housing).lib
  if lib and lib.metatable then
    setmetatable(housing, lib.metatable)
  end
end

local update_housings = function(tick)
  local bucket_index = tick % script_data.update_rate
  local update_list = script_data.update_buckets[bucket_index]
  if not update_list then
    return
  end

  local housings = script_data.housings

  local k = 1
  while true do
    local housing_index = update_list[k]
    if not housing_index then
      return
    end
    local housing = housings[housing_index]
    if not (housing and housing.entity.valid) then
      housings[housing_index] = nil
      local last = #update_list
      if k == last then
        update_list[k] = nil
      else
        update_list[k], update_list[last] = update_list[last], nil
      end
    else
      housing:update()
      k = k + 1
    end
  end
end

local on_tick = function(event)
  if event.tick % script_data.update_rate == 0 then
    update_working_colonists(event.tick)
  end

  update_housings(event.tick)
end

local setup_lib_values = function()
  for k, lib in pairs(housing_libs) do
    lib.get_housing = get_housing_by_index
  end
end

local insert = table.insert
local refresh_update_buckets = function()
  local count = 1
  local interval = script_data.update_rate
  local buckets = {}
  for index, housing in pairs(script_data.housings) do
    local bucket_index = count % interval
    buckets[bucket_index] = buckets[bucket_index] or {}
    insert(buckets[bucket_index], index)
    count = count + 1
  end
  script_data.update_buckets = buckets
end

local refresh_update_rate = function()
  local update_rate = settings.global["colonists-update-interval"].value
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

local OnPlayerCreated = function(event)
  local player = game.players[event.player_index]
  get_force_data_by_force(player.force)
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
  [defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed,

  [defines.events.on_player_created] = OnPlayerCreated,

}

lib.on_init = function()
  global.transport_housings = global.transport_housings or script_data
  setup_lib_values()
  refresh_update_rate()
end

lib.on_load = function()
  script_data = global.transport_housings or script_data
  setup_lib_values()
  for k, housing in pairs(script_data.housings) do
    load_housing(housing)
  end
end

lib.on_configuration_changed = function()
  global.transport_housings = global.transport_housings or script_data

  for k, housing in pairs(script_data.housings) do
    if not housing.entity.valid then
      script_data.housings[k] = nil
    else
      script.register_on_entity_destroyed(housing.entity)
      housing.surface_index = housing.entity.surface.index
      if housing.on_config_changed then
        housing:on_config_changed()
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

lib.get_housing = function(entity)
  return script_data.housings[tostring(entity.unit_number)]
end

lib.get_housing_by_index = get_housing_by_index

return lib
