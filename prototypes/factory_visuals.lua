-- Shared neutral machinery; each factory supplies palette, right assembly and timing.
-- Change docs/data/factory-palettes.json and run docs/tools/build_shared_factories.py
-- to keep the generated palette table and inventory icons synchronized.
local palettes = require("prototypes.factory-palettes")

return function(name)
  local palette = assert(palettes[name], "Unknown factory palette: " .. name)
  local layers = {}
  local function add(file, width, height, x, y, animated, tint, shadow)
    local layer = {
      filename = "__yi_pfw__/graphics/entity/" .. file .. ".png",
      width = width, height = height, scale = 0.5,
      shift = {0.5 + (x + width / 2 - 128) / 64, (y + height / 2 - 128) / 64},
      animation_speed = palette.speed,
      frame_count = animated and 16 or 1,
    }
    if animated then layer.line_length = 16 else layer.repeat_count = 16 end
    if tint then layer.tint = tint end
    if shadow then layer.draw_as_shadow = true end
    layers[#layers + 1] = layer
  end
  local component = name == "comp"
  add("factory-" .. name .. "-right", 92, component and 256 or 216, 112, component and 0 or 16, component)
  add("factory-left-base", 110, 216, 2, 16)
  for _, material in ipairs({"trim", "rings", "panels"}) do
    add("factory-left-" .. material, 110, 216, 2, 16, false, palette[material])
  end
  for _, rotor in ipairs({
    {"upper", 54, 48, 43, 61}, {"front", 67, 65, 36, 171}, {"rear", 64, 55, 41, 15},
  }) do
    add("factory-left-" .. rotor[1] .. "-cutouts", rotor[2], rotor[3], rotor[4], rotor[5], true)
    add("factory-left-" .. rotor[1] .. "-lights", rotor[2], rotor[3], rotor[4], rotor[5], true, palette.lights)
  end
  if palette.opening_glow then
    add("factory-left-opening-glow", 54, 110, 45, 28, true, palette.opening_glow)
  end
  add("fab-" .. name .. "-shadow", 256, 256, 0, 0, component, nil, true)
  return {layers = layers}
end
