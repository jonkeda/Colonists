local util = require("prototypes/utils/tf_util")

local path = function(string)
  return util.path("prototypes/informatron/"..string)
end

informatron_make_image("welcome", path("transport_drones.png"), 960, 512)
informatron_make_image("housing", path("transport_drones.png"), 960, 512)
