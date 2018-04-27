
local S = homedecor_i18n.gettext

local wd_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
}

-- cache set_textures function (fallback to old version)
-- default.player_set_textures is deprecated and will be removed in future
local set_player_textures =
	minetest.get_modpath("player_api") and player_api.set_textures
	or default.player_set_textures

local armor_mod_path = minetest.get_modpath("3d_armor")
local skins = {"male1", "male2", "male3", "male4", "male5"}
local skin_updates = {} -- skin update queue

local function set_player_skin(player, skin)
	minetest.log("verbose",
		S("player @1 sets skin to @2", player:get_player_name(), skin) ..
		(armor_mod_path and ' [armor]' or '')
	)
	if armor_mod_path then -- if 3D_armor's installed, let it set the skin
		armor.textures[player:get_player_name()].skin = skin
		armor:update_player_visuals(player)
	else
		set_player_textures(player, { skin })
	end
end

homedecor.register("wardrobe", {
	mesh = "homedecor_bedroom_wardrobe.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_wardrobe_drawers.png",
		"homedecor_wardrobe_doors.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",
	description = S("Wardrobe"),
	groups = {snappy=3},
	selection_box = wd_cbox,
	collision_box = wd_cbox,
	sounds = default.node_sound_wood_defaults(),
	expand = { top="placeholder" },
	on_rotate = screwdriver.rotate_simple,
	infotext = S("Wardrobe"),
	inventory = {
		size = 10
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		-- textures made by the Minetest community (mostly Calinou and Jordach)
		local clothes_strings = ""
		for i = 1,5 do
			clothes_strings = clothes_strings..
			  "image_button_exit["..(i-1)..".5,0;1.1,2;homedecor_clothes_"..skins[i].."_preview.png;"..skins[i]..";]"..
			  "image_button_exit["..(i-1)..".5,2;1.1,2;homedecor_clothes_fe"..skins[i].."_preview.png;fe"..skins[i]..";]"
		end
		meta:set_string("formspec", "size[5.5,8.5]"..default.gui_bg..default.gui_bg_img..default.gui_slots..
			"vertlabel[0,0.5;"..minetest.formspec_escape(S("Clothes")).."]"..
			clothes_strings..
			"vertlabel[0,5.2;"..minetest.formspec_escape(S("Storage")).."]"..
			"list[current_name;main;0.5,4.5;5,2;]"..
			"list[current_player;main;0.5,6.8;5,2;]" ..
			"listring[]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		for i = 1,5 do
			if fields[skins[i]] then
				set_player_skin(sender, "homedecor_clothes_"..skins[i]..".png")
				sender:set_attribute("homedecor:player_skin", "homedecor_clothes_"..skins[i]..".png")
				break
			elseif fields["fe"..skins[i]] then
				set_player_skin(sender, "homedecor_clothes_fe"..skins[i]..".png")
				sender:set_attribute("homedecor:player_skin", "homedecor_clothes_fe"..skins[i]..".png")
				break
			end
		end
	end
})

minetest.register_alias("homedecor:wardrobe_bottom", "homedecor:wardrobe")
minetest.register_alias("homedecor:wardrobe_top", "air")

minetest.register_on_joinplayer(function(player)
	local skin = player:get_attribute("homedecor:player_skin")
	if skin ~= nil then
		-- setting player skin on connect has no effect, so queue skin change for next game step
		table.insert(skin_updates, {player, skin})
	end
end)

minetest.register_globalstep(function(dtime)
	-- if skin update queue is filled
	if #skin_updates > 0 then
		-- update player skins
		for _,u in pairs(skin_updates) do
			set_player_skin(u[1], u[2])
		end
		skin_updates = {} -- empty queue
	end
end)
