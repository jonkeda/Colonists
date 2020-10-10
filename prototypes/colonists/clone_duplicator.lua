
data:extend({
    {
        type = "assembling-machine",
        name = "colonists-clone-duplicator",
        fixed_recipe = "colonist-clone",
        icon = "__Colonists__/graphics/icons/colonists/clone-duplicator.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "colonists-clone-duplicator"},
        max_health = 100,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.2}, {0.6, 1.2}},
        selection_box = {{-1.65, -1.65}, {0.75, 1.75}},
        pictures =
        {
            filename = "__Colonists__/graphics/entity/clone-duplicator/clone-duplicator.png",
            priority = "low",
            width = 160,
            height = 128,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
        },
        animation =
        {
            layers =
            {
                {
                    width = 160,
                    height = 128,
                    frame_count = 1,
                    direction_count = 1,
                    shift = {0.3, 0},
                    animation_speed = 5,
                    max_advance = 1,
                    scale = 0.75,
                    priority = "extra-high",
                    filename = "__Colonists__/graphics/entity/clone-duplicator/clone-duplicator.png",
                },
            }
        },
        crafting_categories = {"colonists-clone-duplicator"},
        crafting_speed = 5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.05 / 1.5
        },
        energy_usage = "1kW",
        ingredient_count = 4,
        -- open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        -- close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/lab.ogg",
                volume = 0.7
            },
            apparent_volume = 1
        }
    },

    {
        type = "item-with-entity-data",
        name = "colonists-clone-duplicator",
        icon = "__Colonists__/graphics/icons/colonists/clone-duplicator.png",
        icon_size = 32,
        subgroup = "colonists-buildings",
        order = "a[clone-duplicator]",
        stack_size = 50,
        place_result = "colonists-clone-duplicator",
    },
    {
        type = "recipe-category",
        name = "colonists-clone-duplicator"
    },

    {
        type = "recipe",
        name = "colonists-clone-duplicator",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {type="item", name="wood", amount=100},
                {type="item", name="iron-plate", amount=100},
            },
            results= { {type="item", name="colonists-clone-duplicator", amount=1} },
        }
    },

    {
        type = "recipe",
        name = "colonist-clone",
        category = "colonists-clone-duplicator",
        icon = "__Colonists__/graphics/icons/colonist.png",
        icon_size = 32,
        energy_required = 5,
        enabled = true,
        ingredients = {
            {type="item", name="wood", amount=100},
            {type="item", name="iron-plate", amount=100},
        },
        results= { {type="item", name="colonist", amount=1} },
        hide_from_player_crafting = true

    },

    {
        type = "technology",
        name = "colonists-clone-duplicator",
        icon = "__Colonists__/graphics/entity/clone-duplicator/clone-duplicator.png",
        icon_size = 64,
        order = "c-m-a",
        --prerequisites = {"colonial-agriculture"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "colonists-clone-duplicator",
            },
            {
                type = "unlock-recipe",
                recipe = "colonist-clone",
            },
        },
        unit = {
            count = 20,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            },
            time = 10
        },
    },
})