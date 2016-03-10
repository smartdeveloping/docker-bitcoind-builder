#!/bin/bash

( git clone https://github.com/bitcoin/bitcoin.git /tmp/bitcoin && \
  cd /tmp/bitcoin && \
  ./autogen.sh && \
  ./configure --with-incompatible-bdb --disable-shared && \
  make &&
  mv /tmp/bitcoin/src/bitcoind /bitcoin-out ) || (echo "Build failed!" && exit 1)
