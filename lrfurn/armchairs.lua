
local S = homedecor_i18n.gettext

local armchair_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5 },
		{-0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
	}
}

for i, c in ipairs(lrfurn.colors) do
	local colour, coldesc, hue = unpack(c)

	minetest.register_node("lrfurn:armchair_"..colour, {
		description = S("Armchair (@1)", coldesc),
		drawtype = "mesh",
		mesh = "lrfurn_armchair.obj",
		tiles = {
			{ name = "lrfurn_upholstery.png", color = hue }, 
			"lrfurn_sofa_bottom.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = armchair_cbox,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			if not clicker:is_player() then
				return itemstack
			end
			pos.y = pos.y-0.5
			clicker:setpos(pos)
			clicker:set_hp(20)
			return itemstack
		end
	})

	minetest.register_craft({
		output = "lrfurn:armchair_"..colour,
		recipe = {
			{"wool:"..colour, "", "", },
			{"stairs:slab_wood", "", "", },
			{"group:stick", "", "", }
		}
	})

	minetest.register_craft({
		output = "lrfurn:armchair_"..colour,
		recipe = {
			{"wool:"..colour, "", "", },
			{"moreblocks:slab_wood", "", "", },
			{"group:stick", "", "", }
		}
	})

end

if minetest.setting_get("log_mods") then
	minetest.log("action", "[lrfurn/armchairs] "..S("Loaded!"))
end
