QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('bm-hints:HintPrice',function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Price = Config.InfoCost
    if Player.PlayerData.money.bank >= Price then
        Player.Functions.RemoveMoney('Bank', Price, 'Suspicious Payment')
        cb(true)
        TriggerClientEvent('QBCore:Notify', src, 'Paid $10,000', 'success') 
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, 'Come back when you have some money', 'error')    
    end
end)
