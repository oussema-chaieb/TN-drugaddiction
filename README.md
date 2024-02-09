player metadata


qbcore/server/player.lua under ligne  112

PlayerData.metadata['methaddiction'] = PlayerData.metadata['methaddiction'] or 100
PlayerData.metadata['cokeaddiction'] = PlayerData.metadata['cokeaddiction'] or 100
PlayerData.metadata['weedaddiction'] = PlayerData.metadata['weedaddiction'] or 100


qbcore/shared/items 

    coke                          = { name = 'coke', label = 'Coke', weight = 0, type = 'item', image = 'coke.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    methamine                     = { name = 'methamine', label = 'Methamine', weight = 0, type = 'item', image = 'methamine.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    weed_joint                    = { name = 'weed_joint', label = 'Weed Joint', weight = 0, type = 'item', image = 'weed_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },

