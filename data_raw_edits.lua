local function setModuleSlots(name)
  for _,m in pairs(data.raw[name]) do
    if m.module_specification == nil then
      m.module_specification =
      {
        module_slots = 1
      }
      m.allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    end
  end
end

setModuleSlots("assembling-machine")
setModuleSlots("furnace")