-- Home decor seating
-- forked from the previous lrfurn mod

local S = minetest.get_translator("homedecor_seating")
local modpath = minetest.get_modpath("homedecor_seating")
local has_player_monoids = minetest.get_modpath("player_monoids")

lrfurn = {}

lrfurn.fdir_to_right = {
	{  1,  0 },
	{  0, -1 },
	{ -1,  0 },
	{  0,  1 },
}

lrfurn.colors = {
	"black",
	"brown",
	"blue",
	"cyan",
	"dark_grey",
	"dark_green",
	"green",
	"grey",
	"magenta",
	"orange",
	"pink",
	"red",
	"violet",
	"white",
	"yellow",
}

function lrfurn.check_right(pos, fdir, long, placer)
	if not fdir or fdir > 3 then fdir = 0 end

	local pos2 = {
		x = pos.x + lrfurn.fdir_to_right[fdir+1][1],
		y = pos.y, z = pos.z + lrfurn.fdir_to_right[fdir+1][2]
	}
	local pos3 = {
		x = pos.x + lrfurn.fdir_to_right[fdir+1][1] * 2,
		y = pos.y, z = pos.z + lrfurn.fdir_to_right[fdir+1][2] * 2
	}

	local node2 = minetest.get_node(pos2)
	if node2 and node2.name ~= "air" then
		return false
	elseif minetest.is_protected(pos2, placer:get_player_name()) then
		if not long then
			minetest.chat_send_player(placer:get_player_name(), S("Someone else owns the spot where the other end goes!"))
		else
			minetest.chat_send_player(placer:get_player_name(),
				S("Someone else owns the spot where the middle or far end goes!"))
		end
		return false
	end

	if long then
		local node3 = minetest.get_node(pos3)
		if node3 and node3.name ~= "air" then
			return false
		elseif minetest.is_protected(pos3, placer:get_player_name()) then
			minetest.chat_send_player(placer:get_player_name(), S("Someone else owns the spot where the other end goes!"))
			return false
		end
	end

	return true
end

function lrfurn.fix_sofa_rotation_nsew(pos, placer, itemstack, pointed_thing)
	local node = minetest.get_node(pos)
	local colorbits = node.param2 - (node.param2 % 8)
	local yaw = placer:get_look_horizontal()
	local dir = minetest.yaw_to_dir(yaw)
	local fdir = minetest.dir_to_wallmounted(dir)
	minetest.swap_node(pos, { name = node.name, param2 = fdir+colorbits })
end

local physics_cache = {}

function lrfurn.sit(pos, node, clicker, itemstack, pointed_thing, seats)
	if not clicker:is_player() then
		return itemstack
	end

	local name = clicker:get_player_name()
	if physics_cache[name] then --already sitting
		lrfurn.stand(clicker)
		return itemstack
	end

	--conversion table for param2 to dir
	local p2d = {
		vector.new(0, 0, 0),
		vector.new(0, 0, -1),
		vector.new(0, 0, 1),
		vector.new(1, 0, 0),
		vector.new(-1, 0, 0),
		vector.new(0, 0, 0),
		vector.new(0, 0, 0)
	}

	--generate posible seat positions
	local valid_seats = {[minetest.hash_node_position(pos)] = pos}
	if seats > 1 then
		for i=1,seats-1 do
			--since this are hardware colored nodes, node.param2 gives us a actual param to get a dir from
			local npos = vector.add(pos, vector.multiply(p2d[node.param2 % 8], i))
			valid_seats[minetest.hash_node_position(npos)] = npos
		end
	end

	--see if we can find a non occupied seat
	local sit_pos
	for hash, spos in pairs(valid_seats) do
		local pstatus = false
		for _, ref in pairs(minetest.get_objects_inside_radius(spos, 0.5)) do
			if ref:is_player() then
				pstatus = true
			end
		end
		if not pstatus then sit_pos = spos end
	end
	if not sit_pos then
		minetest.chat_send_player(name, "sorry, this seat is currently occupied")
		return itemstack
	end

	--seat the player
	clicker:set_pos(sit_pos)

	xcompat.player.player_attached[name] = true
    xcompat.player.set_animation(clicker, "sit", 0)
	if has_player_monoids then
		physics_cache[name] = true
		player_monoids.speed:add_change(clicker, 0, "homedecor_seating:sit")
		player_monoids.jump:add_change(clicker, 0, "homedecor_seating:sit")
		player_monoids.gravity:add_change(clicker, 0, "homedecor_seating:sit")
	else
		physics_cache[name] = table.copy(clicker:get_physics_override())
		clicker:set_physics_override({speed = 0, jump = 0, gravity = 0})
	end

	return itemstack
end

function lrfurn.stand(clicker)
	local name = clicker:get_player_name()
	xcompat.player.player_attached[name] = false
	if physics_cache[name] then
		if has_player_monoids then
			player_monoids.speed:del_change(clicker, "homedecor_seating:sit")
			player_monoids.jump:del_change(clicker, "homedecor_seating:sit")
			player_monoids.gravity:del_change(clicker, "homedecor_seating:sit")
		else
			clicker:set_physics_override(physics_cache[name])
		end
		physics_cache[name] = nil
	else --in case this is called and the cache is empty
		if has_player_monoids then
			player_monoids.speed:del_change(clicker, "homedecor_seating:sit")
			player_monoids.jump:del_change(clicker, "homedecor_seating:sit")
			player_monoids.gravity:del_change(clicker, "homedecor_seating:sit")
		else
			clicker:set_physics_override({speed = 1, jump = 1, gravity = 1})
		end
	end
end

dofile(modpath.."/longsofas.lua")
dofile(modpath.."/sofas.lua")
dofile(modpath.."/armchairs.lua")
dofile(modpath.."/misc.lua")
