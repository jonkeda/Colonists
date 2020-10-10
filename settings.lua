local settings =
{
  {
    type = "int-setting",
    name = "transport-vehicle-update-interval",
    localised_name = "Transport vehicle update interval",
    setting_type = "runtime-global",
    default_value = 60,
    minimum_value = 1,
    maximum_value = 80085
  },
  
  
}

data:extend(settings)