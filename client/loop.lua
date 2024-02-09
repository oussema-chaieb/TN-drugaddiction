local QBCore = exports['qb-core']:GetCoreObject()

local function addictMethEffect()
    local player = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {"cough"})
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(player, 2500, 4000, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    Wait(5000)
    DoScreenFadeOut(1500)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
    Wait(2000)
    SetTimecycleModifier('spectator5')
    SetPedMotionBlur(player, true)
    SetPedMovementClipset(player, 'MOVE_M@DRUNK@VERYDRUNK', true)
    SetPedIsDrunk(player, true)
    SetPedAccuracy(player, 0)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 1.10)
    Wait(2000)
    DoScreenFadeIn(1800)
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(player, 2500, 4000, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.20)
    Wait(2000)            
    Wait(10*6000) -- 10 mins
    DoScreenFadeOut(1400)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 1.10)
    Wait(2000)  
    DoScreenFadeIn(1200)
    if IsPedWalking(player) or IsPedRunning(player) then
        SetPedToRagdollWithFall(player, 2500, 4000, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.05)
    Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(player, 0)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
end

-- CreateThread(function()
--     while true do
--         local sleep = 0
--         if LocalPlayer.state.isLoggedIn then
--             sleep = (1000 * 60) * Config.updateInterval
--             TriggerServerEvent('tn-drugaddiction:sv:UpdatePlayer')
--         end
--         Wait(sleep)
--     end
-- end)

-- CreateThread(function()
--     while true do
--         if LocalPlayer.state.isLoggedIn then
--             if QBCore.Functions.GetPlayerData().metadata['methaddiction'] <= 30 and QBCore.Functions.GetPlayerData().metadata['methaddiction'] > 1 then
--                 addictMethEffect()
--                 if QBCore.Functions.GetPlayerData().metadata['methaddiction'] <= 0 then
--                     TriggerEvent('animations:client:EmoteCommandStart', {"fallover5"})
--                     QBCore.Functions.Notify("you need meth or your head will blow up", "error")
--                     TriggerEvent('animations:client:Walk', {"drunk3"})
                    
--                     local ped = PlayerPedId()
                    
--                     DoScreenFadeOut(1000)
--                     SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                     DoScreenFadeIn(1000)
                    
--                     local currentHealth = GetEntityHealth(ped)
--                     SetEntityHealth(ped, currentHealth - 7)
--                 end
--             end
--             if QBCore.Functions.GetPlayerData().metadata['cokeaddiction'] <= 30 and QBCore.Functions.GetPlayerData().metadata['cokeaddiction'] > 1 then
--                 addictMethEffect()
--                 if QBCore.Functions.GetPlayerData().metadata['cokeaddiction'] <= 0 then
--                     QBCore.Functions.Notify("you need coke or your head will blow up", "error")
--                     TriggerEvent('animations:client:Walk', {"drunk"})
--                     local ped = PlayerPedId()

--                     DoScreenFadeOut(1000)
--                     SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                     DoScreenFadeIn(1000)
                    
--                     local currentHealth = GetEntityHealth(ped)
--                     SetEntityHealth(ped, currentHealth - 7)
--                 end
--             end
--             if QBCore.Functions.GetPlayerData().metadata['weedaddiction'] <= 30 and QBCore.Functions.GetPlayerData().metadata['weedaddiction'] > 1 then
--                 addictMethEffect()
--                 if QBCore.Functions.GetPlayerData().metadata['weedaddiction'] <= 0 then
--                     QBCore.Functions.Notify("you need weed or your head will blow up", "error")
--                     TriggerEvent('animations:client:Walk', {"drunk"})
--                     local ped = PlayerPedId()

--                     DoScreenFadeOut(1000)
--                     SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                     DoScreenFadeIn(1000)
                    
--                     local currentHealth = GetEntityHealth(ped)
--                     SetEntityHealth(ped, currentHealth - 7)
--                 end
--             end
--         end
--         Wait(Config.statusInterval)
--     end
-- end)