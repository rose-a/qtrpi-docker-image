FROM ubuntu:latest
MAINTAINER Alexander Rose <arose@haprotec.de>

# install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip

# Clone Qtrpi
RUN git clone https://github.com/neuronalmotion/qtrpi.git

# Add additional scripts
COPY scripts/docker-build.sh /qtrpi
COPY scripts/init-common.sh /qtrpi/utils

# Setup Qtrpi environment
ENV QTRPI_QT_VERSION='5.6.2' \
    QTRPI_TARGET_DEVICE='linux-rpi3-g++' \
    QTRPI_TARGET_HOST='pi@localhost' \
    QTRPI_DOCKER='True'

# Change workdir
WORKDIR /qtrpi

# Execute init script
RUN ./init-qtrpi-minimal.sh

# Extend path
ENV PATH=/opt/qtrpi/bin:$PATH

# Create path for source files
RUN mkdir /source
WORKDIR /source

# Execute build commands on run
CMD /qtrpi/docker-build.sh
