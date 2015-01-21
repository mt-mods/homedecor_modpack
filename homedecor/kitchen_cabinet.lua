-- This file supplies Kitchen cabinets and kitchen sink

local S = homedecor.gettext

local counter_materials = { "", "granite", "marble", "steel" }

for _, mat in ipairs(counter_materials) do

	local desc = S("Kitchen Cabinet")
	local material = ""

	if mat ~= "" then
		desc = S("Kitchen Cabinet ("..mat.." top)")
		material = "_"..mat
	end

	homedecor.register("kitchen_cabinet"..material, {
		description = desc,
		tiles = { 'homedecor_kitchen_cabinet_top'..material..'.png',
				'homedecor_kitchen_cabinet_bottom.png',
				'homedecor_kitchen_cabinet_sides.png',
				'homedecor_kitchen_cabinet_sides.png',
				'homedecor_kitchen_cabinet_sides.png',
				'homedecor_kitchen_cabinet_front.png'},
		sunlight_propagates = false,
		walkable = true,
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		infotext=S("Kitchen Cabinet"),
		inventory = {
			size=24,
			formspec="size[8,8]"..
				"list[context;main;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]",
		},
	})
end

homedecor.register("kitchen_cabinet_half", {
	description = S('Half-height Kitchen Cabinet (on ceiling)'),
	tiles = { 'homedecor_kitchen_cabinet_sides.png',
			'homedecor_kitchen_cabinet_bottom.png',
			'homedecor_kitchen_cabinet_sides.png',
			'homedecor_kitchen_cabinet_sides.png',
			'homedecor_kitchen_cabinet_sides.png',
			'homedecor_kitchen_cabinet_front_half.png'},
	sunlight_propagates = false,
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, 0, -0.5, 0.5, 0.5, 0.5 }
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Kitchen Cabinet"),
	inventory = {
		size=12,
		formspec="size[8,7]"..
			"list[context;main;1,0;6,2;]"..
			"list[current_player;main;0,3;8,4;]",
	},
})


homedecor.register("kitchen_cabinet_with_sink", {
	description = S("Kitchen Cabinet with sink"),
	mesh = "homedecor_kitchen_sink.obj",
	tiles = { "homedecor_kitchen_sink.png" },
	sunlight_propagates = false,
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Under-sink cabinet"),
	inventory = {
		size=16,
		formspec="size[8,7]"..
			"list[context;main;0,0;8,2;]"..
			"list[current_player;main;0,3;8,4;]",
	},
})
