--name,              energy, fullness, effect,      category,       result,   technology,       folder
--     1                2       3       4               5              6           7              8
local foods = {
    {"apple", 			2, 	    30, 	-20,    "colonist-food-1", "compost",   nil,            "foods"},
    {"orange", 			2, 	    30, 	-20,    "colonist-food-1", "compost",   nil,            "foods"},
    {"corn", 			10, 	30, 	-20,    "colonist-food-1", "compost",   nil,            "items"},
    {"cucumber", 		8, 		20, 	-20,    "colonist-food-1", "compost",   nil,            "items"},
    {"tomato", 			4, 		10, 	-15,    "colonist-food-1", "compost",   nil,            "items"},
    {"lettuce", 		3, 		8, 		-10,    "colonist-food-1", "compost",   nil,            "items"},

    {"cooked-corn", 	15, 	40, 	-40,    "colonist-food-1", "waste",     "cooking",      "foods"},
    {"corn-bread", 		25, 	65, 	-30,    "colonist-food-1", "waste",     "flour",        "foods"},
    {"popcorn", 		4, 		9, 		-10,    "colonist-food-1", "waste",     "frying",       "foods"},
    {"basic-salad", 	25, 	40, 	-100,   "colonist-food-1", "waste",     "salad",        "foods"},

    {"cooked-soy", 		2,		5, 		-5,     "colonist-food-2", "waste",     "cooking",      "foods"},
    {"cooked-fish-meat",2,		5, 		-5,     "colonist-food-2", "waste",     "cooking",      "foods"},
    {"baked-potato", 	10, 	30, 	-40,    "colonist-food-2", "waste",     "cooking",      "foods"},
    {"fries", 			20, 	55, 	-50,    "colonist-food-2", "waste",     "frying",       "foods"},
    {"ketchup-fries", 	25, 	70, 	-50,    "colonist-food-2", "waste",     "seasoning",    "foods"},
    {"biter-steak", 	30, 	70, 	30,     "colonist-food-2", "waste",     "frying",       "foods"},
    {"fish-steak", 		30, 	70, 	30,     "colonist-food-2", "waste",     "frying",       "foods"},
    {"schnitzel", 		35, 	80, 	40,     "colonist-food-2", "waste",     "frying",       "foods"},
    {"tofu", 			25, 	60, 	-15,    "colonist-food-2", "waste",     "fermentation", "foods"},

    {"pizza", 			70, 	95, 	-60,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"burger", 			75, 	100, 	-60,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"tofu-pizza", 		65, 	95, 	-80,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"tofu-burger", 	60, 	100, 	-80,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"fish-pizza", 		65, 	95, 	-80,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"fish-burger", 	60, 	100, 	-80,    "colonist-food-3", "waste",     "complex-foods", "foods"},
    {"best-salad", 		45, 	70, 	-200,   "colonist-food-3", "waste",     "seasoning",     "foods"},
    {"fish-salad", 		45, 	70, 	-200,   "colonist-food-3", "waste",     "seasoning",     "foods"},
    {"fish-and-chips", 	75, 	100, 	-200,   "colonist-food-3", "waste",     "frying",        "foods"},
    {"cooked-biter-meat",20, 	60, 	50,     "colonist-food-3", "waste",     "cooking",       "foods"}
}

local fi = data.raw["item-group"]["food-industry"]


-- Food
for i,f in pairs(foods) do

    local food = f[1]

    local modPath
    if fi ~= nil and food ~= "apple" then
        modPath = "__FoodIndustry__"
    else
        modPath = "__Colonists__"
    end

    if data.raw["capsule"][food] ~= nil then
        local folder = f[8]
        local folder = "items"
        if f[6] == "compost" then
            data:extend({
            {
                type = "recipe",
                name = f[1].."-waste",
                icon = modPath.."/graphics/icons/"..folder.."/"..f[1]..".png",
                icon_size = 32,
                category = f[5],
                subgroup = "colonists-fluids",
                energy_required = 10,
                ingredients =
                {
                    {f[1], 1},
                },
                results = {{type="item", name="compostwaste", amount=f[2]} },
                enabled = true,
                main_product = ""
            },
            })
        else
            data:extend({
            {
                type = "recipe",
                name = f[1].."-waste",
                icon = modPath.."/graphics/icons/"..folder.."/"..f[1]..".png",
                icon_size = 32,
                category = f[5],
                subgroup = "colonists-fluids",
                energy_required = 10,
                ingredients =
                {
                    {f[1], 1},
                },
                results = {{type="fluid", name="waste", amount=f[2]}},
                enabled = false,
                main_product = ""
            },
            })
            local tech = f[7]
            if tech ~= nil then
                local t = data.raw["technology"][tech]["effects"]
                table.insert(t, {type = "unlock-recipe", recipe = f[1].."-waste"})
            end
        end
end
end