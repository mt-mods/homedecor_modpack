homedecor.materials = {
    dirt = "default:dirt",
    sand = "default:sand",
    gravel = "default:gravel",
    copper_ingot = "default:copper_ingot",
    steel_ingot = "default:steel_ingot",
    gold_ingot = "default:gold_ingot",
    tin_ingot = "default:tin_ingot",
    mese_crystal_fragment = "default:mese_crystal_fragment",
    torch = "default:torch",
    diamond = "default:diamond",
    clay_lump = "default:clay_lump",
    water_bucket = "bucket:bucket_water",
    empty_bucket = "bucket:bucket_empty",
    dye_dark_grey = "dye:dark_grey",
    dye_black = "dye:black",
    dye_white = "dye:white",
    silicon = "mesecons_materials:silicon",
    string = "farming:string",
    paper = "default:paper",
    book = "default:book",
    iron_lump = "default:iron_lump",
    wool_grey = "wool:grey",
    wool_green = "wool:green",
    wool_dark_green = "wool:dark_green",
    wool_brown = "wool:brown"
}

if minetest.get_modpath("moreores") then
    homedecor.materials.silver_ingot = "moreores:silver_ingot"
end

if minetest.get_modpath("mcl_core") then
    homedecor.materials = {
        dirt = "mcl_core:dirt",
        sand = "mcl_core:sand",
        gravel = "mcl_core:gravel",
        steel_ingot = "mcl_core:iron_ingot",
        gold_ingot = "mcl_core:gold_ingot",
        mese_crystal_fragment = "mesecons:redstone",
        torch = "mcl_torches:torch",
        diamond = "mcl_core:diamond",
        clay_lump = "mcl_core:clay_lump",
        water_bucket = "mcl_buckets:bucket_water",
        empty_bucket = "mcl_buckets:bucket_empty",
        dye_dark_grey = "mcl_dye:dark_grey",
        -- Use iron where no equivalent
        copper_ingot = "mcl_core:iron_ingot",
        tin_ingot = "mcl_core:iron_ingot",
        silver_ingot = "mcl_core:iron_ingot",
        silicon = "mesecons_materials:silicon",
    }
elseif minetest.get_modpath("fl_ores") and minetest.get_modpath("fl_stone") then
    homedecor.materials = {
        dirt = "fl_topsoil:dirt",
        sand = "fl_stone:sand",
        gravel = "fl_topsoil:gravel",
        steel_ingot = "fl_ores:iron_ingot",
        gold_ingot = "fl_ores:gold_ingot",
        mese_crystal_fragment = "fl_ores:iron_ingot",
        torch = "fl_light_sources:torch",
        diamond = "fl_ores:diamond",
        clay_lump = "fl_bricks:clay_lump",
        water_bucket = "fl_bucket:bucket_water",
        empty_bucket = "fl_bucket:bucket",
        dye_dark_grey = "fl_dyes:dark_grey_dye",
        dye_black = "fl_dyes:black_dye",
        dye_white = "fl_dye:white_dye",
        copper_ingot = "fl_ores:copper_ingot",
        tin_ingot = "fl_ores:tin_ingot",
        silver_ingot = "fl_ores:iron_ingot",
        silicon = "mesecons_materials:silicon",
        string = "fl_plantlife:oxeye_daisy",
        paper = "basic_materials:plastic_sheet",
        iron_lump = "fl_ores:iron_ore",
    }
elseif minetest.get_modpath("hades_core") then
    homedecor.materials = {
        dirt = "hades_core:dirt",
        sand = "hades_core:fertile_sand",
        gravel = "hades_core:gravel",
        steel_ingot = "hades_core:steel_ingot",
        gold_ingot = "hades_core:gold_ingot",
        mese_crystal_fragment = "hades_core:mese_crystal_fragment",
        torch = "hades_torches:torch",
        diamond = "hades_core:diamond",
        clay_lump = "hades_core:clay_lump",
        dye_dark_grey = "dye:dark_grey",
        copper_ingot = "hades_core:copper_ingot",
        tin_ingot = "hades_core:tin_ingot",
        --[[
            Since hades doesnt have buckets or water for the user,
            using dirt from near water to pull the water out
        ]]
        water_bucket = "hades_core:dirt",
        empty_bucket = "hades_core:fertile_sand",
        -- Set this to steel unless hadesextraores is present
        silver_ingot = "hades_core:steel_ingot",
        silicon = "hades_materials:silicon",
    }

    if minetest.get_modpath("hades_bucket") then
        homedecor.materials["water_bucket"] = "hades_bucket:bucket_water"
        homedecor.materials["empty_bucket"] = "hades_bucket:bucket_empty"
    end
    if minetest.get_modpath("hades_extraores") then
        homedecor.materials["silver_ingot"] = "hades_extraores:silver_ingot"
    end
end