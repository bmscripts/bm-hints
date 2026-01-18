local core = exports.qbx_core
local cooldowns = {}

lib.callback.register('bm-hints:pay', function(source, payment, pedIndex, hintIndex)
    local player = core:GetPlayer(source)
    if not player then return false end

    local L = Lang[Config.Locale] -- shorthand

    -- Validate pedIndex + hintIndex
    if not pedIndex or not hintIndex then
        print("^1[BM-HINTS] ERROR: pedIndex or hintIndex missing from client callback^0")
        TriggerClientEvent('ox_lib:notify', source, {
            description = L.errors.invalid_hint,
            type = "error"
        })
        return false
    end

    -- Validate ped exists
    local pedData = Config.Peds[pedIndex]
    if not pedData then
        print("^1[BM-HINTS] ERROR: Invalid pedIndex (" .. tostring(pedIndex) .. ")^0")
        TriggerClientEvent('ox_lib:notify', source, {
            description = L.errors.invalid_ped,
            type = "error"
        })
        return false
    end

    -- Validate hint exists
    local hint = pedData.hints[hintIndex]
    if not hint then
        print("^1[BM-HINTS] ERROR: Invalid hintIndex (" .. tostring(hintIndex) .. ") for ped " .. pedIndex .. "^0")
        TriggerClientEvent('ox_lib:notify', source, {
            description = L.errors.invalid_hint,
            type = "error"
        })
        return false
    end

    -- Initialize cooldown table for player
    cooldowns[source] = cooldowns[source] or {}
    cooldowns[source][pedIndex] = cooldowns[source][pedIndex] or {}

    local cd = hint.cooldown or 0

    -- Check cooldown
    local now = os.time()
    local expires = cooldowns[source][pedIndex][hintIndex] or 0

    if now < expires then
        local remaining = expires - now
        TriggerClientEvent('ox_lib:notify', source, {
            description = (L.cooldown.active):format(remaining),
            type = "error"
        })
        return false
    end

    -- Validate payment table
    if not payment or not payment.type then
        print("^1[BM-HINTS] ERROR: Invalid payment table received from client^0")
        TriggerClientEvent('ox_lib:notify', source, {
            description = L.payment.invalid_payment,
            type = "error"
        })
        return false
    end

    local pType = payment.type
    local amount = payment.amount

    -- BANK PAYMENT
    if pType == "bank" then
        if player.Functions.RemoveMoney('bank', amount) then
            cooldowns[source][pedIndex][hintIndex] = now + (cd / 1000)

            TriggerClientEvent('ox_lib:notify', source, {
                description = (L.payment.paid_bank):format(amount),
                type = "success"
            })
            return true
        end

        TriggerClientEvent('ox_lib:notify', source, {
            description = L.payment.not_enough_bank,
            type = "error"
        })
        return false
    end

    -- CASH PAYMENT
    if pType == "cash" then
        if player.Functions.RemoveMoney('cash', amount) then
            cooldowns[source][pedIndex][hintIndex] = now + (cd / 1000)

            TriggerClientEvent('ox_lib:notify', source, {
                description = (L.payment.paid_cash):format(amount),
                type = "success"
            })
            return true
        end

        TriggerClientEvent('ox_lib:notify', source, {
            description = L.payment.not_enough_cash,
            type = "error"
        })
        return false
    end

    -- ITEM PAYMENT
    if pType == "item" then
        local item = payment.item
        local itemAmount = payment.itemAmount or 1

        if not item then
            print("^1[BM-HINTS] ERROR: Item payment missing item name^0")
            TriggerClientEvent('ox_lib:notify', source, {
                description = L.payment.invalid_payment,
                type = "error"
            })
            return false
        end

        local invItem = player.Functions.GetItemByName(item)

        if invItem and invItem.amount >= itemAmount then
            player.Functions.RemoveItem(item, itemAmount)
            cooldowns[source][pedIndex][hintIndex] = now + (cd / 1000)

            TriggerClientEvent('ox_lib:notify', source, {
                description = (L.payment.paid_item):format(itemAmount, item),
                type = "success"
            })
            return true
        end

        TriggerClientEvent('ox_lib:notify', source, {
            description = (L.payment.not_enough_items):format(itemAmount, item),
            type = "error"
        })
        return false
    end

    -- Unknown payment type
    print("^1[BM-HINTS] ERROR: Unknown payment type '" .. tostring(pType) .. "'^0")
    TriggerClientEvent('ox_lib:notify', source, {
        description = L.errors.unknown_payment_type,
        type = "error"
    })
    return false
end)

-- ITEM DELIVERY HANDLER (for hint rewards)
RegisterNetEvent('bm-hints:giveItem', function(item)
    local src = source
    local player = core:GetPlayer(src)
    if not player then return end

    local L = Lang[Config.Locale]

    player.Functions.AddItem(item, 1)

    TriggerClientEvent('ox_lib:notify', src, {
        description = (L.delivery.item_received):format(item),
        type = "success"
    })
end)
