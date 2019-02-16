data:extend({

    {
        type = "item-subgroup",
        name = "colonists-colonist",
        group = "colonists",
        order = "a"
    },

    -- colonist recipe-category
    {
        type = "recipe-category",
        name = "colonist"
    },

    -- colonists and their activities
    {
        type = "item",
        name = "colonist",
        icon = "__Colonists__/graphics/icons/colonist.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        order = "c[colonist]",
        subgroup = "colonists-colonist",
        stack_size = 12
    },
})