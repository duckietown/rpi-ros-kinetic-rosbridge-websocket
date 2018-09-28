# Base image
FROM duckietown/rpi-duckiebot-base:master18

ENV DEBIAN_FRONTEND=noninteractive

# arguments
ARG PORT=9001
ENV WEBSOCKET_BRIDGE_PORT $PORT

# enable ARM
RUN [ "cross-build-start" ]

# install packages
RUN apt-get update && apt-get install -q -y \
		ros-$ROS_DISTRO-rosbridge-server \
    && rm -rf /var/lib/apt/lists/*

# copy launch scripts
COPY assets/* /root/
RUN chmod +x /root/launch_websocket_bridge.sh

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/launch_websocket_bridge.sh"]
