local spawnedPeds = {}
local pedTargets = {}
local pedBlips = {}

-- Create permanent blips for all peds (always visible)
CreateThread(function()
    local L = Lang[Config.Locale]

    for index, data in ipairs(Config.Peds) do
        if data.blip and data.blip.enabled then
            local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)

            SetBlipSprite(blip, data.blip.sprite or 280)
            SetBlipColour(blip, data.blip.color or 5)
            SetBlipScale(blip, data.blip.scale or 0.8)
            SetBlipAsShortRange(blip, true) -- ALWAYS visible

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.blip.text or L.general.info_menu_title)
            EndTextCommandSetBlipName(blip)

            pedBlips[index] = blip
        end
    end
end)

-- Spawn a ped when player enters streaming range
local function spawnPed(index, data)
    local L = Lang[Config.Locale]

    lib.requestModel(data.model)

    local ped = CreatePed(
        0,
        data.model,
        data.coords.x,
        data.coords.y,
        data.coords.z - 1.0,
        data.coords.w,
        false,
        false
    )

    TaskStartScenarioInPlace(ped, data.scenario, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    spawnedPeds[index] = ped

    -- Target interaction
    pedTargets[index] = exports.ox_target:addLocalEntity(ped, {
        {
            icon = data.icon,
            label = ("%s ($%s)"):format(data.label or L.general.info_menu_title, data.payment.amount),
            onSelect = function()
                TriggerEvent('bm-hints:openMenu', index)
            end
        }
    })
end

-- Delete ped when player leaves streaming range
local function deletePed(index)
    local ped = spawnedPeds[index]
    if ped and DoesEntityExist(ped) then
        DeleteEntity(ped)
    end

    spawnedPeds[index] = nil

    if pedTargets[index] then
        exports.ox_target:removeLocalEntity(pedTargets[index])
        pedTargets[index] = nil
    end

    -- DO NOT REMOVE BLIPS ANYMORE
end

-- Streaming loop
CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(cache.ped)

        for index, data in ipairs(Config.Peds) do
            local dist = #(playerCoords - vector3(data.coords.x, data.coords.y, data.coords.z))

            -- STREAM IN
            if dist < 80.0 then
                if not spawnedPeds[index] then
                    spawnPed(index, data)
                end

                -- Optional marker
                if data.marker and data.marker.enabled then
                    DrawMarker(
                        data.marker.type or 2,
                        data.coords.x, data.coords.y, data.coords.z + 1.2,
                        0.0, 0.0, 0.0,
                        0.0, 0.0, 0.0,
                        data.marker.size.x, data.marker.size.y, data.marker.size.z,
                        data.marker.color.r, data.marker.color.g, data.marker.color.b, data.marker.color.a,
                        data.marker.bob or false,
                        data.marker.rotate or false,
                        2, false, nil, nil, false
                    )
                end

            -- STREAM OUT
            elseif dist > 120.0 then
                if spawnedPeds[index] then
                    deletePed(index)
                end
            end
        end

        Wait(0)
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for index in pairs(spawnedPeds) do
        deletePed(index)
    end
end)
