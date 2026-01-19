local Translations = {

    -- General
    general = {
        contact_soon = "I'll be in touch soon.",
        info_menu_title = "Information",
        info_menu_header = "What would you like information about?",
    },

    -- Payments
    payment = {
        paid_bank = "Paid $%s from bank.",
        paid_cash = "Paid $%s in cash.",
        paid_item = "Paid %sx %s.",
        not_enough_bank = "You don't have enough bank balance.",
        not_enough_cash = "You don't have enough cash.",
        not_enough_items = "You need %sx %s.",
        invalid_payment = "Internal error: invalid payment data.",
    },

    -- Cooldowns
    cooldown = {
        active = "You must wait %s seconds before asking again.",
        invalid_hint = "Internal error: invalid hint reference.",
    },

    -- Delivery confirmations
    delivery = {
        waypoint_set = "A location has been marked on your GPS.",
        blip_set = "A location has been marked on your map.",
        item_received = "Received item: %s",
    },

    -- Errors
    errors = {
        invalid_ped = "Invalid ped reference.",
        invalid_hint = "Invalid hint reference.",
        unknown_payment_type = "Unknown payment type.",
    }
}

Lang = Lang or {}
Lang['en'] = Translations
