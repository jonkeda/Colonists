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
    local pbWidth = 100
    local player = game.players[index]

    local root = nil
    if player.gui.left.coli then
        root = player.gui.left.coli
        player.gui.left.coli.clear()
    else
        root = player.gui.left.add{
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
        column_count = 16
    }

    -- colonist count
    layout1.add{
        type = "sprite",
        name = "lblColonists",
        tooltip = {"property.colonistsCount"},
        sprite = "colonists-sprite"
    }
--    layout1.add{
--        type = "label",
--        name = "colonistsCount",
--        tooltip = {"property.colonistsCount"},
--        caption = "0"
--    }

    -- housing
    layout1.add{
        type = "sprite",
        name = "lblhousing",
        tooltip = {"property.housing"},
        sprite = "housing-sprite"
    }
    layout1.add{
        type = "sprite",
        name = "lblhousecold",
        tooltip = {"property.house-cold"},
        sprite = "house-cold-sprite"
    }
    local pb = layout1.add{
        type = "progressbar",
        name = "houses",
        tooltip = {"property.houses"},
        caption = "0",
    }
    pb.style.width = pbWidth
--    layout1.add{
--        type = "label",
--        name = "housing",
--        tooltip = {"property.housing"},
--        caption = "0"
--    }
--    layout1.add{
--        type = "label",
--        name = "coldhouses",
--        tooltip = {"property.coldHouses"},
--        caption = "0"
--    }
    layout1.add{
        type = "sprite",
        name = "lblhousewarm",
        tooltip = {"property.house-warm"},
        sprite = "house-warm-sprite"
    }

    -- jobs
    layout1.add{
        type = "sprite",
        name = "lbljobs",
        tooltip = {"property.jobs"},
        sprite = "jobs-sprite"
    }
    local pb = layout1.add{
        type = "progressbar",
        name = "jobspb",
        tooltip = {"property.jobs"},
        caption = "0"
    }
    pb.style.width = pbWidth
--    layout1.add{
--        type = "label",
--        name = "jobs",
--        tooltip = {"property.jobs"},
--        caption = "0"
--    }
    layout1.add{
        type = "sprite",
        name = "lbljobsend",
        tooltip = {"property.jobs"},
        sprite = "jobs-sprite"
    }

    -- food
    layout1.add{
        type = "sprite",
        name = "lblfoodhungry",
        tooltip = {"property.foodHungry"},
        sprite = "food-hungry-sprite"
    }
    local pb = layout1.add{
        type = "progressbar",
        name = "food",
        tooltip = {"property.food"},
        caption = "0"
    }
    pb.style.width = pbWidth
    layout1.add{
        type = "sprite",
        name = "lblfoodfull",
        tooltip = {"property.foodfull"},
        sprite = "food-full-sprite"
    }

    -- happiness
    layout1.add{
        type = "sprite",
        name = "lblunhappiness",
        tooltip = {"property.unhappy"},
        sprite = "unhappyface-sprite"
    }
    local pb = layout1.add{
        type = "progressbar",
        name = "happiness",
        tooltip = {"property.happiness"},
        caption = "0"
    }
    pb.style.width = pbWidth
    layout1.add{
        type = "sprite",
        name = "lblhappiness",
        tooltip = {"property.happy"},
        sprite = "happyface-sprite"
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


