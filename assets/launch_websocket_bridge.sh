#!/usr/bin/env bash

# source ROS and code
source /opt/ros/$ROS_DISTRO/setup.bash

# launch websocket bridge
roslaunch --wait /root/rosbridge_websocket.launch port:=$WEBSOCKET_BRIDGE_PORT
