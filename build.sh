#!/bin/bash

( git clone https://github.com/bitcoin/bitcoin.git /tmp/bitcoin && \
  cd /tmp/bitcoin && \
  ./autogen.sh && \
  ./configure --disable-shared --enable-static && \
  make &&
  mv /tmp/bitcoin /bitcoin-out ) || (echo "Build failed!" && exit 1)
