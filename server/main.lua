local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('tn-drugaddiction:sv:UpdatePlayer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if not Player then return end
    local isaddictedCoke = MySQL.Sync.fetchScalar('SELECT cokeaddiction FROM addiction WHERE citizenid = ?', { citizenid})
    local isaddictedMeth = MySQL.Sync.fetchScalar('SELECT methaddiction FROM addiction WHERE citizenid = ?', { citizenid})
    local isaddictedWeed = MySQL.Sync.fetchScalar('SELECT weedaddiction FROM addiction WHERE citizenid = ?', { citizenid})
    if isaddictedCoke ~= nil and isaddictedCoke == 1 then
        local newCoke = Player.PlayerData.metadata['cokeaddiction'] - Config.CokeRate
        if newCoke <= 0 then
            newCoke = 0
        end
        Player.Functions.SetMetaData('cokeaddiction', newCoke)
        TriggerClientEvent('tn-drugaddicition:cl:UpdateCokeNeeds', src, newCoke)
    end
    if isaddictedMeth ~= nil and isaddictedMeth == 1 then
        local newMeth = Player.PlayerData.metadata['methaddiction'] - Config.MethRate
        if newMeth <= 0 then
            newMeth = 0
        end
        Player.Functions.SetMetaData('methaddiction', newMeth)
        TriggerClientEvent('tn-drugaddicition:cl:UpdateMethNeeds', src, newMeth)
    end
    if isaddictedWeed ~= nil and isaddictedWeed == 1 then
        local newWeed = Player.PlayerData.metadata['weedaddiction'] - Config.WeedRate
        if newWeed <= 0 then
            newWeed = 0
        end
        Player.Functions.SetMetaData('weedaddiction', newWeed)
        TriggerClientEvent('tn-drugaddicition:cl:UpdateWeedNeeds', src, newWeed)
    end
    Player.Functions.Save()
end)