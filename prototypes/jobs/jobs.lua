data:extend({

    -- Jobs recipe-category
    {
        type = "recipe-category",
        name = "colonists-job-basic"
    },
    {
        type = "recipe-category",
        name = "colonists-job-advanced"
    },
    {
        type = "recipe-category",
        name = "colonists-job-expert"
    },

    -- Jobs module
    -- https://www.iconexperience.com/o_collection/icons/?icon=scientist&color_style=orange_dark_grey
    -- manager
    {
        type = "module",
        name = "colonists-speed-module-1",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "speed",
        tier = 1,
        order = "a[speed]-a[speed-module-1]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.0}}
    },
    -- engineer
    {
        type = "module",
        name = "colonists-effectivity-module-1",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "effectivity",
        tier = 1,
        order = "a[effectivity]-a[effectivity-module-1]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { consumption = {bonus = -0.2}}
    },
    -- worker
    {
        type = "module",
        name = "colonists-productivity-module-1",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "productivity",
        tier = 1,
        order = "a[pollution]-a[productivity-module-1]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { productivity = {bonus = 0.04},}
    },
    -- environmentalist
    {
        type = "module",
        name = "colonists-pollution-module-1",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "pollution",
        tier = 1,
        order = "a[pollution]-a[pollution-module-1]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { pollution = {bonus = -0.05},}
    },

    -- manager
    {
        type = "module",
        name = "colonists-speed-module-2",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "speed",
        tier = 1,
        order = "a[speed]-a[speed-module-2]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.0}}
    },
    -- engineer
    {
        type = "module",
        name = "colonists-effectivity-module-2",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "effectivity",
        tier = 1,
        order = "a[effectivity]-a[effectivity-module-2]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { consumption = {bonus = -0.2}}
    },
    -- worker
    {
        type = "module",
        name = "colonists-productivity-module-2",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "productivity",
        tier = 1,
        order = "a[pollution]-a[productivity-module-2]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { productivity = {bonus = 0.04},}
    },
    -- environmentalist
    {
        type = "module",
        name = "colonists-pollution-module-2",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "pollution",
        tier = 1,
        order = "a[pollution]-a[pollution-module-2]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { pollution = {bonus = -0.05},}
    },

    -- manager
    {
        type = "module",
        name = "colonists-speed-module-3",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "speed",
        tier = 1,
        order = "a[speed]-a[speed-module-3]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.0}}
    },
    -- engineer
    {
        type = "module",
        name = "colonists-effectivity-module-3",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "effectivity",
        tier = 1,
        order = "a[effectivity]-a[effectivity-module-3]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { consumption = {bonus = -0.2}}
    },
    -- worker
    {
        type = "module",
        name = "colonists-productivity-module-3",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "productivity",
        tier = 1,
        order = "a[pollution]-a[productivity-module-3]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { productivity = {bonus = 0.04},}
    },
    -- environmentalist
    {
        type = "module",
        name = "colonists-pollution-module-3",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,

        subgroup = "colonists-colonist",
        category = "pollution",
        tier = 1,
        order = "a[pollution]-a[pollution-module-3]",
        stack_size = 5,
        default_request_amount = 1,
        effect = { pollution = {bonus = -0.05},}
    },

    -- Jobs recipe
    -- Jobs - basic
    {
        type = "recipe",
        category="colonists-job-basic",
        name = "colonists-speed-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonists-speed-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-basic",
        name = "colonists-effectivity-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonists-effectivity-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-basic",
        name = "colonists-productivity-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonists-productivity-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-basic",
        name = "colonists-pollution-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonists-pollution-module-1",
        enabled = false,
    },

    -- Jobs - advanced
    {
        type = "recipe",
        category="colonists-job-advanced",
        name = "colonists-speed-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonists-speed-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-advanced",
        name = "colonists-effectivity-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonists-effectivity-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-advanced",
        name = "colonists-productivity-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonists-productivity-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-advanced",
        name = "colonists-pollution-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonists-pollution-module-2",
        enabled = false,
    },

    -- Jobs - expert
    {
        type = "recipe",
        category="colonists-job-expert",
        name = "colonists-speed-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonists-speed-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-expert",
        name = "colonists-effectivity-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonists-effectivity-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-expert",
        name = "colonists-productivity-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonists-productivity-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonists-job-expert",
        name = "colonists-pollution-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonists-pollution-module-3",
        enabled = false,
    },

    -- technology

--    {
--        type = "technology",
--        name = "colonists-job-a",
--        icon = "__Colonists__/graphics/technology/colonists-charter.png",
--        icon_size = 128,
--        effects =
--        {
--            {type = "unlock-recipe", recipe = "colonists-training-1"},
--            {type = "unlock-recipe", recipe = "colonists-speed-module-1"},
--            {type = "unlock-recipe", recipe = "colonists-effectivity-module-1"},
--            {type = "unlock-recipe", recipe = "colonists-productivity-module-1"},
--            {type = "unlock-recipe", recipe = "colonists-pollution-module-1"},
--        },
--        unit =
--        {
--            time = 60,
--            count = 150,
--            ingredients =
--            {
--                {"science-pack-1", 1}
--            },
--        },
--        order = "w",
--    },
--    {
--        type = "technology",
--        name = "colonists-job-b",
--        icon = "__Colonists__/graphics/technology/colonists-charter.png",
--        icon_size = 128,
--        prerequisites =
--        {
--            "colonists-job-a"
--        },
--        effects =
--        {
--            {type = "unlock-recipe", recipe = "colonists-training-2"},
--            {type = "unlock-recipe", recipe = "colonists-speed-module-2"},
--            {type = "unlock-recipe", recipe = "colonists-effectivity-module-2"},
--            {type = "unlock-recipe", recipe = "colonists-productivity-module-2"},
--            {type = "unlock-recipe", recipe = "colonists-pollution-module-2"},
--        },
--        unit =
--        {
--            time = 60,
--            count = 150,
--            ingredients =
--            {
--                {"science-pack-1", 1},
--                {"science-pack-2", 1},
--            },
--        },
--        order = "w",
--    },
--    {
--        type = "technology",
--        name = "colonists-job-c",
--        icon = "__Colonists__/graphics/technology/colonists-charter.png",
--        icon_size = 128,
--        prerequisites =
--        {
--            "colonists-job-b"
--        },
--        effects =
--        {
--            {type = "unlock-recipe", recipe = "colonists-training-3"},
--            {type = "unlock-recipe", recipe = "colonists-speed-module-3"},
--            {type = "unlock-recipe", recipe = "colonists-effectivity-module-3"},
--            {type = "unlock-recipe", recipe = "colonists-productivity-module-3"},
--            {type = "unlock-recipe", recipe = "colonists-pollution-module-3"},
--        },
--        unit =
--        {
--            time = 60,
--            count = 150,
--            ingredients =
--            {
--                {"science-pack-1", 1},
--                {"science-pack-2", 1},
--                {"science-pack-3", 1},
--
--            },
--        },
--        order = "w",
--    },

})