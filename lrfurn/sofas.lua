local sofas_list = {
	{ "Red Sofa", "red"},
	{ "Orange Sofa", "orange"},
	{ "Yellow Sofa", "yellow"},
	{ "Green Sofa", "green"},
	{ "Blue Sofa", "blue"},
	{ "Violet Sofa", "violet"},
	{ "Black Sofa", "black"},
	{ "Grey Sofa", "grey"},
	{ "White Sofa", "white"},
}

for i in ipairs(sofas_list) do
	local sofadesc = sofas_list[i][1]
	local colour = sofas_list[i][2]

	minetest.register_node("lrfurn:sofa_"..colour, {
		description = sofadesc,
		drawtype = "mesh",
		mesh = "lrfurn_sofa_short.obj",
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
						{-0.5, -0.5, -0.5, 0.5, 0.5, 1.5},
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

	minetest.register_alias("lrfurn:sofa_left_"..colour, "air")
	minetest.register_alias("lrfurn:sofa_right_"..colour, "lrfurn:sofa_"..colour)

	minetest.register_craft({
		output = "lrfurn:sofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "", },
			{"stairs:slab_wood", "stairs:slab_wood", "", },
			{"group:stick", "group:stick", "", }
		}
	})

	minetest.register_craft({
		output = "lrfurn:sofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "", },
			{"moreblocks:slab_wood", "moreblocks:slab_wood", "", },
			{"group:stick", "group:stick", "", }
		}
	})

	minetest.register_craft({
		output = "lrfurn:sofa_"..colour,
		recipe = {
			{"wool:"..colour, "wool:"..colour, "", },
			{"group:wood_slab", "group:wood_slab", "", },
			{"group:stick", "group:stick", "", }
		}
	})

end

if minetest.setting_get("log_mods") then
	minetest.log("action", "sofas loaded")
end
