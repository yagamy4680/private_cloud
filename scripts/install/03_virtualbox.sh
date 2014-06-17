#!/bin/bash -e

# Environment variables
#
if [ "" == "${VBOX_VERSION}" ]; then
	export VBOX_VERSION="4.3"
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

# Check Virtualbox's installation status
#
if [ "" == "$(which vboxmanage)" ]; then
	LINE=$(tail -n 1 ${TMP})
	APT_FOUND=$(cat /etc/apt/sources.list | grep "${LINE}")
	if [ "" == "${APT_FOUND}" ]; then
        	cat ${TMP} >> /etc/apt/sources.list
	fi
	echo "install virtualbox public key"
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
	echo "update virtualbox apt repository"
	apt-get update -qq
	echo "install virtualbox"
	apt-get install -y -q virtualbox-${VBOX_VERSION}
else
	echo "virtualbox $(vboxmanage --version | cut --delimiter=r --fields=1) was installed at $(which vboxmanage)"

fi


# Install Virtualbox's extension pack
#
VBOX_VERSION=$(vboxmanage --version | cut --delimiter=r --fields=1)
VBOX_EXTPACK_URL="http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack"
echo "download virtualbox extension pack from ${VBOX_EXTPACK_URL}"
wget -O "/tmp/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack" -q ${VBOX_EXTPACK_URL}
vboxmanage extpack install "/tmp/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack"
