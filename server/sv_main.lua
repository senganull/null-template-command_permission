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

    -- エラーハンドリング
    local targetId = args[1]
    local message = args[2]

    if not targetId or not message then
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 255, 0},
            multiline = true,
            args = {"System", "構文エラー: /testcmd [ID] [MESSAGE] の形で入力してください"}
        })
        return
    end

    print(string.format("Command executed by %s: Target %s, Message: %s", GetPlayerName(src), targetId, message))

    --成功時のフィードバック
    TriggerClientEvent('chat:addMessage', src, {
        color = {0, 255, 0},
        multiline = true,
        args = {"System", string.format("ID %s へメッセージを送りました: %s", targetId, message)}
    })
    
end, true)