FROM ubuntu:latest
MAINTAINER Alexander Rose <arose@haprotec.de>

# install git
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    git \
    unzip

# Setup Qtrpi environment
ENV QTRPI_QT_VERSION='5.6.2'
ENV QTRPI_TARGET_DEVICE='linux-rpi3-g++'
ENV QTRPI_TARGET_HOST='pi@localhost'
ENV QTRPI_SKIP_SANITY_CHECK='True'

# Clone Qtrpi
RUN git clone https://github.com/neuronalmotion/qtrpi.git

# Add additional scripts
ADD scripts/docker-build.sh /qtrpi
ADD scripts/init-common-docker.sh /qtrpi/utils
ADD scripts/init-qtrpi-docker-minimal.sh /qtrpi

# Change workdir
WORKDIR /qtrpi

# Execute init script
RUN ./init-qtrpi-docker-minimal.sh

# Extend path
ENV PATH=/opt/qtrpi/bin:$PATH

# Create path for source files
RUN mkdir /source
WORKDIR /source

# Execute build commands on run
CMD /qtrpi/docker-build.sh
