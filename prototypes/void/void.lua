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
        subgroup="colonists-products",
        --subgroup = "void",
        order = "void",
        stack_size = 100
    },

})