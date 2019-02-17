require("prototypes.scripts.util")

local created = false
function CreateGuis()

    if created then
        return
    end

    if game ~= nil then
        for i=1,#game.players do
            created = true
            CreateGui(i)
        end
    end
end

function CreateGui(index)

    local player = game.players[index]

    local root = nil
    if player.gui.left.coli then
        root = player.gui.left.coli
        player.gui.left.coli.clear()
    else
        local root = player.gui.left.add{
            type = "frame",
            name = "coli",
            direction = "vertical", --horizontal
            column_count = 1
        }
        root.style.top_padding = 4
        root.style.bottom_padding = 4
        root.style.minimal_width = 230

    end

    --    root.style.maximum_width = 230
    local layout1 = root.add{
        type = "table",
        name = "layout1",
        column_count = 14
    }

    -- colonist count
    layout1.add{
        type = "sprite",
        name = "lblColonists",
        tooltip = {"property.colonistsCount"},
        sprite = "colonists-sprite"
    }
    layout1.add{
        type = "label",
        name = "colonistsCount",
        tooltip = {"property.colonistsCount"},
        caption = "0"
    }

    -- housing
    layout1.add{
        type = "sprite",
        name = "lblhousing",
        tooltip = {"property.housing"},
        sprite = "housing-sprite"
    }
    layout1.add{
        type = "label",
        name = "housing",
        tooltip = {"property.housing"},
        caption = "0"
    }
    layout1.add{
        type = "label",
        name = "coldhouses",
        tooltip = {"property.coldHouses"},
        caption = "0"
    }

    -- jobs
    layout1.add{
        type = "sprite",
        name = "lbljobs",
        tooltip = {"property.jobs"},
        sprite = "jobs-sprite"
    }
    layout1.add{
        type = "label",
        name = "jobs",
        tooltip = {"property.jobs"},
        caption = "0"
    }

--    -- waste
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblWaste",
--        caption = {"property.waste"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "waste",
--        caption = "0"
--    }
--
--    -- manager
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblManagers",
--        caption = {"property.manager"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "managers",
--        caption = "0"
--    }
--
--    -- engineer
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblEngineer",
--        caption = {"property.engineer"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "engineers",
--        caption = "0"
--    }
--
--    -- worker
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblWorker",
--        caption = {"property.worker"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "workers",
--        caption = "0"
--    }
--
--    -- environmentalist
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblEnvironmentalist",
--        caption = {"property.environmentalist"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "environmentalists",
--        caption = "0"
--    }
--
--    -- workers needed
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblJobs",
--        caption = {"property.jobs"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "jobs",
--        caption = "0"
--    }
--
--    -- Food needed this turn
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblFoodNeeded",
--        caption = {"property.foodneeded"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "foodneeded",
--        caption = "0"
--    }
--
--    -- Food needed this turn
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblFoodEaten",
--        caption = {"property.foodeaten"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "foodeaten",
--        caption = "0"
--    }
--
--    -- Hunger state
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblHungerState",
--        caption = {"property.hungerstate"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "hungerstate",
--        caption = "0"
--    }
--
--
--    -- Cold state
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "lblColdState",
--        caption = {"property.coldstate"}
--    }
--    local label1_2 = layout1.add{
--        type = "label",
--        name = "coldstate",
--        caption = "0"
--    }
end


