-- Font: 04.jp.org

-- CONSTANTS

local SIGN_WIDTH = 110
local SIGN_PADDING = 8

local LINE_LENGTH = 16
local NUMBER_OF_LINES = 4

local LINE_HEIGHT = 14
local CHAR_WIDTH = 5

local signs = {
    {delta = {x = -0.06, y = 0, z = 0.399}, yaw = 0},
    {delta = {x = 0.399, y = 0, z = 0.06}, yaw = math.pi / -2},
    {delta = {x = 0.06, y = 0, z = -0.399}, yaw = math.pi},
    {delta = {x = -0.399, y = 0, z = -0.06}, yaw = math.pi / 2},
}

local signs_yard = {
    {delta = {x = -0.06, y = 0, z = -0.05}, yaw = 0},
    {delta = {x = -0.05, y = 0, z = 0.06}, yaw = math.pi / -2},
    {delta = {x = 0.06, y = 0, z = 0.05}, yaw = math.pi},
    {delta = {x = 0.05, y = 0, z = -0.06}, yaw = math.pi / 2},
}

local signs_post = {
    {delta = {x = -0.06, y = 0, z = -0.226}, yaw = 0},
    {delta = {x = -0.226, y = 0, z = 0.06}, yaw = math.pi / -2},
    {delta = {x = 0.06, y = 0, z = 0.226}, yaw = math.pi},
    {delta = {x = 0.226, y = 0, z = -0.06}, yaw = math.pi / 2},
}

local sign_groups = {choppy=2, dig_immediate=2}

local fences_with_sign = { }

-- Misc variables

local chars_file = io.open(minetest.get_modpath("homedecor").."/characters", "r")
local charmap = {}
local max_chars = 16

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if homedecor.intllib_modpath then
    dofile(homedecor.intllib_modpath.."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- some local helper functions

local homedecor_create_lines = function(text)
	local tab = {}
	for line in text:gmatch("([^|]+)|?") do
		line = line:gsub("^%s*(.*)%s*$", "%1") -- Trim whitespace
		table.insert(tab, line)
		if #tab >= NUMBER_OF_LINES then break end
	end
	return tab
end

local math_max = math.max

local homedecor_generate_line = function(s, ypos)
    local i = 1
    local parsed = {}
    local width = 0
    local maxw = 0
    local chars = 0
    while i <= #s do
        local file = nil
        if charmap[s:sub(i, i)] ~= nil then
            file = charmap[s:sub(i, i)]
            i = i + 1
        elseif i < #s and charmap[s:sub(i, i + 1)] ~= nil then
            file = charmap[s:sub(i, i + 1)]
            i = i + 2
        else
            print("[signs] W: unknown symbol in '"..s.."' at "..i.." (probably "..s:sub(i, i)..")")
            i = i + 1
        end
        if file ~= nil then
            width = width + CHAR_WIDTH
            maxw = math_max(width, maxw)
			chars = chars + 1
			if chars > max_chars then
				width = 0
			end
            table.insert(parsed, file)
        end
    end
    maxw = maxw - 1

    local texture = { }
    local start_xpos = math.floor((SIGN_WIDTH - 2 * SIGN_PADDING - maxw) / 2 + SIGN_PADDING)
    local xpos = start_xpos
    local linepos = 0
    for i = 1, #parsed do
        table.insert(texture, (":%d,%d=%s.png"):format(xpos, ypos, parsed[i]))
        xpos = xpos + CHAR_WIDTH + 1
        linepos = linepos + 1
        if linepos > max_chars then
			xpos = start_xpos
			linepos = 0
			ypos = ypos + LINE_HEIGHT
		end
    end
    return table.concat(texture, ""), ypos
end

local function copy ( t )
    local nt = { };
    for k, v in pairs(t) do
        if type(v) == "table" then
            nt[k] = copy(v)
        else
            nt[k] = v
        end
    end
    return nt
end

local homedecor_generate_texture = function(lines)
    local texture = { ("[combine:%dx%d"):format(SIGN_WIDTH, SIGN_WIDTH) }
    local ypos = 12
    for i = 1, #lines do
        local linetex, yp = homedecor_generate_line(lines[i], ypos)
        table.insert(texture, linetex)
        ypos = yp + LINE_HEIGHT
    end
    return table.concat(texture, "")
end

-- load characters map

if not chars_file then
    print("[signs] "..S("E: character map file not found"))
else
    while true do
        local char = chars_file:read("*l")
        if char == nil then
            break
        end
        local img = chars_file:read("*l")
        chars_file:read("*l")
        charmap[char] = img
    end
end

homedecor.construct_sign = function(pos)
    local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "field[text;;${text}]")
	meta:set_string("infotext", "")
end

homedecor.destruct_sign = function(pos)
    local objects = minetest.get_objects_inside_radius(pos, 0.5)
    for _, v in ipairs(objects) do
        if v:get_entity_name() == "signs:text" then
            v:remove()
        end
    end
end

homedecor.update_sign = function(pos, fields)
    local meta = minetest.get_meta(pos)
	if fields then
		meta:set_string("infotext", table.concat(homedecor_create_lines(fields.text), "\n"))
		meta:set_string("text", fields.text)
	end
    local text = meta:get_string("text")
    local objects = minetest.get_objects_inside_radius(pos, 0.5)
    for _, v in ipairs(objects) do
        if v:get_entity_name() == "signs:text" then
            v:set_properties({textures={homedecor_generate_texture(homedecor_create_lines(text))}})
			return
        end
    end
	
	-- if there is no entity
	local sign_info
	if minetest.get_node(pos).name == "signs:sign_yard" then
		sign_info = signs_yard[minetest.get_node(pos).param2 + 1]
	elseif minetest.get_node(pos).name == "default:sign_wall" then
		sign_info = signs[minetest.get_node(pos).param2 + 1]
	else --if minetest.get_node(pos).name == "signs:sign_post" then
		sign_info = signs_post[minetest.get_node(pos).param2 + 1]
	end
	if sign_info == nil then
		return
	end
	local text = minetest.add_entity({x = pos.x + sign_info.delta.x,
										y = pos.y + sign_info.delta.y,
										z = pos.z + sign_info.delta.z}, "signs:text")
	text:setyaw(sign_info.yaw)
end

if not homedecor.disable_signs then
	minetest.register_node(":default:sign_wall", {
		description = "Sign",
		inventory_image = "default_sign_wall.png",
		wield_image = "default_sign_wall.png",
		node_placement_prediction = "",
		paramtype = "light",
		sunlight_propagates = true,
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {type = "fixed", fixed = {-0.45, -0.15, 0.4, 0.45, 0.45, 0.498}},
		selection_box = {type = "fixed", fixed = {-0.45, -0.15, 0.4, 0.45, 0.45, 0.498}},
		tiles = {"signs_top.png", "signs_bottom.png", "signs_side.png", "signs_side.png", "signs_back.png", "signs_front.png"},
		groups = sign_groups,

		on_place = function(itemstack, placer, pointed_thing)
			local name
			name = minetest.get_node(pointed_thing.under).name
			if fences_with_sign[name] then
				if homedecor:node_is_owned(pointed_thing.under, placer) then
					return itemstack
				end
			else
				name = minetest.get_node(pointed_thing.above).name
				local def = minetest.registered_nodes[name]
				if homedecor:node_is_owned(pointed_thing.above, placer)
				 or (not def.buildable_to) then
					return itemstack
				end
			end

		local node=minetest.get_node(pointed_thing.under)

		if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
			return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		else
			local above = pointed_thing.above
			local under = pointed_thing.under
			local dir = {x = under.x - above.x,
						 y = under.y - above.y,
						 z = under.z - above.z}

			local wdir = minetest.dir_to_wallmounted(dir)

			local placer_pos = placer:getpos()
			if placer_pos then
				dir = {
					x = above.x - placer_pos.x,
					y = above.y - placer_pos.y,
					z = above.z - placer_pos.z
				}
			end

			local fdir = minetest.dir_to_facedir(dir)

			local sign_info
			local pt_name = minetest.get_node(under).name
			print(dump(pt_name))

			if fences_with_sign[pt_name] then
				minetest.add_node(under, {name = fences_with_sign[pt_name], param2 = fdir})
				sign_info = signs_post[fdir + 1]

			elseif wdir == 0 then
				--how would you add sign to ceiling?
				minetest.add_item(above, "default:sign_wall")
					itemstack:take_item()
					return itemstack
			elseif wdir == 1 then
				minetest.add_node(above, {name = "signs:sign_yard", param2 = fdir})
				sign_info = signs_yard[fdir + 1]
			else
				minetest.add_node(above, {name = "default:sign_wall", param2 = fdir})
				sign_info = signs[fdir + 1]
			end

			local text = minetest.add_entity({x = above.x + sign_info.delta.x,
												  y = above.y + sign_info.delta.y,
												  z = above.z + sign_info.delta.z}, "signs:text")
			text:setyaw(sign_info.yaw)

			
			if not homedecor.expect_infinite_stacks then
				itemstack:take_item()
			end
			return itemstack
		end
		end,
		on_construct = function(pos)
			homedecor.construct_sign(pos)
		end,
		on_destruct = function(pos)
			homedecor.destruct_sign(pos)
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			if fields then
				print(S("%s wrote \"%s\" to sign at %s"):format(
					(sender:get_player_name() or ""),
					fields.text,
					minetest.pos_to_string(pos)
				))
			end
			if homedecor:node_is_owned(pos, sender) then return end
			homedecor.update_sign(pos, fields)
		end,
		on_punch = function(pos, node, puncher)
			homedecor.update_sign(pos)
		end,
	})
end

minetest.register_node(":signs:sign_yard", {
    paramtype = "light",
	sunlight_propagates = true,
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = {type = "fixed", fixed = {
        {-0.45, -0.15, -0.049, 0.45, 0.45, 0.049},
        {-0.05, -0.5, -0.049, 0.05, -0.15, 0.049}
    }},
    selection_box = {type = "fixed", fixed = {-0.45, -0.15, -0.049, 0.45, 0.45, 0.049}},
    tiles = {"signs_top.png", "signs_bottom.png", "signs_side.png", "signs_side.png", "signs_back.png", "signs_front.png"},
    groups = {choppy=2, dig_immediate=2},
    drop = "default:sign_wall",

    on_construct = function(pos)
        homedecor.construct_sign(pos)
    end,
    on_destruct = function(pos)
        homedecor.destruct_sign(pos)
    end,
    on_receive_fields = function(pos, formname, fields, sender)
        if fields then
            print(S("%s wrote \"%s\" to sign at %s"):format(
                (sender:get_player_name() or ""),
                fields.text,
                minetest.pos_to_string(pos)
            ))
        end
		if homedecor:node_is_owned(pos, sender) then return end
        homedecor.update_sign(pos, fields)
    end,
	on_punch = function(pos, node, puncher)
		homedecor.update_sign(pos)
	end,
})

minetest.register_node(":signs:sign_post", {
    paramtype = "light",
	sunlight_propagates = true,
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = {
	type = "fixed",
	fixed = { 
		{ -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
		{ -0.45, -0.15, -0.225, 0.45, 0.45, -0.125 },
	}
    },
    selection_box = {
	type = "fixed",
	fixed = { 
		{ -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
		{ -0.45, -0.15, -0.225, 0.45, 0.45, -0.125 },
	}
    },
    tiles = {
	"signs_post_top.png",
	"signs_post_bottom.png",
	"signs_post_side.png",
	"signs_post_side.png",
	"signs_post_back.png",
	"signs_post_front.png",
    },
    groups = {choppy=2, dig_immediate=2},
    drop = {
	max_items = 2,
	items = {
		{ items = { "default:sign_wall" }},
		{ items = { "default:fence_wood" }},
	},
    },
})

local signs_text_on_activate

if not homedecor.disable_signs then
	signs_text_on_activate = function(self)
		local meta = minetest.get_meta(self.object:getpos())
		local text = meta:get_string("text")
		self.object:set_properties({textures={homedecor_generate_texture(homedecor_create_lines(text))}})
	end
else
	signs_text_on_activate = function(self)
		self.object:remove()
	end
end


minetest.register_entity(":signs:text", {
    collisionbox = { 0, 0, 0, 0, 0, 0 },
    visual = "upright_sprite",
    textures = {},

	on_activate = signs_text_on_activate,
})

-- And the good stuff here! :-)

function homedecor.register_fence_with_sign(fencename, fencewithsignname)
    local def = minetest.registered_nodes[fencename]
    local def_sign = minetest.registered_nodes[fencewithsignname]
    if not (def and def_sign) then
        minetest.log("warning", "[homedecor] Attempt to register unknown node as fence")
        return
    end
    def = copy(def)
    def_sign = copy(def_sign)
    fences_with_sign[fencename] = fencewithsignname

    def.on_place = function(itemstack, placer, pointed_thing, ...)
		local node_above = minetest.get_node(pointed_thing.above)
		local node_under = minetest.get_node(pointed_thing.under)
		local def_above = minetest.registered_nodes[node_above.name]
		local def_under = minetest.registered_nodes[node_under.name]
		local fdir = minetest.dir_to_facedir(placer:get_look_dir())
		if def_under and def_under.on_rightclick then
			return def_under.on_rightclick(pointed_thing.under, node_under, placer, itemstack) or itemstack
		elseif (not homedecor:node_is_owned(pointed_thing.under, placer))
		 and def_under.buildable_to then
			minetest.add_node(pointed_thing.under, {name = fencename, param2 = fdir})
			if not homedecor.expect_infinite_stacks then
				itemstack:take_item()
			end
			placer:set_wielded_item(itemstack)
			return itemstack
		elseif (not homedecor:node_is_owned(pointed_thing.above, placer))
		 and def_above.buildable_to then
			minetest.add_node(pointed_thing.above, {name = fencename, param2 = fdir})
			if not homedecor.expect_infinite_stacks then
				itemstack:take_item()
			end
			placer:set_wielded_item(itemstack)
			return itemstack
		end
	end
	def_sign.on_construct = function(pos, ...)
		homedecor.construct_sign(pos)
	end
	def_sign.on_destruct = function(pos, ...)
		homedecor.destruct_sign(pos)
	end
	def_sign.on_receive_fields = function(pos, formname, fields, sender, ...)
        if fields then
            print(S("%s wrote \"%s\" to sign at %s"):format(
                (sender:get_player_name() or ""),
                fields.text,
                minetest.pos_to_string(pos)
            ))
        end
		if homedecor:node_is_owned(pos, sender) then return end
		homedecor.update_sign(pos, fields)
	end
	def_sign.on_punch = function(pos, node, puncher, ...)
		homedecor.update_sign(pos)
	end
	local fencename = fencename
	def_sign.after_dig_node = function(pos, node, ...)
	    node.name = fencename
	    minetest.add_node(pos, node)
	end
    def_sign.drop = "default:sign_wall"
	minetest.register_node(":"..fencename, def)
	minetest.register_node(":"..fencewithsignname, def_sign)
	print("Registered "..fencename.." and "..fencewithsignname)
end

if minetest.setting_get("log_mods") then
	minetest.log("action", S("signs loaded"))
end
