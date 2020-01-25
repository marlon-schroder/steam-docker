#!/bin/sh

xhost +

docker run --name steam --rm \
	-v /dev/dri:/dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/shm:/dev/shm \
	-v /etc/machine-id:/etc/machine-id \
	-v ${HOME}:/home/marlon \
	-e DISPLAY=${DISPLAY} \
	--privileged=true \
	steam \
	sh -c "export LANG=en_US.UTF-8 && export LC_CTYPE=en_US.UTF-8 && sudo /etc/init.d/dbus start && subl"
