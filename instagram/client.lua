-- made by vexxy


local instaHandle = ''

RegisterCommand('instahandle', function(source, args)
    local handle = table.concat(args, ' ')
    if handle ~= '' then
        TriggerServerEvent('setInstaHandle', handle)
        instaHandle = handle
        TriggerEvent('chat:addMessage', {
            color = {204, 0, 204},
            multiline = true,
            args = {'[Instagram]', 'Your Instagram handle has been set to: ' .. handle}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {204, 0, 204},
            multiline = true,
            args = {'[Instagram]', 'Usage: /instahandle [handle]'}
        })
    end
end, false)

RegisterCommand('inst', function(source, args)
    local message = table.concat(args, ' ')
    if message ~= '' then
        TriggerServerEvent('sendInstaPost', instaHandle, message)
    else
        TriggerEvent('chat:addMessage', {
            color = {204, 0, 204},
            multiline = true,
            args = {'[Instagram]', 'Usage: /inst [message]'}
        })
    end
end, false)

RegisterNetEvent('setInstaHandle')
AddEventHandler('setInstaHandle', function(handle)
    instaHandle = handle
end)

RegisterNetEvent('receiveInstaPost')
AddEventHandler('receiveInstaPost', function(handle, message)
    local name = ('[Instagram] | %s'):format(handle)
    TriggerEvent('chat:addMessage', {
        color = {204, 0, 204},
        multiline = true,
        args = {name, message}
    })
end)
