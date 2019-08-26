#!/bin/bash

set -e

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

roslaunch \
  --wait \
  ${DIR}/assets/rosbridge_websocket.launch \
    port:=${WEBSOCKET_BRIDGE_PORT}
