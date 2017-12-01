#!/bin/bash

cd /code/ws/capture
source install/setup.bash
export ROS_PACKAGE_PATH=/code/pkgs/arl-ros-pkg:$ROS_PACKAGE_PATH
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
roslaunch $@
