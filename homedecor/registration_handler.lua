homedecor = homedecor or {}
local S = homedecor.gettext

local default_can_dig = function(pos,player)
	local meta = minetest.get_meta(pos)
	return meta:get_inventory():is_empty("main")
end

local default_inventory_size = 32
local default_inventory_formspec = "size[8,9]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;main;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
	default.get_hotbar_bg(0,4.85)

local function remove_node_if()
end


--wrapper around minetest.register_node that sets sane defaults and interprets some specialized settings
function homedecor.register(name, def)
	def.paramtype = def.paramtype or "light"
	def.paramtype2 = def.paramtype2 or "facedir"

	def.drawtype = def.drawtype
			or (def.mesh and "mesh")
			or (def.node_box and "nodebox")

	local infotext = def.infotext
	--def.infotext = nil -- currently used to set locked refrigerator infotexts

	-- handle inventory setting
	-- inventory = {
	--	size = 16
	--	formspec = …
	-- }
	local inventory = def.inventory
	def.inventory = nil

	if inventory then
		assert((inventory.formspec == nil) == (inventory.size == nil),
			"inventory.formspec and inventory.size either have both to be set or both be left nil" )

		def.on_construct = def.on_construct or function(pos)
			local meta = minetest.get_meta(pos)
			if infotext then
				meta:set_string("infotext", infotext)
			end

			meta:set_string("formspec", inventory.formspec or default_inventory_formspec)
			meta:get_inventory():set_size("main", inventory.size or default_inventory_size)
		end

		def.can_dig = def.can_dig or default_can_dig
		def.on_metadata_inventory_move = def.on_metadata_inventory_move or function(pos, from_list, from_index, to_list, to_index, count, player)
			minetest.log("action", S("%s moves stuff in %s at %s"):format(
				player:get_player_name(), name, minetest.pos_to_string(pos)
			))
		end
		def.on_metadata_inventory_put = def.on_metadata_inventory_put or function(pos, listname, index, stack, player)
			minetest.log("action", S("%s moves stuff to %s at %s"):format(
				player:get_player_name(), name, minetest.pos_to_string(pos)
			))
		end
		def.on_metadata_inventory_take = def.on_metadata_inventory_take or function(pos, listname, index, stack, player)
			minetest.log("action", S("%s takes stuff from %s at %s"):format(
				player:get_player_name(), name, minetest.pos_to_string(pos)
			))
		end
	elseif infotext and not def.on_construct then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
		end
	end

	local expand = def.expand
	def.expand = nil

	if expand then
		def.on_place = def.on_place or function(itemstack, placer, pointed_thing)
			if expand.top then
				homedecor.stack_vertically(itemstack, placer, pointed_thing, itemstack:get_name(), expand.top)
			end
			if expand.right then
				homedecor.stack_sideways(itemstack, placer, pointed_thing, itemstack:get_name(), expand.right, true)
			end
			if expand.forward then
				homedecor.stack_sideways(itemstack, placer, pointed_thing, itemstack:get_name(), expand.forward, false)
			end
		end
		def.after_dig_node = def.after_dig_node or function(pos, oldnode, oldmetadata, digger)
			if expand.top and expand.forward ~= "air" then
				local top_pos = { x=pos.x, y=pos.y+1, z=pos.z }
				if minetest.get_node(top_pos).name == expand.top then
					minetest.remove_node(top_pos)
				end
			end

			local fdir = oldnode.param2
			if not fdir or fdir > 3 then return end

			if expand.right and expand.forward ~= "air" then
				local right_pos = { x=pos.x+homedecor.fdir_to_right[fdir+1][1], y=pos.y, z=pos.z+homedecor.fdir_to_right[fdir+1][2] }
				if minetest.get_node(right_pos).name == expand.right then
					minetest.remove_node(right_pos)
				end
			end
			if expand.forward and expand.forward ~= "air" then
				local forward_pos = { x=pos.x+homedecor.fdir_to_fwd[fdir+1][1], y=pos.y, z=pos.z+homedecor.fdir_to_fwd[fdir+1][2] }
				if minetest.get_node(forward_pos).name == expand.forward then
					minetest.remove_node(forward_pos)
				end
			end
		end
	end

	-- register the actual minetest node
	minetest.register_node("homedecor:" .. name, def)
end
