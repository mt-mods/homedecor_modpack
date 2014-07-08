-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
--
-- Mostly my own code; overall template borrowed from game default

local S = homedecor.gettext

-- misc craftitems

minetest.register_craftitem("homedecor:terracotta_base", {
        description = S("Uncooked Terracotta Base"),
        inventory_image = "homedecor_terracotta_base.png",
})

minetest.register_craftitem("homedecor:roof_tile_terracotta", {
        description = S("Terracotta Roof Tile"),
        inventory_image = "homedecor_roof_tile_terracotta.png",
})

minetest.register_craftitem("homedecor:plastic_sheeting", {
        description = S("Plastic sheet"),
        inventory_image = "homedecor_plastic_sheeting.png",
})

minetest.register_craftitem("homedecor:plastic_strips", {
        description = S("Plastic strips"),
        inventory_image = "homedecor_plastic_strips.png",
})

minetest.register_craftitem("homedecor:plastic_base", {
        description = S("Unprocessed Plastic base"),
        wield_image = "homedecor_plastic_base.png",
        inventory_image = "homedecor_plastic_base_inv.png",
})

minetest.register_craftitem("homedecor:drawer_small", {
        description = S("Small Wooden Drawer"),
        inventory_image = "homedecor_drawer_small.png",
})

minetest.register_craftitem("homedecor:brass_ingot", {
        description = S("Brass Ingot"),
        inventory_image = "homedecor_brass_ingot.png",
	groups = { brass_ingot=1 }
})

minetest.register_craftitem("homedecor:ic", {
	description = S("Simple Integrated Circuit"),
	inventory_image = "homedecor_ic.png",
})

minetest.register_craftitem("homedecor:heating_element", {
	description = S("Heating element"),
	inventory_image = "homedecor_heating_element.png",
})

minetest.register_craftitem("homedecor:motor", {
	description = S("Motor"),
	inventory_image = "homedecor_motor.png",
})

minetest.register_craftitem("homedecor:power_crystal", {
	description = S("Power Crystal"),
	inventory_image = "homedecor_power_crystal.png",
})

minetest.register_craftitem("homedecor:blank_canvas", {
	description = S("Blank Canvas"),
	inventory_image = "homedecor_blank_canvas.png"
})

minetest.register_craftitem("homedecor:vcr", {
	description = S("VCR"),
	inventory_image = "homedecor_vcr.png"
})

minetest.register_craftitem("homedecor:dvd_player", {
	description = S("DVD Player"),
	inventory_image = "homedecor_dvd_player.png"
})

-- alternate craftitem for silicon if mesecons isn't installed.

if ( minetest.get_modpath("mesecons") ) == nil then

	minetest.register_craftitem(":mesecons_materials:silicon", {
		description = S("Silicon lump"),
		inventory_image = "homedecor_silicon.png",
	})

	minetest.register_craft( {
		output = "mesecons_materials:silicon 4",
		recipe = {
			{ "default:sand", "default:sand" },
			{ "default:sand", "default:steel_ingot" },
		},
	})

end

-- the actual crafts

minetest.register_craft( {
    output = "homedecor:plastic_strips 3",
    recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" }
    },
})

minetest.register_craft( {
    output = "homedecor:heating_element 2",
    recipe = {
		{ "default:copper_ingot", "default:mese_crystal_fragment", "default:copper_ingot" }
    },
})

minetest.register_craft( {
    output = "homedecor:motor 2",
    recipe = {
		{ "default:mese_crystal_fragment", "default:iron_lump", "homedecor:plastic_sheeting" },
		{ "default:copper_ingot", "default:steel_ingot", "default:steel_ingot" },
		{ "default:mese_crystal_fragment", "default:iron_lump", "homedecor:plastic_sheeting" }
    },
})

minetest.register_craft({
	--type = "shapeless",
	output = "homedecor:power_crystal 2",
	recipe = {
		{ "default:mese_crystal_fragment", "default:torch", "default:mese_crystal_fragment" },
		{ "default:diamond", "default:gold_ingot", "default:diamond" }
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "homedecor:power_crystal",
	burntime = 50,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:terracotta_base 8",
        recipe = {
		"default:dirt",
		"default:clay_lump",
		"bucket:bucket_water"
        },
	replacements = { {"bucket:bucket_water", "bucket:bucket_empty"}, },
})

minetest.register_craft({
        type = "cooking",
        output = "homedecor:roof_tile_terracotta",
        recipe = "homedecor:terracotta_base",
})

minetest.register_craft( {
        output = "homedecor:shingles_terracotta",
        recipe = {
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta"},
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta"},
        },
})

minetest.register_craft( {
        output = "homedecor:roof_tile_terracotta 8",
        recipe = {
			{ "homedecor:shingles_terracotta", "homedecor:shingles_terracotta" }
		}
})

minetest.register_craft( {
        output = "homedecor:flower_pot_terracotta",
        recipe = {
                { "homedecor:roof_tile_terracotta", "default:dirt", "homedecor:roof_tile_terracotta" },
                { "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta", "homedecor:roof_tile_terracotta" },
        },
})

--

minetest.register_craft({
    type = "shapeless",
    output = "homedecor:plastic_base 4",
    recipe = {
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves"
	}
})

minetest.register_craft({
        type = "cooking",
        output = "homedecor:plastic_sheeting",
        recipe = "homedecor:plastic_base",
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:plastic_base",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:plastic_sheeting",
        burntime = 30,
})

minetest.register_craft( {
        output = "homedecor:flower_pot_green",
        recipe = {
                { "", "dye:dark_green", "" },
                { "homedecor:plastic_sheeting", "default:dirt", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

minetest.register_craft( {
        output = "homedecor:flower_pot_black",
        recipe = {
                { "dye:black", "dye:black", "dye:black" },
                { "homedecor:plastic_sheeting", "default:dirt", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

--

minetest.register_craft( {
        output = "homedecor:projection_screen 3",
        recipe = {
		{ "", "default:glass", "" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:projection_screen",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:ceiling_paint 20",
        recipe = {
                "dye:white",
                "dye:white",
                "default:sand",
		"bucket:bucket_water",
        },
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }
})

minetest.register_craft( {
        output = "homedecor:ceiling_tile 10",
        recipe = {
                { "", "dye:white", "" },
                { "default:steel_ingot", "default:stone", "default:steel_ingot" },

        },
})


-- =======================================================
--  Items/recipes not requiring smelting of anything new

minetest.register_craft( {
        output = "homedecor:glass_table_small_round_b 15",
        recipe = {
                { "", "default:glass", "" },
                { "default:glass", "default:glass", "default:glass" },
                { "", "default:glass", "" },
        },
})

minetest.register_craft( {
        output = "homedecor:glass_table_small_square_b 2",
        recipe = {
		{"homedecor:glass_table_small_round", "homedecor:glass_table_small_round" },
	}
})

minetest.register_craft( {
        output = "homedecor:glass_table_large_b 2",
        recipe = { 
		{ "homedecor:glass_table_small_square", "homedecor:glass_table_small_square" },
	}
})

--

minetest.register_craft( {
        output = "homedecor:wood_table_small_round_b 15",
        recipe = {
                { "", "group:wood", "" },
                { "group:wood", "group:wood", "group:wood" },
                { "", "group:wood", "" },
        },
})

minetest.register_craft( {
        output = "homedecor:wood_table_small_square_b 2",
        recipe = { 
		{ "homedecor:wood_table_small_round","homedecor:wood_table_small_round" },
	}
})

minetest.register_craft( {
        output = "homedecor:wood_table_large_b 2",
        recipe = { 
		{ "homedecor:wood_table_small_square", "homedecor:wood_table_small_square" },
	}
})

--

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_small_round_b",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_small_square_b",
        burntime = 30,
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:wood_table_large_b",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:shingles_asphalt 6",
        recipe = {
                { "building_blocks:gravel_spread", "dye:black", "building_blocks:gravel_spread" },
                { "default:sand", "dye:black", "default:sand" },
                { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
        },
})

--

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "default:stick", "group:wood"},
                { "group:wood", "default:stick"},
        },
})

minetest.register_craft( {
        output = "homedecor:shingles_wood 12",
        recipe = {
                { "group:wood", "default:stick"},
                { "default:stick", "group:wood"},
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shingles_wood",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:skylight 4",
        recipe = { 
		{ "homedecor:glass_table_large", "homedecor:glass_table_large" },
		{ "homedecor:glass_table_large", "homedecor:glass_table_large" },
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:skylight_frosted",
        recipe = {
			"dye:white",
			"homedecor:skylight"
		},
})

minetest.register_craft({
        type = "cooking",
        output = "homedecor:skylight",
        recipe = "homedecor:skylight_frosted",
})

-- Various colors of shutters

minetest.register_craft( {
        output = "homedecor:shutter_oak 2",
        recipe = {
		{ "default:stick", "default:stick" },
		{ "default:stick", "default:stick" },
		{ "default:stick", "default:stick" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_oak",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_black 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:black"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_black",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_dark_grey 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:dark_grey"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_dark_grey",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_grey 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:grey"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_grey",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_white 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:white"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_white",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_mahogany 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:brown"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_mahogany",
       	burntime = 30,
})
minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_red 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:red"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_red",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_yellow 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:yellow"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_yellow",
       	burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_forest_green 4",
        recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:dark_green"
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:shutter_forest_green",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_light_blue 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"unifieddyes:light_blue"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_light_blue",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:shutter_violet 4",
       	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:violet"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:shutter_violet",
       	burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:drawer_small",
        recipe = {
                { "group:wood", "default:steel_ingot", "group:wood" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:drawer_small",
        burntime = 30,
})

--

minetest.register_craft( {
        output = "homedecor:nightstand_oak_one_drawer",
        recipe = {
                { "homedecor:drawer_small" },
                { "group:wood" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_oak_one_drawer",
        burntime = 30,
})

minetest.register_craft( {
        output = "homedecor:nightstand_oak_two_drawers",
        recipe = {
                { "homedecor:drawer_small" },
                { "homedecor:drawer_small" },
                { "group:wood" },
        },
})

minetest.register_craft( {
        output = "homedecor:nightstand_oak_two_drawers",
        recipe = {
                { "homedecor:nightstand_oak_one_drawer" },
                { "homedecor:drawer_small" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_oak_two_drawers",
        burntime = 30,
})

--

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:nightstand_mahogany_one_drawer",
        recipe = {
                "homedecor:nightstand_oak_one_drawer",
                "dye:brown",
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_mahogany_one_drawer",
        burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:nightstand_mahogany_two_drawers",
        recipe = {
                "homedecor:nightstand_oak_two_drawers",
                "dye:brown",
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:nightstand_mahogany_two_drawers",
        burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:brass_ingot 2",
	recipe = {
		"moreores:silver_ingot",
		"default:copper_ingot",
	},
})

-- Table legs

minetest.register_craft( {
        output = "homedecor:table_legs_wrought_iron 3",
        recipe = {
                { "", "default:iron_lump", "" },
                { "", "default:iron_lump", "" },
                { "default:iron_lump", "default:iron_lump", "default:iron_lump" },
        },
})

minetest.register_craft( {
        output = "homedecor:table_legs_brass 3",
	recipe = {
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" },
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" }
	},
})

minetest.register_craft( {
        output = "homedecor:utility_table_legs",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "", "default:stick" },
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "homedecor:utility_table_legs",
        burntime = 30,
})

-- vertical poles/lampposts

minetest.register_craft( {
        output = "homedecor:pole_brass 4",
	recipe = {
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" },
		{ "", "group:brass_ingot", "" }
	},
})

minetest.register_craft( {
        output = "homedecor:pole_wrought_iron 4",
        recipe = {
                { "default:iron_lump", },
                { "default:iron_lump", },
                { "default:iron_lump", },
        },
})

-- Home electronics

minetest.register_craft( {
	output = "homedecor:ic 4",
	recipe = {
		{ "mesecons_materials:silicon", "mesecons_materials:silicon" },
		{ "mesecons_materials:silicon", "default:copper_ingot" },
	},
})

minetest.register_craft( {
	output = "homedecor:television",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "moreblocks:glow_glass", "homedecor:plastic_sheeting" },
		{ "homedecor:ic", "homedecor:ic", "homedecor:ic" },
	},
})

minetest.register_craft( {
	output = "homedecor:television",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "default:glass", "homedecor:plastic_sheeting" },
		{ "homedecor:ic", "homedecor:power_crystal", "homedecor:ic" },
	},
})

minetest.register_craft( {
	output = "homedecor:stereo",
	recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:ic", "homedecor:plastic_sheeting" },
		{ "default:steel_ingot", "homedecor:ic", "default:steel_ingot" },
	},
})

-- ===========================================================
-- Recipes that require materials from wool (cotton alternate)

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_small 8",
       	recipe = {
       		"wool:red",
		"wool:yellow",
		"wool:blue",
		"wool:black"
	},
})

-- cotton version:

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_small 8",
       	recipe = {
       		"cotton:red",
		"cotton:yellow",
		"cotton:blue",
		"cotton:black"
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:rug_small",
       	burntime = 30,
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:rug_large 2",
       	recipe = {
		"homedecor:rug_small",
		"homedecor:rug_small",
	},
})

minetest.register_craft({
       	type = "fuel",
       	recipe = "homedecor:rug_large",
       	burntime = 30,
})

-- =====================================
-- Speakers require copper from moreores

minetest.register_craft( {
        output = "homedecor:speaker",
      		recipe = {
		{ "group:wood", "wool:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
		{ "group:wood", "wool:black", "group:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "group:wood", "wool:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
	},
})

-- cotton version

minetest.register_craft( {
        output = "homedecor:speaker",
      		recipe = {
		{ "group:wood", "cotton:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
		{ "group:wood", "cotton:black", "group:wood" },
	},
})

minetest.register_craft( {
        output = "homedecor:speaker_small",
      		recipe = {
		{ "group:wood", "cotton:black", "group:wood" },
		{ "group:wood", "default:copper_ingot", "group:wood" },
	},
})

-- Curtains

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
	minetest.register_craft( {
		output = "homedecor:curtain_"..color.." 3",
	      		recipe = {
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
		},
	})
end


-- Recycling recipes

-- Some glass objects recycle via the glass fragments item/recipe in the Vessels mod.

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_small_round",
		"homedecor:glass_table_small_round",
		"homedecor:glass_table_small_round"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_small_square",
		"homedecor:glass_table_small_square",
		"homedecor:glass_table_small_square"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:glass_table_large",
		"homedecor:glass_table_large",
		"homedecor:glass_table_large"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "vessels:glass_fragments",
        recipe = {
		"homedecor:skylight",
		"homedecor:skylight",
		"homedecor:skylight",
	}
})

-- Wooden tabletops can turn into sticks

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_small_round",
		"homedecor:wood_table_small_round",
		"homedecor:wood_table_small_round"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_small_square",
		"homedecor:wood_table_small_square",
		"homedecor:wood_table_small_square"
	}
})

minetest.register_craft({
        type = "shapeless",
        output = "default:stick 4",
        recipe = {
		"homedecor:wood_table_large",
		"homedecor:wood_table_large",
		"homedecor:wood_table_large"
	}
})

-- Kitchen stuff

minetest.register_craft({
        output = "homedecor:oven_steel",
        recipe = {
		{"homedecor:heating_element", "default:steel_ingot", "homedecor:heating_element", },
		{"default:steel_ingot", "moreblocks:iron_glass", "default:steel_ingot", },
		{"default:steel_ingot", "homedecor:heating_element", "default:steel_ingot", },
	}
})

minetest.register_craft({
        output = "homedecor:oven_steel",
        recipe = {
		{"homedecor:heating_element", "default:steel_ingot", "homedecor:heating_element", },
		{"default:steel_ingot", "default:glass", "default:steel_ingot", },
		{"default:steel_ingot", "homedecor:heating_element", "default:steel_ingot", },
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "homedecor:oven",
	recipe = {
		"homedecor:oven_steel",
		"dye:white",
		"dye:white",
	}
})

minetest.register_craft({
        output = "homedecor:microwave_oven 2",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "moreblocks:iron_glass", "homedecor:ic", },
		{"default:steel_ingot", "default:copper_ingot", "homedecor:power_crystal", },
	}
})

minetest.register_craft({
        output = "homedecor:microwave_oven 2",
        recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:glass", "homedecor:ic", },
		{"default:steel_ingot", "default:copper_ingot", "homedecor:power_crystal", },
	}
})

minetest.register_craft({
	output = "homedecor:refrigerator_steel",
	recipe = {
		{"default:steel_ingot", "homedecor:glowlight_small_cube_yellow", "default:steel_ingot", },
		{"default:steel_ingot", "moreores:tin_ingot", "default:steel_ingot", },
		{"default:steel_ingot", "default:clay", "default:steel_ingot", },
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "homedecor:refrigerator",
	recipe = {
		"homedecor:refrigerator_steel",
		"dye:white",
		"dye:white",
		"dye:white",
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet",
        recipe = {
		{"group:wood", "default:stick", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_steel",
        recipe = {
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"", "homedecor:kitchen_cabinet", ""},
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_steel",
        recipe = {
			{"moreblocks:slab_steelblock_1"},
			{ "homedecor:kitchen_cabinet" },
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_marble",
        recipe = {
			{"building_blocks:slab_marble"},
			{"homedecor:kitchen_cabinet"},
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_marble",
        recipe = {
			{"technic:slab_marble_1"},
			{"homedecor:kitchen_cabinet"},
	}
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_granite",
        recipe = {
			{"technic:slab_granite_1"},
			{"homedecor:kitchen_cabinet"},
	}
})

minetest.register_craft({
	type = "shapeless",
        output = "homedecor:kitchen_cabinet_half 2",
        recipe = { "homedecor:kitchen_cabinet" }
})

minetest.register_craft({
        output = "homedecor:kitchen_cabinet_with_sink",
        recipe = {
		{"group:wood", "default:steel_ingot", "group:wood", },
		{"group:wood", "default:steel_ingot", "group:wood", },
		{"group:wood", "default:stick", "group:wood", },
	}
})

-- Lighting

-- yellow

minetest.register_craft({
	output = "homedecor:glowlight_half_yellow 6",
	recipe = {
		{"default:glass", "homedecor:power_crystal", "default:glass", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_half_yellow 6",
	recipe = {
		{"moreblocks:super_glow_glass", "moreblocks:glow_glass", "moreblocks:super_glow_glass", },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_quarter_yellow 6",
        recipe = {
		{"homedecor:glowlight_half_yellow", "homedecor:glowlight_half_yellow", "homedecor:glowlight_half_yellow", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_small_cube_yellow 16",
	recipe = {
		{"default:glass" },
		{"homedecor:power_crystal" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_yellow 16",
        recipe = {
		{"moreblocks:glow_glass" },
		{"moreblocks:super_glow_glass" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_yellow 4",
        recipe = {
		{"homedecor:glowlight_half_yellow" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_half_yellow",
        recipe = {
		{"homedecor:glowlight_small_cube_yellow","homedecor:glowlight_small_cube_yellow"},
		{"homedecor:glowlight_small_cube_yellow","homedecor:glowlight_small_cube_yellow"}
	}
})

-- white

minetest.register_craft({
	output = "homedecor:glowlight_half_white 6",
	recipe = {
		{ "dye:white", "dye:white", "dye:white" },
		{ "default:glass", "homedecor:power_crystal", "default:glass", },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_half_white 6",
        recipe = {
		{ "dye:white", "dye:white", "dye:white" },
		{"moreblocks:super_glow_glass", "moreblocks:glow_glass", "moreblocks:super_glow_glass", },
	}
})

minetest.register_craft({
	type = "shapeless",
        output = "homedecor:glowlight_half_white 2",
        recipe = {
		"dye:white",
		"homedecor:glowlight_half_yellow",
		"homedecor:glowlight_half_yellow",
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_quarter_white 6",
        recipe = {
		{"homedecor:glowlight_half_white", "homedecor:glowlight_half_white", "homedecor:glowlight_half_white", },
	}
})

minetest.register_craft({
	output = "homedecor:glowlight_small_cube_white 8",
	recipe = {
		{ "dye:white" },
		{ "default:glass" },
		{ "homedecor:power_crystal" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_white 8",
        recipe = {
		{"dye:white" },
		{"moreblocks:super_glow_glass" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_small_cube_white 4",
        recipe = {
		{"homedecor:glowlight_half_white" },
	}
})

minetest.register_craft({
        output = "homedecor:glowlight_half_white",
        recipe = {
		{"homedecor:glowlight_small_cube_white","homedecor:glowlight_small_cube_white"},
		{"homedecor:glowlight_small_cube_white","homedecor:glowlight_small_cube_white"}
	}
})

minetest.register_craft({
    output = "homedecor:plasma_lamp",
    recipe = {
		{"", "default:glass", ""},
		{"default:glass", "homedecor:power_crystal", "default:glass"},
		{"", "default:glass", ""}
	}
})

-- Brass/wrought iron fences


minetest.register_craft( {
        output = "homedecor:fence_brass 6",
	recipe = {
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" },
		{ "group:brass_ingot", "group:brass_ingot", "group:brass_ingot" },
	},
})

minetest.register_craft( {
        output = "homedecor:fence_wrought_iron 6",
        recipe = {
                { "default:iron_lump","default:iron_lump","default:iron_lump" },
                { "default:iron_lump","default:iron_lump","default:iron_lump" },
        },
})

-- other types of fences


minetest.register_craft( {
        output = "homedecor:fence_picket 6",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "default:stick", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_corner",
	recipe = {
		"homedecor:fence_picket",
		"homedecor:fence_picket"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket 2",
	recipe = {
		"homedecor:fence_picket_corner"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_picket_white 6",
        recipe = {
                { "default:stick", "default:stick", "default:stick" },
                { "default:stick", "dye:white", "default:stick" },
                { "default:stick", "default:stick", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_corner_white",
	recipe = {
		"homedecor:fence_picket_white",
		"homedecor:fence_picket_white"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_picket_white 2",
	recipe = {
		"homedecor:fence_picket_corner_white"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_privacy 6",
        recipe = {
                { "group:wood", "default:stick", "group:wood" },
                { "group:wood", "", "group:wood" },
                { "group:wood", "default:stick", "group:wood" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_privacy_corner",
	recipe = {
		"homedecor:fence_privacy",
		"homedecor:fence_privacy"
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_privacy 2",
	recipe = {
		"homedecor:fence_privacy_corner"
	},
})

--


minetest.register_craft( {
        output = "homedecor:fence_barbed_wire 6",
        recipe = {
                { "default:stick", "default:iron_lump", "default:stick" },
                { "default:stick", "", "default:stick" },
                { "default:stick", "default:iron_lump", "default:stick" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_barbed_wire_corner",
	recipe = { "homedecor:fence_barbed_wire", "homedecor:fence_barbed_wire" },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_barbed_wire 2",
	recipe = { "homedecor:fence_barbed_wire_corner" },
})

--


minetest.register_craft( {
        output = "homedecor:fence_chainlink 9",
        recipe = {
                { "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
                { "default:steel_ingot", "default:iron_lump", "default:steel_ingot" },
                { "default:steel_ingot", "default:iron_lump", "default:steel_ingot" }
        },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_chainlink_corner",
	recipe = { "homedecor:fence_chainlink", "homedecor:fence_chainlink" },
})

minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:fence_chainlink 2",
	recipe = { "homedecor:fence_chainlink_corner" },
})


-- Gates

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_picket_white_closed",
        recipe = {
		"homedecor:fence_picket_white"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_picket_white",
        recipe = {
		"homedecor:gate_picket_white_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_picket_closed",
        recipe = {
		"homedecor:fence_picket"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_picket",
        recipe = {
		"homedecor:gate_picket_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_barbed_wire_closed",
        recipe = {
		"homedecor:fence_barbed_wire"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_barbed_wire",
        recipe = {
		"homedecor:gate_barbed_wire_closed"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:gate_chainlink_closed",
        recipe = {
		"homedecor:fence_chainlink"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:fence_chainlink",
        recipe = {
		"homedecor:gate_chainlink_closed"
        },
})

------ Doors

-- plain wood, non-windowed

minetest.register_craft( {
        output = "homedecor:door_wood_plain_bottom_left 2",
        recipe = {
		{ "group:wood", "group:wood", "" },
		{ "group:wood", "group:wood", "default:steel_ingot" },
		{ "group:wood", "group:wood", "" },
        },
})

-- fancy exterior

minetest.register_craft( {
        output = "homedecor:door_exterior_fancy_bottom_left 2",
        recipe = {
		{ "group:wood", "default:glass" },
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
        },
})

-- wood and glass (grid style)

-- bare

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "default:glass", "group:wood" },
		{ "group:wood", "default:glass" },
		{ "default:glass", "group:wood" },
        },
})

minetest.register_craft( {
        output = "homedecor:door_wood_glass_bottom_left 2",
        recipe = {
		{ "group:wood", "default:glass" },
		{ "default:glass", "group:wood" },
		{ "group:wood", "default:glass" },
        },
})

-- mahogany

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left 2",
        recipe = {
		"default:dirt",
		"default:coal_lump",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_mahogany_bottom_left 2",
        recipe = {
		"dye:brown",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

-- white

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_wood_glass_white_bottom_left 2",
        recipe = {
		"dye:white",
		"homedecor:door_wood_glass_bottom_left",
		"homedecor:door_wood_glass_bottom_left"
        },
})

-- Solid glass with metal handle

minetest.register_craft( {
        output = "homedecor:door_glass_bottom_left 2",
        recipe = {
		{ "default:glass", "default:glass" },
		{ "default:glass", "default:steel_ingot" },
		{ "default:glass", "default:glass" },
        },
})

-- Closet doors

-- oak

minetest.register_craft( {
        output = "homedecor:door_closet_oak_bottom_left 2",
        recipe = {
		{ "", "default:stick", "default:stick" },
		{ "default:steel_ingot", "default:stick", "default:stick" },
		{ "", "default:stick", "default:stick" },
        },
})

-- mahogany

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_left 2",
        recipe = {
		"homedecor:door_closet_oak_bottom_left",
		"homedecor:door_closet_oak_bottom_left",
		"default:dirt",
		"default:coal_lump",
        },
})

minetest.register_craft( {
	type = "shapeless",
        output = "homedecor:door_closet_mahogany_bottom_left 2",
        recipe = {
		"homedecor:door_closet_oak_bottom_left",
		"homedecor:door_closet_oak_bottom_left",
		"dye:brown"
        },
})

-- washer and dryer

minetest.register_craft( {
    output = "homedecor:washing_machine",
    recipe = {
		{ "default:steel_ingot", "default:steel_ingot", "homedecor:ic" },
		{ "default:steel_ingot", "bucket:bucket_water", "default:steel_ingot" },
		{ "default:steel_ingot", "homedecor:motor", "default:steel_ingot" }
    },
})

minetest.register_craft( {
    output = "homedecor:washing_machine",
    recipe = {
		{ "default:steel_ingot", "default:steel_ingot", "homedecor:ic" },
		{ "default:steel_ingot", "bucket:bucket_water", "default:steel_ingot" },
		{ "default:steel_ingot", "technic:motor", "default:steel_ingot" }
    },
})

minetest.register_craft( {
    output = "homedecor:dryer",
    recipe = {
		{ "default:steel_ingot", "default:steel_ingot", "homedecor:ic" },
		{ "default:steel_ingot", "bucket:bucket_empty", "homedecor:motor" },
		{ "default:steel_ingot", "homedecor:heating_element", "default:steel_ingot" }
    },
})

minetest.register_craft( {
    output = "homedecor:dryer",
    recipe = {
		{ "default:steel_ingot", "default:steel_ingot", "homedecor:ic" },
		{ "default:steel_ingot", "bucket:bucket_empty", "technic:motor" },
		{ "default:steel_ingot", "homedecor:heating_element", "default:steel_ingot" }
    },
})

-- dishwasher

minetest.register_craft( {
    output = "homedecor:dishwasher",
    recipe = {
		{ "homedecor:ic", "homedecor:fence_chainlink", "default:steel_ingot",  },
		{ "default:steel_ingot", "homedecor:shower_head", "homedecor:motor" },
		{ "default:steel_ingot", "homedecor:heating_element", "bucket:bucket_water" }
    },
})

minetest.register_craft( {
    output = "homedecor:dishwasher",
    recipe = {
		{ "homedecor:ic", "homedecor:fence_chainlink", "default:steel_ingot",  },
		{ "default:steel_ingot", "homedecor:shower_head", "technic:motor" },
		{ "default:steel_ingot", "homedecor:heating_element", "bucket:bucket_water" }
    },
})

-- paintings

minetest.register_craft({
    output = "homedecor:blank_canvas",
    recipe = {
		{ "", "default:stick", "" },
		{ "default:stick", "wool:white", "default:stick" },
		{ "", "default:stick", "" },
    }
})

local painting_patterns = {
	[1] = {	{ "brown", "red", "brown" },
	 		{ "dark_green", "red", "green" } },

	[2] = {	{ "green", "yellow", "green" },
	 		{ "green", "yellow", "green" } },

	[3] = {	{ "green", "pink", "green" },
	 		{ "brown", "pink", "brown" } },

	[4] = {	{ "black", "orange", "grey" },
	 		{ "dark_green", "orange", "orange" } },

	[5] = {	{ "blue", "orange", "yellow" },
	 		{ "green", "red", "brown" } },

	[6] = {	{ "green", "red", "orange" },
	 		{ "orange", "yellow", "green" } },

	[7] = {	{ "blue", "dark_green", "dark_green" },
	 		{ "green", "grey", "green" } },

	[8] = {	{ "blue", "blue", "blue" },
	 		{ "green", "green", "green" } },

	[9] = {	{ "blue", "blue", "dark_green" },
	 		{ "green", "grey", "dark_green" } },

	[10] = { { "green", "white", "green" },
	 		 { "dark_green", "white", "dark_green" } },

	[11] = { { "blue", "white", "blue" },
	 		 { "blue", "grey", "dark_green" } },

	[12] = { { "green", "green", "green" },
	 		 { "grey", "grey", "green" } },

	[13] = { { "blue", "blue", "grey" },
	 		 { "dark_green", "white", "white" } },

	[14] = { { "red", "yellow", "blue" },
	 		 { "blue", "green", "violet" } },

	[15] = { { "blue", "yellow", "blue" },
	 		 { "black", "black", "black" } },

	[16] = { { "red", "orange", "blue" },
	 		 { "black", "dark_grey", "grey" } },

	[17] = { { "orange", "yellow", "orange" },
	 		 { "black", "black", "black" } },

	[18] = { { "grey", "dark_green", "grey" },
	 		 { "white", "white", "white" } },

	[19] = { { "white", "brown", "green" },
	 		 { "green", "brown", "brown" } },

	[20] = { { "blue", "blue", "blue" },
	 		 { "red", "brown", "grey" } }
}

for i,recipe in pairs(painting_patterns) do

	local item1 = "dye:"..recipe[1][1]
	local item2 = "dye:"..recipe[1][2]
	local item3 = "dye:"..recipe[1][3]
	local item4 = "dye:"..recipe[2][1]
	local item5 = "dye:"..recipe[2][2]
	local item6 = "dye:"..recipe[2][3]

	minetest.register_craft({
		output = "homedecor:painting_"..i,
		recipe = {
			{ item1, item2, item3 },
			{ item4, item5, item6 },
			{"", "homedecor:blank_canvas", "" }
		}
	})
end

-- more misc stuff here

minetest.register_craft({
        output = "homedecor:chimney 2",
        recipe = {
			{ "default:clay_brick", "", "default:clay_brick" },
			{ "default:clay_brick", "", "default:clay_brick" },
			{ "default:clay_brick", "", "default:clay_brick" },
        },
})

minetest.register_craft({
        output = "homedecor:fishtank",
        recipe = {
			{ "homedecor:plastic_sheeting", "homedecor:glowlight_small_cube_white", "homedecor:plastic_sheeting" },
			{ "default:glass", "bucket:bucket_water", "default:glass" },
			{ "default:glass", "building_blocks:gravel_spread", "default:glass" },
        },
	replacements = { {"bucket:bucket_water", "bucket:bucket_empty"} }
})

minetest.register_craft({
    output = "homedecor:towel_rod",
    recipe = {
		{ "default:wood", "default:stick", "default:wood" },
		{ "", "building_blocks:terrycloth_towel", "" },
    },
})

minetest.register_craft({
    output = "homedecor:cardboard_box 2",
    recipe = {
		{ "default:paper", "", "default:paper" },
		{ "default:paper", "default:paper", "default:paper" },
    },
})

minetest.register_craft({
    output = "homedecor:desk",
    recipe = {
		{ "stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood" },
		{ "homedecor:drawer_small", "default:wood", "default:wood" },
		{ "homedecor:drawer_small", "", "default:wood" },
    },
})

minetest.register_craft({
    output = "homedecor:desk",
    recipe = {
		{ "moreblocks:slab_wood", "moreblocks:slab_wood", "moreblocks:slab_wood" },
		{ "homedecor:drawer_small", "default:wood", "default:wood" },
		{ "homedecor:drawer_small", "", "default:wood" },
    },
})

minetest.register_craft({
    output = "homedecor:analog_clock_plastic 2",
    recipe = {
		{ "homedecor:plastic_sheeting", "dye:black", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:ic", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "dye:black", "homedecor:plastic_sheeting" },
    },
})

minetest.register_craft({
    output = "homedecor:analog_clock_wood 2",
    recipe = {
		{ "default:stick", "dye:black", "default:stick" },
		{ "default:stick", "homedecor:ic", "default:stick" },
		{ "default:stick", "dye:black", "default:stick" },
    },
})

minetest.register_craft({
    output = "homedecor:digital_clock 2",
    recipe = {
		{ "homedecor:plastic_sheeting", "default:paper", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:ic", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:power_crystal", "homedecor:plastic_sheeting" },
    },
})

minetest.register_craft({
    output = "homedecor:alarm_clock",
    recipe = {
		{ "homedecor:plastic_sheeting", "homedecor:speaker_small", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:digital_clock", "homedecor:plastic_sheeting" },
		{ "homedecor:plastic_sheeting", "homedecor:power_crystal", "homedecor:plastic_sheeting" },
    },
})

minetest.register_craft({
    output = "homedecor:air_conditioner",
    recipe = {
		{ "default:steel_ingot", "building_blocks:grate", "default:steel_ingot" },
		{ "default:steel_ingot", "homedecor:motor", "default:steel_ingot" },
		{ "default:steel_ingot", "homedecor:motor", "default:steel_ingot" },
    },
})

minetest.register_craft({
    output = "homedecor:air_conditioner",
    recipe = {
		{ "default:steel_ingot", "building_blocks:grate", "default:steel_ingot" },
		{ "default:steel_ingot", "technic:motor", "default:steel_ingot" },
		{ "default:steel_ingot", "technic:motor", "default:steel_ingot" },
    },
})


minetest.register_craft({
    output = "homedecor:welcome_mat_grey 2",
    recipe = {
		{ "", "dye:black", "" },
		{ "wool:grey", "wool:grey", "wool:grey" },
    },
})

minetest.register_craft({
    output = "homedecor:welcome_mat_brown 2",
    recipe = {
		{ "", "dye:black", "" },
		{ "wool:brown", "wool:brown", "wool:brown" },
    },
})

minetest.register_craft({
    output = "homedecor:welcome_mat_green 2",
    recipe = {
		{ "", "dye:white", "" },
		{ "wool:dark_green", "wool:dark_green", "wool:dark_green" },
    },
})

minetest.register_craft({
	type = "shapeless",
    output = "homedecor:window_plain 8",
    recipe = {
		"dye:white",
		"dye:white",
		"dye:white",
		"dye:white",
		"building_blocks:woodglass"
    }
})

minetest.register_craft({
	type = "shapeless",
    output = "homedecor:window_quartered",
    recipe = {
		"dye:white",
		"default:stick",
		"default:stick",
		"homedecor:window_plain"
    }
})

minetest.register_craft({
    output = "homedecor:vcr 2",
    recipe = {
		{ "homedecor:ic", "default:steel_ingot", "homedecor:plastic_sheeting" },
		{ "default:iron_lump", "default:iron_lump", "default:iron_lump" },
		{ "homedecor:plastic_sheeting", "", "homedecor:plastic_sheeting" },
    },
})

minetest.register_craft({
    output = "homedecor:dvd_player 2",
    recipe = {
		{ "", "homedecor:plastic_sheeting", "" },
		{ "default:obsidian_glass", "homedecor:motor", "homedecor:motor" },
		{ "default:mese_crystal_fragment", "homedecor:ic", "homedecor:power_crystal" },
    },
})

minetest.register_craft({
    output = "homedecor:dvd_player 2",
    recipe = {
		{ "", "homedecor:plastic_sheeting", "" },
		{ "default:obsidian_glass", "technic:motor", "technic:motor" },
		{ "default:mese_crystal_fragment", "homedecor:ic", "homedecor:power_crystal" },
    },
})

minetest.register_craft({
	type = "shapeless",
    output = "homedecor:dvd_vcr",
    recipe = {
		"homedecor:vcr",
		"homedecor:dvd_player"
    },
})

minetest.register_craft({
    output = "homedecor:blinds_thin",
    recipe = {
		{ "default:stick", "homedecor:plastic_sheeting", "default:stick" },
		{ "farming:string", "homedecor:plastic_strips", "" },
		{ "", "homedecor:plastic_strips", "" },
    },
})

minetest.register_craft({
    output = "homedecor:blinds_thick",
    recipe = {
		{ "default:stick", "homedecor:plastic_sheeting", "default:stick" },
		{ "farming:string", "homedecor:plastic_strips", "homedecor:plastic_strips" },
		{ "", "homedecor:plastic_strips", "homedecor:plastic_strips" },
    },
})
