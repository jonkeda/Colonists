local util = require("prototypes/utils/tf_util")

bobmods.lib.recipe.replace_ingredient_in_all("ta_clone", "colonist")

util.prototype.remove_recipe_from_technologies("ta_clone")
util.prototype.remove_recipe_from_technologies("ta-cloning-machine")