#!/bin/sh

apt-get update
apt-get install -y libz-dev libssl-dev build-essential
apt-get install -y git
# apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
# wget https://github.com/git/git/archive/v1.8.5.tar.gz
# tar -xvf v1.8.5.tar.gz
# cd git-1.8.5/
# make prefix=/usr/local all
# make prefix=/usr/local install
# cd ~

curl https://raw.github.com/yagamy4680/private_cloud/master/virtualbox_source_list.txt >> /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
apt-get update
apt-get install -y virtualbox-4.3
wget http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb
dpkg -i vagrant_1.3.5_x86_64.deb
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

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

