#!/bin/sh

#[ ! -d /run/user/pulse ] && doas mkdir /run/user/pulse

xhost +

docker run --name steam --rm \
	-v /dev/dri:/dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/shm:/dev/shm \
	-v /run/user/pulse:/run/user/${UID}/pulse \
	-v /etc/machine-id:/etc/machine-id \
	-v ${HOME}/steam/.local/share:/home/steam/.local/share \
	-v ${HOME}/steam/.steam:/home/steam/.steam \
	-v ${HOME}/downloads:/tmp/Downloads \
	--privileged=true \
	-e DISPLAY=${DISPLAY} \
	steam \
	/etc/init.d/steam &

#docker commit 12fa3f4b1afd steam:latest
#sudo /etc/init.d/dbus start & /bin/bash
#rm -rf ~/.local/share/Steam && rm -rf ~/.steam* && steam
