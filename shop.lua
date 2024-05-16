-- Define the crafting recipe
minetest.register_craft({
    output = "btc:shop",
    recipe = {
        {"default:copper_ingot", "default:sign_wall_steel", "default:chest_locked"},
        {"default:gold_ingot", "default:mese_block", "default:gold_ingot"},
        {"default:brick", "default:brick", "default:brick"},
    },
})


minetest.register_node("btc:shop", {
    description = "LN Shop",
    inventory_image = "shop_face.png",
    -- on_use = kybertrike.jumpjet_on_use,
})
