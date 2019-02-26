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
        column_count = 5
    }

    -- colonist count
    layout1.add{
        type = "sprite",
        name = "lblColonists",
        tooltip = {"property.colonistsCount"},
        sprite = "colonists-sprite"
    }

    -- housing
    local housing = layout1.add{
        type = "table",
        name = "housing",
        column_count = 4
    }
    housing.add{
        type = "sprite",
        name = "lblhousing",
        tooltip = {"property.housing"},
        sprite = "housing-sprite"
    }
    housing.add{
        type = "sprite",
        name = "lblhousecold",
        tooltip = {"property.house-cold"},
        sprite = "house-cold-sprite"
    }
    local pb = housing.add{
        type = "progressbar",
        name = "houses",
        tooltip = {"property.houses"},
        caption = "0",
    }
    pb.style.width = pbWidth
    housing.add{
        type = "sprite",
        name = "lblhousewarm",
        tooltip = {"property.house-warm"},
        sprite = "house-warm-sprite"
    }

    -- jobs
    local jobs = layout1.add{
        type = "table",
        name = "jobs",
        column_count = 3
    }
    jobs.add{
        type = "sprite",
        name = "lbljobs",
        tooltip = {"property.jobs"},
        sprite = "jobs-sprite"
    }
    local pb = jobs.add{
        type = "progressbar",
        name = "jobspb",
        tooltip = {"property.jobs"},
        caption = "0"
    }
    pb.style.width = pbWidth
    jobs.add{
        type = "sprite",
        name = "lbljobsend",
        tooltip = {"property.jobs"},
        sprite = "jobs-sprite"
    }

    -- food
    local food = layout1.add{
        type = "table",
        name = "food",
        column_count = 3
    }
    food.add{
        type = "sprite",
        name = "lblfoodhungry",
        tooltip = {"property.foodHungry"},
        sprite = "food-hungry-sprite"
    }
    local pb = food.add{
        type = "progressbar",
        name = "food",
        tooltip = {"property.food"},
        caption = "0"
    }
    pb.style.width = pbWidth
    food.add{
        type = "sprite",
        name = "lblfoodfull",
        tooltip = {"property.foodfull"},
        sprite = "food-full-sprite"
    }

    -- happiness
    local happiness = layout1.add{
        type = "table",
        name = "happiness",
        column_count = 3
    }
    happiness.add{
        type = "sprite",
        name = "lblunhappiness",
        tooltip = {"property.unhappy"},
        sprite = "unhappyface-sprite"
    }
    local pb = happiness.add{
        type = "progressbar",
        name = "happiness",
        tooltip = {"property.happiness"},
        caption = "0"
    }
    pb.style.width = pbWidth
    happiness.add{
        type = "sprite",
        name = "lblhappiness",
        tooltip = {"property.happy"},
        sprite = "happyface-sprite"
    }




    -- colonist
    colonist2.add{
        type = "label",
        name = "colonistCount",
        caption = 50
    }

    -- housing
    local housing2 = layout1.add{
        type = "table",
        name = "housing2",
        column_count = 3,
    }
    housing2.style.width = 200
    housing2.style.column_alignments[3] = "right"
    housing2.style.horizontally_stretchable = true
    housing2.add{
        type = "label",
        name = "house",
        caption = ""
    }

    housing2.add{
        type = "label",
        name = "cold",
        caption = 1111
    }
    local lbl = housing2.add{
        type = "label",
        name = "warm",
        caption = 2222
    }
    lbl.style.align = "right"

    -- jobs
    local jobs2 = layout1.add{
        type = "table",
        name = "jobs2",
        column_count = 2,
        column_alignments = { "left", "right" }
    }
    jobs2.style.column_alignments[2] = "right"
    jobs2.add{
        type = "label",
        name = "workers",
        caption = 33
    }
    jobs2.add{
        type = "label",
        name = "jobs",
        caption = 44
    }



    -- food
    local food2 = layout1.add{
        type = "table",
        name = "food2",
        column_count = 2,
        column_alignments = { "left", "right" }
    }
    food2.style.column_alignments[2] = "right"
    food2.add{
        type = "label",
        name = "workers",
        caption = 55
    }
    food2.add{
        type = "label",
        name = "jobs",
        caption = 66
    }



    -- happiness
    local happiness2 = layout1.add{
        type = "table",
        name = "happiness2",
        column_count = 3
    }

end


