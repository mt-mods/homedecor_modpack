
-- This file supplies glowlights

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- Yellow

minetest.register_node('homedecor:glowlight_thick_yellow', {
	description = S("Yellow Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_thick_yellow_sides.png',
		'homedecor_glowlight_thick_yellow_sides.png',
		'homedecor_glowlight_thick_yellow_sides.png',
		'homedecor_glowlight_thick_yellow_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thick_yellow_wall', {
	description = S("Yellow Glowlight (thick, on wall)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_thick_yellow_sides.png',
		'homedecor_glowlight_thick_yellow_sides.png',
		'homedecor_glowlight_thick_yellow_wall_sides.png',
		'homedecor_glowlight_thick_yellow_wall_sides.png',
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_yellow_tb.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
        },
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thin_yellow', {
	description = S("Yellow Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_thin_yellow_sides.png',
		'homedecor_glowlight_thin_yellow_sides.png',
		'homedecor_glowlight_thin_yellow_sides.png',
		'homedecor_glowlight_thin_yellow_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, 0.25, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, 0.25, -0.5, 0.5, 0.5, 0.5 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thin_yellow_wall', {
	description = S("Yellow Glowlight (thin, on wall)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_thin_yellow_sides.png',
		'homedecor_glowlight_thin_yellow_sides.png',
		'homedecor_glowlight_thin_yellow_wall_sides.png',
		'homedecor_glowlight_thin_yellow_wall_sides.png',
		'homedecor_glowlight_yellow_tb.png',
		'homedecor_glowlight_yellow_tb.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.25, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.25, 0.5, 0.5, 0.5 }
        },
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_small_cube_yellow', {
	description = S("Yellow Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_cube_yellow_tb.png',
		'homedecor_glowlight_cube_yellow_tb.png',
		'homedecor_glowlight_cube_yellow_sides.png',
		'homedecor_glowlight_cube_yellow_sides.png',
		'homedecor_glowlight_cube_yellow_sides.png',
		'homedecor_glowlight_cube_yellow_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_small_cube_yellow_ceiling', {
	description = S("Yellow Glowlight (small cube, on ceiling)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_cube_yellow_tb.png',
		'homedecor_glowlight_cube_yellow_tb.png',
		'homedecor_glowlight_cube_yellow_sides_ceiling.png',
		'homedecor_glowlight_cube_yellow_sides_ceiling.png',
		'homedecor_glowlight_cube_yellow_sides_ceiling.png',
		'homedecor_glowlight_cube_yellow_sides_ceiling.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.25, 0, -0.25, 0.25, 0.5, 0.25 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.25, 0, -0.25, 0.25, 0.5, 0.25 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

-- White

minetest.register_node('homedecor:glowlight_thick_white', {
	description = S("White Glowlight (thick)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_thick_white_sides.png',
		'homedecor_glowlight_thick_white_sides.png',
		'homedecor_glowlight_thick_white_sides.png',
		'homedecor_glowlight_thick_white_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thick_white_wall', {
	description = S("White Glowlight (thick, on wall)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_thick_white_sides.png',
		'homedecor_glowlight_thick_white_sides.png',
		'homedecor_glowlight_thick_white_wall_sides.png',
		'homedecor_glowlight_thick_white_wall_sides.png',
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_white_tb.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
        },
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thin_white', {
	description = S("White Glowlight (thin)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_thin_white_sides.png',
		'homedecor_glowlight_thin_white_sides.png',
		'homedecor_glowlight_thin_white_sides.png',
		'homedecor_glowlight_thin_white_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, 0.25, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, 0.25, -0.5, 0.5, 0.5, 0.5 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_thin_white_wall', {
	description = S("White Glowlight (thin, on wall)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_thin_white_sides.png',
		'homedecor_glowlight_thin_white_sides.png',
		'homedecor_glowlight_thin_white_wall_sides.png',
		'homedecor_glowlight_thin_white_wall_sides.png',
		'homedecor_glowlight_white_tb.png',
		'homedecor_glowlight_white_tb.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.25, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.25, 0.5, 0.5, 0.5 }
        },
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_small_cube_white', {
	description = S("White Glowlight (small cube)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_cube_white_tb.png',
		'homedecor_glowlight_cube_white_tb.png',
		'homedecor_glowlight_cube_white_sides.png',
		'homedecor_glowlight_cube_white_sides.png',
		'homedecor_glowlight_cube_white_sides.png',
		'homedecor_glowlight_cube_white_sides.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:glowlight_small_cube_white_ceiling', {
	description = S("White Glowlight (small cube, on ceiling)"),
	drawtype = "nodebox",
	tiles = {
		'homedecor_glowlight_cube_white_tb.png',
		'homedecor_glowlight_cube_white_tb.png',
		'homedecor_glowlight_cube_white_sides_ceiling.png',
		'homedecor_glowlight_cube_white_sides_ceiling.png',
		'homedecor_glowlight_cube_white_sides_ceiling.png',
		'homedecor_glowlight_cube_white_sides_ceiling.png'
	},
        selection_box = {
                type = "fixed",
                fixed = { -0.25, 0, -0.25, 0.25, 0.5, 0.25 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.25, 0, -0.25, 0.25, 0.5, 0.25 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	walkable = true,
	groups = { snappy = 3 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_leaves_defaults(),
})
