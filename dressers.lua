-- This file supplies dressers


minetest.register_craftitem("homedecor:drawer_large", {
        description = "Large Wooden Drawer",
        inventory_image = "homedecor_drawer_large.png",
})


minetest.register_craft( {
        output = 'homedecor:drawer_large',
        recipe = {
                { 'default:wood', 'default:steel_ingot', 'default:wood' },
                { 'default:wood', 'default:wood', 'default:wood' },
        },
})

minetest.register_craft({
        type = 'fuel',
        recipe = 'homedecor:drawer_large',
        burntime = 30,
})

--

minetest.register_craftitem("homedecor:dresser_oak", {
        description = "Three-Drawer Oak Dresser",
        inventory_image = "homedecor_dresser_oak_inv.png",
})


minetest.register_craft( {
        output = 'homedecor:dresser_oak',
        recipe = {
                { 'default:wood', 'homedecor:drawer_large', 'default:wood' },
                { 'default:wood', 'homedecor:drawer_large', 'default:wood' },
                { 'default:wood', 'homedecor:drawer_large', 'default:wood' },
        },
})

minetest.register_craft({
        type = 'fuel',
        recipe = 'homedecor:dresser_oak',
        burntime = 30,
})

--

minetest.register_craftitem("homedecor:dresser_mahogany", {
        description = "Three-Drawer Mahogany Dresser",
        inventory_image = "homedecor_dresser_mahogany_inv.png",
})

minetest.register_craft( {
	type = 'shapeless',
        output = 'homedecor:dresser_mahogany',
        recipe = {
		'homedecor:dresser_oak',
		'unifieddyes:dark_orange',
		'unifieddyes:dark_orange',
        },
	replacements = {
			{'unifieddyes:dark_orange', 'vessels:glass_bottle'},
			{'unifieddyes:dark_orange', 'vessels:glass_bottle'}
	},
})

minetest.register_craft( {
	type = 'shapeless',
        output = 'homedecor:dresser_mahogany',
        recipe = {
		'homedecor:dresser_oak',
                'default:dirt',
                'default:dirt',
		'default:coal_lump',
		'default:coal_lump',
        },
})

minetest.register_craft({
        type = 'fuel',
        recipe = 'homedecor:dresser_oak',
        burntime = 30,
})

