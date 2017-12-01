#!/bin/bash

cd /code/ws/kalibr
if [[ -e install ]]; then
    source install/setup.bash
else
    source /opt/ros/indigo/setup.bash
fi
catkin_make $@ -j $(nproc) -DCMAKE_BUILD_TYPE=RelWithDebInfo install
