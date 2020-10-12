require("prototypes.robotArmy.units")


local ra = data.raw["recipe"]["basic-marine"]

if ra ~= nil then

    for i,u in pairs(robotArmyUnits) do

        recipe = data.raw["recipe"][u[1]]
        table.insert(recipe.ingredients, { "colonist", u[2] } )

    end
end
