
local S = homedecor.gettext

function homedecor.node_is_owned(pos, placer)
	local ownername = false
	if type(IsPlayerNodeOwner) == "function" then					-- node_ownership mod
		if HasOwner(pos, placer) then						-- returns true if the node is owned
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) then
				if type(getLastOwner) == "function" then		-- ...is an old version
					ownername = getLastOwner(pos)
				elseif type(GetNodeOwnerName) == "function" then	-- ...is a recent version
					ownername = GetNodeOwnerName(pos)
				else
					ownername = S("someone")
				end
			end
		end

	elseif type(isprotect)=="function" then 					-- glomie's protection mod
		if not isprotect(5, pos, placer) then
			ownername = S("someone")
		end
	elseif type(protector)=="table" and type(protector.can_dig)=="function" then 					-- Zeg9's protection mod
		if not protector.can_dig(5, pos, placer) then
			ownername = S("someone")
		end
	end

	if ownername ~= false then
		minetest.chat_send_player( placer:get_player_name(), S("Sorry, %s owns that spot."):format(ownername) )
		return true
	else
		return false
	end
end

-- protection wrapper for 6d stuff

function homedecor.protect_and_rotate(itemstack, placer, pointed_thing)
	if not homedecor.node_is_owned(pointed_thing.under, placer) 
	   and not homedecor.node_is_owned(pointed_thing.above, placer) then
		local keys=placer:get_player_control()
		minetest.rotate_and_place(itemstack, placer, pointed_thing,
			homedecor.expect_infinite_stacks, {invert_wall = keys.sneak})
	end
	return itemstack
end

