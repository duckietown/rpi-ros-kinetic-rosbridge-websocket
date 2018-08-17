# Base image
FROM duckietown/rpi-duckiebot-base:latest

# arguments
ARG PORT=9001
ENV WEBSOCKET_BRIDGE_PORT $PORT

# enable ARM
RUN [ "cross-build-start" ]

# install packages
RUN apt-get update && apt-get install -q -y \
		ros-$ROS_DISTRO-rosbridge-server \
    && rm -rf /var/lib/apt/lists/*

# copy modified launch file
COPY assets/rosbridge_websocket.launch /rosbridge_websocket.launch

# copy launch script
COPY assets/launch_websocket_bridge.sh /root/launch_websocket_bridge.sh
RUN chmod +x /root/launch_websocket_bridge.sh

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/launch_websocket_bridge.sh"]
