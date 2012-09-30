-- This file adds fences of various types

minetest.register_node("homedecor:fence_brass", {
        description = "Brass Fence/railing",
        drawtype = "fencelike",
        tiles = {"homedecor_tile_brass.png"},
        inventory_image = "homedecor_fence_brass.png",
        wield_image = "homedecor_pole_brass.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
        },
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

minetest.register_node("homedecor:fence_wrought_iron", {
        description = "Wrought Iron Fence/railing",
        drawtype = "fencelike",
        tiles = {"homedecor_tile_wrought_iron.png"},
        inventory_image = "homedecor_fence_wrought_iron.png",
        wield_image = "homedecor_pole_wrought_iron.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
        },
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

minetest.register_node("homedecor:fence_picket", {
        description = "Unpainted Picket Fence",
        tiles = {"homedecor_fence_picket.png"},
        inventory_image = "homedecor_fence_picket.png",
        wield_image = "homedecor_fence_picket.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_node("homedecor:fence_picket_white", {
        description = "White Picket Fence",
        tiles = {"homedecor_fence_picket_white.png"},
        inventory_image = "homedecor_fence_picket_white.png",
        wield_image = "homedecor_fence_picket_white.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_node("homedecor:fence_privacy", {
        description = "Wooden Privacy Fence",
        tiles = {"homedecor_fence_privacy.png"},
        inventory_image = "homedecor_fence_privacy.png",
        wield_image = "homedecor_fence_privacy.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_node("homedecor:fence_barbed_wire", {
        description = "Barbed Wire Fence",
        tiles = {"homedecor_fence_barbed_wire.png"},
        inventory_image = "homedecor_fence_barbed_wire.png",
        wield_image = "homedecor_fence_barbed_wire.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
	},
})

