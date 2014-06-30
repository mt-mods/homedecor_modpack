-- ================ Alternaitve crafts that do not require the moreblocks mod

-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
-- 2012-06-12
--
-- Mostly my own code; overall template borrowed from game default
--
-- License: GPL
--

-- Zeno-, 2014-05-10, Modifications to remove moreblocks deps
-- VanessaE, 2014-06-18, rewritten slightly, some recipes changes, incorporated upstream.

local S = homedecor.gettext

-- ================ Additional crafts for replacing moreblocks requirements (Zeno)

minetest.register_craftitem("homedecor:power_crystal", {
	description = S("Power Crystal"),
	inventory_image = "homedecor_power_crystal.png",
})

minetest.register_craft({
	--type = "shapeless",
	output = "homedecor:power_crystal 2",
	recipe = {
		{ "default:mese_crystal_fragment", "default:torch", "default:mese_crystal_fragment" },
		{ "default:diamond", "default:gold_ingot", "default:diamond" }
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "homedecor:power_crystal",
	burntime = 50,
})

-- ================ Alternative crafts

minetest.register_craft( {
	output = "homedecor:television",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "default:glass", "homedecor:plastic_sheeting" },
		{ "homedecor:ic", "homedecor:power_crystal", "homedecor:ic" },
	},
})

minetest.register_craft({
	output = "homedecor:oven",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:glass", "default:steel_ingot", },
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:microwave_oven 2",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:glass", "homedecor:ic", },
		{"default:steel_ingot", "default:copper_ingot", "homedecor:power_crystal", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_half_yellow 6",
	recipe = {
		{"default:glass", "homedecor:power_crystal", "default:glass", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_small_cube_yellow 16",
	recipe = {
		{"default:glass" },
		{"homedecor:power_crystal" },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_half_white 6",
	recipe = {
		{ "dye:white", "dye:white", "dye:white" },
		{ "default:glass", "homedecor:power_crystal", "default:glass", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_small_cube_white 8",
	recipe = {
		{ "dye:white" },
		{ "default:glass" },
		{ "homedecor:power_crystal" },
	}
})

