#!/usr/bin/env bash

# launch websocket bridge
roslaunch \
  --wait \
  "${SOURCE_DIR}/rosbridge_websocket.launch" \
  port:=${WEBSOCKET_BRIDGE_PORT}
