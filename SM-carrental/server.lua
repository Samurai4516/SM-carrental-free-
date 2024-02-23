esx = nil
ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('remove:money', function(...)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney(Config.account, Config.amount)
  end)