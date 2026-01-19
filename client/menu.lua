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

                -- Trigger payment + cooldown check
                lib.callback('bm-hints:pay', false, function(paid)
                    if paid then
                        -- Only send the hint if payment succeeded
                        TriggerEvent('bm-hints:sendHint', pedIndex, hintIndex)
                    end
                end, pedData.payment, pedIndex, hintIndex)
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
