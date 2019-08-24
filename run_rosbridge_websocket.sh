#!/bin/bash

set -e -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

roslaunch \
  --wait \
  ${DIR}/assets/rosbridge_websocket.launch \
    port:=${WEBSOCKET_BRIDGE_PORT}
