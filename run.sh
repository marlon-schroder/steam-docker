#!/bin/sh

#[ ! -d /run/user/pulse ] && doas mkdir /run/user/pulse

xhost +steam

docker run --name steam --rm \
	-v /dev/dri:/dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/shm:/dev/shm \
	-v /run/user/pulse:/run/user/${UID}/pulse \
	-v /etc/machine-id:/etc/machine-id \
	-v ${HOME}/downloads:/tmp/Downloads \
	-e DISPLAY=${DISPLAY} \
	steam \
	/etc/init.d/steam &

#--privileged=true \
