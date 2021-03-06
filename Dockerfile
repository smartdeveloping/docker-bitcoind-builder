FROM ubuntu:trusty
MAINTAINER Andrew Boss (info@smartdeveloping.com)

# Add build script
ADD build.sh /tmp/build.sh

# Get
RUN mkdir /bitcoin-out && \
  chmod +x /tmp/build.sh && \
  apt-get update && \
  apt-get -y install build-essential libtool autotools-dev autoconf pkg-config libssl-dev bsdmainutils git && \
  apt-get -y install software-properties-common && \
  apt-get -y install python-software-properties && \
  add-apt-repository -y ppa:bitcoin/bitcoin && \
  apt-get update && \
  apt-get -y install libdb4.8-dev libdb4.8++-dev && \
  apt-get -y install libboost-all-dev && \
  apt-get -y install libevent-dev && \
  apt-get -y install libminiupnpc-dev

VOLUME ["/bitcoin-out"]


CMD ["/bin/bash", "/tmp/build.sh"]
