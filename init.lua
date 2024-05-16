local modname = "btc"

btc = {}
btc.mp = minetest.get_modpath(modname)
btc.S = minetest.get_translator(modname)

dofile(btc.mp.."/api.lua")


local btc_enable_shop = minetest.settings:get_bool("btc_enable_shop", true)
if btc_enable_shop then
    dofile(btc.mp.."/shop.lua")
end

local btc_enable_ui = minetest.settings:get_bool("btc_enable_ui", true)
if btc_enable_ui then
    dofile(btc.mp.."/ui.lua")
end




if minetest.get_modpath("mtt") then
	dofile(btc.mp .. "/shop.spec.lua")
	dofile(btc.mp .. "/ui.spec.lua")
end