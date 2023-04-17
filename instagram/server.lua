-- made by vexxy

local instaHandle = ''

RegisterServerEvent('setInstaHandle')
AddEventHandler('setInstaHandle', function(handle)
    instaHandle = handle
end)

RegisterServerEvent('sendInstaPost')
AddEventHandler('sendInstaPost', function(handle, message)
    TriggerClientEvent('receiveInstaPost', -1, handle, message)
end)

AddEventHandler('playerDropped', function()
    local source = source
    if GetPlayerName(source) == instaHandle then
        instaHandle = ''
        TriggerClientEvent('setInstaHandle', -1, '')
    end
end)
