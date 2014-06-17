#!/bin/bash

NODE_VERSION=$(apt-cache show nodejs | grep "^Version" | cut --delimiter=' ' -f2 | cut --delimiter='~' -f1)

if [ "" != "${NODE_VERSION}" ]; then
	# Use apt repository to install the compiled nodejs.
	#
	echo "nodejs v${NODE_VERSION} is available on apt repository"
	apt-get install -y -q nodejs
else
	# Install nodejs from source
	# 
	NODE_VERSION="0.10.29"
	NODE_FILE=$(which node)

	if [ "" != "${NODE_FILE}" ]; then
		echo "nodejs ($(node --version)) was installed at ${NODE_FILE}"
		exit 0
	fi

	CURRENT=$(pwd)

	# Download sources and compile.
	#
	NODE_URL="https://github.com/joyent/node/archive/v${NODE_VERSION}.tar.gz"
	wget -O /tmp/node-${NODE_VERSION}.tar.gz ${NODE_URL}
	cd /tmp
	tar -xvf node-${NODE_VERSION}.tar.gz
	cd node-${NODE_VERSION}
	./configure --prefix=/opt/node
	make -j$(nproc)
	make install

	# Setup environment path for nodejs execution.
	#
	PATHES=$(cat /etc/environment | grep -v "^#" | grep "^PATH" | cut --delimiter='"' -f2)
	PATHES="${PATHES}:/opt/node/bin"
	sed -i 's/^PATH.*$//g' /etc/environment
	echo "PATH=\"${PATHES}\"" >> /etc/environment

	cd ${CURRENT}
fi

npm install -g LiveScript
npm install -g coffee-script
npm install -g pm2
npm install -g forever 
