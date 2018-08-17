#!/usr/bin/env bash

roslaunch --wait /root/rosbridge_websocket.launch port:=$WEBSOCKET_BRIDGE_PORT
