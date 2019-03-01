-- https://forums.factorio.com/viewtopic.php?t=22132

local function colonist_autoplace_settings(multiplier, order_suffix, rectangle)
    local peak =
    {
        noise_layer = "colonist",
        noise_octaves_difference = -2,
        noise_persistence = 0.9
    }

    if rectangle ~= nil then
        local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
        local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
        local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
        local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

        peak["aux_optimal"] = aux_center
        peak["aux_range"] = aux_range
        peak["aux_max_range"] = water_range + 0.05

        peak["water_optimal"] = water_center
        peak["water_range"] = water_range
        peak["water_max_range"] = water_range + 0.05
    end

    return {
        order = "a[doodad]-a[rock]-" .. order_suffix,
        coverage = multiplier * 0.01,
        sharpness = 0.7,
        max_probability = multiplier * 0.7,
        peaks = { peak }
    }
end


data:extend(
    {
        {
            type = "autoplace-control",
            name = "colonist",
            category="resource",
            richness = true,
            order = "b-e"
        },
        {
            type = "noise-layer",
            name = "colonist"
        },
        {
            type = "simple-entity",
            name = "colonist",
            icon = "__Colonists__/graphics/icons/colonist.png",
            icon_size=32,
            flags = {"placeable-neutral"},
            order="a-b-a",
            map_color = {r=0.26, g=0.30, b=0.39},
            minimum=0,
            normal=1,
            categories="basic-solid",
            minable =
            {
                hardness = 0.5,
                --mining_particle = "colonist",
                mining_time = 1.5,
                results = {{name = "colonist", amount_min = 1, amount_max = 1}},
            },
            loot =
            {
                {item = "stone", probability = 1, count_min = 1, count_max = 1}
            },
            collision_box = {{ -0.5, -0.5}, {0.5, 0.5}},
            selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
            mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
            vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
            render_layer = "object",
            max_health = 500,
--            colonist_autoplace_settings(0.125, "a[h]", {{0, 0.65}, {1, 1}}),
            autoplace =
            {
                control = "colonist",
                sharpness = 1,
                richness_multiplier = 0,
                richness_base = 2,
                size_control_multiplier = 0.006,
                peaks = {
--                    {
--                        influence = 0.3,
--                        starting_area_weight_optimal = 0,
--                        starting_area_weight_range = 0,
--                        starting_area_weight_max_range = 1,
--                    },
                    {
                        influence = 0.30,
                        min_influence = 0.25,
                        max_influence = 0.5,
                        noise_layer = "colonist",
                        noise_octaves_difference = -2,
                        noise_persistence = 0.9,
                        starting_area_weight_optimal = 1,
                        starting_area_weight_range = 1,
                        starting_area_weight_max_range = 1,
                    },
                },
            },
            stage_counts = {1},
            picture =
            {
                filename = "__Colonists__/graphics/icons/colonist.png",
                priority = "extra-high",
                width = 32,
                height = 32,
                frame_count = 1,
                variation_count = 1
            }
--            stages =
--            {
--                sheet =
--                {
--                    filename = "__Colonists__/graphics/icons/colonist.png",
--                    priority = "extra-high",
--                    width = 32,
--                    height = 32,
--                    frame_count = 1,
--                    variation_count = 1
--                }
--            },
        },
        --        {
        --            type = "item",
        --            name = "angels-ore1",
        --            icon = "__angelsrefining__/graphics/icons/angels-ore1.png",
        --
        --            subgroup = "angels-ores",
        --            order = "a[angels-ore1]",
        --            stack_size = 200
        --        },
    }
)
