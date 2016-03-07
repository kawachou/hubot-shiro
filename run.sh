#!/bin/bash
# Set environment variable
export HUBOT_SLACK_TOKEN=

# foreverでhubotをデーモンで起動
case $1 in
    "start" | "stop" | "restart" )
       forever $1 \
           -p /home/labtech/forever \
           --pidfile /home/labtech/forever/run/shiro.pid \
           -l /home/labtech/forever/logs/shiro.log -a \
           -c coffee node_modules/hubot/bin/hubot --adapter slack
    ;;
    * ) echo "usage: run.sh start|stop|retart" ;;
esac
