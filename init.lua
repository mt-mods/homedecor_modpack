-- Home Decor mod by VanessaE
-- 2012-09-30
--
-- Mostly my own code, with bits and pieces lifted from Minetest's default
-- lua files and from ironzorg's flowers mod.  Many thanks to GloopMaster
-- for helping me figure out the inventories used in the nightstands/dressers.
--
-- The code for ovens, nightstands, refrigerators are basically modified 
-- copies of the code for chests and furnaces.
--
-- License: LGPL
--

dofile(minetest.get_modpath("homedecor").."/door_wood_plain.lua")
dofile(minetest.get_modpath("homedecor").."/door_glass.lua")
dofile(minetest.get_modpath("homedecor").."/door_glass_and_wood.lua")
dofile(minetest.get_modpath("homedecor").."/door_glass_and_wood_mahogany.lua")
dofile(minetest.get_modpath("homedecor").."/door_glass_and_wood_white.lua")
dofile(minetest.get_modpath("homedecor").."/door_exterior_fancy.lua")
dofile(minetest.get_modpath("homedecor").."/door_closet_oak.lua")
dofile(minetest.get_modpath("homedecor").."/door_closet_mahogany.lua")

dofile(minetest.get_modpath("homedecor").."/lighting.lua")
dofile(minetest.get_modpath("homedecor").."/fences.lua")
dofile(minetest.get_modpath("homedecor").."/kitchen_cabinet.lua")
dofile(minetest.get_modpath("homedecor").."/refrigerator.lua")
dofile(minetest.get_modpath("homedecor").."/oven.lua")
dofile(minetest.get_modpath("homedecor").."/nightstands.lua")
dofile(minetest.get_modpath("homedecor").."/television.lua")

dofile(minetest.get_modpath("homedecor").."/crafts.lua")

local DEBUG = 0

-- Local Functions

local dbg = function(s)
	if DEBUG == 1 then
		print('[HomeDecor] ' .. s)
	end
end

-- Nodes

minetest.register_node('homedecor:shingles_wood', {
	description = "Wood Shingles",
	drawtype = 'raillike',
	tiles = { 'homedecor_shingles_wood.png' },
	wield_image = 'homedecor_shingles_wood.png',
	inventory_image = 'homedecor_shingles_wood.png',
	paramtype = 'light',
	sunlight_propagates = false,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:skylight', {
	description = "Glass Skylight",
	drawtype = 'raillike',
	tiles = { 'default_glass.png' },
	wield_image = 'default_glass.png',
	inventory_image = 'default_glass.png',
	paramtype = 'light',
	sunlight_propagates = true,
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:shingles_asphalt', {
	description = "Asphalt Shingles",
	drawtype = 'raillike',
	tiles = { 'homedecor_shingles_asphalt.png' },
	wield_image = 'homedecor_shingles_asphalt.png',
	inventory_image = 'homedecor_shingles_asphalt.png',
	paramtype = 'light',
	sunlight_propagates = false,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:shingles_terracotta', {
	description = "Terracotta Roofing",
	drawtype = 'raillike',
	tiles = { 'homedecor_shingles_terracotta.png' },
	wield_image = 'homedecor_shingles_terracotta.png',
	inventory_image = 'homedecor_shingles_terracotta.png',
	paramtype = 'light',
	sunlight_propagates = false,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        drop = 'homedecor:roof_tile_terracotta 4',

})

minetest.register_node('homedecor:projection_screen', {
	description = "Projection Screen Material",
	drawtype = 'signlike',
	tiles = { 'homedecor_projection_screen.png' },
	wield_image = 'homedecor_projection_screen_inv.png',
	inventory_image = 'homedecor_projection_screen_inv.png',
	sunlight_propagates = false,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

minetest.register_node('homedecor:ceiling_paint', {
	description = "Textured Ceiling Paint",
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_paint.png' },
	inventory_image = 'homedecor_ceiling_paint_roller.png',
	wield_image = 'homedecor_ceiling_paint_roller.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:ceiling_tile', {
	description = "Drop-Ceiling Tile",
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_tile.png' },
	wield_image = 'homedecor_ceiling_tile.png',
	inventory_image = 'homedecor_ceiling_tile.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:rug_small', {
	description = "Small Throw Rug",
	drawtype = 'signlike',
	tiles = { 'homedecor_rug_small.png' },
	wield_image = 'homedecor_rug_small.png',
	inventory_image = 'homedecor_rug_small.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:rug_large', {
	description = "Large Area Rug",
	drawtype = 'signlike',
	tiles = { 'homedecor_rug_large.png' },
	wield_image = 'homedecor_rug_large.png',
	inventory_image = 'homedecor_rug_large.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
	})

minetest.register_node('homedecor:glass_table_large', {
	description = "Large Glass Table Piece",
	drawtype = 'signlike',
	tiles = { 'homedecor_glass_table_large.png' },
	wield_image = 'homedecor_glass_table_large.png',
	inventory_image = 'homedecor_glass_table_large.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = "wallmounted",
	is_ground_content = true,
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:glass_table_small_round', {
	description = "Glass Table (Small, Round)",
	drawtype = 'signlike',
	tiles = { 'homedecor_glass_table_small_round.png' },
	wield_image = 'homedecor_glass_table_small_round.png',
	inventory_image = 'homedecor_glass_table_small_round.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:glass_table_small_square', {
	description = "Glass Table (Small, Square)",
	drawtype = 'signlike',
	tiles = { 'homedecor_glass_table_small_square.png' },
	wield_image = 'homedecor_glass_table_small_square.png',
	inventory_image = 'homedecor_glass_table_small_square.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node("homedecor:table_legs_brass", {
        description = "Brass Table Legs",
        drawtype = "plantlike",
        tiles = {"homedecor_table_legs_brass.png"},
        inventory_image = "homedecor_table_legs_brass.png",
        wield_image = "homedecor_table_legs_brass.png",
	visual_scale = 1.04,
        paramtype = "light",
        walkable = false,
        groups = {snappy=3},
        sounds = default.node_sound_leaves_defaults(),
	walkable = true,
})

minetest.register_node("homedecor:table_legs_wrought_iron", {
        description = "Brass Table Legs",
        drawtype = "plantlike",
        tiles = {"homedecor_table_legs_wrought_iron.png"},
        inventory_image = "homedecor_table_legs_wrought_iron.png",
        wield_image = "homedecor_table_legs_wrought_iron.png",
	visual_scale = 1.04,
        paramtype = "light",
        walkable = false,
        groups = {snappy=3},
        sounds = default.node_sound_leaves_defaults(),
	walkable = true,
})

minetest.register_node('homedecor:stereo', {
	description = "Stereo Receiver",
	tiles = { 'homedecor_stereo_top.png',
			'homedecor_stereo_bottom.png',
			'homedecor_stereo_right.png',
			'homedecor_stereo_left.png',
			'homedecor_stereo_back.png',
			'homedecor_stereo_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:utility_table_top', {
	description = "Utility Table",
	tiles = { 'homedecor_utility_table_top.png' },
	inventory_image = 'homedecor_utility_table_top.png',
	wield_image = 'homedecor_utility_table_top.png',
	drawtype = "signlike",
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = "wallmounted",
	is_ground_content = true,
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },

})

minetest.register_node('homedecor:utility_table_legs', {
	description = "Legs for Utility Table",
	tiles = { 'homedecor_utility_table_legs.png' },
	inventory_image = 'homedecor_utility_table_legs_inv.png',
	wield_image = 'homedecor_utility_table_legs.png',
	visual_scale = 1.04,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	drawtype = "plantlike",
})

minetest.register_node('homedecor:flower_pot_terracotta', {
	description = "Terracotta Flower Pot",
	tiles = { 'homedecor_flower_pot_terracotta_top.png',
			'homedecor_flower_pot_terracotta_bottom.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png',
			'homedecor_flower_pot_terracotta_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_black', {
	description = "Black Plastic Flower Pot",
	tiles = { 'homedecor_flower_pot_black_top.png',
			'homedecor_flower_pot_black_bottom.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png',
			'homedecor_flower_pot_black_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_green', {
	description = "Green Plastic Flower Pot",
	tiles = { 'homedecor_flower_pot_green_top.png',
			'homedecor_flower_pot_green_bottom.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png',
			'homedecor_flower_pot_green_sides.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:wood_table_large', {
	description = "Wooden Tabletop piece",
	tiles = { 'homedecor_wood_table_large.png' },
	inventory_image = 'homedecor_wood_table_large.png',
	wield_image = 'homedecor_wood_table_large.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = "wallmounted",
	is_ground_content = true,
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:wood_table_small_round', {
	description = "Wooden Tabletop (Small, Round)",
	tiles = { 'homedecor_wood_table_small_round.png' },
	inventory_image = 'homedecor_wood_table_small_round.png',
	wield_image = 'homedecor_wood_table_small_round.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = "wallmounted",
	is_ground_content = true,
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:wood_table_small_square', {
	description = "Wooden Tabletop (Small, Square)",
	tiles = { 'homedecor_wood_table_small_square.png' },
	inventory_image = 'homedecor_wood_table_small_square.png',
	wield_image = 'homedecor_wood_table_small_square.png',
	drawtype = 'signlike',
	sunlight_propagates = false,
	paramtype = "light",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = "wallmounted",
	is_ground_content = true,
        selection_box = {
			type = "wallmounted",
                         --wall_top = <default>
                         --wall_bottom = <default>
                         --wall_side = <default>
                        },
})

minetest.register_node('homedecor:shutter_black', {
	description = "Wooden Shutter (Black)",
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
	description = "Wooden Shutter (Unpainted Mahogany)",
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
	description = "Wooden Shutter (Unpainted Oak)",
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
	description = "Wooden Shutter (Dark Grey)",
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
	description = "Wooden Shutter (Forest Green)",
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
	description = "Wooden Shutter (Grey)",
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
	description = "Wooden Shutter (Light Blue)",
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

minetest.register_node('homedecor:shutter_purple', {
	description = "Wooden Shutter (Purple)",
	tiles = { 'homedecor_window_shutter_purple.png' },
	inventory_image = 'homedecor_window_shutter_purple.png',
	wield_image = 'homedecor_window_shutter_purple.png',
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
	description = "Wooden Shutter (Red)",
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
	description = "Wooden Shutter (White)",
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
	description = "Wooden Shutter (Yellow)",
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


minetest.register_node('homedecor:utilitytable2', {
	description = "Utility table mk2",
	tiles = { 'homedecor_utility_table_top.png',
			'homedecor_blanktile.png',
			'homedecor_utility_table_legs.png',
			'homedecor_utility_table_legs.png',
			'homedecor_utility_table_legs.png',
			'homedecor_utility_table_legs.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

-- cylinder-shaped objects courtesy Jeija

local cylbox = {}
local detail = 50
local sehne
local size = 0.2

for i = 1, detail-1 do
        sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
        cylbox[i]={((i/detail)-0.5)*size, -0.5, -sehne*size, ((i/detail)+(1/detail)-0.5)*size, 0.5, sehne*size}
end

minetest.register_node("homedecor:pole_brass", {
        description = "Brass Pole",
        drawtype = "nodebox",
        tiles = {"homedecor_tile_brass2.png"},
        inventory_image = "homedecor_pole_brass2.png",
        wield_image = "homedecor_pole_brass2.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-size/2, -0.5, -size/2, size/2, 0.5, size/2},
        },
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = cylbox,
	}
})
	
minetest.register_node("homedecor:pole_wrought_iron", {
        description = "Wrought Iron Pole",
        drawtype = "nodebox",
        tiles = {"homedecor_tile_wrought_iron2.png"},
        inventory_image = "homedecor_pole_wrought_iron.png",
        wield_image = "homedecor_pole_wrought_iron.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
        },
	node_box = {
		type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
	},
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

minetest.register_node('homedecor:speaker', {
	description = "Large Stereo Speaker",
	tiles = { 'homedecor_speaker_top.png',
			'homedecor_speaker_bottom.png',
			'homedecor_speaker_right.png',
			'homedecor_speaker_left.png',
			'homedecor_speaker_back.png',
			'homedecor_speaker_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:speaker_small', {
	description = "Small Surround Speaker",
	drawtype = "nodebox",
	tiles = {
		'homedecor_speaker_top.png',
		'homedecor_speaker_bottom.png',
		'homedecor_speaker_right.png',
		'homedecor_speaker_left.png',
		'homedecor_speaker_back.png',
		'homedecor_speaker_front.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.2, -0.5, 0, 0.2, 0, 0.4 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.2, -0.5, 0, 0.2, 0, 0.4 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

--

local curtaincolors = {
	"red",
	"green",
	"blue",
	"white",
	"pink",
	"violet"
}

for c in ipairs(curtaincolors) do
	local color = curtaincolors[c]

minetest.register_node("homedecor:curtain_"..color, {
	description = "Curtains ("..color..")",
	tiles = { "homedecor_curtain_"..color..".png" },
	inventory_image = "homedecor_curtain_"..color..".png",
	wield_image = "homedecor_curtain_"..color..".png",
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

end

print("[HomeDecor] Loaded!")
