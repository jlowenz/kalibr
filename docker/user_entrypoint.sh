#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

umask 0000
USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-9001}

echo "Starting with UID : $USER_ID"
groupadd --gid $GROUP_ID docker_user
useradd --shell /bin/bash -u $USER_ID -o -c ""  user
adduser user docker_user
adduser user sudo

source /opt/ros/indigo/setup.bash
export HOME=/home/user
export ROS_PACKAGE_PATH=/code/pkgs/arl-ros-pkg:$ROS_PACKAGE_PATH
export ROS_HOST=`hostname`
export ROSCONSOLE_CONFIG_FILE=/home/user/.rosconsole

#chown -R user:docker_user /usr/local/zed
#chmod 666 -R /usr/local/zed

exec /usr/sbin/chroot --userspec=user:docker_user --groups=sudo / "$@"
