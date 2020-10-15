require("prototypes.food.foods_data")


data:extend({
    -- cold item
    {
        type = "item",
        name = "colonists-hungry",
        icon = "__Colonists__/graphics/icons/happiness/unhappyface.png",
        icon_size = 32,
        flags = {"hidden"},
        subgroup="colonists-products",
        --subgroup = "void",
        order = "hungry",
        stack_size = 100
    },

        -- food recipe-category
        {
            type = "recipe-category",
            name = "colonist-food-1"
        },

        {
            type = "recipe-category",
            name = "colonist-food-2"
        },
        {
            type = "recipe-category",
            name = "colonist-food-3"
        },
    
        {
            type = "item-subgroup",
            name = "colonists-buildings-food",
            group = "colonists",
            order = "d-b"
        },

        {
            type = "recipe-category",
            name = "colonists-research-1"
        },

}
)