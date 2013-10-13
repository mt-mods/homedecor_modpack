-- Simplified 6d facedir rotation/prediction library
-- by VanessaE 
-- license: WTFPL

lib_6d = {}

local dirs1 = { 20, 23, 22, 21 }
local dirs2 = { 9, 18, 7, 12 }

function lib_6d:rotate_and_place(itemstack, placer, pointed_thing, infinitestacks)
	local node = minetest.get_node(pointed_thing.under)
	if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

		local above = pointed_thing.above
		local under = pointed_thing.under
		local pitch = placer:get_look_pitch()
		local pname = minetest.get_node(under).name
		local node = minetest.get_node(above)
		local fdir = minetest.dir_to_facedir(placer:get_look_dir())
		local wield_name = itemstack:get_name()

		if not minetest.registered_nodes[pname]
		    or not minetest.registered_nodes[pname].on_rightclick then

			local iswall = (above.x ~= under.x) or (above.z ~= under.z)
			local isceiling = (above.x == under.x) and (above.z == under.z) and (pitch > 0)
			local pos1 = above

			if minetest.registered_nodes[pname]["buildable_to"] then
				pos1 = under
				iswall = false
			end

			if not minetest.registered_nodes[minetest.get_node(pos1).name]["buildable_to"] then return end

			if iswall then 
				minetest.add_node(pos1, {name = wield_name, param2 = dirs2[fdir+1] }) -- place wall variant
			elseif isceiling then
				minetest.add_node(pos1, {name = wield_name, param2 = 20 }) -- place upside down variant
			else
				minetest.add_node(pos1, {name = wield_name, param2 = 0 }) -- place right side up
			end

			if not infinitestacks then
				itemstack:take_item()
				return itemstack
			end
		end
	else
		minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack)
	end
end
