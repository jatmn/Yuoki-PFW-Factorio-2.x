-- Both providers are required in info.json and load before PFW.
assert(mods["Yuoki"] and mods["yi_engines"], "PFW requires Yuoki and yi_engines")
local node = assert(data.raw["assembling-machine"]["ye_trade_node"],
  "PFW requires yi_engines Trade Node ye_trade_node")
-- Preserve the parent's existing categories, graphics and operating statistics.
for _, category in ipairs(node.crafting_categories) do
  if category == "yrcat-retrade" then return end
end
table.insert(node.crafting_categories, "yrcat-retrade")
