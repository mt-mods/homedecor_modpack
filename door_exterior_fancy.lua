-- This file supplies Fancy Exterior wood doors with frosted glass insert
--
-- Textures derived from...
-- http://commons.wikimedia.org/wiki/File:Front_door_of_Morey_Mansion.jpg
-- ...plus the standard Minetest logo.

-- Left-opening

minetest.register_node("homedecor:door_exterior_fancy_top_left", {
	description = "wood/glass door top half",
	drawtype = "nodebox",
	tiles = {
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_right_top.png",
		"homedecor_door_exterior_fancy_left_top.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	selection_box = {
	        type = "fixed",
	        fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 8/16}
	},
	node_box = {
	        type = "fixed",
		fixed = {
			{ -8/16, 6/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },
			{ 6/16, -8/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 7/16, 8/16, 8/16, 7/16 }
		}
	},
	drop = "homedecor:door_exterior_fancy_bottom_left",
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if minetest.env:get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "homedecor:door_exterior_fancy_bottom_left" then
			minetest.env:remove_node({x=pos.x, y=pos.y-1, z=pos.z})
		end
	end,
	on_punch = function(pos, node, puncher)
		nfdir=node.param2-1
		if nfdir < 0 then nfdir = 3 end
		minetest.env:add_node(pos, { name =  "homedecor:door_exterior_fancy_top_right", param2=nfdir})
		minetest.env:add_node({x=pos.x, y=pos.y-1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_bottom_right", param2=nfdir})
	end
})

minetest.register_node("homedecor:door_exterior_fancy_bottom_left", {
	description = "Wood and Glass Grid-Style Door",
	drawtype = "nodebox",
	tiles = {
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_right_bottom.png",
		"homedecor_door_exterior_fancy_left_bottom.png",
	},
	wield_image = "homedecor_door_exterior_fancy_left_inv.png",
	inventory_image = "homedecor_door_exterior_fancy_left_inv.png",
	wield_scale = {x=1,y=1,z=0.25},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	selection_box = {
	        type = "fixed",
	        fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 8/16}
	},
	node_box = {
	        type = "fixed",
		fixed = {
			{ -8/16, -8/16, 6/16, 8/16, 6/16, 8/16 },
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },
			{ 6/16, -8/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 7/16, 8/16, 8/16, 7/16 }
		}
	},
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local pd = true
		if type(IsPlayerNodeOwner)=="function" then
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) and HasOwner(pos) then
				minetest.chat_send_player( placer:get_player_name(), "Sorry, "..getLastOwner(pos).." owns that spot." )
				pd = false
			end
		end
		if type(isprotect)=="function" then
			pd = isprotect(5, pos, placer)
			if not pd then 
				minetest.chat_send_player( placer:get_player_name(), "Sorry, someone owns that spot." )
			end
		end
		if pd then
			fdir = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
				minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place a door!' )
				return
			end
			minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_top_left", param2=fdir})
			return minetest.item_place(itemstack, placer, pointed_thing)
		end	
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "homedecor:door_exterior_fancy_top_left" then
			minetest.env:remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	on_punch = function(pos, node, puncher)
		nfdir=node.param2-1
		if nfdir < 0 then nfdir = 3 end
		minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_top_right", param2=nfdir})
		minetest.env:add_node(pos, { name =  "homedecor:door_exterior_fancy_bottom_right", param2=nfdir})
	end
})

-- Right-opening

minetest.register_node("homedecor:door_exterior_fancy_top_right", {
	description = "wood/glass door top half",
	drawtype = "nodebox",
	tiles = {
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_left_top.png",
		"homedecor_door_exterior_fancy_right_top.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=3, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	selection_box = {
	        type = "fixed",
	        fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 8/16}
	},
	node_box = {
	        type = "fixed",
		fixed = {
			{ -8/16, 6/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },
			{ 6/16, -8/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 7/16, 8/16, 8/16, 7/16 }
		}
	},
	drop = "homedecor:door_exterior_fancy_bottom_left",
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if minetest.env:get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "homedecor:door_exterior_fancy_bottom_right" then
			minetest.env:remove_node({x=pos.x, y=pos.y-1, z=pos.z})
		end
	end,
	on_punch = function(pos, node, puncher)
		nfdir=node.param2+1
		if nfdir > 3 then nfdir = 0 end
		minetest.env:add_node(pos, { name =  "homedecor:door_exterior_fancy_top_left", param2=nfdir})
		minetest.env:add_node({x=pos.x, y=pos.y-1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_bottom_left", param2=nfdir})
	end
})

minetest.register_node("homedecor:door_exterior_fancy_bottom_right", {
	description = "Wood and Glass Grid-Style Door (Right-opening)",
	drawtype = "nodebox",
	tiles = {
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_tb.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_lr.png",
		"homedecor_door_exterior_fancy_left_bottom.png",
		"homedecor_door_exterior_fancy_right_bottom.png",
	},
	wield_image = "homedecor_door_exterior_fancy_right_inv.png",
	inventory_image = "homedecor_door_exterior_fancy_right_inv.png",
	wield_scale = {x=1,y=1,z=0.25},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	selection_box = {
	        type = "fixed",
	        fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 8/16}
	},
	node_box = {
	        type = "fixed",
		fixed = {
			{ -8/16, -8/16, 6/16, 8/16, 6/16, 8/16 },
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },
			{ 6/16, -8/16, 6/16, 8/16, 8/16, 8/16 },
			{ -8/16, -8/16, 7/16, 8/16, 8/16, 7/16 }
		}
	},
	drop = "homedecor:door_exterior_fancy_bottom_left",
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local pd = true
		if type(IsPlayerNodeOwner)=="function" then
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) and HasOwner(pos) then
				minetest.chat_send_player( placer:get_player_name(), "Sorry, "..getLastOwner(pos).." owns that spot." )
				pd = false
			end
		end
		if type(isprotect)=="function" then
			pd = isprotect(5, pos, placer)
			if not pd then 
				minetest.chat_send_player( placer:get_player_name(), "Sorry, someone owns that spot." )
			end
		end
		if pd then
			fdir = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
				minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place a door!' )
				return
			end
			minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_top_right", param2=fdir})
			return minetest.item_place(itemstack, placer, pointed_thing)
		end
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "homedecor:door_exterior_fancy_top_right" then
			minetest.env:remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	on_punch = function(pos, node, puncher)
		nfdir=node.param2+1
		if nfdir > 3 then nfdir = 0 end
		minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_exterior_fancy_top_left", param2=nfdir})
		minetest.env:add_node(pos, { name =  "homedecor:door_exterior_fancy_bottom_left", param2=nfdir})
	end
})

-- Backwards compatibility with old zlpdoors-derived 2D version
-- good enough to avoid losing any items, though some doors may
-- need to be dug up and placed again to correct their orientations.

minetest.register_alias("homedecor:exterior_door_fancy_a_c", "homedecor:door_exterior_fancy_top_left")
minetest.register_alias("homedecor:exterior_door_fancy_a_o", "homedecor:door_exterior_fancy_top_right")
minetest.register_alias("homedecor:exterior_door_fancy_b_c", "homedecor:door_exterior_fancy_bottom_left")
minetest.register_alias("homedecor:exterior_door_fancy_b_o", "homedecor:door_exterior_fancy_bottom_right")
minetest.register_alias("homedecor:exterior_door_fancy_a_c_right", "homedecor:door_exterior_fancy_top_right")
minetest.register_alias("homedecor:exterior_door_fancy_a_o_right", "homedecor:door_exterior_fancy_top_left")
minetest.register_alias("homedecor:exterior_door_fancy_b_c_right", "homedecor:door_exterior_fancy_bottom_right")
minetest.register_alias("homedecor:exterior_door_fancy_b_o_right", "homedecor:door_exterior_fancy_bottom_left")
minetest.register_alias("homedecor:exterior_door_fancy", "homedecor:door_exterior_fancy_bottom_left")
minetest.register_alias("homedecor:exterior_door_fancy_right", "homedecor:door_exterior_fancy_bottom_right")
