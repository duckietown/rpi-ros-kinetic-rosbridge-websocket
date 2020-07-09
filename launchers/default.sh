#!/bin/bash

source /environment.sh

# initialize launch file
dt-launchfile-init

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------


# launching app
dt-exec roslaunch \
  --wait \
  ${DT_REPO_PATH}/assets/rosbridge_websocket.launch \
    port:=${WEBSOCKET_BRIDGE_PORT} \
    veh:="$VEHICLE_NAME"


# ----------------------------------------------------------------------------
# YOUR CODE ABOVE THIS LINE

# wait for app to end
dt-launchfile-join
