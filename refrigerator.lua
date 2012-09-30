-- This file supplies refrigerators

minetest.register_node('homedecor:refrigerator', {
	description = "Refrigerator",
	tiles = { 'homedecor_refrigerator_top.png',
			'homedecor_refrigerator_bottom.png',
			'homedecor_refrigerator_right.png',
			'homedecor_refrigerator_left.png',
			'homedecor_refrigerator_back.png',
			'homedecor_refrigerator_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,8]"..
				"list[current_name;main;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Refrigerator")
		local inv = meta:get_inventory()
		inv:set_size("main", 24)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in refrigerator at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to refrigerator at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from refrigerator at "..minetest.pos_to_string(pos))
	end,
})

