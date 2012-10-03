-- This file supplies refrigerators

minetest.register_node('homedecor:refrigerator', {
	drawtype = "nodebox",
	description = "Refrigerator",
	tiles = {
		'homedecor_refrigerator_top.png',
		'homedecor_refrigerator_bottom.png',
		'homedecor_refrigerator_right.png',
		'homedecor_refrigerator_left.png',
		'homedecor_refrigerator_back.png',	
		'homedecor_refrigerator_front.png'
	},
	inventory_image = "homedecor_refrigerator_inv.png",
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },

        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
        },

	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[10,10]"..
				"list[current_name;main;0,0;10,5;]"..
				"list[current_player;main;1,6;8,4;]")
		meta:set_string("infotext", "Refrigerator")
		local inv = meta:get_inventory()
		inv:set_size("main",50)
	end,

	after_place_node = function(pos, placer)
		ntop = minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z})
		if ntop.name ~= "air" then
			minetest.env:remove_node(pos)
			placer:get_inventory():add_item("main", "homedecor:refrigerator")
        	        minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place a refrigerator!' )
		end
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

