-- mods/fachwerk/nodes.lua
-- =======================
-- See README.md for licensing and other information.

-- Optional fachwerk types you can enable if you like
-- Registers desert stone, white, grey and yellow wool, wood and junglewood
local additional_fachwerk_types = false

local S = fachwerk.translator

-- fachwerk.register_fachwerk(basename, texture, description, craft_from)
fachwerk.register_fachwerk("clay", "default_clay.png", S("Clay"), "hades_core:clay")
fachwerk.register_fachwerk("brick", "default_brick.png", S("Bricks"), "hades_core:brick")
fachwerk.register_fachwerk("stonebrick", "default_stone_brick.png", S("Stone Brick"), "hades_core:stonebrick")
fachwerk.register_fachwerk("cobble", "default_cobble.png", S("Cobble"), "hades_core:cobble")
fachwerk.register_fachwerk("cobble_baked", "default_cobble_baked.png", S("Baked Cobble"), "hades_core:cobble_baked")
fachwerk.register_fachwerk("stone", "default_stone.png", S("Stone"), "hades_core:stone")
fachwerk.register_fachwerk("stone_baked", "default_stone_baked.png", S("Baked Stone"), "hades_core:stone_baked")
fachwerk.register_fachwerk("stonebrick_baked", "default_stone_brick_baked.png", S("Baked Stone Brick"), "hades_core:stonebrick_baked")
fachwerk.register_fachwerk("tuff", "default_tuff.png", S("Tuff"), "hades_core:tuff")
fachwerk.register_fachwerk("tuff_baked", "default_tuff_baked.png", S("Baked Tuff"), "hades_core:tuff_baked")

fachwerk.register_fachwerk("cactus_brick", "default_cactus_brick.png", S("Cactus Brick"), "hades_core:cactus_brick")
fachwerk.register_fachwerk("chondrite_brick", "default_chondrite_brick.png", S("Chondrite Brick"), "hades_core:chondrite_brick")
fachwerk.register_fachwerk("essexite_brick", "default_essexite_brick.png", S("Essexite Brick"), "hades_core:essexite_brick")
fachwerk.register_fachwerk("marble_brick", "default_marble_brick.png", S("Marble Brick"), "hades_core:marble_brick")
fachwerk.register_fachwerk("sandstone_brick", "default_sandstone_brick.png", S("Sandstone Brick"), "hades_core:sandstone_brick")

if additional_fachwerk_types == true then
	fachwerk.register_fachwerk("wood", "default_wood.png", S("Common Wood"), "hades_trees:wood")
	fachwerk.register_fachwerk("birchwood", "default_birchwood.png", S("Birch Wood Planks"), "hades_trees:junglewood")
	fachwerk.register_fachwerk("palewood", "default_palewood.png", S("Pale Wood Planks"), "hades_trees:palewood")
	fachwerk.register_fachwerk("junglewood", "default_junglewood.png", S("Jungle Wood Planks"), "hades_trees:junglewood")
end

local basic_colors = {
  black="Black", blue="Blue", brown="Brown",
	cyan="Cyan", dark_green="Dark Green", dark_grey="Dark Grey",
  green="Green", grey="Grey", magenta="Magenta",
	orange="Oragne", pink="Pink", red="Red",
  violet="Violet", white="White", yellow="Yellow"
}

for key,name in pairs(basic_colors) do
	name = S(name)
	fachwerk.register_fachwerk("brick_"..key, "default_brick_"..key..".png", name.." Brick", "hades_core:brick_"..key)
	fachwerk.register_fachwerk("colwood_"..key, "hades_trees_colwood_"..key..".png", name.." Wood Planks", "hades_trees:colwood_"..key)
end

--
-- Special Nodes (these are not supported by the API)
--

minetest.register_node("hades_fachwerk:framed_glass", {
	description = S("Timber-framed Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"fachwerk_blank.png^default_glass_detail.png", "default_glass_detail.png"},
	inventory_image = minetest.inventorycube("fachwerk_blank.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3,oddly_breakable_by_hand = 3},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "hades_fachwerk:framed_glass 8",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "hades_core:glass", "group:wood"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

