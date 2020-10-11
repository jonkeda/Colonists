function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
 end

local function addEffects(name)
  for _,m in pairs(data.raw[name]) do
    if not string.starts(m.name, "colonists-") then
        if m.module_specification == nil then
        --   m.module_specification =
        --   {
        --     module_slots = 1
        --   }
            m.allowed_effects = {"consumption", "speed", "productivity", "pollution"}
        end
    end
  end
end

addEffects("assembling-machine")
addEffects("furnace")

addEffects("boiler")
addEffects("lab")
addEffects("mining-drill")
addEffects("reactor")



-- Inserter
-- TransportBelt