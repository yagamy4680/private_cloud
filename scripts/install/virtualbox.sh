#!/bin/bash

# Environment variables
#
if [ "" == "${VBOX_VERSION}" ]; then
	export VBOX_VERSION="4.3"
fi

if [ "" == "${VBOX_EXTPACK}" ]; then
	export VBOX_EXTPACK="http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack"
fi

# Add necessary apt repositories for virtualbox
#
TMP=$(mktemp)
cat <<EOF >> ${TMP}
deb http://download.virtualbox.org/virtualbox/debian saucy contrib
deb http://download.virtualbox.org/virtualbox/debian raring contrib
deb http://download.virtualbox.org/virtualbox/debian quantal contrib
deb http://download.virtualbox.org/virtualbox/debian precise contrib
deb http://download.virtualbox.org/virtualbox/debian lucid contrib non-free
deb http://download.virtualbox.org/virtualbox/debian wheezy contrib
deb http://download.virtualbox.org/virtualbox/debian squeeze contrib non-free
EOF

LINE=$(tail -n 1 ${TMP})
APT_FOUND=$(cat /etc/apt/sources.list | grep "${LINE}")
if [ "" == "${APT_FOUND}" ]; then
	cat ${TMP} >> /etc/apt/sources.list
fi
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
apt-get update
apt-get install -y virtualbox-${VBOX_VERSION}

# Install Virtualbox's extension pack
#
TMP=$(mktemp)
wget -o ${TMP} ${VBOX_EXTPACK}
vboxmanage extpack install ${VBOX_EXTPACK}
