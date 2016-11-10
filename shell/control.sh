#! /bin/bash

# This is controller for start/stop-zk-all.sh .
# Input your choice,this scirpt will run as them.
# @Auther: signalfeng@gmail.com
# VERSION 1.0	2016/11/10

start="start-zk-all.sh"
stop="stop-zk-all.sh"
check="check-zk-all.sh"

one="\033[37;31;5m[ 1 ]\033[39;49;0m Start Zookeeper.\n"
two="\033[37;31;5m[ 2 ]\033[39;49;0m Stop Zookeeper.\n"
three="\033[37;31;5m[ 3 ]\033[39;49;0m Check Zookeeper status.\n"
four="\033[37;31;5m[ 4 ]\033[39;49;0m Exit.\n"

echo -e "$one$two$three$four"

read -p "Input your choice : " tmp

if [ $tmp = 1 ];then 
  sh $start
elif [ $tmp = 2 ];then
  sh $stop
elif [ $tmp = 3 ];then
  sh $check
elif [ $tmp = 4 ];then
  exit
else
  echo "ERROR: There is no such choice,please input the right number."
fi
