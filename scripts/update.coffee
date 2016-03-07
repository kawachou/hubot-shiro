# Description:
#   Allows hubot to update itself using git pull and npm update.
#   If updates are downloaded you'll need to restart hubot, for example using "hubot die" (restart using a watcher like forever.js).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot update - Performs a git pull and npm udate.
#
# Author:
#   benjamine

child_process = require('child_process')

module.exports = (robot) ->
    robot.respond /できること$/i, (msg) ->
        candolist =
        """
        ```
        あいさつ
        #{robot.name} できること
        #{robot.name} restart
            自分再起動
        #{robot.name} update yourself
            自分の更新＋再起動
        ```
        """
        msg.send candolist

    robot.respond /restart$/i, (msg) ->
        try
            msg.send "はーい。さよなら"
            child_process.exec './run.sh restart', (error, stdout, stderr) ->
                if error
                    msg.send "再起動 失敗: " + stderr
        catch error
            msg.send "再起動 失敗: " + error

    robot.respond /update yourself$/i, (msg) ->
        try
            msg.send "はーい。自分を更新。git pullします。"
            child_process.exec 'bin/update_myself.sh', (error, stdout, stderr) ->
                if error
                    msg.send "git pull 失敗: " + stderr
                else
                    output = stdout+''
                    if not /Already up\-to\-date/.test output
                        msg.send "最新版に更新されました。再起動します:\n" + output
                        child_process.exec './run.sh restart'
                    else
                        msg.send "すでに最新です"
        catch error
            msg.send "git pull 失敗: " + error

