#!/bin/bash

# Environment variables
#
if [ "" == "${VAGRANT_URL}" ]; then
	export VAGRANT_URL="https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb"
fi

if [ "" == "${VAGRANT_PLUGINS}" ]; then
	export VAGRANT_PLUGINS="\
	vagrant-berkshelf
	vagrant-omnibus
"
fi


# Install Vagrant
#
TMP="$(mktemp).deb"
wget -o ${TMP} ${VAGRANT_URL}
dpkg -i ${TMP}

# Install all necessary plugins for Vagrant.
#
for p in $VAGRANT_PLUGINS; do \
	vagrant plugin install ${p}
done
