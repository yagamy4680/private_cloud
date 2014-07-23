#!/bin/bash

# Refer to https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
apt-get install -y software-properties-common python-software-properties python
add-apt-repository -y ppa:chris-lea/node.js
apt-get update -q
apt-get install -y -q g++ make nodejs

npm install -g LiveScript
npm install -g coffee-script
npm install -g pm2
npm install -g forever 
