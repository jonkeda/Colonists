require("prototypes.scripts.util")

local function countColonistsjob(force, job)
    return tostring(
        force.item_production_statistics.get_input_count(job.."1") * 4 +
                force.item_production_statistics.get_input_count(job.."2") * 8 +
                force.item_production_statistics.get_input_count(job.."3") * 12
    )
end

local function setTooltip(control, text)
    if control.tooltip ~= text then
        control.tooltip = text
    end
end

local on_gui_tick = function()

    if game.tick % 20 ~= 0 then
        return
    end
--    surface = game.surfaces[1]


    for i,p in pairs(game.players) do
        --if p.character then
            --p.gui.left.coli.layout1.days.caption = tostring(global.coli.days)

--            local buildInput = p.force.entity_build_count_statistics.get_input_count("colonist")
--            local productionInput = p.force.item_production_statistics.get_input_count("colonist")
--            local totalInput = buildInput + productionInput
--
--            local buildOutput = p.force.entity_build_count_statistics.get_output_count("colonist")
--            local productionOutput = p.force.item_production_statistics.get_output_count("colonist")
--            local totalOutput = buildOutput + productionOutput

            --p.gui.left.coli.layout1.colonistsCount.caption = tostring(totalInput - totalOutput)
            --local wasteInput = calculateTotalWaste()

--            p.gui.left.coli.layout1.waste.caption = tostring(wasteInput)
--            p.gui.left.coli.layout1.managers.caption = countColonistsjob(p.force, "colonist-speed-module-")
--            p.gui.left.coli.layout1.engineers.caption = countColonistsjob(p.force, "colonist-effectivity-module-")
--            p.gui.left.coli.layout1.workers.caption = countColonistsjob(p.force, "colonist-productivity-module-")
--            p.gui.left.coli.layout1.environmentalists.caption = countColonistsjob(p.force, "colonist-pollution-module-")

            setTooltip(p.gui.left.coli.layout1.lblColonists, tostring(global.coli.housing))

            -- jobs
            if global.coli.housing == 0 or global.coli.jobs > global.coli.housing then
                p.gui.left.coli.layout1.jobspb.value = 1
            else
                p.gui.left.coli.layout1.jobspb.value = global.coli.jobs / global.coli.housing
                setTooltip(p.gui.left.coli.layout1.jobspb, "("..tostring(global.coli.jobs).."/"..tostring(global.coli.housing)..")")
            end

            -- heating
            if not global.coli.coldhouses then global.coli.coldhouses = 100 end
            if global.coli.housing == 0 then
                p.gui.left.coli.layout1.houses.value = 1
                setTooltip(p.gui.left.coli.layout1.houses, "")
            else
                p.gui.left.coli.layout1.houses.value = (global.coli.housing - global.coli.coldhouses) / global.coli.housing
                setTooltip(p.gui.left.coli.layout1.houses, "("..tostring(global.coli.housing).."/"..tostring(global.coli.coldhouses)..")")
            end

            -- food
            p.gui.left.coli.layout1.food.value = global.coli.hungerstate
            setTooltip(p.gui.left.coli.layout1.food, "("..tostring(global.coli.foodneeded).."/"..tostring(global.coli.foodEaten)..")")

            -- happiness
            if not global.coli.happiness then global.coli.happiness = 100 end
            p.gui.left.coli.layout1.happiness.value = global.coli.happiness / 100
            setTooltip(p.gui.left.coli.layout1.happiness, tostring(global.coli.happiness))

    end
end

local isLoad = false
function loadGui()
    if coli.ticks ~= nil and not isLoad then
        isLoad = true
        table.insert(coli.ticks, on_gui_tick)
    end
end

local isInit = false
function initGui()

    if isInit then
        return
    end
    isInit = true

    loadGui()
end

