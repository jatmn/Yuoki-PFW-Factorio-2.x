-- Build trade overlays after all PFW items, ammunition and guns are registered.
-- Yuoki owns the arrow artwork and composition; base icons follow their current owners.
require("__Yuoki__.lib.yi-tools")

local trades = {
  {"y-import1-recipe", "y-redcoil", "up"},
  {"y-import2-recipe", "y-grycoil", "up"},
  {"y-import3-recipe", "y-stuff-1", "up"},
  {"y-import4-recipe", "y-stuff-2", "up"},
  {"y-import5-recipe", "y-stuff-3", "up"},
  {"y-import6-recipe", "y-stuff-4", "up"},
  {"y-import7-recipe", "y-stuff-5", "up"},
  {"y-import8-recipe", "y-stuff-6", "up"},
  {"y-rfab1a-recipe", "y-mun-0", "down"},
  {"y-rfab1b-recipe", "y-mun-1", "down"},
  {"y-rfab1c-recipe", "yi_ammo_energie", "down"},
  {"y-rfab1d-recipe", "y-mun-3", "down"},
  {"y-rfab1e-recipe", "y-mun-4", "down"},
  {"y-rfab1f-recipe", "y-mun-5", "down"},
  {"y-rfab1g-recipe", "y-mun-6", "down"},
  {"y-rfab1h-recipe", "y-mun-7", "down"},
  {"y-rfab1i-recipe", "y-mun-8", "down"},
  {"y-rfab1k-recipe", "y-mun-9", "down"},
  {"y-rfab2a-recipe", "y-sm-0", "down"},
  {"y-rfab2b-recipe", "yi_lasergun", "down"},
  {"y-rfab2c-recipe", "yi_lasergun", "down"},
  {"y-rfab2d-recipe", "y-sm-3", "down"},
  {"y-rfab2e-recipe", "y-sm-4", "down"},
  {"y-rfab2f-recipe", "yi_minigun", "down"},
  {"y-rfab2g-recipe", "y-sm-6", "down"},
  {"y-rfab3a-recipe", "y-cyb-0", "down"},
  {"y-rfab3b-recipe", "y-cyb-1", "down"},
  {"y-rfab3c-recipe", "y-cyb-2", "down"},
  {"y-rfab3d-recipe", "y-cyb-3", "down"},
  {"y-rfab3e-recipe", "y-cyb-4", "down"},
  {"y-rfab3f-recipe", "y-cyb-5", "down"},
  {"y-rfab3g-recipe", "y-cyb-6", "down"},
  {"y-rfab3h-recipe", "y-cyb-7", "down"},
  {"y-rfab3i-recipe", "y-cyb-8", "down"},
  {"y-rfab3k-recipe", "y-cyb-9", "down"},
  {"y-rfab5d-recipe", "y-veh-3", "down"},
  {"y-rfab5e-recipe", "y-veh-4", "down"},
  {"y-rfab5f-recipe", "y-veh-5", "down"},
  {"y-rfab5g-recipe", "y-veh-6", "down"},
  {"y-rfab5i-recipe", "y-veh-8", "down"},
  {"y-rfab5k-recipe", "y-veh-9", "down"},
  {"y-rfab8b-recipe", "yi_equip_shield_a", "down"},
  {"y-rfab8c-recipe", "yi_equip_shield_b", "down"},
  {"y-rfab8d-recipe", "y-equ-3", "down"},
  {"y-rfab8e-recipe", "y-equ-4", "down"},
  {"y-rfab8f-recipe", "y-equ-5", "down"},
  {"y-rfab8g-recipe", "yi_equip_generator_a", "down"},
  {"y-rimp1-recipe", "y-redcoil", "down"},
  {"y-rimp2-recipe", "y-grycoil", "down"},
  {"y-rimp3-recipe", "y-stuff-1", "down"},
  {"y-rimp4-recipe", "y-stuff-2", "down"},
  {"y-rimp5-recipe", "y-stuff-3", "down"},
  {"y-rimp6-recipe", "y-stuff-4", "down"},
  {"y-rimp7-recipe", "y-stuff-5", "down"},
  {"y-rimp8-recipe", "y-stuff-6", "down"},
  {"y-rzproduct-8-recipe", "y-zproduct-8", "down"},
}

for _, trade in ipairs(trades) do
  local recipe = assert(data.raw.recipe[trade[1]], "PFW trade recipe missing: " .. trade[1])
  local build = trade[3] == "up" and yi.lib.recipe.atomics.item_up or yi.lib.recipe.atomics.item_down
  recipe.icons = assert(build(trade[2]), "PFW trade icon source missing: " .. trade[2])
  recipe.icon = nil
  recipe.icon_size = nil
end
