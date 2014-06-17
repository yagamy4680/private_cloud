#!/bin/bash

# Update entire apt repositories
#
echo "update apt repositories ..."
apt-get update -qq

# Install linux headers
#
apt-get install -y -q linux-headers-$(uname -r)

# Install necessary packages
#
apt-get install -y -q libz-dev libssl-dev build-essential openssl pkg-config
