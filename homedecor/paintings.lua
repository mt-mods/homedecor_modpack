--Various kinds of paintings

for i = 1,20 do
	minetest.register_node("homedecor:painting_"..i, {
		description = "Decorative painting",
		drawtype = "nodebox",
		tiles = {
			"homedecor_painting_edges.png",
			"homedecor_painting_edges.png",
			"homedecor_painting_edges.png",
			"homedecor_painting_edges.png",
			"homedecor_painting_back.png",
			"homedecor_painting"..i..".png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{ -8/16, -8/16, 7/16, 8/16, 8/16, 8/16 },
			}
		},
		groups = {snappy=3},
	})
end
