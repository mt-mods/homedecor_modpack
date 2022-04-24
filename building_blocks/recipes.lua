if minetest.get_modpath("moreblocks") then
	minetest.register_craft({
		output = 'building_blocks:sticks 2',
		recipe = {
			{'group:stick', ''           , 'group:stick'},
			{'group:stick', 'group:stick', 'group:stick'},
			{'group:stick', 'group:stick', 'group:stick'},
		}
	})
else
	minetest.register_craft({
		output = 'building_blocks:sticks',
		recipe = {
			{'group:stick', 'group:stick'},
			{'group:stick', 'group:stick'},
		}
	})
end

minetest.register_craft({
	output = 'building_blocks:Adobe 3',
	recipe = {
		{homedecor.materials.sand},
		{homedecor.materials.clay_lump},
		{"group:stick"},
	}
})
minetest.register_craft({
	output = 'building_blocks:brobble_spread 4',
	recipe = {
		{homedecor.materials.brick, homedecor.materials.cobble, homedecor.materials.brick},
	}
})
minetest.register_craft({
	output = 'building_blocks:BWtile 10',
	recipe = {
		{"group:marble", "group:tar_block"},
		{"group:tar_block", "group:marble"},
	}
})
minetest.register_craft({
	output = 'building_blocks:fakegrass 2',
	recipe = {
		{'group:leaves'},
		{homedecor.materials.dirt},
	}
})
minetest.register_craft({
	output = 'building_blocks:Fireplace 1',
	recipe = {
		{homedecor.materials.steel_ingot, "building_blocks:sticks", homedecor.materials.steel_ingot},
	}
})
minetest.register_craft({
	output = 'building_blocks:grate 1',
	recipe = {
		{homedecor.materials.steel_ingot, homedecor.materials.steel_ingot},
		{homedecor.materials.glass_block, homedecor.materials.glass_block},
	}
})

if not minetest.get_modpath("moreblocks") or not minetest.get_modpath("gloopblocks") then
	minetest.register_craft({
		output = 'building_blocks:gravel_spread 4',
		recipe = {
			{homedecor.materials.gravel, homedecor.materials.gravel, homedecor.materials.gravel},
		}
	})
end

if minetest.get_modpath("default") then
	minetest.register_craft({
		output = 'building_blocks:hardwood 2',
		recipe = {
			{"default:wood", "default:junglewood"},
			{"default:junglewood", "default:wood"},
		}
	})
	minetest.register_craft({
		output = 'building_blocks:hardwood 2',
		recipe = {
			{"default:junglewood", "default:wood"},
			{"default:wood", "default:junglewood"},
		}
	})
end
minetest.register_craft({
	output = 'building_blocks:knife 1',
	recipe = {
		{"group:tar_block"},
		{"group:stick"},
	}
})
minetest.register_craft({
	output = "building_blocks:Marble 9",
	recipe = {
		{homedecor.materials.clay_lump, "group:tar_block", homedecor.materials.clay_lump},
		{"group:tar_block",homedecor.materials.clay_lump, "group:tar_block"},
		{homedecor.materials.clay_lump, "group:tar_block",homedecor.materials.clay_lump},
	}
})
minetest.register_craft({
	output = 'building_blocks:Roofing 10',
	recipe = {
		{"building_blocks:Adobe", "building_blocks:Adobe"},
		{"building_blocks:Adobe", "building_blocks:Adobe"},
	}
})
minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'building_blocks:sticks'},
	}
})
minetest.register_craft({
	output = 'building_blocks:tar_base 4',
	recipe = {
		{homedecor.materials.coal_lump, homedecor.materials.gravel},
		{homedecor.materials.gravel, homedecor.materials.coal_lump}
	}
})
minetest.register_craft({
	output = 'building_blocks:tar_base 4',
	recipe = {
		{homedecor.materials.gravel, homedecor.materials.coal_lump},
		{homedecor.materials.coal_lump, homedecor.materials.gravel}
	}
})
minetest.register_craft({
	output = 'building_blocks:Tarmac_spread 4',
	recipe = {
		{"group:tar_block", "group:tar_block"},
	}
})
minetest.register_craft({
	output = 'building_blocks:terrycloth_towel 2',
	recipe = {
		{"farming:string", "farming:string", "farming:string"},
	}
})
minetest.register_craft({
	output = 'building_blocks:woodglass 1',
	recipe = {
		{"group:wood"},
		{homedecor.materials.glass_block},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "building_blocks:smoothglass",
	recipe = homedecor.materials.glass_block
})
minetest.register_craft({
	type = "cooking",
	output = "building_blocks:Tar",
	recipe = "building_blocks:tar_base",
})

minetest.register_craft({
	type = "fuel",
	recipe = "building_blocks:hardwood",
	burntime = 28,
})
minetest.register_craft({
	type = "fuel",
	recipe = "building_blocks:sticks",
	burntime = 5,
})
minetest.register_craft({
	type = "fuel",
	recipe = "building_blocks:Tar",
	burntime = 40,
})
