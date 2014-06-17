#!/bin/bash
#
MOD_NAME="v4l2loopback"
MOD_FILE=$(modinfo ${MOD_NAME} | grep filename | awk -F' ' '{print $2}')

if [ "" != "${MOD_FILE}" ]; then
	echo "${MOD_NAME} is already installed at ${MOD_FILE}, skip further installation steps"
	exit 0
fi

if [ "" == "${V4L2LOOPBACK_GIT_URL}" ]; then
	export V4L2LOOPBACK_GIT_URL="https://github.com/umlaeute/v4l2loopback.git"
fi

# Install the prerequisites for compiling v4l2 loopback driver
#
apt-get install -y libv4l-dev v4l-utils

echo "download v4l2-loopback from ${V4L2LOOPBACK_GIT_URL}"
cd /opt
git clone ${V4L2LOOPBACK_GIT_URL}
cd v4l2loopback
make
make install

# todo: 
#
