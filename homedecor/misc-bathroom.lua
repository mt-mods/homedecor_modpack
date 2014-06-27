minetest.register_node("homedecor:tiles_1", {
	description = "Bathroom/kitchen tiles (shade #1)",
	tiles = {
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png^[transformR90",
		"homedecor_tiles1.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_2", {
	description = "Bathroom/kitchen tiles (shade #2)",
	tiles = {
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png^[transformR90",
		"homedecor_tiles2.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_3", {
	description = "Bathroom/kitchen tiles (shade #3)",
	tiles = {
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png^[transformR90",
		"homedecor_tiles3.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_4", {
	description = "Bathroom/kitchen tiles (shade #4)",
	tiles = {
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png^[transformR90",
		"homedecor_tiles4.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:towel_rod", {
	description = "Towel rod with towel",
	drawtype = "nodebox",
	tiles = {
		"homedecor_towel_rod_top.png",
		"homedecor_towel_rod_bottom.png",
		"homedecor_towel_rod_sides.png",
		"homedecor_towel_rod_sides.png^[transformFX",
		"homedecor_towel_rod_fb.png",
		"homedecor_towel_rod_fb.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0.1875, 0.25, -0.3125, 0.375, 0.5},
			{ 0.3125, 0.1875, 0.25, 0.375, 0.375, 0.5},
			{-0.3125, 0.25, 0.3125, 0.3125, 0.375, 0.375},
			{-0.3125, 0, 0.375, 0.3125, 0.34375, 0.4375},
			{-0.3125, -0.3125, 0.25, 0.3125, 0.34375, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.375, -0.3125, 0.25, 0.375, 0.375, 0.5 }
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_defaults(),
})

