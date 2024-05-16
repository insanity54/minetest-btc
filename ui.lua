local m_ui = minetest.get_modpath('unified_inventory')
local ui = unified_inventory

-- warp function
-- local function warp(player, warp_point, item_cost)

--     local player_name = player:get_player_name()

--     if warp_point == nil then
--         minetest.chat_send_player(player_name,"Invalid or un-set warp point.")
--         return
--     end

--     -- prevent warp if the destination is protected by another player
--     if minetest.is_protected(warp_point, player_name) then
--         minetest.chat_send_player(player:get_player_name(), "Can't warp there-- waypoint is protected by another player!")
--         return
--     end

--     -- ensure player can afford the warp
--     local inv = minetest.get_inventory({type = "player", name = player_name})
--     if not inv:contains_item("main", ItemStack(item_cost)) then
--         minetest.chat_send_player(player_name,"You don't have any of that gemstone!")
--         return
--     end

--     -- collect payment for the warp
--     inv:remove_item("main", ItemStack(item_cost))
--     player:get_inventory():set_list("main", inv:get_list("main")) -- record state


--     -- do the warp
--     minetest.log("action", "[gemwarp] " .. player_name .. " gemwarped to (" .. warp_point.x .. ", " .. warp_point.y .. ", " .. warp_point.z .. ")")
--     player:set_pos(warp_point)

-- end




-- local function get_waypoint_data(player)
--     local player_name = player:get_player_name()

--     -- Get directly from metadata
--     local waypoints = player:get_meta():get("ui_waypoints")
--     waypoints = waypoints and minetest.parse_json(waypoints) or {}
--     waypoints.data = waypoints.data or {}

--     return waypoints.data
-- end


-- formspec function
local function get_formspec(name, waypoints)
    local heading
    local rows = {}

    heading = 'size[8,8;]'..
        "label[0.375,0.5;Bitcoin Lightning Network]"

    rows = 'field[0.375,2.75;9,0.8;address;'..name..'\'s LN address;]'..
        'button[3.375,4.0;4,0.8;save;Save]'

    return heading..rows
end



-- when pressing buttons
-- minetest.register_on_player_receive_fields(function(player, formname, fields)

--     if formname ~= "" then return end

--     local data = get_waypoint_data(player)

--     local is_handled = false


--     for i = 1, #data do
--         if data[i] ~= nil and data[i]['world_pos'] ~= nil then
--             if data[i]['world_pos'] == nil then
--                 minetest.log('warning', 'Player '..player:get_player_name()..' does not have waypoint '..i..' data. How is this happening? Investigation needed! (see https://github.com/insanity54/btc)')
--                 is_handled = false
--             end

--             local world_pos = data[i]['world_pos']
--             if fields['warp_'..i..'_amethyst'] ~= nil then
--                 warp(player, world_pos, 'amethyst:amethyst_ingot')
--                 is_handled = true
--             end

--             if fields['warp_'..i..'_ruby'] ~= nil then
--                 warp(player, world_pos, 'ruby:ruby')
--                 is_handled = true
--             end

--             if fields['warp_'..i..'_emerald'] ~= nil then
--                 warp(player, world_pos, 'emerald:emerald')
--                 is_handled = true
--             end

--             if fields['warp_'..i..'_sapphire'] ~= nil then
--                 warp(player, world_pos, 'sapphire:sapphire')
--                 is_handled = true
--             end
--         end
--     end

--     if is_handled then
--         return true
--     else
--         return false
--     end
-- end)




-- unified inventory button
if m_ui then
    unified_inventory.register_button('btc', {
        type = 'image',
        image = 'bolt.png',
        tooltip = 'Lighting Network'
    })
    unified_inventory.register_page("btc", {
        get_formspec = function(player, perplayer_formspec)
            local name = player:get_player_name()
            local wp_info_x = ui.style_full.form_header_x + 1.25
            local wp_info_y = ui.style_full.form_header_y + 0.5
            local fy = perplayer_formspec.formspec_y
            -- local waypoints = get_waypoint_data(player)
            local formspec = get_formspec(name, waypoints)..ui.style_full.standard_inv_bg
            return {formspec=formspec}
    end
})
end