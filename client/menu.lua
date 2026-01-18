RegisterNetEvent('bm-hints:openMenu', function(pedIndex)
    local pedData = Config.Peds[pedIndex]
    local menu = {
        {
            title = "What would you like information about?",
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
        title = "Information",
        options = menu
    })

    lib.showContext('bm-hints-menu-' .. pedIndex)
end)
