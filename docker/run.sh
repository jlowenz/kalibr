#!/usr/bin/env bash

BASE_CODE=$HOME/dev
DATA_DIR=/home/data/jlowens

#DOCKER_IP=$(ifconfig docker0 | grep 'inet addr' | sed -re's/.*inet addr:([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*/\1/')

CMD=${@:-"/bin/bash"}
echo "EXECUTING: $CMD"
#xhost +$DOCKER_IP
xhost +
nvidia-docker run --rm \
              --net=host \
              -v /dev/:/dev \
              -v /tmp:/tmp \
	            -v $BASE_CODE:/code \
	            -v $HOME/.Xauthority:/home/user/.Xauthority:rw \
			        -v $HOME/.ros:/home/user/.ros \
              -v $HOME/.rosconsole:/home/user/.rosconsole \
              -v $HOME/Documents:/home/user/Documents \
	            -e LOCAL_USER_ID=$(id -u) \
	            -e LOCAL_GROUP_ID=$(id -g) \
	            -e DISPLAY=unix$DISPLAY \
              -e FIND_EIGEN=Eigen3 \
              -e ROS_HOSTNAME=localhost \
              -e ROS_PACKAGE_PATH=/code/pkgs/arl-ros-pkg:$ROS_PACKAGE_PATH \
              -e ROSCONSOLE_CONFIG_FILE=/home/user/.rosconsole \
	            --privileged \
	            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
              -it jlowenz/kalibr:1.0 \
	            $CMD
xhost -
