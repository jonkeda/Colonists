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

    for i,p in pairs(game.players) do

        local coli = global.coli[i]
        local layout1 = p.gui.left.coli.layout1

        setTooltip(layout1.lblColonists, tostring(coli.housing))

        -- jobs
        if coli.housing == 0 or coli.jobs > coli.housing then
            layout1.jobspb.value = 1
        else
            layout1.jobspb.value = coli.jobs / coli.housing
            setTooltip(layout1.jobspb, "("..tostring(coli.jobs).."/"..tostring(coli.housing)..")")
        end

        -- heating
        if not coli.coldhouses then coli.coldhouses = 100 end
        if coli.housing == 0 then
            layout1.houses.value = 1
            setTooltip(layout1.houses, "")
        else
            layout1.houses.value = (coli.housing - coli.coldhouses) / coli.housing
            setTooltip(layout1.houses, "("..tostring(coli.housing).."/"..tostring(coli.coldhouses)..")")
        end

        -- food
        layout1.food.value = coli.hungerstate
        setTooltip(layout1.food, "("..tostring(coli.foodneeded).."/"..tostring(coli.foodEaten)..")")

        -- happiness
        if not coli.happiness then coli.happiness = 100 end
        layout1.happiness.value = coli.happiness / 100
        setTooltip(layout1.happiness, tostring(coli.happiness))

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

