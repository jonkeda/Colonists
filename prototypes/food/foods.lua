--name,              energy, fullness, effect,      category,       result,   technology,       folder,     iconsize  
--     1                2       3       4               5              6           7              8             9
local foods = {
    {"apple", 			2, 	    30, 	-20,    "colonist-food-1", "compost",   nil,            "foods",        64},
    {"orange", 			2, 	    30, 	-20,    "colonist-food-1", "compost",   nil,            "foods",        64},
    {"corn", 			10, 	30, 	-20,    "colonist-food-1", "compost",   nil,            "items",        32},
    {"cucumber", 		8, 		20, 	-20,    "colonist-food-1", "compost",   nil,            "items",        32},
    {"tomato", 		    4, 		10, 	-15,    "colonist-food-1", "compost",   nil,            "items",        32},
    {"lettuce", 		3, 		8, 		-10,    "colonist-food-1", "compost",   nil,            "items",        32},

    {"cooked-corn", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64},
    {"whole-wheat-cookie", 	15, 40, 	-40,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64},
    {"apple-peeled", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64},
    {"orange-peeled", 	15, 	40, 	-40,    "colonist-food-1", "colonists-waste",     "cooking",      "foods",        64},
    {"bread", 		    25, 	65, 	-30,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64},
    {"corn-bread", 		25, 	65, 	-30,    "colonist-food-1", "colonists-waste",     "flour",        "foods",        64},
    {"popcorn", 		4, 		9, 		-10,    "colonist-food-1", "colonists-waste",     "frying",       "foods",        64},
    {"basic-salad", 	25, 	40, 	-100,   "colonist-food-1", "colonists-waste",     "salad",        "foods",        64},
    {"cooked-soy", 		2,		5, 		-5,     "colonist-food-2", "colonists-waste",     "cooking",      "foods",        64},
    {"baked-potato", 	10, 	30, 	-40,    "colonist-food-2", "colonists-waste",     "cooking",      "foods",        64},
    {"fries", 			20, 	55, 	-50,    "colonist-food-2", "colonists-waste",     "frying",       "foods",        64},
    {"ketchup-fries", 	25, 	70, 	-50,    "colonist-food-2", "colonists-waste",     "seasoning",    "foods",        64},
    {"pickles", 	    25, 	70, 	-50,    "colonist-food-2", "colonists-waste",     "seasoning",    "foods",        64},
    {"best-salad", 		45, 	70, 	-200,   "colonist-food-3", "colonists-waste",     "seasoning",    "foods",        64},
    {"tofu", 			25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64},
    {"tofu-pizza", 		25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64},
    {"tofu-burger", 	25, 	60, 	-15,    "colonist-food-2", "colonists-waste",     "fermentation", "foods",        64},

    {"cooked-fish-meat",2,		5, 		-5,     "colonist-food-2", "colonists-waste",     "cooking",       "foods",        64},

    {"fish-salad", 		45, 	70, 	-200,   "colonist-food-3", "colonists-waste",     "seasoning",     "foods",        64},
    {"fish-steak", 		30, 	70, 	30,     "colonist-food-2", "colonists-waste",     "frying",        "foods",        64},
    {"fish-and-chips", 	75, 	100, 	-200,   "colonist-food-3", "colonists-waste",     "frying",        "foods",        64},
    {"fish-pizza", 		65, 	95, 	-80,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64},
    {"fish-burger", 	60, 	100, 	-80,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64},

    {"cooked-biter-meat",20, 	60, 	50,     "colonist-food-3", "colonists-waste",     "cooking",      "foods",        64},
    {"biter-steak", 	30, 	70, 	30,     "colonist-food-2", "colonists-waste",     "frying",       "foods",        64},
    {"schnitzel", 		35, 	80, 	40,     "colonist-food-2", "colonists-waste",     "frying",       "foods",        64},

    {"pizza", 			70, 	95, 	-60,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64},
    {"burger", 			75, 	100, 	-60,    "colonist-food-3", "colonists-waste",     "complex-foods", "foods",        64},
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
    end
end