ARG ARCH=arm32v7
ARG BRANCH=master19

FROM duckietown/${ARCH}-commons:${BRANCH}

ENV DEBIAN_FRONTEND=noninteractive
ENV LAUNCH_FILE="${SOURCE_DIR}/launch.sh"

# arguments
ARG PORT=9001
ENV WEBSOCKET_BRIDGE_PORT $PORT

# enable ARM
RUN ["cross-build-start"]

# install packages
RUN apt-get update \
  && apt-get install -q -y \
     ros-${ROS_DISTRO}-rosbridge-server \
  && rm -rf /var/lib/apt/lists/*

# copy launch scripts
COPY assets/* "${SOURCE_DIR}/"

# disable ARM
RUN ["cross-build-end"]
