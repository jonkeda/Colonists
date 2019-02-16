data:extend({

    {
        type = "item-subgroup",
        name = "colonists-fluids",
        group = "colonists",
        order = "f"
    },

    -- waste
    {
        type = "fluid",
        name = "waste",
        subgroup = "colonists-fluids",
        default_temperature = 25,
        heat_capacity = "0.0KJ",
        base_color = {r=0.5, g=0.04, b=0},
        flow_color = {r=0.85, g=0.6, b=0.3},
        max_temperature = 100,
        icon = "__Colonists__/graphics/icons/fluid/oxygen.png",
        icon_size = 32,
        pressure_to_speed_ratio = 0.4,
        flow_to_energy_ratio = 0.59,
        order = "a[fluid]-x[waste]"
    },

})