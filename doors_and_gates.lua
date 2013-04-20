-- Node definitions for Homedecor doors

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- doors

local sides = {"left", "right"}
local rsides = {"right", "left"}

for i in ipairs(sides) do
	local side = sides[i]
	local rside = rsides[i]

	for j in ipairs(homedecor_door_models) do
		local doorname =		homedecor_door_models[j][1]
		local doordesc =		homedecor_door_models[j][2]
		local nodeboxes_top = nil
		local nodeboxes_bottom = nil

		if side == "left" then
			nodeboxes_top =	homedecor_door_models[j][3]
			nodeboxes_bottomtom =	homedecor_door_models[j][4]
		else
			nodeboxes_top =	homedecor_door_models[j][5]
			nodeboxes_bottomtom =	homedecor_door_models[j][6]
		end

		local tiles_top = {
				"homedecor_door_"..doorname.."_tb.png",
				"homedecor_door_"..doorname.."_tb.png",
				"homedecor_door_"..doorname.."_lrt.png",
				"homedecor_door_"..doorname.."_lrt.png",
				"homedecor_door_"..doorname.."_"..rside.."_top.png",
				"homedecor_door_"..doorname.."_"..side.."_top.png",
				}

		local tiles_bottom = {
				"homedecor_door_"..doorname.."_tb.png",
				"homedecor_door_"..doorname.."_tb.png",
				"homedecor_door_"..doorname.."_lrb.png",
				"homedecor_door_"..doorname.."_lrb.png",
				"homedecor_door_"..doorname.."_"..rside.."_bottom.png",
				"homedecor_door_"..doorname.."_"..side.."_bottom.png",
				}

		local selectboxes_top = {
				type = "fixed",
				fixed = { -0.5, -1.5, 6/16, 0.5, 0.5, 8/16}
			}

		local selectboxes_bottom = {
				type = "fixed",
				fixed = { -0.5, -0.5, 6/16, 0.5, 1.5, 8/16}
			}

		minetest.register_node("homedecor:door_"..doorname.."_top_"..side, {
			description = doordesc.." "..S("(Top Half, %s-opening)"):format(side),
			drawtype = "nodebox",
			tiles = tiles_top,
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {snappy=3, not_in_creative_inventory=1},
			sounds = default.node_sound_wood_defaults(),
			walkable = true,
			selection_box = selectboxes_top,
			node_box = {
				type = "fixed",
				fixed = nodeboxes_top
			},
			drop = "homedecor:door_"..doorname.."_bottom_"..side,
			after_dig_node = function(pos, oldnode, oldmetadata, digger)
				if minetest.env:get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "homedecor:door_"..doorname.."_bottom_"..side then
					minetest.env:remove_node({x=pos.x, y=pos.y-1, z=pos.z})
				end
			end,
			on_rightclick = function(pos, node, clicker)
				homedecor_flip_door({x=pos.x, y=pos.y-1, z=pos.z}, node, clicker, doorname, side)
			end
		})

		minetest.register_node("homedecor:door_"..doorname.."_bottom_"..side, {
			description = doordesc.." "..S("(%s-opening)"):format(side),
			drawtype = "nodebox",
			tiles = tiles_bottom,
			inventory_image = "homedecor_door_"..doorname.."_"..side.."_inv.png",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {snappy=3},
			sounds = default.node_sound_wood_defaults(),
			walkable = true,
			selection_box = selectboxes_bottom,
			node_box = {
				type = "fixed",
				fixed = nodeboxes_bottomtom
			},
			after_dig_node = function(pos, oldnode, oldmetadata, digger)
				if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "homedecor:door_"..doorname.."_top_"..side then
					minetest.env:remove_node({x=pos.x, y=pos.y+1, z=pos.z})
				end
			end,
			on_place = function(itemstack, placer, pointed_thing)

				local node=minetest.env:get_node(pointed_thing.under)
				if not minetest.registered_nodes[node.name]
				    or not minetest.registered_nodes[node.name].on_rightclick then
					return homedecor_place_door(itemstack, placer, pointed_thing, doorname, side)
				else 
					minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
				end
			end,
			on_rightclick = function(pos, node, clicker)
				homedecor_flip_door(pos, node, clicker, doorname, side)
			end
		})
	end
end

-- Gates

local gates_list = { "picket", "picket_white", "barbed_wire", "chainlink" }
local gate_names = { "Unpainted Picket", "White Picket", "Barbed Wire", "Chainlink" }

local gate_models_closed = {
	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},

	{{ -8/16, -8/16, 6/16, -6/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16, 6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { -8/16,  7/16, 13/32, 8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32, 8/16, -7/16, 15/32 },	-- bottom piece
	 { -6/16, -8/16,  7/16, 6/16,  8/16,  7/16 }},	-- the wire

	{{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
	 { -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 },	-- the chainlink itself
	 { -8/16, -3/16,  6/16, -6/16,  3/16,  8/16 }}	-- the lump representing the lock
}

local gate_models_open = {
	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},

	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},
	
	{{  6/16, -8/16, -8/16,  8/16,  8/16, -6/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -6/16,  7/16,  8/16,  6/16 }},	-- the wire

	{{  6/16, -8/16, -8/16,  8/16,  8/16, -7/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -8/16,  7/16,  8/16,  8/16 },	-- the chainlink itself
	 {  6/16, -3/16, -8/16,  8/16,  3/16, -6/16 }}	-- the lump representing the lock
}

for i in ipairs(gates_list) do

	local gate=gates_list[i]

	minetest.register_node("homedecor:gate_"..gate.."_closed", {
		drawtype = "nodebox",
		description = S(gate_names[i].." Fence Gate"),
		tiles = {
			"homedecor_gate_"..gate.."_top.png",
			"homedecor_gate_"..gate.."_bottom.png",
			"homedecor_gate_"..gate.."_left.png",
			"homedecor_gate_"..gate.."_right.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_front.png"
		},
		paramtype = "light",
		is_ground_content = true,
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
		walkable = true,
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_closed[i]
		},
		on_rightclick = function(pos, node, clicker)
			homedecor_flip_gate(pos, node, clicker, gate, "closed")
		end
	})

	minetest.register_node("homedecor:gate_"..gate.."_open", {
		drawtype = "nodebox",
		description = S(gate_names[i].." Fence Gate"),
		tiles = {
			"homedecor_gate_"..gate.."_top.png",
			"homedecor_gate_"..gate.."_bottom.png",
			"homedecor_gate_"..gate.."_front.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_left.png",
			"homedecor_gate_"..gate.."_right.png"
		},
		paramtype = "light",
		is_ground_content = true,
		groups = {snappy=3, not_in_creative_inventory=1},
		sounds = default.node_sound_wood_defaults(),
		walkable = true,
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed ={ 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_open[i]
		},
		drop = "homedecor:gate_"..gate.."_closed",
		on_rightclick = function(pos, node, clicker)
			homedecor_flip_gate(pos, node, clicker, gate, "open")
		end
	})

end

minetest.register_alias("homedecor:fence_barbed_wire_gate_open",    "homedecor:gate_barbed_wire_open")
minetest.register_alias("homedecor:fence_barbed_wire_gate_closed",  "homedecor:gate_barbed_wire_closed")
minetest.register_alias("homedecor:fence_chainlink_gate_open",      "homedecor:gate_chainlink_open")
minetest.register_alias("homedecor:fence_chainlink_gate_closed",    "homedecor:gate_chainlink_closed")
minetest.register_alias("homedecor:fence_picket_gate_open",         "homedecor:gate_picket_open")
minetest.register_alias("homedecor:fence_picket_gate_closed",       "homedecor:gate_picket_closed")
minetest.register_alias("homedecor:fence_picket_gate_white_open",   "homedecor:gate_picket_white_open")
minetest.register_alias("homedecor:fence_picket_gate_white_closed", "homedecor:gate_picket_white_closed")

----- helper functions

function homedecor_place_door(itemstack, placer, pointed_thing, name, side)
	local pos = pointed_thing.above
	if homedecor_node_is_owned(pointed_thing.under, placer) == false then

		local nodename = minetest.env:get_node(pointed_thing.under).name
		local field = nil

		if minetest.registered_nodes[nodename] then field = minetest.registered_nodes[nodename].on_rightclick end

		if field == nil then
			fdir = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
				minetest.chat_send_player( placer:get_player_name(), S('Not enough vertical space to place a door!') )
				return
			end
			minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name = "homedecor:door_"..name.."_top_"..side, param2=fdir})
			minetest.env:add_node(pos, { name = "homedecor:door_"..name.."_bottom_"..side, param2=fdir})
			itemstack:take_item()
			return itemstack
		end
		return minetest.item_place(itemstack, placer, pointed_thing)
	end
end

function homedecor_flip_door(pos, node, player, name, side)
	local rside = nil
	local nfdir = nil
	if side == "left" then
		rside = "right"
		nfdir=node.param2 - 1
		if nfdir < 0 then nfdir = 3 end
	else
		rside = "left"
		nfdir=node.param2 + 1
		if nfdir > 3 then nfdir = 0 end
	end
	minetest.env:add_node({x=pos.x, y=pos.y+1, z=pos.z}, { name =  "homedecor:door_"..name.."_top_"..rside, param2=nfdir})
	minetest.env:add_node(pos, { name = "homedecor:door_"..name.."_bottom_"..rside, param2=nfdir})
end

function homedecor_flip_gate(pos, node, player, gate, oc)
	local fdir = node.param2

	if oc == "closed" then
		minetest.env:add_node(pos, { name = "homedecor:gate_"..gate.."_open", param2=fdir})
	else
		minetest.env:add_node(pos, { name = "homedecor:gate_"..gate.."_closed", param2=fdir})
	end
end
