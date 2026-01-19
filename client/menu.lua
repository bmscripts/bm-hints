RegisterNetEvent('bm-hints:openMenu', function(pedIndex)
    local pedData = Config.Peds[pedIndex]
    local L = Lang[Config.Locale]

    local menu = {
        {
            title = L.general.info_menu_header,
            icon = pedData.icon,
            disabled = true
        }
    }

    for hintIndex, hint in ipairs(pedData.hints) do
        menu[#menu+1] = {
            title = hint.header,
            description = hint.subtext,
            icon = hint.icon,
            onSelect = function()

                -- Use per-hint payment if defined, otherwise fallback to ped payment
                local paymentData = hint.payment or pedData.payment

                -- Trigger payment + cooldown check
                lib.callback('bm-hints:pay', false, function(paid)
                    if paid then
                        TriggerEvent('bm-hints:sendHint', pedIndex, hintIndex)
                    end
                end, paymentData, pedIndex, hintIndex)
            end
        }
    end

    lib.registerContext({
        id = 'bm-hints-menu-' .. pedIndex,
        title = L.general.info_menu_title,
        options = menu
    })

    lib.showContext('bm-hints-menu-' .. pedIndex)
end)
