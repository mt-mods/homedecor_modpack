
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
	sounds = default.node_sound_wood_defaults(),

	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_yellow_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_yellow_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'homedecor:glowlight_thick_yellow'
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
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_yellow_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_yellow_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'homedecor:glowlight_thin_yellow'
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
	sounds = default.node_sound_wood_defaults(),

	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x == under.x and above.z == under.z and pitch > 0 then
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_yellow_ceiling'})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x == under.x and above.z == under.z and pitch > 0 then
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_yellow_ceiling'})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_yellow'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = "homedecor:glowlight_small_cube_yellow",
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
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_white_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_white_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thick_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'homedecor:glowlight_thick_white'
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
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_white_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_white_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_thin_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'homedecor:glowlight_thin_white'
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
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x == under.x and above.z == under.z and pitch > 0 then
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_white_ceiling'})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
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
	groups = { snappy = 3, not_in_creative_inventory=1 },
	light_source = LIGHT_MAX-1,
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x == under.x and above.z == under.z and pitch > 0 then
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_white_ceiling'})
			else
				minetest.env:add_node(above, {name = 'homedecor:glowlight_small_cube_white'})
			end
			if not homedecor_expect_infinite_stacks then
				itemstack:take_item()
				return itemstack
			end
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = "homedecor:glowlight_small_cube_white",
})
