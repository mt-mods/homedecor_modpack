modpath = minetest.get_modpath("homedecor")

screwdriver = screwdriver or {}

local placeholder_node = "air"

--- select which node was pointed at based on it being known, not ignored,
-- buildable_to.  returns nil if no node could be selected
local function select_node(pointed_thing)

	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local def = node and minetest.registered_nodes[node.name]

	if not def or not def.buildable_to then

		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		def = node and minetest.registered_nodes[node.name]
	end

	return def and pos, def
end

--- check if all nodes can and may be build to
local function is_buildable_to(placer_name, ...)

	for _, pos in ipairs({...}) do

		local node = minetest.get_node_or_nil(pos)
		local def = node and minetest.registered_nodes[node.name]

		if not (def and def.buildable_to)
		or minetest.is_protected(pos, placer_name) then
			return false
		end
	end

	return true
end

-- place one or two nodes if and only if both can be placed
local function stack(itemstack, placer, fdir, pos, def, pos2, node1,
		node2, pointed_thing)

	local placer_name = placer:get_player_name() or ""

	if is_buildable_to(placer_name, pos, pos2) then

		local lfdir = fdir or minetest.dir_to_facedir(placer:get_look_dir())

		minetest.set_node(pos, {name = node1, param2 = lfdir})

		-- this can be used to clear buildable_to nodes even though we are
		-- using a multinode mesh, do not assume by default, as we still
		-- might want to allow overlapping in some cases
		node2 = node2 or "air"

		local has_facedir = node2 ~= "air"

		if node2 == "placeholder" then
			has_facedir = false
			node2 = placeholder_node
		end

		minetest.set_node(pos2, {name = node2,
				param2 = (has_facedir and lfdir) or nil})

		-- call after_place_node of the placed node if available
		local ctrl_node_def = minetest.registered_nodes[node1]

		if ctrl_node_def and ctrl_node_def.after_place_node then
			ctrl_node_def.after_place_node(pos, placer, itemstack, pointed_thing)
		end

		if not creative.is_enabled_for(placer_name) then
			itemstack:take_item()
		end
	end

	return itemstack
end

local function rightclick_pointed_thing(pos, placer, itemstack, pointed_thing)

	local node = minetest.get_node_or_nil(pos)

	if not node then return false end

	local def = minetest.registered_nodes[node.name]

	if not def or not def.on_rightclick then return false end

	return def.on_rightclick(pos, node, placer, itemstack, pointed_thing) or itemstack
end

-- Stack one node above another
-- leave the last argument nil if it's one 2m high node
local function stack_vertically(itemstack, placer, pointed_thing,
		node1, node2)

	local rightclick_result = rightclick_pointed_thing(pointed_thing.under,
			 placer, itemstack, pointed_thing)

	if rightclick_result then return rightclick_result end

	local pos, def = select_node(pointed_thing)

	if not pos then return itemstack end

	local top_pos = {x = pos.x, y = pos.y + 1, z = pos.z}

	return stack(itemstack, placer, nil, pos, def, top_pos, node1,
			node2, pointed_thing)
end

local placeholder_node = "air"
local wd_cbox = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}}

-- cache set_textures function (fallback to old version)
-- default.player_set_textures is deprecated and will be removed in future
local set_player_textures =
	minetest.get_modpath("player_api") and player_api.set_textures
	or default.player_set_textures

local armor_mod_path = minetest.get_modpath("3d_armor")

local skinslist = {"male1", "male2", "male3", "male4", "male5"}
local default_skin = "character.png"

local skinsdb_mod_path = minetest.get_modpath("skinsdb")

if skinsdb_mod_path then

	for _, shrt in ipairs(skinslist) do

		for _, prefix in ipairs({"", "fe"}) do

			local skin_name = prefix..shrt
			local skin_obj = skins.new("homedecor_clothes_"..skin_name..".png")

			skin_obj:set_preview("homedecor_clothes_"..skin_name.."_preview.png")
			skin_obj:set_texture("homedecor_clothes_"..skin_name..".png")
			skin_obj:set_meta("name", "Wardrobe "..skin_name)
			skin_obj:set_meta("author", 'Calinou and Jordach')
			skin_obj:set_meta("license", 'CC-by-SA-4.0')

			local file = io.open(modpath ..
				"/textures/homedecor_clothes_" .. skin_name .. ".png", "r")

			skin_obj:set_meta("format", skins.get_skin_format(file))

			file:close()

			skin_obj:set_meta("in_inventory_list", false)
		end
	end
end

local function get_player_skin(player)

	local skin = player:get_attribute("homedecor:player_skin")

	if not skin or skin == "" then
		return default_skin, true
	end

	return skin, false
end

local function set_player_skin(player, skin, save)

	if skinsdb_mod_path then

		skins.set_player_skin(player, skin or skins.default)

	elseif armor_mod_path then -- if 3D_armor's installed, let it set the skin

		armor.textures[player:get_player_name()].skin = skin or default_skin
		armor:update_player_visuals(player)
	else
		set_player_textures(player, { skin or default_skin})
	end

	if save and not skinsdb_mod_path then

		if skin == default_skin then
			skin = "default"
			player:set_attribute("homedecor:player_skin", "")
		else
			player:set_attribute("homedecor:player_skin", skin)
		end
	end
end

local function unset_player_skin(player)
	set_player_skin(player, nil, true)
end

local def = {

	description = "Wardrobe",
	drawtype = "mesh",
	mesh = "homedecor_bedroom_wardrobe.obj",
	tiles = {
		{name = "homedecor_generic_wood_plain.png", color = 0xffa76820},
		"homedecor_wardrobe_drawers.png",
		"homedecor_wardrobe_doors.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",

	paramtype = "light",
	paramtype2 = "facedir",

	groups = {snappy = 3},
	selection_box = wd_cbox,
	collision_box = wd_cbox,
	sounds = default.node_sound_wood_defaults(),

	on_rotate = screwdriver.rotate_simple,

	on_place = function(itemstack, placer, pointed_thing)

		return stack_vertically(itemstack, placer, pointed_thing,
				itemstack:get_name(), "placeholder")
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)

		return meta:get_inventory():is_empty("main")
	end,

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("infotext", "Wardrobe")

		meta:get_inventory():set_size("main", 10)

		-- textures made by the Minetest community (mostly Calinou and Jordach)
		local clothes_strings = ""

		for i = 1, 5 do

			clothes_strings = clothes_strings ..
				"image_button_exit[" .. (i-1) ..
				".5,0;1.1,2;homedecor_clothes_" .. skinslist[i] ..
				"_preview.png;" .. skinslist[i] .. ";]" ..
				"image_button_exit[" .. (i-1) ..
				".5,2;1.1,2;homedecor_clothes_fe" .. skinslist[i] ..
				"_preview.png;fe" .. skinslist[i] .. ";]"
		end

		meta:set_string("formspec",  "size[5.5,8.5]" ..
			default.gui_bg .. default.gui_bg_img .. default.gui_slots ..
			"vertlabel[0,0.5;" .. minetest.formspec_escape("Clothes") .. "]" ..
			"button_exit[0,3.29;0.6,0.6;default;x]" ..
			clothes_strings ..
			"vertlabel[0,5.2;" .. minetest.formspec_escape("Storage") .. "]" ..
			"list[current_name;main;0.5,4.5;5,2;]" ..
			"list[current_player;main;0.5,6.8;5,2;]" ..
			"listring[]"
		)
	end,

	on_receive_fields = function(pos, formname, fields, sender)

		if fields.default then

			set_player_skin(sender, nil, "player")

			return
		end

		for i = 1, 5 do

			if fields[skinslist[i]] then

				set_player_skin(sender,
					"homedecor_clothes_" .. skinslist[i] .. ".png", "player")
				break

			elseif fields["fe" .. skinslist[i]] then

				set_player_skin(sender,
					"homedecor_clothes_fe" .. skinslist[i] .. ".png", "player")
				break
			end
		end
	end
}

-- register the actual minetest node
minetest.register_node(":homedecor:wardrobe", def)

minetest.register_alias("homedecor:wardrobe_bottom", "homedecor:wardrobe")
minetest.register_alias("homedecor:wardrobe_top", "air")

if not skinsdb_mod_path then -- If not managed by skinsdb

	minetest.register_on_joinplayer(function(player)

		local skin = player:get_attribute("homedecor:player_skin")

		if skin and skin ~= "" then

			-- setting player skin on connect has no effect, so delay skin change
			minetest.after(1, function(player, skin)
				set_player_skin(player, skin)
			end, player, skin)
		end
	end)
end

minetest.register_craft( {
	output = "homedecor:wardrobe",
	recipe = {
		{ "homedecor:drawer_small", "homedecor:kitchen_cabinet" },
		{ "homedecor:drawer_small", "default:wood" },
		{ "homedecor:drawer_small", "default:wood" }
	},
})
