--name,              energy, fullness, effect,      category,       result,             technology,       folder,     iconsize            research  
--     1                2       3       4               5              6                    7              8             9,                  10
local foods = {
    {"apple", 			2, 	    30, 	-20,    "colonist-food-1", "compost",               nil,          "foods",        64,   "automation-science-pack"},
    {"orange", 			2, 	    30, 	-20,    "colonist-food-1", "compost",               nil,          "foods",        64,   "automation-science-pack"},
    {"corn", 			10, 	30, 	-20,    "colonist-food-1", "compost",               nil,          "items",        32,   "automation-science-pack"},
    {"cucumber", 		8, 		20, 	-20,    "colonist-food-1", "compost",               nil,          "items",        32,   "automation-science-pack"},
    {"tomato", 		    4, 		10, 	-15,    "colonist-food-1", "compost",               nil,          "items",        32,   "automation-science-pack"},
    {"lettuce", 		3, 		8, 		-10,    "colonist-food-1", "compost",               nil,          "items",        32,   "automation-science-pack"},

    {"cooked-corn", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64,   "logistic-science-pack"},
    {"whole-wheat-cookie", 	15, 40, 	-40,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64,   "logistic-science-pack"},
    {"apple-peeled", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64,   "logistic-science-pack"},
    {"orange-peeled", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64,   "logistic-science-pack"},
    {"bread", 		    25, 	65, 	-30,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64,   "logistic-science-pack"},
    {"corn-bread", 		25, 	65, 	-30,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64,   "logistic-science-pack"},
    {"popcorn", 		4, 		9, 		-10,    "colonist-food-1", "colonists-waste",     "frying",       "foods",        64,   "logistic-science-pack"},
    {"basic-salad", 	25, 	40, 	-100,   "colonist-food-1", "colonists-waste",     "salad",        "foods",        64,   "logistic-science-pack"},
    {"cooked-soy", 		2,		5, 		-5,     "colonist-food-2", "colonists-waste",     "cooking",      "foods",        64,   "chemical-science-pack"},
    {"baked-potato", 	10, 	30, 	-40,    "colonist-food-2", "colonists-waste",     "cooking",      "foods",        64,   "chemical-science-pack"},
    {"fries", 			20, 	55, 	-50,    "colonist-food-2", "colonists-waste",     "frying",       "foods",        64,   "chemical-science-pack"},
    {"ketchup-fries", 	25, 	70, 	-50,    "colonist-food-2", "colonists-waste",     "seasoning",    "foods",        64,   "chemical-science-pack"},
    {"pickles", 	    25, 	70, 	-50,    "colonist-food-2", "colonists-waste",     "seasoning",    "foods",        64,   "chemical-science-pack"},
    {"best-salad", 		45, 	70, 	-200,   "colonist-food-3", "colonists-waste",     "seasoning",    "foods",        64,   "utility-science-pack"},
    {"tofu", 			25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64,   "chemical-science-pack"},
    {"tofu-pizza", 		25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64,   "chemical-science-pack"},
    {"tofu-burger", 	25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64,   "chemical-science-pack"},

    {"cooked-fish-meat",2,		5, 		-5,     "colonist-food-2", "colonists-waste",     "cooking",       "foods",        64,   "chemical-science-pack"},

    {"fish-salad", 		45, 	70, 	-200,   "colonist-food-3", "colonists-waste",     "seasoning",     "foods",        64,   "utility-science-pack"},
    {"fish-steak", 		30, 	70, 	30,     "colonist-food-2", "colonists-waste",     "frying",        "foods",        64,   "chemical-science-pack"},
    {"fish-and-chips", 	75, 	100, 	-200,   "colonist-food-3", "colonists-waste",     "frying",        "foods",        64,   "utility-science-pack"},
    {"fish-pizza", 		65, 	95, 	-80,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64,   "utility-science-pack"},
    {"fish-burger", 	60, 	100, 	-80,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64,   "utility-science-pack"},

    {"cooked-biter-meat",20, 	60, 	50,     "colonist-food-3", "colonists-waste",     "cooking",      "foods",        64,   "utility-science-pack"},
    {"biter-steak", 	30, 	70, 	30,     "colonist-food-2", "colonists-waste",     "frying",       "foods",        64,   "chemical-science-pack"},
    {"schnitzel", 		35, 	80, 	40,     "colonist-food-2", "colonists-waste",     "frying",       "foods",        64,   "chemical-science-pack"},

    {"pizza", 			70, 	95, 	-60,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64,   "utility-science-pack"},
    {"burger", 			75, 	100, 	-60,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64,   "utility-science-pack"},
}

local fi = data.raw["item-group"]["food-industry"]

local fiV2 = data.raw["capsule"]["orange"]


-- Food
for i,f in pairs(foods) do

    local food = f[1]

    local modPath
    if fi ~= nil and (food ~= "apple" or fiV2 ~= nil) then
        modPath = "__FoodIndustry__"
    else
        modPath = "__Colonists__"
    end

    if data.raw["capsule"][food] ~= nil then
        local folder
        if fiV2 ~= nil then
            folder = f[8]
        else
            folder = "items"
        end

        if f[6] == "compost" then
            data:extend({
            {
                type = "recipe",
                name = f[1].."-waste",
                localised_name = {"description.eat_food", {"item-name." .. f[1]}},
                icon = modPath.."/graphics/icons/"..folder.."/"..f[1]..".png",
                icon_size = f[9],
                category = f[5],
                subgroup = "colonists-fluids",
                energy_required = 10,
                ingredients =
                {
                    {f[1], 1},
                },
                results = {{type="item", name="compost", amount=f[2]} },
                enabled = true,
                main_product = "",
                hide_from_player_crafting = true
            },
            })
        else
            data:extend({
            {
                type = "recipe",
                name = f[1].."-waste",
                localised_name = {"description.eat_food", {"item-name." .. f[1]}},
                icon = modPath.."/graphics/icons/"..folder.."/"..f[1]..".png",
                icon_size = f[9],
                category = f[5],
                subgroup = "colonists-fluids",
                energy_required = 10,
                ingredients =
                {
                    {f[1], 1},
                },
                results = {{type="fluid", name="colonists-waste", amount=f[2]}},
                enabled = false,
                main_product = "",
                hide_from_player_crafting = true
            },
            })
            local tech = f[7]
            if tech ~= nil then
                local t = data.raw["technology"][tech]["effects"]
                table.insert(t, {type = "unlock-recipe", recipe = f[1].."-waste"})
            end
        end

        data:extend({
        {
            type = "recipe",
            name = f[1].."-research",
            localised_name = {"description.research_food", {"item-name." .. f[1]}},
            icon = modPath.."/graphics/icons/"..folder.."/"..f[1]..".png",
            icon_size = f[9],
            category = "colonists-research-1",
            subgroup = "colonists-fluids",
            energy_required = 10,
            ingredients =
            {
                {f[1], 4},
            },
            result = f[10],
            enabled = f[6] == "compost",
            main_product = "",
            hide_from_player_crafting = f[6] ~= "compost"
        },
        })
        local tech = f[7]
        if tech ~= nil then
            local t = data.raw["technology"][tech]["effects"]
            table.insert(t, {type = "unlock-recipe", recipe = f[1].."-research"})
        end

    end
end