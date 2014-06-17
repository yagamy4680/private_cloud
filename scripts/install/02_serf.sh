#!/bin/bash -eux

apt-get -q -y install unzip

SERF_VERSION=0.5.0
wget -q "https://dl.bintray.com/mitchellh/serf/${SERF_VERSION}_linux_amd64.zip" \
     -O /tmp/serf-${SERF_VERSION}.zip
(cd /tmp && unzip -o -qq /tmp/serf-${SERF_VERSION}.zip -d /usr/local/bin/)
rm -rf /tmp/serf-${SERF_VERSION}.zip
