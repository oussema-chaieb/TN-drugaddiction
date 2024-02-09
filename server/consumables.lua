local QBCore = exports['qb-core']:GetCoreObject()
-- addiction items
QBCore.Functions.CreateUseableItem("coke_pure", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if Player.Functions.RemoveItem(item.name, 1) then
        -- local isaddicted = MySQL.Sync.fetchScalar('SELECT cokeaddiction FROM addiction WHERE citizenid = ?', { citizenid})
        -- if isaddicted == nil then
        --     MySQL.insert('INSERT INTO addiction (citizenid, cokeaddiction) VALUES (?, ?)',{ citizenid, 1 })
        -- else
        --     if isaddicted == 0 then    
        --         MySQL.Async.execute('UPDATE addiction SET cokeaddiction = ? WHERE citizenid = ?', {1, citizenid}) 
        --         TriggerClientEvent('QBCore:Notify', src, 'you become coke slave', "error", 8000)
        --     end
        -- end 
        TriggerClientEvent("tn-drugaddiction:cl:coke", src, item.info.quality)      
    end
end)
 
QBCore.Functions.CreateUseableItem("methamine", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    Player.Functions.RemoveItem(item.name, 1)
    -- local isaddicted = MySQL.Sync.fetchScalar('SELECT methaddiction FROM addiction WHERE citizenid = ?', { citizenid})
    -- if isaddicted == nil then 
    --     MySQL.insert('INSERT INTO addiction (citizenid, methaddiction) VALUES (?, ?)',{ citizenid, 1 })
    -- else
    --     if isaddicted == 0 then    
    --         MySQL.Async.execute('UPDATE addiction SET methaddiction = ? WHERE citizenid = ?', {1, citizenid}) 
    --         TriggerClientEvent('QBCore:Notify', src, 'you become meth slave', "error", 8000) 
    --     end
    -- end       
    TriggerClientEvent("tn-drugaddiction:cl:methamine", src, item.info.quality)
end)

QBCore.Functions.CreateUseableItem("weed_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if Player.Functions.GetItemByName("lighter") then
        if Player.Functions.RemoveItem(item.name, 1) then
            -- local isaddicted = MySQL.Sync.fetchScalar('SELECT weedaddiction FROM addiction WHERE citizenid = ?', { citizenid})
            -- if isaddicted == nil then 
            --     MySQL.insert('INSERT INTO addiction (citizenid, weedaddiction) VALUES (?, ?)',{ citizenid, 1 })
            -- else
            --     if isaddicted == 0 then    
            --         MySQL.Async.execute('UPDATE addiction SET weedaddiction = ? WHERE citizenid = ?', {1, citizenid}) 
            --         TriggerClientEvent('QBCore:Notify', src, 'you become weed slave', "error", 8000) 
            --     end
            -- end       
            TriggerClientEvent("tn-drugaddiction:cl:weed_joint", src, item.info.quality)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'you need a lighter', "error", 5000) 
    end
end)

QBCore.Functions.CreateUseableItem("curemeth", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if Player.Functions.RemoveItem(item.name, 1) then
        local isaddicted = MySQL.Sync.fetchScalar('SELECT methaddiction FROM addiction WHERE citizenid = ?', { citizenid})
        if isaddicted and isaddicted == 1 then 
            MySQL.Async.execute('UPDATE addiction SET methaddiction = ? WHERE citizenid = ?', {0, citizenid}) 
            TriggerClientEvent('QBCore:Notify', src, 'your meth addiction is removed', "success")
            Player.Functions.SetMetaData('methaddiction', 100)
            TriggerClientEvent('tn-drugaddicition:cl:UpdateMethNeeds', src, 100)
        else
            TriggerClientEvent('QBCore:Notify', src, 'you are not addicted to meth', "error")
        end
        TriggerClientEvent("tn-drugaddiction:cl:cure", src)
    end
end)
 
QBCore.Functions.CreateUseableItem("curecoke", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if Player.Functions.RemoveItem(item.name, 1) then
        local isaddicted = MySQL.Sync.fetchScalar('SELECT cokeaddiction FROM addiction WHERE citizenid = ?', { citizenid})
        if isaddicted and isaddicted == 1 then 
            MySQL.Async.execute('UPDATE addiction SET cokeaddiction = ? WHERE citizenid = ?', {0, citizenid}) 
            TriggerClientEvent('QBCore:Notify', src, 'your coke addiction is removed', "success")
            Player.Functions.SetMetaData('cokeaddiction', 100)
            TriggerClientEvent('tn-drugaddicition:cl:UpdateCokeNeeds', src, 100)
        else
            TriggerClientEvent('QBCore:Notify', src, 'you are not addicted to coke', "error")
        end
        TriggerClientEvent("tn-drugaddiction:cl:cure", src)
    end
end)

QBCore.Functions.CreateUseableItem("cureweed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if Player.Functions.RemoveItem(item.name, 1) then
        local isaddicted = MySQL.Sync.fetchScalar('SELECT weedaddiction FROM addiction WHERE citizenid = ?', { citizenid})
        if isaddicted and isaddicted == 1 then 
            MySQL.Async.execute('UPDATE addiction SET weedaddiction = ? WHERE citizenid = ?', {0, citizenid}) 
            TriggerClientEvent('QBCore:Notify', src, 'your weed addiction is removed', "success")
            Player.Functions.SetMetaData('weedaddiction', 100)
            TriggerClientEvent('tn-drugaddicition:cl:UpdateWeedNeeds', src, 100)
        else
            TriggerClientEvent('QBCore:Notify', src, 'you are not addicted to weed', "error")
        end
        TriggerClientEvent("tn-drugaddiction:cl:cure", src)
    end
end)
 
 
RegisterNetEvent('tn-drugaddiction:sv:addcokedict', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if amount > 100 then amount = 100 end
    Player.Functions.SetMetaData('cokeaddiction', amount)
    --TriggerClientEvent('tn-drugaddicition:cl:UpdateCokeNeeds', source, amount)
end)
 
RegisterNetEvent('tn-drugaddiction:sv:addmethdict', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if amount > 100 then amount = 100 end
    Player.Functions.SetMetaData('methaddiction', amount)
    --TriggerClientEvent('tn-drugaddicition:cl:UpdateMethNeeds', source, amount)
end)

RegisterNetEvent('tn-drugaddiction:sv:addweeddict', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if amount > 100 then amount = 100 end
    Player.Functions.SetMetaData('weedaddiction', amount)
    --TriggerClientEvent('tn-drugaddicition:cl:UpdateWeedNeeds', source, amount)
end)

RegisterNetEvent('tn-drugaddiction:sv:removesyringandmeth', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("empty_syringe", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_syringe'], "remove")
    Player.Functions.RemoveItem("methamine", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['methamine'], "remove")
end)