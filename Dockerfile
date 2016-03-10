FROM debian:wheezy
MAINTAINER Sean Payne (seantpayne@gmail.com)

# Add oldstable repository for libdb4.8
#ADD oldstable.list /etc/apt/sources.list.d/oldstable.list

# Add build script
ADD build.sh /tmp/build.sh

# Get
RUN mkdir /bitcoin-out && \
  chmod +x /tmp/build.sh && \
  apt-get update && \
  apt-get -y install build-essential libtool autotools-dev autoconf pkg-config libssl-dev bsdmainutils git && \
  apt-get -y install libboost-all-dev && \
  apt-get -y install libdb5.1++-dev && \
  apt-get -y install libminiupnpc-dev

VOLUME ["/bitcoin-out"]


CMD ["/bin/bash", "/tmp/build.sh"]
