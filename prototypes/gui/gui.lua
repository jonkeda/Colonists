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

    local pb

    --    root.style.maximum_width = 230
    local layout1 = root.add{
        type = "table",
        name = "layout1",
        column_count = 13
    }

    -- colonist count
    layout1.add{
        type = "sprite",
        name = "lblColonists",
        tooltip = {"property.colonistsCount"},
        sprite = "colonists-sprite"
    }

    -- housing
    layout1.add{
        type = "sprite",
        name = "lblhousecold",
        tooltip = {"property.house-cold"},
        sprite = "house-cold-sprite"
    }
    pb = layout1.add{
        type = "progressbar",
        name = "houses",
        tooltip = {"property.houses"},
        caption = "0",
    }
    pb.style.width = pbWidth
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
        tooltip = {"property.vacancies"},
        sprite = "jobs-sprite"
    }
    pb = layout1.add{
        type = "progressbar",
        name = "jobspb",
        tooltip = {"property.jobs"},
        caption = "0"
    }
    pb.style.width = pbWidth
    layout1.add{
        type = "sprite",
        name = "lbljobsend",
        tooltip = {"property.employed"},
        sprite = "jobs-sprite"
    }

    -- food
    layout1.add{
        type = "sprite",
        name = "lblfoodhungry",
        tooltip = {"property.foodHungry"},
        sprite = "food-hungry-sprite"
    }
    pb = layout1.add{
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
        sprite = "food-hungry-sprite"
    }

    -- happiness
    layout1.add{
        type = "sprite",
        name = "lblunhappiness",
        tooltip = {"property.unhappy"},
        sprite = "unhappyface-sprite"
    }
    pb = layout1.add{
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




    -- colonist
    layout1.add{
        type = "label",
        name = "colonistCount"
    }

    -- housing
    layout1.add{
        type = "label",
        name = "cold"
    }
    layout1.add{
        type = "label",
        name = "warmth"
    }
    layout1.add{
        type = "label",
        name = "warm"
    }

    -- jobs
    layout1.add{
        type = "label",
        name = "vacancies"
    }
    layout1.add{
        type = "label",
        name = "employment"
    }
    layout1.add{
        type = "label",
        name = "employed"
    }



    -- food
    layout1.add{
        type = "label",
        name = "full"
    }
    layout1.add{
        type = "label",
        name = "foodsp"
    }
    layout1.add{
        type = "label",
        name = "hungry"
    }


    -- happiness
    layout1.add{
        type = "label",
        name = "happy"
    }
    layout1.add{
        type = "label",
        name = "happiness2"
    }
    layout1.add{
        type = "label",
        name = "unhappy"
    }

end


