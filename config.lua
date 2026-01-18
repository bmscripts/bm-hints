Config = {}

Config.Locale = "en" -- only language currently supported is english

Config.notifyPosition = "center-right" -- top | top-right | top-left | bottom | bottom-right | bottom-left | center-right | center-left

Config.Peds = {
    {
        model = `ig_lestercrest`, -- https://docs.fivem.net/docs/game-references/ped-models/
        scenario = 'WORLD_HUMAN_SEAT_WALL_TABLET', -- https://github.com/DioneB/GTAV-Scenarios
        coords = vec4(1274.73, -1707.93, 54.2, 110.0),
        icon = 'fa-solid fa-comments-dollar', -- https://fontawesome.com/search
        label = 'Buy Information',

        payment = {
            type = "item",      -- bank, cash, item
            amount = 10000,     -- used for bank/cash
            item = "goldbar",   -- if not used simply put nil
            itemAmount = 1      -- if not used simply put nil
        },

        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            enabled = true,
            sprite = 66, -- blip type
            color = 0, -- blip colour
            scale = 1.0, -- blip size
            text = "Information Broker" -- blip name
        },

        marker = { -- https://docs.fivem.net/docs/game-references/markers/
            enabled = true,
            type = 32, -- marker type
            size = vec3(0.5, 0.5, 0.5), -- marker size
            color = { r = 255, g = 255, b = 255, a = 150 }, -- marker colour
            bob = false, -- move up and down
            rotate = true -- follow the camera
        },
        
        hints = {
            {
                header = "ATM Robbery",
                subtext = "High risk, high reward!",
                icon = "fa-solid fa-credit-card", -- https://fontawesome.com/search
                emailSender = "Lester Crest",
                emailSubject = "Regarding an ATM Robbery",
                emailMessage = "Before you go hit any ATMs you will need a few things depending on which method you choose to do. You can either find a credit card and hack into the ATM. Find a gas tank and lighter and blow open the ATM. Or find a laser drill, nylon rope, and toolkit and use your car pull out the ATM.",
                wait = 5000, -- how long till the delivery method is made
                cooldown = 10000, -- how long the player has to wait to find more information
                delivery = {
                    method = "email" -- email, text, item, waypoint, blip, notify
                }
            },
            {
                header = "Store Robbery",
                subtext = "High risk, high reward!",
                icon = "fa-solid fa-basket-shopping", -- https://fontawesome.com/search
                emailSender = "Lester Crest",
                emailSubject = "Regarding a Store Robbery",
                emailMessage = "Before you go hit any convenience stores you will need a few things. You will need to search for a circuit tester, an advanced lockpick, a hard drive, and an encrypted device.",
                wait = 5000, -- how long till the delivery method is made
                cooldown = 10000, -- how long the player has to wait to find more information
                delivery = {
                    method = "item", -- email, text, item, waypoint, blip, notify
                    item = "goldbar" -- item given to the player
                }
            },
            {
                header = "House Robbery",
                subtext = "High risk, high reward!",
                icon = "fa-solid fa-house", -- https://fontawesome.com/search
                emailSender = "Lester Crest",
                emailSubject = "Regarding a House Robbery",
                emailMessage = "Before you go hit any houses you will need an advanced lockpick and will need to search for a guy who will guide you through the rest.",
                wait = 5000, -- how long till the delivery method is made
                cooldown = 10000, -- how long the player has to wait to find more information
                delivery = {
                    method = "waypoint", -- email, text, item, waypoint, blip, notify
                    waypoint = vec3(452.1, -973.2, 30.7) -- GPS marker
                }
            },
            {
                header = "Vangelico Heist",
                subtext = "High risk, high reward!",
                icon = "fa-solid fa-gem", -- https://fontawesome.com/search
                emailSender = "Lester Crest",
                emailSubject = "Regarding a Vangelico Heist",
                emailMessage = "Before you go hit Vangelico you will need a few things. Depending on if you want to go in loud or quiet you will need to search for a smoke grenade, an encrypted phone, a hammer, a circuit tester, an encrypted device, a glass cutter, a fingerprint bag, and fingerprint tape.",
                wait = 5000, -- how long till the delivery method is made
                cooldown = 10000, -- how long the player has to wait to find more information
                delivery = {
                    method = "blip", -- email, text, item, waypoint, blip, notify
                    blip = {
                        coords = vec3(1234.5, -1300.2, 35.0),
                        sprite = 161,
                        color = 1,
                        scale = 1.0,
                        text = "Hidden Stash"
                    }
                }
            },
            {
                header = "Fleeca Bank Heist",
                subtext = "High risk, high reward!",
                icon = "fa-solid fa-sack-dollar", -- https://fontawesome.com/search
                emailSender = "Lester Crest",
                emailSubject = "Regarding a Fleeca Bank Heist",
                emailMessage = "Before you go hit any Fleeca banks you will need a few things. You will need to search for an encrypted device, a pair of pliers, a bag, a fleeca keycard, and an encrypted laptop.",
                wait = 5000, -- how long till the delivery method is made
                cooldown = 10000, -- how long the player has to wait to find more information
                delivery = {
                    method = "notify", -- email, text, item, waypoint, blip, notify
                    notifyDuration = 10000, -- how long the notification stays visible (ms)
                    notifyType = "inform", -- optional: inform, success, error
                    notifyMessage = nil -- optional: override emailMessage
                }
            },
        }
    },

    -- Add unlimited peds here
}
