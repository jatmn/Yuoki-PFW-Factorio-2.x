data:extend(
{
	-- Energy ammunition now belongs to Yuoki; retain the former category as inactive source.
	-- Parent owner: Yuoki, ammo-category plasma. Preserved inactive PFW definition.
	--[=[
	{ type = "ammo-category", name = "yi-pfw-energy" },
	]=]

	{	type = "item-group", name = "yi_special", --[[Legacy field: inventory_order = "yis",]] icon = "__yi_pfw__/graphics/mpfw_ticon2.png", icon_size = 128, order = "yi-s", },

	{	type = "item-subgroup",	name = "yi-basic", group = "yi_special", order = "0" },		-- start/basic rezepte
	{	type = "item-subgroup",	name = "yi-muntion", group = "yi_special", order = "a" },	-- fab 1 
	{	type = "item-subgroup",	name = "yi-handwaffen", group = "yi_special", order = "b" },-- fab 2
	{	type = "item-subgroup",	name = "yi-cyborgs", group = "yi_special", order = "c" },	-- fab 3
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-swwaffen", group = "yi_special", order = "d" },	-- fab 4
	{	type = "item-subgroup",	name = "yi-fahrzeuge", group = "yi_special", order = "e" },	-- fab 5
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-panzer", group = "yi_special", order = "f" },	-- fab 6
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-support", group = "yi_special", order = "g" },	-- fab 7
	{	type = "item-subgroup",	name = "yi-material", group = "yi_special", order = "h" },	-- fab 8
	{	type = "item-subgroup",	name = "yi-component", group = "yi_special", order = "i" },	-- zmaterial
	
	{	type = "item-subgroup",	name = "yi-imports", group = "yi_special", order = "k" },
	{	type = "item-subgroup",	name = "yi-retrade", group = "yuoki-atomics", order = "j" },
	{	type = "item-subgroup",	name = "yi-retrade1", group = "yuoki-atomics", order = "j1" },
	{	type = "item-subgroup",	name = "yi-retrade2", group = "yuoki-atomics", order = "j2" },	
	{	type = "item-subgroup",	name = "yi-retrade3", group = "yuoki-atomics", order = "j3" },
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-retrade4", group = "yuoki-atomics", order = "j4" },
	{	type = "item-subgroup",	name = "yi-retrade5", group = "yuoki-atomics", order = "j5" },
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-retrade6", group = "yuoki-atomics", order = "j6" },
	-- Unused category/subgroup of a preserved inactive factory.
	--{	type = "item-subgroup",	name = "yi-retrade7", group = "yuoki-atomics", order = "j7" },
	{	type = "item-subgroup",	name = "yi-retrade8", group = "yuoki-atomics", order = "j8" },	
	{	type = "item-subgroup",	name = "yi-retrade9", group = "yuoki-atomics", order = "j9" },	
	
	{ 	type = "recipe-category", name = "yrcat-munition" },	-- Projektil, Batterien, Granaten, Chemische
	{ 	type = "recipe-category", name = "yrcat-handwaffen" },	-- Gewehre, Granatwerfer
	{ 	type = "recipe-category", name = "yrcat-cyborgs" },		-- Cyborg-Modelle
	-- Unused category/subgroup of a preserved inactive factory.
	--{ 	type = "recipe-category", name = "yrcat-swwaffen" },	-- Kanonen, Luftabwehr
	{ 	type = "recipe-category", name = "yrcat-fahrzeuge" },	-- Rad-Fahrzeuge
	-- Unused category/subgroup of a preserved inactive factory.
	--{ 	type = "recipe-category", name = "yrcat-panzer" },		-- Panzer
	-- Unused category/subgroup of a preserved inactive factory.
	--{ 	type = "recipe-category", name = "yrcat-support" },		-- Transporter, Mobile Befestigungen
	{ 	type = "recipe-category", name = "yrcat-material" },	-- Ausrüstung, Ziefernrohre, Panzerungen	
	{ 	type = "recipe-category", name = "yrcat-component" },	-- Komponenten
	
	{ 	type = "recipe-category", name = "yrcat-retrade" },		-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	--{ 	type = "recipe-category", name = "yrcat-retrade" },	-- für retrader-knoten
	
})