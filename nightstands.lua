-- This file supplies nightstands

minetest.register_node('homedecor:nightstand_oak_one_drawer', {
	drawtype = "nodebox",
	description = "Oak Nightstand with One Drawer",
	tiles = { 'homedecor_nightstand_oak_top.png',
			'homedecor_nightstand_oak_bottom.png',
			'homedecor_nightstand_oak_right.png',
			'homedecor_nightstand_oak_left.png',
			'homedecor_nightstand_oak_back.png',
			'homedecor_nightstand_oak_1_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16,     0, -30/64,  8/16,  8/16,   8/16 },	-- top half
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64}, 	-- drawer face
			{ -8/16, -8/16, -30/64, -7/16,     0,   8/16 },	-- left
			{  7/16, -8/16, -30/64,  8/16,     0,   8/16 },	-- right
			{ -8/16, -8/16,   7/16,  8/16,     0,   8/16 },	-- back
			{ -8/16, -8/16, -30/64,  8/16, -7/16,   8/16 }	-- bottom
		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,6]"..
				"list[current_name;main;0,0;8,1;]"..
				"list[current_player;main;0,2;8,4;]")
		meta:set_string("infotext", "One-drawer Nightstand")
		local inv = meta:get_inventory()
		inv:set_size("main", 8)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from nightstand at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node('homedecor:nightstand_oak_two_drawers', {
	drawtype = "nodebox",
	description = "Oak Nightstand with One Drawer",
	tiles = { 'homedecor_nightstand_oak_top.png',
			'homedecor_nightstand_oak_bottom.png',
			'homedecor_nightstand_oak_right.png',
			'homedecor_nightstand_oak_left.png',
			'homedecor_nightstand_oak_back.png',
			'homedecor_nightstand_oak_2_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64 },	-- top drawer face
			{ -7/16, -7/16, -32/64,  7/16, -1/16, -29/64 },	-- bottom drawer face

		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"list[current_name;main;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", "Two-drawer Nightstand")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from nightstand at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node('homedecor:nightstand_mahogany_one_drawer', {
	drawtype = "nodebox",
	description = "Mahogany Nightstand with One Drawer",
	tiles = { 'homedecor_nightstand_mahogany_top.png',
			'homedecor_nightstand_mahogany_bottom.png',
			'homedecor_nightstand_mahogany_right.png',
			'homedecor_nightstand_mahogany_left.png',
			'homedecor_nightstand_mahogany_back.png',
			'homedecor_nightstand_mahogany_1_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16,     0, -30/64,  8/16,  8/16,   8/16 },	-- top half
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64}, 	-- drawer face
			{ -8/16, -8/16, -30/64, -7/16,     0,   8/16 },	-- left
			{  7/16, -8/16, -30/64,  8/16,     0,   8/16 },	-- right
			{ -8/16, -8/16,   7/16,  8/16,     0,   8/16 },	-- back
			{ -8/16, -8/16, -30/64,  8/16, -7/16,   8/16 }	-- bottom
		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,6]"..
				"list[current_name;main;0,0;8,1;]"..
				"list[current_player;main;0,2;8,4;]")
		meta:set_string("infotext", "One-drawer Nightstand")
		local inv = meta:get_inventory()
		inv:set_size("main", 8)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from nightstand at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node('homedecor:nightstand_mahogany_two_drawers', {
	drawtype = "nodebox",
	description = "Mahogany Nightstand with Two Drawers",
	tiles = { 'homedecor_nightstand_mahogany_top.png',
			'homedecor_nightstand_mahogany_bottom.png',
			'homedecor_nightstand_mahogany_right.png',
			'homedecor_nightstand_mahogany_left.png',
			'homedecor_nightstand_mahogany_back.png',
			'homedecor_nightstand_mahogany_2_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64 },	-- top drawer face
			{ -7/16, -7/16, -32/64,  7/16, -1/16, -29/64 },	-- bottom drawer face

		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"list[current_name;main;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", "Two-drawer Nightstand")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to nightstand at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from nightstand at "..minetest.pos_to_string(pos))
	end,
})
