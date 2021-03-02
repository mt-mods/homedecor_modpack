local S = minetest.get_translator("computers")

-- "bedflinger" style 3D Printer (Prusa i3 or equivalent)

local cbox = {
	type = "fixed",
	fixed = {-0.25, -0.25, -0.5, 0.3, 0.3, 0.25 }
}

minetest.register_node("computers:3dprinter_bedflinger", {
	description = S('3D Printer ("bedflinger" design)'),
	inventory_image = "computers_3dprinter_bedflinger_inv.png",
	tiles = {
		{ name = "computers_3dprinter.png", color = 0xffffffff },
		"computers_3dprinter_filament.png"
	},
	paramtype = "light",
	walkable = true,
	groups = {snappy=3, ud_param2_colorable = 1},
	sound = default.node_sound_wood_defaults(),
	drawtype = "mesh",
	mesh = "computers_3dprinter_bedflinger.obj",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = cbox,
	collision_box = cbox,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		unifieddyes.fix_rotation_nsew(pos, placer, itemstack, pointed_thing)
	end,
	on_dig = unifieddyes.on_dig,
	on_rotate = unifieddyes.fix_after_screwdriver_nsew,
})

-- COreXY style printer (Hypercube or similar)

cbox = {
	type = "fixed",
	fixed = {-0.4375, -0.5, -0.5, 0.4375, 0.5, 0.375 }
}

minetest.register_node("computers:3dprinter_corexy", {
	description = S('3D Printer (CoreXY design)'),
	tiles = {
		{ name = "computers_3dprinter.png", color = 0xffffffff },
		"computers_3dprinter_filament.png"
	},
	paramtype = "light",
	walkable = true,
	groups = {snappy=3, ud_param2_colorable = 1},
	sound = default.node_sound_wood_defaults(),
	drawtype = "mesh",
	mesh = "computers_3dprinter_corexy.obj",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
	selection_box = cbox,
	collision_box = cbox,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		unifieddyes.fix_rotation_nsew(pos, placer, itemstack, pointed_thing)
	end,
	on_dig = unifieddyes.on_dig,
	on_rotate = unifieddyes.fix_after_screwdriver_nsew,
})
