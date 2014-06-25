-- Various misc. nodes

local S = homedecor.gettext

minetest.register_node('homedecor:ceiling_paint', {
	description = S("Textured Ceiling Paint"),
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
	description = S("Drop-Ceiling Tile"),
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
	description = S("Small Throw Rug"),
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
	description = S("Large Area Rug"),
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

local flower_pot_model = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.5, -0.1875, 0.1875, -0.3125, 0.1875},
		{-0.25, -0.5, -0.0625, 0.25, -0.3125, 0.0625},
		{-0.0625, -0.5, -0.25, 0.0625, -0.25, 0.25},
		{-0.25, -0.3125, -0.25, 0.25, -0.125, 0.25},
		{-0.125, -0.3125, -0.3125, 0.125, -0.125, 0.3125},
		{-0.3125, -0.3125, -0.125, 0.3125, -0.125, 0.125},
		{-0.3125, -0.125, -0.25, 0.3125, 0.0625, 0.25},
		{-0.125, -0.125, -0.375, 0.125, 0.0625, 0.375},
		{-0.375, -0.125, -0.125, 0.375, 0.0625, 0.125},
		{-0.25, -0.125, -0.3125, 0.25, 0.0625, 0.3125},
		{-0.4375, 0.0625, -0.1875, 0.4375, 0.25, 0.1875},
		{-0.1875, 0.0625, -0.4375, 0.1875, 0.25, 0.4375},
		{-0.3125, 0.0625, -0.375, 0.3125, 0.25, 0.375},
		{-0.375, 0.0625, -0.3125, 0.375, 0.25, 0.3125},
		{-0.1875, 0.25, -0.5, 0.1875, 0.5, 0.5},
		{-0.5, 0.25, -0.1875, 0.5, 0.5, 0.1875},
		{-0.4375, 0.25, -0.3125, 0.4375, 0.5, 0.3125},
		{-0.3125, 0.25, -0.4375, 0.3125, 0.5, 0.4375},
		{-0.375, 0.25, -0.375, 0.375, 0.5, 0.375},
	}
}

minetest.register_node('homedecor:flower_pot_terracotta', {
	drawtype = "nodebox",
	description = S("Terracotta Flower Pot"),
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
	node_box = flower_pot_model,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_black', {
	drawtype = "nodebox",
	description = S("Black Plastic Flower Pot"),
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
	node_box = flower_pot_model,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('homedecor:flower_pot_green', {
	drawtype = "nodebox",
	description = S("Green Plastic Flower Pot"),
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
	node_box = flower_pot_model,
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
        description = S("Brass Pole"),
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
        description = S("Wrought Iron Pole"),
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
	local color_d = S(curtaincolors[c])

	minetest.register_node("homedecor:curtain_"..color, {
		description = S("Curtains (%s)"):format(color_d),
		tiles = { "homedecor_curtain_"..color..".png" },
		inventory_image = "homedecor_curtain_"..color..".png",
		wield_image = "homedecor_curtain_"..color..".png",
		drawtype = 'signlike',
		sunlight_propagates = true,
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
	if color_d ~= color then
		minetest.register_alias("homedecor:curtain_"..color_d, "homedecor:curtain_"..color)
	end
end

minetest.register_node('homedecor:air_conditioner', {
	drawtype = "nodebox",
	description = S("Air Conditioner"),
	tiles = { 'homedecor_ac_tb.png',
		  'homedecor_ac_tb.png',
		  'homedecor_ac_sides.png',
		  'homedecor_ac_sides.png',
		  'homedecor_ac_back.png',
		  'homedecor_ac_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.124, 0.5 }, -- off by just a tad to force the adjoining faces to be drawn.
			{-0.5, 0.125, -0.5, 0.5, 0.5, 0.5 },
		}
	},
	selection_box = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
})

minetest.register_node("homedecor:tiles_1", {
	description = "Bathroom/kitchen tiles (shade #1)",
	tiles = {
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png",
		"homedecor_tiles1.png^[transformR90",
		"homedecor_tiles1.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_2", {
	description = "Bathroom/kitchen tiles (shade #2)",
	tiles = {
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png",
		"homedecor_tiles2.png^[transformR90",
		"homedecor_tiles2.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_3", {
	description = "Bathroom/kitchen tiles (shade #3)",
	tiles = {
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png",
		"homedecor_tiles3.png^[transformR90",
		"homedecor_tiles3.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("homedecor:tiles_4", {
	description = "Bathroom/kitchen tiles (shade #4)",
	tiles = {
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png",
		"homedecor_tiles4.png^[transformR90",
		"homedecor_tiles4.png^[transformR90"
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

local welcome_mat_colors = { "green", "brown", "grey" }

for _, color in ipairs(welcome_mat_colors) do
	minetest.register_node("homedecor:welcome_mat_"..color, {
		description = "Welcome Mat ("..color..")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"homedecor_welcome_mat_"..color..".png",
			"homedecor_welcome_mat_bottom.png",
			"homedecor_welcome_mat_"..color..".png",
		},
		groups = {crumbly=3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.375, 0.5, -0.46875, 0.375 }
		}
	})
end

minetest.register_node("homedecor:chimney", {
	drawtype = "nodebox",
	paramtype = "light",
	description = "Chimney",
	tiles = {
		"homedecor_chimney_top.png",
		"homedecor_chimney_bottom.png",
		"homedecor_chimney_sides.png",
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, -0.1875},
			{-0.25, -0.5, 0.1875, 0.25, 0.5, 0.25},
			{-0.25, -0.5, -0.25, -0.1875, 0.5, 0.25},
			{0.1875, -0.5, -0.25, 0.25, 0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

