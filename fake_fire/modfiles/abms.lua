--[[

	I commented out this part because:
		1. water and lava buckets are disabled on some servers,
		2. putting out fire with water and especially lava would only make
		a big mess, and...

	As for 'realism':
		* C'mon... This is *fake* fire.
		* Torches have long been impervious to water.
		* Minetest creates surreal worlds so it's OK if some things aren't
		perfectly realistic.
 
	Besides, the fake-fire can be put out by punching it - simple and effective.
	~ LazyJ, 2014_03_14



-- water and lava puts out fake fire --
minetest.register_abm({
	nodenames = {"fake_fire:fake_fire"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		if minetest.env:find_node_near(pos, 1, {"default:water_source",
		"default:water_flowing","default:lava_source",
		"default:lava_flowing"}) then
		minetest.sound_play("fire_extinguish",
		{gain = 1.0, max_hear_distance = 20,})
		node.name = "air"
		minetest.env:set_node(pos, node)
		end
	end
})
	
	
	
-- ADVISING ABOUT SMOKE PARTICLES SETTINGS

    -- For the best visual result...
    -- If you increase the particles size, 
    -- you should decrease the particles amount	and/or increase the smoke column lenght. 
    -- If you increase the particle time duration and/or particle course, 
    -- you should decrease the particles amount or increase the smoke column lenght.
    -- Or conversely...
    -- ~ JP
    
    --]]

minetest.register_abm({
	nodenames = {
				"fake_fire:fake_fire",
				"fake_fire:ice_fire",
				"fake_fire:chimney_top_stone",
				"fake_fire:chimney_top_sandstone"
				},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			8, --particles amount
			1, --time
			{x=pos.x-0.3, y=pos.y+0.4, z=pos.z-0.3}, --min. smoke position
			{x=pos.x+0.3, y=pos.y+8, z=pos.z+0.3}, --max. smoke position
			{x=-0.2, y=0.2, z=-0.2}, --min. particle velocity
			{x=0.2, y=2, z=0.2}, --max. particle velocity
			{x=0,y=0,z=0}, --min. particle acceleration
			{x=0,y=0,z=0}, --max. particle acceleration
			0.5, --min. time particle expiration
			3, --max. time particle expiration
			8, --min. particle size
			10, --max. particle size
			false, --collision detection
			"smoke_particle.png" --textures
		)
		end,
})

