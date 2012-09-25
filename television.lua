-- This file provides a semi-animated television.

minetest.register_node('homedecor:television', {
	description = "Small CRT Television",
	tiles = { 'homedecor_television_top.png',
		  'homedecor_television_bottom.png',
		  'homedecor_television_right.png',
		  'homedecor_television_left.png',
		  'homedecor_television_back.png',
		   { name="homedecor_television_front_animated.png",
			  animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=80.0
		          }
		   }
	},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	light_source = LIGHT_MAX - 1,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

