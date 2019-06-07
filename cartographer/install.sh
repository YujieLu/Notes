#!/bin/sh
#---Generated from template 'sh' wrote by @aliben---
# @Copyright (C) 2019 All rights reserved.
# @file: install.sh
# @author: aliben.develop@gmail.com
# @created_date: 2019-04-30 12:10:03
# @last_modified_date: 2019-04-30 12:10:53
# @brief: TODO
# @details: TODO
#---***********************************************---


#---Variables
CREATED_TIME=`date '+%Y-%m-%d %H:%M:%S'`
CREATED_YEAR=`date '+%Y'`

#---Shell Command
sudo apt-get update
sudo apt-get install -y python-wstool python-rosdep ninja-build

mkdir catkin_ws
cd catkin_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall
wstool update -t src

src/cartographer/scripts/install_proto3.sh
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

catkin_make_isolated --install --use-ninja
