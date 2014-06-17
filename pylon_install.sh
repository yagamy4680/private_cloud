#!/bin/sh
apt-get install -y build-essential openssl libssl-dev pkg-config
wget http://nodejs.org/dist/v0.10.22/node-v0.10.22.tar.gz
tar -xvf node-v0.10.22.tar.gz
cd node-v0.10.22
./configure --prefix=/opt/node && make && sudo make install

echo "PATH=\"$PATH:/opt/node/bin\"" > /etc/environment

/opt/node/bin/npm install -g LiveScript
/opt/node/bin/npm install -g coffee-script
/opt/node/bin/npm install -g pm2
/opt/node/bin/npm install -g forever

