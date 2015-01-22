-- This file supplies refrigerators

local S = homedecor.gettext

-- nodebox models

local fridge_model_bottom = {
	type = "fixed",
	fixed = {
		{0, -0.4375, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.42, 0.5, 0.5, 0.5}, -- NodeBox2
		{-0.5, -0.4375, -0.4375, -0.0625, 0.5, 0.5}, -- NodeBox3
		{0, 0.25, -0.5, 0.0625, 0.3125, -0.4375}, -- NodeBox4
		{-0.125, 0.25, -0.5, -0.0625, 0.3125, -0.4375}, -- NodeBox5
		{0, 0.25, -0.5, 0.0625, 0.5, -0.473029}, -- NodeBox6
		{-0.125, 0.25, -0.5, -0.0625, 0.5, -0.473029}, -- NodeBox7
	}
}

local fridge_model_top = {
	type = "fixed",
	fixed = {
		{0, -0.5, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.0625, -0.5, -0.42, 0, 0.5, 0.5}, -- NodeBox2
		{-0.5, -0.5, -0.4375, -0.0625, -0.4375, 0.5}, -- NodeBox3
		{-0.5, -0.5, -0.4375, -0.4375, 0.5, 0.5}, -- NodeBox4
		{-0.5, -0.1875, -0.4375, -0.0625, 0.5, 0.5}, -- NodeBox5
		{-0.4375, -0.4375, -0.125, -0.0625, -0.1875, 0.5}, -- NodeBox6
		{-0.125, -0.4375, -0.4375, -0.0625, -0.1875, -0.125}, -- NodeBox7
		{-0.3125, -0.3125, -0.307054, -0.25, -0.1875, -0.286307}, -- NodeBox8
		{-0.125, 0, -0.5, -0.0625, 0.0625, -0.4375}, -- NodeBox9
		{0, 0, -0.5, 0.0625, 0.0625, -0.4375}, -- NodeBox10
		{0, -0.5, -0.5, 0.0625, 0.0625, -0.473029}, -- NodeBox11
		{-0.125, -0.5, -0.5, -0.0625, 0.0625, -0.473029}, -- NodeBox12
	}
}

-- steel-textured fridge
homedecor.register("refrigerator_steel_bottom", {
	tiles = {
		"default_steel_block.png",
		"homedecor_refrigerator_steel_bottom.png",
		"homedecor_refrigerator_steel_sides1.png",
		"homedecor_refrigerator_steel_sides1.png^[transformFX",
		"homedecor_refrigerator_steel_back1.png",
		"homedecor_refrigerator_steel_front2.png"
	},
	inventory_image = "homedecor_refrigerator_steel_inv.png",
	description = S("Refrigerator (stainless steel)"),
	groups = {snappy=3},
	node_box = fridge_model_bottom,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		homedecor.stack_vertically(itemstack, placer, pointed_thing, "homedecor:refrigerator_steel_bottom", "homedecor:refrigerator_steel_top")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local pos2 = { x = pos.x, y=pos.y + 1, z = pos.z }
		if minetest.get_node(pos2).name == "homedecor:refrigerator_steel_top" then
			minetest.remove_node(pos2)
		end
	end,
	infotext=S("Refrigerator"),
	inventory = {
		size=50,
		lockable=true,
		formspec="size[10,10]"..
			"list[context;main;0,0;10,5;]"..
			"list[current_player;main;1,6;8,4;]",
	},
})

homedecor.register("refrigerator_steel_top", {
	tiles = {
		"homedecor_refrigerator_steel_top.png",
		"default_steel_block.png",
		"homedecor_refrigerator_steel_sides1.png",
		"homedecor_refrigerator_steel_sides1.png^[transformFX",
		"homedecor_refrigerator_steel_back1.png",
		"homedecor_refrigerator_steel_front1.png"
	},
	groups = {snappy=3},
	node_box = fridge_model_top,
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

-- white, enameled fridge

homedecor.register("refrigerator_white_bottom", {
	tiles = {
		"default_steel_block.png",
		"homedecor_refrigerator_white_bottom.png",
		"homedecor_refrigerator_white_sides1.png",
		"homedecor_refrigerator_white_sides1.png^[transformFX",
		"homedecor_refrigerator_white_back1.png",
		"homedecor_refrigerator_white_front2.png"
	},
	inventory_image = "homedecor_refrigerator_white_inv.png",
	description = S("Refrigerator"),
	groups = {snappy=3},
	node_box = fridge_model_bottom,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		homedecor.stack_vertically(itemstack, placer, pointed_thing, "homedecor:refrigerator_white_bottom", "homedecor:refrigerator_white_top")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local pos2 = { x = pos.x, y=pos.y + 1, z = pos.z }
		if minetest.get_node(pos2).name == "homedecor:refrigerator_white_top" then
			minetest.remove_node(pos2)
		end
	end,
	infotext=S("Refrigerator"),
	inventory = {
		size=50,
		formspec="size[10,10]"..
			"list[context;main;0,0;10,5;]"..
			"list[current_player;main;1,6;8,4;]",
	},
})

homedecor.register("refrigerator_white_top", {
	tiles = {
		"homedecor_refrigerator_white_top.png",
		"default_steel_block.png",
		"homedecor_refrigerator_white_sides1.png",
		"homedecor_refrigerator_white_sides1.png^[transformFX",
		"homedecor_refrigerator_white_back1.png",
		"homedecor_refrigerator_white_front1.png"
	},
	groups = {snappy=3},
	node_box = fridge_model_top,
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

-- convert the old single-node fridges to the new two-node models

minetest.register_abm({
	nodenames = { "homedecor:refrigerator" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2
		local p_top = { x=pos.x, y=pos.y+1, z=pos.z }
		minetest.swap_node(pos, { name = "homedecor:refrigerator_white_bottom", param2 = fdir })
		minetest.set_node(p_top, { name = "homedecor:refrigerator_white_top", param2 = fdir })
	end
})

minetest.register_abm({
	nodenames = { "homedecor:refrigerator_locked" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2
		local p_top = { x=pos.x, y=pos.y+1, z=pos.z }
		minetest.swap_node(pos, { name = "homedecor:refrigerator_white_bottom_locked", param2 = fdir })
		minetest.set_node(p_top, { name = "homedecor:refrigerator_white_top", param2 = fdir })
	end
})

minetest.register_abm({
	nodenames = { "homedecor:refrigerator_steel" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2
		local p_top = { x=pos.x, y=pos.y+1, z=pos.z }
		minetest.swap_node(pos, { name = "homedecor:refrigerator_steel_bottom", param2 = fdir })
		minetest.set_node(p_top, { name = "homedecor:refrigerator_steel_top", param2 = fdir })
	end
})

minetest.register_abm({
	nodenames = { "homedecor:refrigerator_steel_locked" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2
		local p_top = { x=pos.x, y=pos.y+1, z=pos.z }
		minetest.swap_node(pos, { name = "homedecor:refrigerator_steel_bottom_locked", param2 = fdir })
		minetest.set_node(p_top, { name = "homedecor:refrigerator_steel_top", param2 = fdir })
	end
})

