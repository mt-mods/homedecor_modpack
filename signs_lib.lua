-- This code was borrowed from Pilzadam's rework of thexyz's signs mod

-- Font: 04.jp.org

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- load characters map
local chars_file = io.open(minetest.get_modpath("homedecor").."/characters", "r")
local charmap = {}
local max_chars = 16
if not chars_file then
    print("[homedecor] "..S("E: character map file not found"))
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

local signs_post = {
    {delta = {x = 0, y = 0, z = -0.226}, yaw = 0},
    {delta = {x = -0.226, y = 0, z = 0}, yaw = math.pi / -2},
    {delta = {x = 0, y = 0, z = 0.226}, yaw = math.pi},
    {delta = {x = 0.226, y = 0, z = 0}, yaw = math.pi / 2},
}

homedecor_construct_sign = function(pos)
    local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "field[text;;${text}]")
	meta:set_string("infotext", "")
end

homedecor_destruct_sign = function(pos)
    local objects = minetest.env:get_objects_inside_radius(pos, 0.5)
    for _, v in ipairs(objects) do
        if v:get_entity_name() == "homedecor:sign_text" then
            v:remove()
        end
    end
end

homedecor_update_sign = function(pos, fields)
    local meta = minetest.env:get_meta(pos)
	meta:set_string("infotext", "")
	if fields then
		meta:set_string("text", fields.text)
	end
    local text = meta:get_string("text")
    local objects = minetest.env:get_objects_inside_radius(pos, 0.5)
    for _, v in ipairs(objects) do
        if v:get_entity_name() == "homedecor:sign_text" then
            v:set_properties({textures={homedecor_generate_texture(homedecor_create_lines(text))}})
			return
        end
    end
	
	-- if there is no entity
	local sign_info
	if minetest.env:get_node(pos).name == "homedecor:fence_brass_with_sign" 
	    or minetest.env:get_node(pos).name == "homedecor:fence_wrought_iron_with_sign" then
		sign_info = signs_post[minetest.env:get_node(pos).param2 + 1]
	end
	if sign_info == nil then
		return
	end
	local text = minetest.env:add_entity({x = pos.x + sign_info.delta.x,
						y = pos.y + sign_info.delta.y,
						z = pos.z + sign_info.delta.z}, "homedecor:sign_text")
	text:setyaw(sign_info.yaw)
end

minetest.register_entity("homedecor:sign_text", {
    collisionbox = { 0, 0, 0, 0, 0, 0 },
    visual = "upright_sprite",
    textures = {},

    on_activate = function(self)
        local meta = minetest.env:get_meta(self.object:getpos())
        local text = meta:get_string("text")
        self.object:set_properties({textures={homedecor_generate_texture(homedecor_create_lines(text))}})
    end
})

-- CONSTANTS
local SIGN_WITH = 110
local SIGN_PADDING = 8

local LINE_LENGTH = 16
local NUMBER_OF_LINES = 4

local LINE_HEIGHT = 14
local CHAR_WIDTH = 5

homedecor_string_to_array = function(str)
	local tab = {}
	for i=1,string.len(str) do
		table.insert(tab, string.sub(str, i,i))
	end
	return tab
end

homedecor_string_to_word_array = function(str)
	local tab = {}
	local current = 1
	tab[1] = ""
	for _,char in ipairs(homedecor_string_to_array(str)) do
		if char ~= " " then
			tab[current] = tab[current]..char
		else
			current = current+1
			tab[current] = ""
		end
	end
	return tab
end

homedecor_create_lines = function(text)
	local line = ""
	local line_num = 1
	local tab = {}
	for _,word in ipairs(homedecor_string_to_word_array(text)) do
		if string.len(line)+string.len(word) < LINE_LENGTH and word ~= "|" then
			if line ~= "" then
				line = line.." "..word
			else
				line = word
			end
		else
			table.insert(tab, line)
			if word ~= "|" then
				line = word
			else
				line = ""
			end
			line_num = line_num+1
			if line_num > NUMBER_OF_LINES then
				return tab
			end
		end
	end
	table.insert(tab, line)
	return tab
end

homedecor_generate_texture = function(lines)
    local texture = "[combine:"..SIGN_WITH.."x"..SIGN_WITH
    local ypos = 12
    for i = 1, #lines do
        texture = texture..homedecor_generate_line(lines[i], ypos)
        ypos = ypos + LINE_HEIGHT
    end
    return texture
end

homedecor_generate_line = function(s, ypos)
    local i = 1
    local parsed = {}
    local width = 0
    local chars = 0
    while chars < max_chars and i <= #s do
        local file = nil
        if charmap[s:sub(i, i)] ~= nil then
            file = charmap[s:sub(i, i)]
            i = i + 1
        elseif i < #s and charmap[s:sub(i, i + 1)] ~= nil then
            file = charmap[s:sub(i, i + 1)]
            i = i + 2
        else
            print("[homedecor] "..S("W: unknown symbol in '%s' at %d (probably %s)"):format(s, i, s:sub(i, i)))
            i = i + 1
        end
        if file ~= nil then
            width = width + CHAR_WIDTH
            table.insert(parsed, file)
            chars = chars + 1
        end
    end
    width = width - 1

    local texture = ""
    local xpos = math.floor((SIGN_WITH - 2 * SIGN_PADDING - width) / 2 + SIGN_PADDING)
    for i = 1, #parsed do
        texture = texture..":"..xpos..","..ypos.."="..parsed[i]..".png"
        xpos = xpos + CHAR_WIDTH + 1
    end
    return texture
end

