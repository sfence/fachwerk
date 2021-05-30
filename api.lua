-- mods/fachwerk/api.lua
-- =====================
-- See README.md for licensing and other information.

local S = fachwerk.translator

local timber_framed_desc = S("Timber-framed") .. " "
local ob1_desc = " " .. S("Oblique Beam 1")
local ob2_desc = " " .. S("Oblique Beam 2")
local cross_desc = " " .. S("Cross")

function fachwerk.register_fachwerk(basename, texture, description, craft_from)
	local group_def = {choppy = 2, oddly_breakable_by_hand = 2, cracky = 3}

	minetest.register_node("hades_fachwerk:" .. basename, {
		description = timber_framed_desc .. description,
		tiles = {texture .. "^fachwerk_blank.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = group_def,
		sounds = hades_sounds.node_sound_stone_defaults()
	})

	minetest.register_node("hades_fachwerk:" .. basename .. "_1", {
		description = timber_framed_desc .. description .. ob1_desc,
		tile_images = {
			texture .. "^fachwerk_blank.png", -- top
			texture .. "^fachwerk_blank.png", -- bottom
			texture .. "^fachwerk_beam_1.png",
			texture .. "^fachwerk_beam_1.png^[transformFX",
			texture .. "^fachwerk_beam_1.png^[transformFX",
			texture .. "^fachwerk_beam_1.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = group_def,
		sounds = hades_sounds.node_sound_stone_defaults()
	})

	-- TODO: is this one really needed? the node above covers most of that already
	minetest.register_node("hades_fachwerk:" .. basename .. "_2", {
		description = timber_framed_desc .. description .. ob2_desc,
		tiles = {
			texture .. "^fachwerk_blank.png", -- top
			texture .. "^fachwerk_blank.png", -- bottom
			texture .. "^fachwerk_beam_2.png",
			texture .. "^fachwerk_beam_2.png^[transformFX",
			texture .. "^fachwerk_beam_2.png^[transformFX",
			texture .. "^fachwerk_beam_2.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = group_def,
		sounds = hades_sounds.node_sound_stone_defaults()
	})

	minetest.register_node("hades_fachwerk:" .. basename .. "_cross", {
		description = timber_framed_desc .. description .. cross_desc,
		tiles = {texture .. "^fachwerk_cross.png"},
		groups = group_def,
		sounds = hades_sounds.node_sound_stone_defaults()
	})

	--
	-- Crafting
	--

	-- yields 8, after all we did add a lot of wood
	minetest.register_craft({
		output = "hades_fachwerk:" .. basename .. " 8",
		recipe = {
			{"group:wood", "group:wood", "group:wood"},
			{"group:wood", craft_from, "group:wood"},
			{"group:wood", "group:wood", "group:wood"}
		}
	})

	minetest.register_craft({
		output = "hades_fachwerk:" .. basename .. "_cross 8",
		recipe = {
			{"group:wood", craft_from, "group:wood"},
			{craft_from, "group:wood", craft_from},
			{"group:wood", craft_from, "group:wood"}
		}
	})

	minetest.register_craft({
		output = "hades_fachwerk:" .. basename .. "_1 8",
		recipe = {
			{craft_from, "group:wood", craft_from},
			{craft_from, craft_from, craft_from},
			{"group:wood", craft_from, craft_from}
		}
	})

	minetest.register_craft({
		output = "hades_fachwerk:" .. basename .. "_2 8",
		recipe = {
			{craft_from, craft_from, "group:wood"},
			{craft_from, craft_from, craft_from },
			{craft_from, "group:wood", craft_from}
		}
	})
end
