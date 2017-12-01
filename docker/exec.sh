#!/bin/bash

# How to generalize this??
cd /code/ws/kalibr
if [[ -e devel ]]; then
    source devel/setup.bash
else
    source /opt/ros/indigo/setup.bash
fi
#rosrun --prefix 'gdb --ex run --args' $@
rosrun $@
