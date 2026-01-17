QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    QBCore.Functions.LoadModel(Config.Ped)
        local Ped = CreatePed(0, Config.Ped, Config.PedLocation.x, Config.PedLocation.y, Config.PedLocation.z-1.0, Config.PedLocation.w, false, false)
        TaskStartScenarioInPlace(Ped, Config.PedScenario, true)
        FreezeEntityPosition(Ped, true)
        SetEntityInvincible(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        exports['qb-target']:AddTargetEntity(Ped, {
            options = {
                {
                    icon = Config.HintIcon,
                    label = Config.HintLabel,
                    action = function ()
                        QBCore.Functions.TriggerCallback('bm-hints:HintPrice',function(paid)
                        if paid then
                            TriggerEvent('bm-hints:HintMenu')
                        end
                    end)
                end,
                },
            },
            distance = 2.0
        })
end)

RegisterNetEvent('bm-hints:HintOneInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintOneSender,
            subject = Config.HintOneSubject,
            message = Config.HintOneMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintTwoInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintTwoSender,
            subject = Config.HintTwoSubject,
            message = Config.HintTwoMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintThreeInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintThreeSender,
            subject = Config.HintThreeSubject,
            message = Config.HintThreeMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintFourInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintFourSender,
            subject = Config.HintFourSubject,
            message = Config.HintFourMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintFiveInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintFiveSender,
            subject = Config.HintFiveSubject,
            message = Config.HintFiveMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintSixInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintSixSender,
            subject = Config.HintSixSubject,
            message = Config.HintSixMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintSevenInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintSevenSender,
            subject = Config.HintSevenSubject,
            message = Config.HintSevenMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintEightInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintEightSender,
            subject = Config.HintEightSubject,
            message = Config.HintEightMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintNineInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintNineSender,
            subject = Config.HintNineSubject,
            message = Config.HintNineMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintTenInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintTenSender,
            subject = Config.HintTenSubject,
            message = Config.HintTenMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintElevenInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintElevenSender,
            subject = Config.HintElevenSubject,
            message = Config.HintElevenMessage,
            button = {}
        })
    end)
end)

RegisterNetEvent('bm-hints:HintTwelveInfo', function()
    QBCore.Functions.Notify('I\'ll be in touch with you soon', 'success', 5000)
    SetTimeout(Config.WaitTime, function()
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.HintTwelveSender,
            subject = Config.HintTwelveSubject,
            message = Config.HintTwelveMessage,
            button = {}
        })
    end)
end)