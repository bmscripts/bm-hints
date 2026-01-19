local core = exports.qbx_core

-- peds.lua handles all ped spawning, blips, markers, and payments

RegisterNetEvent('bm-hints:sendHint', function(pedIndex, hintIndex)
    local hint = Config.Peds[pedIndex].hints[hintIndex]
    local delivery = hint.delivery
    local L = Lang[Config.Locale]

    -- Contact confirmation
    lib.notify({
        description = L.general.contact_soon,
        type = "success",
        position = Config.notifyPosition
    })

    SetTimeout(hint.wait, function()

        -- EMAIL DELIVERY
        if delivery.method == "email" then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = hint.brokerSender,
                subject = hint.brokerSubject,
                message = hint.brokerMessage
            })
        end

        -- ITEM DELIVERY
        if delivery.method == "item" and delivery.item then
            TriggerServerEvent('bm-hints:giveItem', delivery.item)
        end

        -- WAYPOINT DELIVERY
        if delivery.method == "waypoint" and delivery.waypoint then
            SetNewWaypoint(delivery.waypoint.x, delivery.waypoint.y)
            lib.notify({
                description = L.delivery.waypoint_set,
                type = "inform",
                position = Config.notifyPosition
            })
        end

        -- BLIP DELIVERY (RADIUS SEARCH AREA)
        if delivery.method == "blip" and delivery.blip then
            local b = delivery.blip

            -- Create radius blip
            local radius = b.radius or 75.0
            local blip = AddBlipForRadius(b.coords.x, b.coords.y, b.coords.z, radius)

            -- Style the radius blip
            SetBlipColour(blip, b.color or 1)
            SetBlipAlpha(blip, b.alpha or 128)
            SetBlipAsShortRange(blip, true)

            -- Optional center point
            if b.showCenter then
                local center = AddBlipForCoord(b.coords.x, b.coords.y, b.coords.z)
                SetBlipSprite(center, b.sprite or 161)
                SetBlipColour(center, b.color or 1)
                SetBlipScale(center, b.scale or 0.8)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(b.text or "Search Area")
                EndTextCommandSetBlipName(center)

                -- Auto-remove center blip too
                SetTimeout(b.removeAfter or 30000, function()
                    RemoveBlip(center)
                end)
            end

        -- Notify player
            lib.notify({
                description = L.delivery.blip_set,
                type = "inform",
                position = Config.notifyPosition
            })

            -- Auto-remove radius blip after X ms
            SetTimeout(b.removeAfter or 60000, function()
                RemoveBlip(blip)
            end)
        end



        -- NOTIFICATION DELIVERY
        if delivery.method == "notify" then
            local msg = delivery.notifyMessage or hint.brokerMessage
            local nType = delivery.notifyType or "inform"
            local duration = delivery.notifyDuration or 5000 -- fallback to 5s if not set

            lib.notify({
                description = msg,
                type = nType,
                duration = duration,
                position = Config.notifyPosition
            })
        end

    end)
end)
