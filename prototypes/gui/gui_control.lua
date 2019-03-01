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

        local colonists = coli.housing

        setTooltip(layout1.lblColonists, tostring(coli.housing))
        layout1.colonistCount.caption = tostring(colonists)


        -- jobs
        local vacancies = coli.jobs - colonists
        local employed
        if vacancies < 0 then
            vacancies = 0
        end
        if colonists > coli.jobs then
            employed = coli.jobs
        else
            employed = colonists
        end
        if (employed + vacancies) == 0 then
            layout1.jobspb.value = 0
        else
            layout1.jobspb.value = employed / (employed + vacancies)
            setTooltip(layout1.jobspb, "("..tostring(employed).."/"..tostring(vacancies)..")")
        end
        layout1.vacancies.caption = tostring(vacancies)
        layout1.employed.caption = tostring(employed)


        -- heating
        local coldcolonists = coli.coldhouses
        local warmcolonists = colonists - coli.coldhouses
        if not coli.coldhouses then coli.coldhouses = 100 end
        if colonists == 0 then
            layout1.houses.value = 0
            setTooltip(layout1.houses, "")
        else
            layout1.houses.value = (colonists - coli.coldhouses) / colonists
            setTooltip(layout1.houses, "("..tostring(colonists).."/"..tostring(coli.coldhouses)..")")
        end
        layout1.cold.caption = tostring(coli.coldhouses)
        layout1.warm.caption = tostring(warmcolonists)


        -- food
        local fed
        local hungry
        layout1.food.value = coli.hungerstate
        setTooltip(layout1.food, "("..tostring(coli.foodneeded).."/"..tostring(coli.foodEaten)..")")
        layout1.full.caption = tostring(coli.foodEaten)
        layout1.hungry.caption = tostring(coli.foodneeded)


        -- happiness
        if not coli.happiness then coli.happiness = 0 end
        layout1.happiness.value = coli.happiness / 100
        setTooltip(layout1.happiness, tostring(coli.happiness))


        -- player_print(layout1.colonist2.style.help())

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

