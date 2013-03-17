-- Various kinds of tables

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

minetest.register_node('homedecor:glass_table_large', {
	description = S("Large Glass Table Piece"),
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
	description = S("Glass Table (Small, Round)"),
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
	description = S("Glass Table (Small, Square)"),
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

minetest.register_node('homedecor:utility_table_top', {
	description = S("Utility Table"),
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

minetest.register_node('homedecor:wood_table_large', {
	description = S("Wooden Tabletop piece"),
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
	description = S("Wooden Tabletop (Small, Round)"),
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
	description = S("Wooden Tabletop (Small, Square)"),
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

-- Various kinds of table legs

minetest.register_node("homedecor:table_legs_brass", {
        description = S("Brass Table Legs"),
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
        description = S("Brass Table Legs"),
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

minetest.register_node('homedecor:utility_table_legs', {
	description = S("Legs for Utility Table"),
	drawtype = "plantlike",
	tiles = { 'homedecor_utility_table_legs.png' },
	inventory_image = 'homedecor_utility_table_legs_inv.png',
	wield_image = 'homedecor_utility_table_legs.png',
	visual_scale = 1.04,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

