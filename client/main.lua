local core = exports.qbx_core

-- peds.lua handles all ped spawning, blips, markers, and payments

RegisterNetEvent('bm-hints:sendHint', function(pedIndex, hintIndex)
    local hint = Config.Peds[pedIndex].hints[hintIndex]
    local delivery = hint.delivery
    local L = Lang[Config.Locale] -- shorthand

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
                sender = hint.emailSender,
                subject = hint.emailSubject,
                message = hint.emailMessage
            })
        end

        -- TEXT MESSAGE DELIVERY
        if delivery.method == "text" then
            TriggerServerEvent('qb-phone:server:sendNewMessage', {
                sender = hint.emailSender,
                message = hint.emailMessage
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

        -- BLIP DELIVERY
        if delivery.method == "blip" and delivery.blip then
            local b = delivery.blip
            local blip = AddBlipForCoord(b.coords.x, b.coords.y, b.coords.z)

            SetBlipSprite(blip, b.sprite or 161)
            SetBlipColour(blip, b.color or 1)
            SetBlipScale(blip, b.scale or 1.0)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(b.text or "Hint Location")
            EndTextCommandSetBlipName(blip)

            lib.notify({
                description = L.delivery.blip_set,
                type = "inform",
                position = Config.notifyPosition
            })
        end

        -- NOTIFICATION DELIVERY
        if delivery.method == "notify" then
            local msg = delivery.notifyMessage or hint.emailMessage
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
