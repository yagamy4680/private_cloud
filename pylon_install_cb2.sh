#!/bin/bash

apt-get update
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
wget https://github.com/git/git/archive/v1.8.5.tar.gz
tar -xvf v1.8.5.tar.gz
cd git-1.8.5/
make prefix=/usr/local all
make prefix=/usr/local install
