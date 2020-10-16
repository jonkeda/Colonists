--local shared = require("shared")
--local transport_technologies = require("script/transport_technologies")
local informatron = {}

informatron.menu_list = function(player_index)
 
  return
  {
    housing = 1,
  }

end

local doerhickers =
{
  housing = function(gui)
    gui.add{type = "label", caption = {"colonists.page_housing"}}
    gui.add{type="button", style="housing"}
  end,

}

informatron.page_content = function(page_name, player_index, element)
  if doerhickers[page_name] then
    doerhickers[page_name](element)
  end
end

return informatron