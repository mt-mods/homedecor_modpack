-- Various kinds of window shutters

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

minetest.register_node('homedecor:shutter_black', {
	description = S("Wooden Shutter (Black)"),
	tiles = { 'homedecor_window_shutter_black.png' },
	inventory_image = 'homedecor_window_shutter_black.png',
	wield_image = 'homedecor_window_shutter_black.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_mahogany', {
	description = S("Wooden Shutter (Unpainted Mahogany)"),
	tiles = { 'homedecor_window_shutter_mahogany.png' },
	inventory_image = 'homedecor_window_shutter_mahogany.png',
	wield_image = 'homedecor_window_shutter_mahogany.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_oak', {
	description = S("Wooden Shutter (Unpainted Oak)"),
	tiles = { 'homedecor_window_shutter_oak.png' },
	inventory_image = 'homedecor_window_shutter_oak.png',
	wield_image = 'homedecor_window_shutter_oak.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_dark_grey', {
	description = S("Wooden Shutter (Dark Grey)"),
	tiles = { 'homedecor_window_shutter_dark_grey.png' },
	inventory_image = 'homedecor_window_shutter_dark_grey.png',
	wield_image = 'homedecor_window_shutter_dark_grey.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_forest_green', {
	description = S("Wooden Shutter (Forest Green)"),
	tiles = { 'homedecor_window_shutter_forest_green.png' },
	inventory_image = 'homedecor_window_shutter_forest_green.png',
	wield_image = 'homedecor_window_shutter_forest_green.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_grey', {
	description = S("Wooden Shutter (Grey)"),
	tiles = { 'homedecor_window_shutter_grey.png' },
	inventory_image = 'homedecor_window_shutter_grey.png',
	wield_image = 'homedecor_window_shutter_grey.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_light_blue', {
	description = S("Wooden Shutter (Light Blue)"),
	tiles = { 'homedecor_window_shutter_light_blue.png' },
	inventory_image = 'homedecor_window_shutter_light_blue.png',
	wield_image = 'homedecor_window_shutter_light_blue.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_violet', {
	description = S("Wooden Shutter (Violet)"),
	tiles = { 'homedecor_window_shutter_violet.png' },
	inventory_image = 'homedecor_window_shutter_violet.png',
	wield_image = 'homedecor_window_shutter_violet.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_red', {
	description = S("Wooden Shutter (Red)"),
	tiles = { 'homedecor_window_shutter_red.png' },
	inventory_image = 'homedecor_window_shutter_red.png',
	wield_image = 'homedecor_window_shutter_red.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_white', {
	description = S("Wooden Shutter (White)"),
	tiles = { 'homedecor_window_shutter_white.png' },
	inventory_image = 'homedecor_window_shutter_white.png',
	wield_image = 'homedecor_window_shutter_white.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:shutter_yellow', {
	description = S("Wooden Shutter (Yellow)"),
	tiles = { 'homedecor_window_shutter_yellow.png' },
	inventory_image = 'homedecor_window_shutter_yellow.png',
	wield_image = 'homedecor_window_shutter_yellow.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_alias("homedecor:shutter_purple", "homedecor:shutter_violet")
