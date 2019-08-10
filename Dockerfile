ARG ARCH=arm32v7
ARG BASE_TAG=devel20-${ARCH}

FROM duckietown/dt-ros-commons:${BASE_TAG}

# configure environment
ENV LAUNCH_FILE="${SOURCE_DIR}/launch.sh"

# arguments
ARG PORT=9001
ENV WEBSOCKET_BRIDGE_PORT $PORT

# install packages
RUN apt-get update \
  && apt-get install -q -y \
     ros-${ROS_DISTRO}-rosbridge-server \
  && rm -rf /var/lib/apt/lists/*

# copy launch scripts
COPY assets/* "${SOURCE_DIR}/"

# configure CMD
CMD ["bash", "-c", "${LAUNCH_FILE}"]
