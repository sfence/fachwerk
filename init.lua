-- mods/fachwerk/init.lua
-- ======================
-- See README.md for licensing and other information.

fachwerk = {
  translator = minetest.get_translator("fachwerk")
}

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath .."/api.lua")
dofile(modpath .. "/nodes.lua")
