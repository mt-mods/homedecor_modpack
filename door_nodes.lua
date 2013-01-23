-- Node definitions for Homedecor doors

local sides = {"left", "right"}
local rsides = {"right", "left"}

-- cheater's method of detecting if default doors are right-click-to-open:
-- default.generate_ore() was exposed to the modding API one day prior to the
-- right-click thing.

local use_rightclick = type(default.generate_ore)

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

		if use_rightclick == nil then -- register the version that uses on_punch

			minetest.register_node("homedecor:door_"..doorname.."_top_"..side, {
				description = doordesc.." (Top Half, "..side.."-opening)",
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
				on_punch = function(pos, node, puncher)
					homedecor_flip_door({x=pos.x, y=pos.y-1, z=pos.z}, node, puncher, doorname, side)
				end
			})

			minetest.register_node("homedecor:door_"..doorname.."_bottom_"..side, {
				description = doordesc.." ("..side.."-opening)",
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
				on_punch = function(pos, node, puncher)
					homedecor_flip_door(pos, node, puncher, doorname, side)
				end,
				on_place = function(itemstack, placer, pointed_thing)
					return homedecor_place_door(itemstack, placer, pointed_thing, doorname, side)
				end,
			})

		else	-- register the version that uses on_rightclick

			minetest.register_node("homedecor:door_"..doorname.."_top_"..side, {
				description = doordesc.." (Top Half, "..side.."-opening)",
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
				description = doordesc.." ("..side.."-opening)",
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
					-- for some obscure reason, this callback is used if the target node
					-- is a homedecor door, probably because they have an on_rightclick
					-- setting -- but only if you're weilding a door! 

					local node=minetest.env:get_node(pointed_thing.under)
					if string.find(node.name, "homedecor:door_") then

						local lr = nil
						if string.find(node.name, "left") then
							lr = "left"
						else
							lr = "right"
						end

						local tb = nil
						if string.find(node.name, "top") then
							tb = "top"
						else
							tb = "bottom"
						end

						local dname = string.gsub(string.gsub(string.gsub(node.name, "homedecor:door_", ""), "_"..lr, ""), "_"..tb, "")

						print(node.name)
						print(dname)
						print(lr)

						homedecor_flip_door(pointed_thing.under, node, placer, dname, lr)
						return
					else
						return homedecor_place_door(itemstack, placer, pointed_thing, doorname, side)
					end
				end,
				on_rightclick = function(pos, node, clicker)
					homedecor_flip_door(pos, node, clicker, doorname, side)
				end
			})
		end
	end
end

function homedecor_node_is_owned(pos, placer)
	local ownername = false
	if type(IsPlayerNodeOwner) == "function" then					-- node_ownership mod
		if HasOwner(pos, placer) then						-- returns true if the node is owned
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) then
				if type(getLastOwner) == "function" then		-- ...is an old version
					ownername = getLastOwner(pos)
				elseif type(GetNodeOwnerName) == "function" then	-- ...is a recent version
					ownername = GetNodeOwnerName(pos)
				else
					ownername = "someone"
				end
			end
		end

	elseif type(isprotect)=="function" then 					-- glomie's protection mod
		if not isprotect(5, pos, placer) then
			ownername = "someone"
		end
	end

	if ownername ~= false then
		minetest.chat_send_player( placer:get_player_name(), "Sorry, "..ownername.." owns that spot." )
		return true
	else
		return false
	end
end

function homedecor_place_door(itemstack, placer, pointed_thing, name, side)
	local pos = pointed_thing.above
	if homedecor_node_is_owned(pointed_thing.under, placer) == false then

		local nodename = minetest.env:get_node(pointed_thing.under).name
		local field = minetest.registered_nodes[nodename].on_rightclick

		if field == nil then
			fdir = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
				minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place a door!' )
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

