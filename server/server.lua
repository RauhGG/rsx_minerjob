ESX = exports["es_extended"]:getSharedObject()
local servicio



RegisterServerEvent('rsx_minero:herramienta', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    if job == 'miner' then
        if Config.advinventory then
            compare = xPlayer.getInventoryItem('WEAPON_HATCHET')
            if compare.count < 1 then
                xPlayer.addInventoryItem('WEAPON_HATCHET', 1)
                xPlayer.showNotification('Has cogido tu hacha y has entrado de servicio', false, false, 1)
                servicio = true
            else
                xPlayer.removeInventoryItem('WEAPON_HATCHET', 1)
                xPlayer.showNotification('Has devuelto tu hacha y te has salido de servicio', false, false, 1)
                servicio = false
            end
        else
            compare = xPlayer.getWeapon('WEAPON_HATCHET')
            if not compare then
                xPlayer.addWeapon('WEAPON_HATCHET', 1)
                xPlayer.showNotification('Has cogido tu hacha y has entrado de servicio', false, false, 1)
                servicio = true
            else
                xPlayer.removeWeapon('WEAPON_HATCHET', 1)
                xPlayer.showNotification('Has devuelto tu hacha y te has salido de servicio', false, false, 1)
                servicio = false
            end
        end
    end
end)

RegisterServerEvent('rsx_minero:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local diamond = xPlayer.getInventoryItem('diamond')
    local oro = xPlayer.getInventoryItem('gold')
    local iron = xPlayer.getInventoryItem('iron')
    local pricediam = diamond.count * Config.precio.diamond
    local priceoro = oro.count * Config.precio.gold
    local priceiron = iron.count * Config.precio.iron
    if diamond.count >= 3 and servicio then
        xPlayer.removeInventoryItem('diamond', diamond.count)
        xPlayer.addAccountMoney('money', pricediam)
        TriggerClientEvent('esx:showNotification', source, 'Has obtenido '..pricediam..'$')
    end
     if oro.count >= 3 and servicio then
        xPlayer.removeInventoryItem('gold', oro.count)
        xPlayer.addAccountMoney('money', pricediam)
        TriggerClientEvent('esx:showNotification', source, 'Has obtenido '..priceoro..'$')
    end
    if iron.count >= 3 and servicio then
        xPlayer.removeInventoryItem('iron', iron.count)
        xPlayer.addAccountMoney('money', priceiron)
        TriggerClientEvent('esx:showNotification', source, 'Has obtenido '..priceiron..'$')
    end
end)

RegisterServerEvent('rsx_minero:darhierro', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = math.random(8)
    if servicio then
    xPlayer.addInventoryItem('iron', quantity)
    else
    DropPlayer(source, "Trying to exploit a trigger")
    end
end)

RegisterServerEvent('rsx_minero:daroro', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = math.random(4)
    if servicio then
    xPlayer.addInventoryItem('gold', quantity)
    else
        DropPlayer(source, "Trying to exploit a trigger")
    end
end)

RegisterServerEvent('rsx_minero:dardiam', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = math.random(4)
    if servicio then
    xPlayer.addInventoryItem('diamond', quantity)
    else
    DropPlayer(source, "Trying to exploit a trigger")
    end
end)

RegisterServerEvent('rsx_minero:checkiron', function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local compare = xPlayer.getInventoryItem('WEAPON_HATCHET')
        if  compare.count > 1 and servicio then
            TriggerClientEvent ('rsx_minero:minarhierro', source)
        else
            TriggerClientEvent('esx:showNotification', source, 'Que vas a picar ¿con la polla?')
        end
end)

RegisterServerEvent('rsx_minero:checkoro', function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local compare = xPlayer.getInventoryItem('WEAPON_HATCHET')
        if  compare.count > 1 and servicio then
            TriggerClientEvent ('rsx_minero:minaroro', source)
        else
            TriggerClientEvent('esx:showNotification', source, 'Que vas a picar ¿con la polla?')
        end
end)

RegisterServerEvent('rsx_minero:checkdiam', function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local compare = xPlayer.getInventoryItem('WEAPON_HATCHET')
        if  compare.count > 1 and servicio then
            TriggerClientEvent ('rsx_minero:minardiam', source)
        else
            TriggerClientEvent('esx:showNotification', source, 'Que vas a picar ¿con la polla?')
        end
end)