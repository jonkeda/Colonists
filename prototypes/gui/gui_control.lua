local function countColonistsjob(force, job)
    return tostring(
        force.item_production_statistics.get_input_count(job.."1") * 4 +
                force.item_production_statistics.get_input_count(job.."2") * 8 +
                force.item_production_statistics.get_input_count(job.."3") * 12
    )
end

local function calculateTotalWaste()

    return global.force.fluid_production_statistics.get_input_count("waste") +
            global.force.item_production_statistics.get_input_count("compostwaste")

end

local on_gui_tick = function()

    if game.tick % 20 ~= 0 then
        return
    end
--    surface = game.surfaces[1]

    for i,p in pairs(global.players) do
        if p.character then
            --p.gui.left.coli.layout1.days.caption = tostring(global.coli.days)

            local buildInput = p.force.entity_build_count_statistics.get_input_count("colonist")
            local productionInput = p.force.item_production_statistics.get_input_count("colonist")
            local totalInput = buildInput + productionInput

            local buildOutput = p.force.entity_build_count_statistics.get_output_count("colonist")
            local productionOutput = p.force.item_production_statistics.get_output_count("colonist")
            local totalOutput = buildOutput + productionOutput

            p.gui.left.coli.layout1.colonistsCount.caption = tostring(totalInput - totalOutput)

            local wasteInput = calculateTotalWaste()

--            p.gui.left.coli.layout1.waste.caption = tostring(wasteInput)

--            p.gui.left.coli.layout1.managers.caption = countColonistsjob(p.force, "colonist-speed-module-")
--            p.gui.left.coli.layout1.engineers.caption = countColonistsjob(p.force, "colonist-effectivity-module-")
--            p.gui.left.coli.layout1.workers.caption = countColonistsjob(p.force, "colonist-productivity-module-")
--            p.gui.left.coli.layout1.environmentalists.caption = countColonistsjob(p.force, "colonist-pollution-module-")

            p.gui.left.coli.layout1.jobs.caption = tostring(global.coli.jobs)
            p.gui.left.coli.layout1.housing.caption = tostring(global.coli.housing)

            -- food needed
--            p.gui.left.coli.layout1.foodneeded.caption = tostring(global.coli.foodneeded)
--            p.gui.left.coli.layout1.foodeaten.caption = tostring(global.coli.foodeaten)
--            p.gui.left.coli.layout1.hungerstate.caption = tostring(global.coli.hungerstate)
        end
    end
end





local isInitGui = false
function initGui()
    if coli.ticks ~= nil and not isInitGui then
        isInitTotals = true
        table.insert(coli.ticks, on_gui_tick)
    end
end