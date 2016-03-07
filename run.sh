#!/bin/bash
# Set environment variable
export HUBOT_SLACK_TOKEN=xoxb-24833690099-4nkOP4Cg5tTPaKUNY2SFIx4m
export DOCOMO_API_KEY=4c6b2e4a383258426777513452726c7762316834504958356633366867365034622f636a54304463455a39

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
