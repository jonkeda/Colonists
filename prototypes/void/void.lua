data:extend({

    -- void recipe-category
    {
        type = "recipe-category",
        name = "void-fluid"
    },

    {
        type = "recipe-category",
        name = "void-air"
    },

    {
        type = "item-subgroup",
        name = "void",
        group = "void",
        order = "a-a",
    },

    -- void
    {
        type = "item",
        name = "void",
        icon = "__Colonists__/graphics/icons/fluid/oxygen.png",
        icon_size = 32,
        flags = {"hidden"},
        subgroup="colonists-waste",
        --subgroup = "void",
        order = "void",
        stack_size = 100
    },

    -- heat item
    {
        type = "item",
        name = "heat",
        icon = "__Colonists__/graphics/icons/housing/houseWarm.png",
        icon_size = 32,
        flags = {"hidden"},
        subgroup="colonists-waste",
        --subgroup = "void",
        order = "heat",
        stack_size = 100
    },

    -- heat item
    {
        type = "item",
        name = "cold",
        icon = "__Colonists__/graphics/icons/housing/houseCold.png",
        icon_size = 32,
        flags = {"hidden"},
        subgroup="colonists-waste",
        --subgroup = "void",
        order = "cold",
        stack_size = 100
    },

    -- Gasses
    {
        type = "recipe",
        name = "free-air",
        category = "void-air",
        subgroup="colonists-waste",
        energy_required = 100,
        ingredients =
        {
        },
        results=
        {
            { type="item", name="heat", amount=1, probability=0 },
        },
        enabled = true,
    },})