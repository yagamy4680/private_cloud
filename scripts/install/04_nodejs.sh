#!/bin/bash

apt-get install -y software-properties-common
add-apt-repository -y ppa:chris-lea/node.js
apt-get update -q
apt-get install -y -q python-software-properties python g++ make nodejs

npm install -g LiveScript
npm install -g coffee-script
npm install -g pm2
npm install -g forever 
