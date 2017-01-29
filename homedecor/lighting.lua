-- This file supplies glowlights

local dirs2 = { 9, 18, 7, 12 }

local S = homedecor.gettext

local function N_(x) return x end

local colors = { N_("yellow"), N_("white") }

local glowlight_nodebox = {
	half = homedecor.nodebox.slab_y(1/2),
	quarter = homedecor.nodebox.slab_y(1/4),
	small_cube = {
			type = "fixed",
			fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
}

homedecor.register("glowlight_half", {
	description = S("Thick Glowlight"),
	tiles = {
		"homedecor_glowlight_top.png",
		"homedecor_glowlight_bottom.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png",
		"homedecor_glowlight_thick_sides.png"
	},
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = glowlight_nodebox.half,
	node_box = glowlight_nodebox.half,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node,
	after_dig_node = unifieddyes.after_dig_node,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		unifieddyes.on_rightclick(pos, node, clicker,
		  itemstack, pointed_thing, "glowlight_half", "wallmounted")
	end,
})

homedecor.register("glowlight_quarter", {
	description = S("Thin Glowlight"),
	tiles = {
		"homedecor_glowlight_top.png",
		"homedecor_glowlight_bottom.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png",
		"homedecor_glowlight_thin_sides.png"
	},
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = glowlight_nodebox.quarter,
	node_box = glowlight_nodebox.quarter,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node,
	after_dig_node = unifieddyes.after_dig_node,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		unifieddyes.on_rightclick(pos, node, clicker,
		  itemstack, pointed_thing, "glowlight_half", "wallmounted")
	end,
})

homedecor.register("glowlight_small_cube", {
	description = S("Small Glowlight Cube"),
	tiles = {
		"homedecor_glowlight_cube_tb.png",
		"homedecor_glowlight_cube_tb.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png",
		"homedecor_glowlight_cube_sides.png"
	},
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = glowlight_nodebox.small_cube,
	node_box = glowlight_nodebox.small_cube,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node,
	after_dig_node = unifieddyes.after_dig_node,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		unifieddyes.on_rightclick(pos, node, clicker,
		  itemstack, pointed_thing, "glowlight_small_cube", "wallmounted")
	end,
})


homedecor.register("plasma_lamp", {
	description = S("Plasma Lamp"),
	drawtype = "glasslike_framed",
	tiles = {"default_gold_block.png","homedecor_glass_face_clean.png"},
	special_tiles = {
		{
			name="homedecor_plasma_storm.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		}
	},
	use_texture_alpha = true,
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		minetest.swap_node(pos, {name = "homedecor:plasma_lamp", param2 = 255})
	end
})

homedecor.register("plasma_ball", {
	description = S("Plasma Ball"),
	mesh = "homedecor_plasma_ball.obj",
	tiles = {
		"homedecor_generic_plastic.png",
		{
			name = "homedecor_plasma_ball_streamers.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
		"homedecor_plasma_ball_glass.png"
	},
	inventory_image = "homedecor_plasma_ball_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875 }
	},
	walkable = false,
	use_texture_alpha = true,
	light_source = default.LIGHT_MAX - 5,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

local tc_cbox = {
	type = "fixed",
	fixed = {
		{ -0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875 },
	}
}

homedecor.register("candle", {
	description = S("Thick Candle"),
	mesh = "homedecor_candle_thick.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_inv.png",
	selection_box = tc_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local c_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0.05, 0.125 },
	}
}

homedecor.register("candle_thin", {
	description = S("Thin Candle"),
	mesh = "homedecor_candle_thin.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_thin_inv.png",
	selection_box = c_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local cs_cbox = {
	type = "fixed",
	fixed = {
		{ -0.15625, -0.5, -0.15625, 0.15625, 0.3125, 0.15625 },
	}
}

homedecor.register("candlestick_wrought_iron", {
	description = S("Candlestick (wrought iron)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_wrought_iron.png",
	},
	inventory_image = "homedecor_candlestick_wrought_iron_inv.png",
	selection_box = cs_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

homedecor.register("candlestick_brass", {
	description = S("Candlestick (brass)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_brass.png",
	},
	inventory_image = "homedecor_candlestick_brass_inv.png",
	selection_box = cs_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

homedecor.register("wall_sconce", {
	description = S("Wall sconce"),
	mesh = "homedecor_wall_sconce.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		'homedecor_wall_sconce_back.png',
		'homedecor_generic_metal_wrought_iron.png',
	},
	inventory_image = "homedecor_wall_sconce_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.1875, -0.25, 0.3125, 0.1875, 0.25, 0.5 }
	},
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-4,
})

local ol_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16, -8/16, -3/16, 5/16, 4/16, 3/16 },
	}
}

homedecor.register("oil_lamp", {
	description = S("Oil lamp (hurricane)"),
	mesh = "homedecor_oil_lamp.obj",
	tiles = {
		"homedecor_generic_metal_brass.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		{ name = "homedecor_generic_metal.png", color = 0xffa00000 },
		"homedecor_oil_lamp_wick.png",
		{ name = "homedecor_generic_metal.png", color = 0xffa00000 },
		"homedecor_oil_lamp_glass.png",
	},
	use_texture_alpha = true,
	inventory_image = "homedecor_oil_lamp_inv.png",
	selection_box = ol_cbox,
	walkable = false,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-3,
	sounds = default.node_sound_glass_defaults(),
})

homedecor.register("oil_lamp_tabletop", {
	description = S("Oil Lamp (tabletop)"),
	mesh = "homedecor_oil_lamp_tabletop.obj",
	tiles = {"homedecor_oil_lamp_tabletop.png"},
	inventory_image = "homedecor_oil_lamp_tabletop_inv.png",
	selection_box = ol_cbox,
	collision_box = ol_cbox,
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-3,
	sounds = default.node_sound_glass_defaults(),
})

local gl_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.45, 0.25 },
}

minetest.register_alias("homedecor:wall_lantern", "homedecor:ground_lantern")

homedecor.register("ground_lantern", {
	description = S("Ground Lantern"),
	mesh = "homedecor_ground_lantern.obj",
	tiles = { "homedecor_light.png", "homedecor_generic_metal_wrought_iron.png" },
	use_texture_alpha = true,
	inventory_image = "homedecor_ground_lantern_inv.png",
	wield_image = "homedecor_ground_lantern_inv.png",
	groups = {snappy=3},
	light_source = 11,
	selection_box = gl_cbox,
	walkable = false
})

local hl_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.2, 0.25, 0.5, 0.5 },
}

homedecor.register("hanging_lantern", {
	description = S("Hanging Lantern"),
	mesh = "homedecor_hanging_lantern.obj",
	tiles = { "homedecor_generic_metal_wrought_iron.png", "homedecor_light.png" },
	use_texture_alpha = true,
	inventory_image = "homedecor_hanging_lantern_inv.png",
	wield_image = "homedecor_hanging_lantern_inv.png",
	groups = {snappy=3},
	light_source = 11,
	selection_box = hl_cbox,
	walkable = false
})

local cl_cbox = {
	type = "fixed",
	fixed = { -0.35, -0.45, -0.35, 0.35, 0.5, 0.35 }
}

homedecor.register("ceiling_lantern", {
	drawtype = "mesh",
	mesh = "homedecor_ceiling_lantern.obj",
	tiles = { "homedecor_light.png", "homedecor_generic_metal_wrought_iron.png" },
	use_texture_alpha = true,
	inventory_image = "homedecor_ceiling_lantern_inv.png",
	description = "Ceiling Lantern",
	groups = {snappy=3},
	light_source = 11,
	selection_box = cl_cbox,
	walkable = false
})

homedecor.register("lattice_lantern_large", {
	description = S("Lattice lantern (large)"),
	tiles = { 'homedecor_lattice_lantern_large.png' },
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_glass_defaults(),
})

homedecor.register("lattice_lantern_small", {
	description = S("Lattice lantern (small)"),
	tiles = {
		'homedecor_lattice_lantern_small_tb.png',
		'homedecor_lattice_lantern_small_tb.png',
		'homedecor_lattice_lantern_small_sides.png'
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
	node_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
	},
	groups = { snappy = 3 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node
})

local repl = {
	["off"] ="low",
	["low"] ="med",
	["med"] ="hi",
	["hi"]  ="max",
	["max"] ="off",
}

local lamp_colors = {
	"white",
	"blue",
	"green",
	"pink",
	"red",
	"violet",
}

local tlamp_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }
}

local slamp_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 1.5, 0.25 }
}

local brightness_tab = {
	0xffd0d0d0,
	0xffd8d8d8,
	0xffe0e0e0,
	0xffe8e8e8,
	0xffffffff,
}

local function reg_lamp(suffix, nxt, light, brightness)

	local wool_brighten = (light or 0) * 15

	homedecor.register("table_lamp_"..suffix, {
		description = S("Table Lamp"),
		mesh = "homedecor_table_lamp.obj",
		tiles = {
			"wool_grey.png^[colorize:#ffffff:"..wool_brighten,
			{ name = "homedecor_table_standing_lamp_lightbulb.png", color = brightness_tab[brightness] },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_table_lamp_foot_inv.png^homedecor_table_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "unifieddyes_palette.png",
		walkable = false,
		light_source = light,
		selection_box = tlamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		groups = {cracky=2,oddly_breakable_by_hand=1,
			not_in_creative_inventory=((light ~= nil) and 1) or nil,
		},
		drop = "homedecor:table_lamp_off",
		on_punch = function(pos, node, puncher)
			node.name = "homedecor:table_lamp_"..repl[suffix]
			minetest.set_node(pos, node)
		end,
		after_dig_node = unifieddyes.after_dig_node,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			unifieddyes.on_rightclick(pos, node, clicker,
			  itemstack, pointed_thing, "homedecor:table_lamp_"..suffix, false)
		end,
	})

	-- standing lamps

	homedecor.register("standing_lamp_"..suffix, {
		description = S("Standing Lamp"),
		mesh = "homedecor_standing_lamp.obj",
		tiles = {
			"wool_grey.png^[colorize:#ffffff:"..wool_brighten,
			{ name = "homedecor_table_standing_lamp_lightbulb.png", color = brightness_tab[brightness] },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_standing_lamp_foot_inv.png^homedecor_standing_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "unifieddyes_palette.png",
		walkable = false,
		light_source = light,
		groups = {cracky=2,oddly_breakable_by_hand=1,
			not_in_creative_inventory=((light ~= nil) and 1) or nil,
		},
		selection_box = slamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.rotate_simple,
		on_punch = function(pos, node, puncher)
			node.name = "homedecor:standing_lamp_"..repl[suffix]
			minetest.set_node(pos, node)
		end,
		after_dig_node = unifieddyes.after_dig_node,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			unifieddyes.on_rightclick(pos, node, clicker,
			  itemstack, pointed_thing, "homedecor:standing_lamp_"..suffix, false)
		end,
		expand = { top="placeholder" },
	})

	-- for old maps that had the original 3dforniture mod
	minetest.register_alias("3dforniture:table_lamp_"..suffix, "homedecor:table_lamp_"..suffix)
end

reg_lamp("off", "low",  nil, 1 )
reg_lamp("low", "med",  3,   2 )
reg_lamp("med", "hi",   7,   3 )
reg_lamp("hi",  "max", 11,   4 )
reg_lamp("max", "off", 14,   5 )

local dlamp_cbox = {
	type = "fixed",
	fixed = { -0.2, -0.5, -0.15, 0.32, 0.12, 0.15 },
}

local dlamp_colors = { N_("red"), N_("blue"), N_("green"), N_("violet") }

for _, color in ipairs(dlamp_colors) do
	homedecor.register("desk_lamp_"..color, {
		description = S("Desk Lamp (@1)", S(color)),
		mesh = "homedecor_desk_lamp.obj",
		tiles = {
			{ name = "homedecor_table_standing_lamp_lightbulb.png", color = brightness_tab[5] },
			{ name = "homedecor_generic_metal.png", color = color },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
			{ name = "homedecor_generic_metal.png", color = color }
		},
		inventory_image = "homedecor_desk_lamp_stem_inv.png^(homedecor_desk_lamp_metal_inv.png^[colorize:"..color..":140)",
		selection_box = dlamp_cbox,
		walkable = false,
		groups = {snappy=3},
	})
end

homedecor.register("ceiling_lamp", {
	description = S("Ceiling Lamp"),
	mesh = "homedecor_ceiling_lamp.obj",
	tiles = {
		"homedecor_generic_metal_brass.png",
		"homedecor_ceiling_lamp_glass.png",
		"homedecor_table_standing_lamp_lightbulb.png",
		{ name = "homedecor_generic_plastic.png", color = 0xff442d04 },
	},
	inventory_image = "homedecor_ceiling_lamp_inv.png",
	light_source = default.LIGHT_MAX,
	groups = {snappy=3},
	walkable = false,
	on_punch = function(pos, node, puncher)
		minetest.set_node(pos, {name = "homedecor:ceiling_lamp_off"})
	end,
})

homedecor.register("ceiling_lamp_off", {
	description = S("Ceiling Lamp (off)"),
	mesh = "homedecor_ceiling_lamp.obj",
	tiles = {
		"homedecor_generic_metal_brass.png",
		"homedecor_ceiling_lamp_glass.png",
		{ "homedecor_table_standing_lamp_lightbulb.png", color = 0xffd0d0d0 },
		{ name = "homedecor_generic_plastic.png", color = 0xff442d04 },
	},
	groups = {snappy=3, not_in_creative_inventory=1},
	walkable = false,
	on_punch = function(pos, node, puncher)
		minetest.set_node(pos, {name = "homedecor:ceiling_lamp"})
	end,
	drop = "homedecor:ceiling_lamp"
})

-- conversion LBM for param2 coloring

homedecor.old_static_nodes = {
	"homedecor:glowlight_quarter_white",
	"homedecor:glowlight_quarter_yellow",
	"homedecor:glowlight_half_white",
	"homedecor:glowlight_half_yellow",
	"homedecor:glowlight_small_cube_white",
	"homedecor:glowlight_small_cube_yellow"
}

local lamp_power = {"off", "low", "med", "hi", "max"}

for _, power in ipairs(lamp_power) do
	for _, color in ipairs(lamp_colors) do
		table.insert(homedecor.old_static_nodes, "homedecor:table_lamp_"..color.."_"..power)
		table.insert(homedecor.old_static_nodes, "homedecor:standing_lamp_"..color.."_"..power)
	end
end

print(dump(homedecor.old_static_nodes))

minetest.register_lbm({
	name = "homedecor:convert_lighting",
	label = "Convert homedecor glowlights, table lamps, and standing lamps to use param2 color",
	run_at_every_load = true,
	nodenames = homedecor.old_static_nodes,
	action = function(pos, node)
		local name = node.name
		local newnode
		local color

		if string.find(name, "small_cube") then
			newname = "homedecor:glowlight_small_cube"
		elseif string.find(name, "glowlight_half") then
			newname = "homedecor:glowlight_half"
		elseif string.find(name, "glowlight_quarter") then
			newname = "homedecor:glowlight_quarter"
		end

		local lampname
		if string.find(name, "standing_lamp") then 
			lampname = "homedecor:standing_lamp"
		elseif string.find(name, "table_lamp") then
			lampname = "homedecor:table_lamp"
		end
		if lampname then
			newname = lampname
			if string.find(name, "_off") then
				newname = newname.."_off"
			elseif string.find(name, "_low") then
				newname = newname.."_low"
			elseif string.find(name, "_med") then
				newname = newname.."_med"
			elseif string.find(name, "_hi") then
				newname = newname.."_hi"
			elseif string.find(name, "_max") then
				newname = newname.."_max"
			end
		end

		if string.find(name, "red") then
			color = "red"
		elseif string.find(name, "pink") then
			color = "pink"
		elseif string.find(name, "green") then
			color = "green"
		elseif string.find(name, "blue") then
			color = "blue"
		elseif string.find(name, "yellow") then
			color = "yellow"
		elseif string.find(name, "violet") then
			color = "violet"
		else
			color = "white"
		end

		local paletteidx
		local fdir
		if string.find(name, "glowlight") then
			paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "wallmounted")
			param2 = paletteidx + (node.param2 % 8 )
		else
			paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, false)
			param2 = paletteidx
		end

		print(node.name.." --> "..newname..", "..color.." ("..paletteidx.."), fdir = "..node.param2.." --> "..param2)

		minetest.set_node(pos, { name = newname, param2 = param2 })
		local meta = minetest.get_meta(pos)
		meta:set_string("dye", "unifieddyes:"..color)
	end
})
