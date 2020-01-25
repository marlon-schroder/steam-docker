#!/bin/sh

xhost +steam

docker run --name steam --rm \
	-e DISPLAY=${DISPLAY} \
	steam \
	subl &
