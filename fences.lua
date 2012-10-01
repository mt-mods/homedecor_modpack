-- This file adds fences of various types

minetest.register_node("homedecor:fence_brass", {
        description = "Brass Fence/railing",
        drawtype = "fencelike",
        tiles = {"homedecor_tile_brass.png"},
        inventory_image = "homedecor_fence_brass.png",
        wield_image = "homedecor_pole_brass.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
        },
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

minetest.register_node("homedecor:fence_wrought_iron", {
        description = "Wrought Iron Fence/railing",
        drawtype = "fencelike",
        tiles = {"homedecor_tile_wrought_iron.png"},
        inventory_image = "homedecor_fence_wrought_iron.png",
        wield_image = "homedecor_pole_wrought_iron.png",
        paramtype = "light",
        is_ground_content = true,
        selection_box = {
                type = "fixed",
                fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
        },
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
})

minetest.register_node("homedecor:fence_picket", {
	drawtype = "nodebox",
        description = "Unpainted Picket Fence",
        tiles = {
		"homedecor_fence_picket.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket.png"
	},
--        inventory_image = "homedecor_fence_picket.png",
--        wield_image = "homedecor_fence_picket.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.495, 0.5, 0.5, 0.495 }
        },
})

minetest.register_node("homedecor:fence_picket_white", {
	drawtype = "nodebox",
        description = "White Picket Fence",
        tiles = {
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white.png"
	},
--        inventory_image = "homedecor_fence_picket_white.png",
--        wield_image = "homedecor_fence_picket_white.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.495, 0.5, 0.5, 0.495 }
        },
})

minetest.register_node("homedecor:fence_privacy", {
	drawtype = "nodebox",
        description = "Wooden Privacy Fence",
        tiles = {
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_backside.png",
		"homedecor_fence_privacy_front.png"
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 5/16, 0.5, 0.5, 8/16 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, 5/16, -5/16,  8/16, 7/16 },	-- left part
			{ -4/16, -8/16, 5/16,  3/16,  8/16, 7/16 },	-- middle part
			{  4/16, -8/16, 5/16,  8/16,  8/16, 7/16 },	-- right part
			{ -8/16, -2/16, 7/16,  8/16,  2/16, 8/16 },	-- connecting rung
		}
        },
})

minetest.register_node("homedecor:fence_barbed_wire", {
	drawtype = "nodebox",
        description = "Barbed Wire Fence",
        tiles = {"homedecor_fence_barbed_wire.png"},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },	-- left post
			{  6/16, -8/16, 6/16,  8/16, 8/16, 8/16 }, 	-- right post
			{ -6/16, -8/16, 7/16,  6/16, 8/16, 7/16 }	-- the wire
		}		
        },
})

minetest.register_node("homedecor:fence_chainlink", {
	drawtype = "nodebox",
        description = "Chainlink Fence",
        tiles = {
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_fb.png",
		"homedecor_fence_chainlink_fb.png",
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
			{  7/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
			{ -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
			{ -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
			{ -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 }	-- the chainlink itself
		}		
        },
})


-- =====
-- Gates

minetest.register_node("homedecor:fence_picket_gate_closed", {
	drawtype = "nodebox",
        description = "Unpainted Picket Fence Gate",
        tiles = {
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate_backside.png",
		"homedecor_fence_picket_gate.png"
	},
--        inventory_image = "homedecor_fence_picket_gate.png",
--        wield_image = "homedecor_fence_picket_gate.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.495, 0.5, 0.5, 0.495 }
        },
})

minetest.register_node("homedecor:fence_picket_gate_open", {
	drawtype = "nodebox",
        description = "Unpainted Picket Fence Gate",
        tiles = {
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate_backside.png",
		"homedecor_fence_picket_gate.png",
		"homedecor_fence_picket_gate.png"
	},
--        inventory_image = "homedecor_fence_picket_gate.png",
--        wield_image = "homedecor_fence_picket_gate.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3, not_in_creative_inventory=1},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { 0.495, -0.5, -0.5, 0.495, 0.5, 0.5 }
        },
	drop = "homedecor:fence_picket_gate_closed"
})

minetest.register_node("homedecor:fence_picket_gate_white_closed", {
	drawtype = "nodebox",
        description = "White Picket Fence Gate",
        tiles = {
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white_backside.png",
		"homedecor_fence_picket_gate_white.png"
	},
--        inventory_image = "homedecor_fence_picket_gate.png",
--        wield_image = "homedecor_fence_picket_gate.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.495, 0.5, 0.5, 0.495 }
        },
})

minetest.register_node("homedecor:fence_picket_gate_white_open", {
	drawtype = "nodebox",
        description = "White Picket Fence Gate",
        tiles = {
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white_backside.png",
		"homedecor_fence_picket_gate_white.png",
		"homedecor_fence_picket_gate_white.png"
	},
--        inventory_image = "homedecor_fence_picket_gate.png",
--        wield_image = "homedecor_fence_picket_gate.png",
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3, not_in_creative_inventory=1},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { 0.495, -0.5, -0.5, 0.495, 0.5, 0.5 }
        },
	drop = "homedecor:fence_picket_gate_closed"
})

minetest.register_node("homedecor:fence_barbed_wire_gate_closed", {
	drawtype = "nodebox",
        description = "Barbed Wire Fence Gate",
        tiles = {
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_backside.png",
		"homedecor_fence_barbed_wire_gate_front.png"
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, 6/16, -6/16, 8/16, 8/16 },	-- left post
			{  6/16, -8/16, 6/16,  8/16, 8/16, 8/16 }, 	-- right post
			{ -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
			{ -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
			{ -6/16, -8/16, 7/16,  6/16, 8/16, 7/16 }	-- the wire
		}		
        },
})

minetest.register_node("homedecor:fence_barbed_wire_gate_open", {
	drawtype = "nodebox",
        description = "Barbed Wire Fence Gate",
        tiles = {
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_front.png",
		"homedecor_fence_barbed_wire_gate_backside.png",
		"homedecor_fence_barbed_wire_gate_edges.png",
		"homedecor_fence_barbed_wire_gate_edges.png"
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3, not_in_creative_inventory=1},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { 0.375, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{  6/16, -8/16, -8/16,  8/16,  8/16, -6/16 },	-- left post
			{  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
			{ 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
			{ 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
			{  7/16, -8/16, -6/16,  7/16,  8/16,  6/16 }	-- the wire
		}		
        },
	drop = "homedecor:fence_barbed_wire_gate_closed"
})

minetest.register_node("homedecor:fence_chainlink_gate_closed", {
	drawtype = "nodebox",
        description = "Chainlink Fence Gate",
        tiles = {
		"homedecor_fence_chainlink_gate_tb.png",
		"homedecor_fence_chainlink_gate_tb.png",
		"homedecor_fence_chainlink_gate_sides.png",
		"homedecor_fence_chainlink_gate_sides.png",
		"homedecor_fence_chainlink_gate_backside.png",
		"homedecor_fence_chainlink_gate_front.png",
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
			{  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
			{ -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
			{ -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
			{ -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 },	-- the chainlink itself
			{ -8/16, -3/16,  6/16, -6/16,  3/16,  8/16 }	-- the lump representing the lock
		}		
        },
})

minetest.register_node("homedecor:fence_chainlink_gate_open", {
	drawtype = "nodebox",
        description = "Chainlink Fence Gate (open)",
        tiles = {
		"homedecor_fence_chainlink_gate_tb.png",
		"homedecor_fence_chainlink_gate_tb.png",
		"homedecor_fence_chainlink_gate_front.png",
		"homedecor_fence_chainlink_gate_backside.png",
		"homedecor_fence_chainlink_gate_sides.png",
		"homedecor_fence_chainlink_gate_sides.png",
	},
        paramtype = "light",
        is_ground_content = true,
        groups = {snappy=3, not_in_creative_inventory=1},
        sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
        selection_box = {
                type = "fixed",
                fixed = { 0.375, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{  6/16, -8/16, -8/16,  8/16,  8/16, -7/16 },	-- left post
			{  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 }, 	-- right post
			{ 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
			{ 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
			{  7/16, -8/16, -8/16,  7/16,  8/16,  8/16 },	-- the chainlink itself
			{  6/16, -3/16, -8/16,  8/16,  3/16, -6/16 }	-- the lump representing the lock
		}		
        },
	drop = "homedecor:fence_chainlink_gate_closed"
})

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_picket_gate_white_closed" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_picket_gate_white_open", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_picket_gate_white_open" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_picket_gate_white_closed", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_picket_gate_closed" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_picket_gate_open", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_picket_gate_open" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_picket_gate_closed", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_barbed_wire_gate_closed" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_barbed_wire_gate_open", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_barbed_wire_gate_open" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_barbed_wire_gate_closed", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_chainlink_gate_closed" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_chainlink_gate_open", param2 = fdir })
	end
end)

minetest.register_on_punchnode(function (pos, node)
	if node.name=="homedecor:fence_chainlink_gate_open" then 
		fdir=node.param2
		minetest.env:add_node(pos, { name = "homedecor:fence_chainlink_gate_closed", param2 = fdir })
	end
end)


