-- Nodes that would affect the local temperature e.g. fans, heater, A/C

local S = homedecor.gettext

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

minetest.register_node('homedecor:space_heater', {
	drawtype = "nodebox",
	description = S("Space heater"),
	tiles = { 'homedecor_heater_tb.png',
		  'homedecor_heater_tb.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_back.png',
		  'homedecor_heater_front.png'
	},
	inventory_image = "homedecor_heater_inv.png",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125}
	}
})

-- fans

minetest.register_entity("homedecor:mesh_desk_fan", {
    collisionbox = { 0, 0, 0, 0, 0, 0 },
    visual = "mesh",
	mesh = "homedecor_desk_fan.b3d",
    textures = {"homedecor_desk_fan_uv.png"},
	visual_size = {x=10, y=10},
})

minetest.register_node("homedecor:desk_fan", {
	description = "Desk Fan",
	drawtype = "nodebox",
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	paramtype = "light",
	groups = {oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox1
		}
	},
	tiles = {"homedecor_desk_fan_body.png"},
	inventory_image = "homedecor_desk_fan_inv.png",
	wield_image = "homedecor_desk_fan_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	on_construct = function(pos)
		local entity_remove = minetest.get_objects_inside_radius(pos, 0.1)
		local meta = minetest.get_meta(pos)
		meta:set_string("active", "no")
		print (meta:get_string("active"))
		if entity_remove[1] == nil then
			minetest.add_entity({x=pos.x, y=pos.y, z=pos.z}, "homedecor:mesh_desk_fan") --+(0.0625*10)
			entity_remove = minetest.get_objects_inside_radius(pos, 0.1)
			if minetest.get_node(pos).param2 == 0 then --list of rad to 90 degree: 3.142/2 = 90; 3.142 = 180; 3*3.142 = 270
				entity_remove[1]:setyaw(3.142)
			elseif minetest.get_node(pos).param2 == 1 then
				entity_remove[1]:setyaw(3.142/2)
			elseif minetest.get_node(pos).param2 == 3 then
				entity_remove[1]:setyaw((-3.142/2))
			else
				entity_remove[1]:setyaw(0)
			end
		end
	end,
	on_punch = function(pos)
		local entity_anim = minetest.get_objects_inside_radius(pos, 0.1)
		local speedy_meta = minetest.get_meta(pos)
		if speedy_meta:get_string("active") == "no" then
			speedy_meta:set_string("active", "yes")
			print (speedy_meta:get_string("active"))
		elseif speedy_meta:get_string("active") == "yes" then
			speedy_meta:set_string("active", "no")
			print (speedy_meta:get_string("active"))
		end
		
		if entity_anim[1] == nil then
			minetest.add_entity({x=pos.x, y=pos.y, z=pos.z}, "homedecor:mesh_desk_fan") --+(0.0625*10)
			local entity_remove = minetest.get_objects_inside_radius(pos, 0.1)
			if minetest.get_node(pos).param2 == 0 then --list of rad to 90 degree: 3.142/2 = 90; 3.142 = 180; 3*3.142 = 270
				entity_remove[1]:setyaw(3.142)
			elseif minetest.get_node(pos).param2 == 1 then
				entity_remove[1]:setyaw(3.142/2)
			elseif minetest.get_node(pos).param2 == 3 then
				entity_remove[1]:setyaw((-3.142/2))
			else
				entity_remove[1]:setyaw(0)
			end
		end
		local entity_anim = minetest.get_objects_inside_radius(pos, 0.1)
		if minetest.get_meta(pos):get_string("active") == "no" then
			entity_anim[1]:set_animation({x=0,y=0}, 1, 0)
		elseif minetest.get_meta(pos):get_string("active") == "yes" then
			entity_anim[1]:set_animation({x=0,y=96}, 24, 0)
		end
	end,
	after_dig_node = function(pos)
		local entity_remove = minetest.get_objects_inside_radius(pos, 0.1)
		entity_remove[1]:remove()
	end,
})


