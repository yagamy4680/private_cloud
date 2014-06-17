#!/bin/bash
MOD_NAME="v4l2loopback"
MOD_FILE=$(modinfo ${MOD_NAME} | grep filename | awk -F' ' '{print $2}')

if [ "0" != "$?" ]; then
        echo "${MOD_NAME} is missing. Please install before loading the kernel module"
        exit 1
fi

echo "intitialize video11, video12, video13, video14, video15, video16 v4l2-loopback devices"
modprobe v4l2loopback video_nr=11,12,13,14,15,16
