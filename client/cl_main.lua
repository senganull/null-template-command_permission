RegisterNetEvent('null-template-command_permission:client:showNotification')
AddEventHandler('null-template-command_permission:client:showNotification', function(message)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(false, false)
end)

--　権限不要なコマンド
RegisterCommand('ping', function()
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 255},
        args = {"System", "Pong!"}
    })
end,false)