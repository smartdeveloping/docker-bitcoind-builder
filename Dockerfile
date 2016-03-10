FROM debian:wheezy
MAINTAINER Sean Payne (seantpayne@gmail.com)

# Add oldstable repository for libdb4.8
ADD oldstable.list /etc/apt/sources.list.d/oldstable.list

# Add build script
ADD build.sh /tmp/build.sh

# Get
RUN mkdir /bitcoin-out && \
  chmod +x /tmp/build.sh && \
  apt-get update && \
  apt-get -y install build-essential libtool autotools-dev autoconf pkg-config libssl-dev bsdmainutils git && \
  apt-get -y install libboost-all-dev && \
  (echo deb http://de.archive.ubuntu.com/ubuntu/ lucid main restricted universe multiverse; echo deb http://de.archive.ubuntu.com/ubuntu/ lucid-updates main restricted universe multiverse; echo deb http://security.ubuntu.com/ubuntu lucid-security main restricted universe multiverse) | sudo sh -c 'cat >>/etc/apt/sources.list'
  apt-get update
  apt-get -y install libdb4.8-dev libdb4.8++-dev && \
  apt-get -y install libminiupnpc-dev

VOLUME ["/bitcoin-out"]


CMD ["/bin/bash", "/tmp/build.sh"]
