-- Various kinds of window shutters

local S = homedecor_i18n.gettext

local shutters = {
	{"oak",          S("unpainted oak"), "bf8a51" },
	{"mahogany",     S("mahogany"),      "822606" },
	{"red",          S("red"),           "d00000" },
	{"yellow",       S("yellow"),        "ffff00" },
	{"forest_green", S("forest green"),  "006000" },
	{"light_blue",   S("light blue"),    "2878d8" },
	{"violet",       S("violet"),        "7000e0" },
	{"black",        S("black"),         "181818" },
	{"dark_grey",    S("dark grey"),     "404040" },
	{"grey",         S("grey"),          "b0b0b0" },
	{"white",        S("white"),         "ffffff" },
}

local shutter_cbox = {
	type = "wallmounted",
	wall_top =		{ -0.5,  0.4375, -0.5,  0.5,     0.5,    0.5 },
	wall_bottom =	{ -0.5, -0.5,    -0.5,  0.5,    -0.4375, 0.5 },
	wall_side =		{ -0.5, -0.5,    -0.5, -0.4375,  0.5,    0.5 }
}

for _, s in ipairs(shutters) do
	local name, desc, hue = unpack(s)

	local tile = { name = "homedecor_window_shutter.png", color = tonumber("0xff"..hue) }
	local inv  = "homedecor_window_shutter_inv.png^[colorize:#"..hue..":150"

	homedecor.register("shutter_"..name, {
		mesh = "homedecor_window_shutter.obj",
		tiles = { tile },
		description = S("Wooden Shutter (@1)", desc),
		inventory_image = inv,
		wield_image = inv,
		paramtype2 = "wallmounted",
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = shutter_cbox,
		node_box = shutter_cbox,
			-- collision_box doesn't accept type="wallmounted", but node_box
			-- does.  Said nodeboxes create a custom collision box but are
			-- invisible themselves because drawtype="mesh".
	})
end

minetest.register_alias("homedecor:shutter_purple", "homedecor:shutter_violet")
