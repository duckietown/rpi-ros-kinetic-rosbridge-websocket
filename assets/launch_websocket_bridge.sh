#!/usr/bin/env bash

set -e -x

# source ROS and code
source /opt/ros/$ROS_DISTRO/setup.bash

# source Duckietown code
source /home/duckiebot-interface/docker_setup.sh
source /home/duckiebot-interface/catkin_ws/devel/setup.bash

# launch websocket bridge
roslaunch --wait /root/rosbridge_websocket.launch port:=$WEBSOCKET_BRIDGE_PORT
