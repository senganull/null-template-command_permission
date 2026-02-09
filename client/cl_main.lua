RegisterNetEvent('null-template-command_permission:client:showNotification')
AddEventHandler('null-template-command_permission:client:showNotification', function(message)
    lib.notify({
        title = message,
        duration = 5000,
        type = 'success',
        icon = 'check',
        iconColor = '#C1FF33'
    })
end)

RegisterCommand('ping', function()
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 255},
        args = {"System", "Pong!"}
    })
end,false)