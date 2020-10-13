-- Turrets have higher speed, health, healing_per_tick and damage_modifier

local util = require("prototypes/utils/tf_util")

local newEntities = {}
local newItems = {}
local newRecipies = {}


local function addToTechnology(prototypeName, copyName)
    for _,tech in pairs(data.raw["technology"]) do
        local effects = tech.effects
        if effects then
            for i = 1, #effects, 1 do
                local effect = effects[i]
                if effect.type == "unlock-recipe" and effect.recipe == prototypeName then
                    table.insert(tech.effects, {type = "unlock-recipe",recipe = copyName})
                end
            end
        end
    end
end

local function copyRecipe(prototypeName, copyName, nrColonists)
    for _,recipe in pairs(data.raw["recipe"]) do
        if recipe.result == prototypeName then
            local recipeCopy = util.table.deepcopy(recipe)
            recipeCopy.name = "colonists-"..recipeCopy.name
            recipeCopy.result = copyName
            recipeCopy.ingredients = {{prototypeName, 1}, {"colonist", nrColonists}}

            newRecipies[recipeCopy.name] = recipeCopy
            
            addToTechnology(recipe.name, recipeCopy.name)
        end
    end
end

local function copyItems(prototypeName, copyName, nrColonists)
    for _,item in pairs(data.raw["item"]) do
        if item.place_result == prototypeName then
            local itemCopy = util.table.deepcopy(item)
            itemCopy.name = "colonists-"..itemCopy.name
            itemCopy.place_result = copyName
            util.createMannedIcon(itemCopy)
            newItems[itemCopy.name] = itemCopy
            itemCopy.place_result = itemCopy.name,

            copyRecipe(item.name, itemCopy.name, nrColonists)
        end
    end
end


local function copyTurrets(prototypeName, nrColonists, modifier, damage_modifier)

    for _,entity in pairs(data.raw[prototypeName]) do
        -- minable

        local entityCopy = util.table.deepcopy(entity)

        entityCopy.name = "colonists-"..entityCopy.name

        entityCopy.localised_name = {"description.manned", entityCopy.localised_name or {"entity-name." .. entity.name}}
        --entityCopy.localised_name = {"item-name.filled-barrel", entityCopy.localised_name or {"fluid-name." .. fluid.name}},
        util.createMannedIcon(entityCopy)

        entityCopy.max_health = modifier * entityCopy.max_health

        if entityCopy.healing_per_tick then
            entityCopy.healing_per_tick = modifier * entityCopy.healing_per_tick
        end
        
        if entityCopy.attacking_speed then
            entityCopy.attacking_speed = modifier * entityCopy.attacking_speed
        end
        if entityCopy.attack_parameters then
            if entityCopy.attack_parameters.damage_modifier and entityCopy.attack_parameters.damage_modifier > 1 then
                entityCopy.attack_parameters.damage_modifier = modifier * entityCopy.attack_parameters.damage_modifier
            else
                entityCopy.attack_parameters.damage_modifier = damage_modifier
            end
        end
        newEntities[entityCopy.name] = entityCopy

        copyItems(entity.name, entityCopy.name, nrColonists)

    end

    for _,entity in pairs(newEntities) do
        data:extend
        {
            entity
        }
    end

    for _,item in pairs(newItems) do
        data:extend
        {
            item
        }
    end

    for _,recipy in pairs(newRecipies) do
        data:extend
        {
            recipy
        }
    end

end

copyTurrets("ammo-turret",      1, 1.5, 1.1)
copyTurrets("electric-turret",  1, 1.5, 1.1)
copyTurrets("fluid-turret",     1, 1.5, 1.1)

copyTurrets("artillery-turret", 4, 1.5, 1.1)
