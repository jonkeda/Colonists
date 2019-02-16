data:extend({

    -- Jobs recipe-category
    {
        type = "recipe-category",
        name = "colonist-job-basic"
    },
    {
        type = "recipe-category",
        name = "colonist-job-advanced"
    },
    {
        type = "recipe-category",
        name = "colonist-job-expert"
    },

    -- Jobs module
    -- https://www.iconexperience.com/o_collection/icons/?icon=scientist&color_style=orange_dark_grey
    -- manager
    {
        type = "module",
        name = "colonist-speed-module-1",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-effectivity-module-1",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-productivity-module-1",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-pollution-module-1",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-speed-module-2",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-effectivity-module-2",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-productivity-module-2",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-pollution-module-2",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-speed-module-3",
        icon = "__Colonists__/graphics/icons/speedworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-effectivity-module-3",
        icon = "__Colonists__/graphics/icons/effectivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-productivity-module-3",
        icon = "__Colonists__/graphics/icons/productivityworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        name = "colonist-pollution-module-3",
        icon = "__Colonists__/graphics/icons/pollutionworker.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
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
        category="colonist-job-basic",
        name = "colonist-speed-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonist-speed-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-basic",
        name = "colonist-effectivity-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonist-effectivity-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-basic",
        name = "colonist-productivity-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonist-productivity-module-1",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-basic",
        name = "colonist-pollution-module-1",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 4},
        },
        result = "colonist-pollution-module-1",
        enabled = false,
    },

    -- Jobs - advanced
    {
        type = "recipe",
        category="colonist-job-advanced",
        name = "colonist-speed-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonist-speed-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-advanced",
        name = "colonist-effectivity-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonist-effectivity-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-advanced",
        name = "colonist-productivity-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonist-productivity-module-2",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-advanced",
        name = "colonist-pollution-module-2",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 8},
        },
        result = "colonist-pollution-module-2",
        enabled = false,
    },

    -- Jobs - expert
    {
        type = "recipe",
        category="colonist-job-expert",
        name = "colonist-speed-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonist-speed-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-expert",
        name = "colonist-effectivity-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonist-effectivity-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-expert",
        name = "colonist-productivity-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonist-productivity-module-3",
        enabled = false,
    },
    {
        type = "recipe",
        category="colonist-job-expert",
        name = "colonist-pollution-module-3",
        energy_required = 10,
        ingredients =
        {
            {"colonist", 12},
        },
        result = "colonist-pollution-module-3",
        enabled = false,
    },

    -- technology

    {
        type = "technology",
        name = "colonist-job-a",
        icon = "__Colonists__/graphics/technology/colonists-charter.png",
        icon_size = 128,
        effects =
        {
            {type = "unlock-recipe", recipe = "colonists-training-1"},
            {type = "unlock-recipe", recipe = "colonist-speed-module-1"},
            {type = "unlock-recipe", recipe = "colonist-effectivity-module-1"},
            {type = "unlock-recipe", recipe = "colonist-productivity-module-1"},
            {type = "unlock-recipe", recipe = "colonist-pollution-module-1"},
        },
        unit =
        {
            time = 60,
            count = 150,
            ingredients =
            {
                {"science-pack-1", 1}
            },
        },
        order = "w",
    },
    {
        type = "technology",
        name = "colonist-job-b",
        icon = "__Colonists__/graphics/technology/colonists-charter.png",
        icon_size = 128,
        prerequisites =
        {
            "colonist-job-a"
        },
        effects =
        {
            {type = "unlock-recipe", recipe = "colonists-training-2"},
            {type = "unlock-recipe", recipe = "colonist-speed-module-2"},
            {type = "unlock-recipe", recipe = "colonist-effectivity-module-2"},
            {type = "unlock-recipe", recipe = "colonist-productivity-module-2"},
            {type = "unlock-recipe", recipe = "colonist-pollution-module-2"},
        },
        unit =
        {
            time = 60,
            count = 150,
            ingredients =
            {
                {"science-pack-1", 1},
                {"science-pack-2", 1},
            },
        },
        order = "w",
    },
    {
        type = "technology",
        name = "colonist-job-c",
        icon = "__Colonists__/graphics/technology/colonists-charter.png",
        icon_size = 128,
        prerequisites =
        {
            "colonist-job-b"
        },
        effects =
        {
            {type = "unlock-recipe", recipe = "colonists-training-3"},
            {type = "unlock-recipe", recipe = "colonist-speed-module-3"},
            {type = "unlock-recipe", recipe = "colonist-effectivity-module-3"},
            {type = "unlock-recipe", recipe = "colonist-productivity-module-3"},
            {type = "unlock-recipe", recipe = "colonist-pollution-module-3"},
        },
        unit =
        {
            time = 60,
            count = 150,
            ingredients =
            {
                {"science-pack-1", 1},
                {"science-pack-2", 1},
                {"science-pack-3", 1},

            },
        },
        order = "w",
    },

})