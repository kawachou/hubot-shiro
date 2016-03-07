# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   cron configs
#


cronJob = require('cron').CronJob
random = (n) -> Math.floor(Math.random() * n)

module.exports = (robot) ->
  cronGohan = new cronJob('50 12 * * 1-5', () =>
      d = new Date()
      unless d.isHoliday()
          gohans = [
              "廻る寿司"
          ]
          gohan = gohans[random(gohans.length)]
          envelope = room: "#general"
          robot.send envelope, "今日のお昼は" + gohan
  )
  cronGohan.start()

  cronGohome = new cronJob('00 19 * * 1-5', () =>
      d = new Date()
      unless d.isHoliday()
          envelope = room: "#general"
          robot.send envelope, "もう７時だし帰ろう"
  )
  cronGohome.start()
