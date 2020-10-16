-- -- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- -- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- -- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- /c game.player.force.research_all_technologies()
-- /c game.player.cheat_mode=true

local handler = require("event_handler")

handler.add_lib(require("prototypes/vehicle_script"))
handler.add_lib(require("prototypes/housing/housing_script"))
handler.add_lib(require("prototypes/engineering/workshops_script"))

script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	if not player.character == nil then
		on_player_creation(player)
	end
end)

-- fires on the end of the cutscene (singleplayer)
script.on_event(defines.events.on_cutscene_cancelled, function(event)
	local player = game.players[event.player_index]
	on_player_creation(player)
end)


function on_player_creation(player)
    -- player.force.research_all_technologies()
    -- player.cheat_mode=true
 
    -- Remove standard items
    local playerInventory = player.get_main_inventory()
    playerInventory.remove({name="iron-plate", count=8})
    playerInventory.remove({name="burner-mining-drill", count=1})
    playerInventory.remove({name="stone-furnace", count=1})
    playerInventory.remove({name="wood", count=1})

    player.insert{name = "colonist", count = 12}
    player.insert{name = "colonists-housing-1", count = 1}
    player.insert{name = "apple", count = 24}
    player.insert{name = "colonists-mining-drill", count = 2}
    player.insert{name = "colonists-heat-generator", count = 1}
    player.insert{name = "coal", count = 5}
    player.insert{name = "stone-furnace", count = 2}
    -- player.insert{name = "pistol", count = 1}
    -- player.insert{name = "firearm-magazine", count = 5}
end

script.on_event(defines.events.on_player_created, OnPlayerCreated)

require("prototypes/scripts/remote_interface")
