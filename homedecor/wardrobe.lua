local S = homedecor.gettext

local wd_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
}

homedecor.register("wardrobe", {
	mesh = "homedecor_bedroom_wardrobe.obj",
	tiles = {
		"homedecor_generic_wood_beech.png",
		"homedecor_wardrobe_drawers.png",
		"homedecor_wardrobe_doors.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",
	description = "Wardrobe",
	groups = {snappy=3},
	selection_box = wd_cbox,
	collision_box = wd_cbox,
	sounds = default.node_sound_wood_defaults(),
	expand = { top="air" },
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local skins = {"male1", "male2", "male3", "male4", "male5"}
		-- textures made by the Minetest community (mostly Calinou and Jordach)
		meta:set_string("formspec", "size[5.5,8.5]"..default.gui_bg..default.gui_bg_img..default.gui_slots..
			"vertlabel[0,0.5;CLOTHES]"..
			"image_button_exit[0.5,0;1.1,2;"..skins[1].."_preview.png;"..skins[1]..";]"..
			"image_button_exit[1.5,0;1.1,2;"..skins[2].."_preview.png;"..skins[2]..";]"..
			"image_button_exit[2.5,0;1.1,2;"..skins[3].."_preview.png;"..skins[3]..";]"..
			"image_button_exit[3.5,0;1.1,2;"..skins[4].."_preview.png;"..skins[4]..";]"..
			"image_button_exit[4.5,0;1.1,2;"..skins[5].."_preview.png;"..skins[5]..";]"..
			"image_button_exit[0.5,2;1.1,2;fe"..skins[1].."_preview.png;fe"..skins[1]..";]"..
			"image_button_exit[1.5,2;1.1,2;fe"..skins[2].."_preview.png;fe"..skins[2]..";]"..
			"image_button_exit[2.5,2;1.1,2;fe"..skins[3].."_preview.png;fe"..skins[3]..";]"..
			"image_button_exit[3.5,2;1.1,2;fe"..skins[4].."_preview.png;fe"..skins[4]..";]"..
			"image_button_exit[4.5,2;1.1,2;fe"..skins[5].."_preview.png;fe"..skins[5]..";]"..
			"vertlabel[0,5.2;STORAGE]"..
			"list[current_name;main;0.5,4.5;5,2;]"..
			"list[current_player;main;0.5,6.8;5,2;]")
		meta:set_string("infotext", "Wardrobe")
		local inv = meta:get_inventory()
		inv:set_size("main", 5*2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in wardrobe at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in wardrobe at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from wardrobe at "..minetest.pos_to_string(pos))
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local formats = {".x", ".b3d" }
		local skins = {"male1", "male2", "male3", "male4", "male5"}
		local skin = ""

		if fields[skins[1]] then
			skin = skins[1]..".png"
		elseif fields[skins[2]] then
			skin = skins[2]..".png"
		elseif fields[skins[3]] then
			skin = skins[3]..".png"
		elseif fields[skins[4]] then
			skin = skins[4]..".png"
		elseif fields[skins[5]] then
			skin = skins[5]..".png"
		elseif fields["fe"..skins[1]] then
			skin = "fe"..skins[1]..".png"
		elseif fields["fe"..skins[2]] then
			skin = "fe"..skins[2]..".png"
		elseif fields["fe"..skins[3]] then
			skin = "fe"..skins[3]..".png"
		elseif fields["fe"..skins[4]] then
			skin = "fe"..skins[4]..".png"
		elseif fields["fe"..skins[5]] then
			skin = "fe"..skins[5]..".png"
		else
			return
		end

		default.player_set_textures(sender, { skin })
	end
})

minetest.register_alias("homedecor:wardrobe_bottom", "homedecor:wardrobe")
minetest.register_alias("homedecor:wardrobe_top", "air")
