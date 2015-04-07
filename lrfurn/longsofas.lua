local longsofas_list = {
	{ "Red Long Sofa", "red"},
	{ "Orange Long Sofa", "orange"},
	{ "Yellow Long Sofa", "yellow"},
	{ "Green Long Sofa", "green"},
	{ "Blue Long Sofa", "blue"},
	{ "Violet Long Sofa", "violet"},
	{ "Black Long Sofa", "black"},
	{ "Grey Long Sofa", "grey"},
	{ "White Long Sofa", "white"},
}

for i in ipairs(longsofas_list) do
	local longsofadesc = longsofas_list[i][1]
	local colour = longsofas_list[i][2]

	minetest.register_node("lrfurn:longsofa_"..colour, {
		description = longsofadesc,
		drawtype = "mesh",
		mesh = "lrfurn_sofa_long.obj",
		tiles = {
			"lrfurn_sofa_"..colour..".png",
			"lrfurn_sofa_bottom.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 2.5},
			}
		},
		on_rightclick = function(pos, node, clicker)
			if not clicker:is_player() then
				return
			end
			pos.y = pos.y-0.5
			clicker:setpos(pos)
			clicker:set_hp(20)
		end
	})

	minetest.register_alias("lrfurn:longsofa_left_"..colour, "air")
	minetest.register_alias("lrfurn:longsofa_middle_"..colour, "air")
	minetest.register_alias("lrfurn:longsofa_right_"..colour, "lrfurn:longsofa_"..colour)

	minetest.register_craft({
		output = "lrfurn:longsofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "wool:"..colour, },
			{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood", },
			{"group:stick", "group:stick", "group:stick", }
		}
	})

	minetest.register_craft({
		output = "lrfurn:longsofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "wool:"..colour, },
			{"moreblocks:slab_wood", "moreblocks:slab_wood", "moreblocks:slab_wood", },
			{"group:stick", "group:stick", "group:stick", }
		}
	})

	minetest.register_craft({
		output = "lrfurn:longsofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "wool:"..colour, },
			{"group:wood_slab", "group:wood_slab", "group:wood_slab", },
			{"group:stick", "group:stick", "group:stick", }
		}
	})

end

if minetest.setting_get("log_mods") then
	minetest.log("action", "long sofas loaded")
end
