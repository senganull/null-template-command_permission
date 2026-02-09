RegisterCommand('testcmd', function(source, args, rawCommand)
    local src = source
    
    --　管理者権限チェック (ACE: command.testcmd)
    if src ~= 0 and not IsPlayerAceAllowed(src, "command.testcmd") then
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "権限がありません。"}
        })
        return
    end

    local targetId = tonumber(args[1])
    local message = table.concat(args, " ", 2)

    if not targetId or not message then
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 255, 0},
            multiline = true,
            args = {"System", "構文エラー: /testcmd [ID] [MESSAGE]"}
        })
        return
    end

    TriggerClientEvent('null-template-command_permission:client:showNotification', targetId, message)
    print(string.format("Command executed by %s: Target %s, Message: %s", GetPlayerName(src), targetId, message))

    --成功時のフィードバック
    TriggerClientEvent('chat:addMessage', src, {
        color = {0, 255, 0},
        multiline = true,
        args = {"System", string.format("ID %s へメッセージを送りました: %s", targetId, message)}
    })
    
end, true)