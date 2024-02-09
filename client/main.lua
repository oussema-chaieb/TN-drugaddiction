RegisterNetEvent("tn-drugaddicition:cl:UpdateCokeNeeds", function(coke)
    SendNUIMessage({coke = coke})
end)

RegisterNetEvent("tn-drugaddicition:cl:UpdateMethNeeds", function(meth)
    SendNUIMessage({meth = meth})
end)

RegisterNetEvent("tn-drugaddicition:cl:UpdateWeedNeeds", function(weed)
    SendNUIMessage({weed = weed})
end)