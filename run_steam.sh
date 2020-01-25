#!/bin/sh

xhost +

docker run --name steam --rm -itd \
	-v /dev/dri:/dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/shm:/dev/shm \
	-v /run/user/pulse:/run/user/${UID}/pulse \
	-v /etc/machine-id:/etc/machine-id \
	-v ${HOME}:/home/marlon \
	-e DISPLAY=${DISPLAY} \
	--privileged=true \
	steam \
	sh -c "export LC_ALL=C && sudo /etc/init.d/dbus start && steam"
