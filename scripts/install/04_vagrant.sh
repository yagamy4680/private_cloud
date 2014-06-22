#!/bin/bash
VAGRANT_FILE=$(which vagrant)

if [ "" == "${VAGRANT_VERSION}" ]; then
	export VAGRANT_VERSION="1.6.3"
fi

if [ "" != "${VAGRANT_FILE}" ]; then
	echo "vagrant $(vagrant --version) was installed at ${VAGRANT_FILE}"
	exit 0
fi

VAGRANT_URL="https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERSION}_x86_64.deb"
VAGRANT_PACKAGE="/tmp/vagrant_${VAGRANT_VERSION}_x86_64.deb"

# Install Vagrant
#
echo "download vagrant ${VAGRANT_VERSION} from ${VAGRANT_URL}"
wget -q -O ${VAGRANT_PACKAGE} ${VAGRANT_URL}
echo "install vagrant"
dpkg -i ${VAGRANT_PACKAGE}

# Install Vagrant plugins
#
echo "install vagrant plugins"
# vagrant plugin install vagrant-berkshelf
# vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-cachier
