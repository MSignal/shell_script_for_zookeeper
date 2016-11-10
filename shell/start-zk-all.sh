#! /bin/bash
# This shell script is for starting all the zookeeper nodes in our cluster.
# You can change the IP address to yours,and then it will be your tools.
# @Author  signalfeng@gmail.com
# @VERSION 1.0	2016/11/9


# Start zookeeper on master node

hostName=`hostname`
echo -e "\e[1;46mZookeeper start on $hostName...\e[0m\n"
/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh start
echo -e "\n"
sleep 2s


# Start zookeeper on slave1 node

hostName=`ssh 192.168.38.130 'hostname'`
echo -e "\e[1;46mZookeeper start on $hostName...\e[0m\n"
ssh $hostName '/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh start'
echo -e "\n"
sleep 2s


# Start zookeeper on slave2 node

hostName=`ssh 192.168.38.131 'hostname'`
echo -e "\e[1;46mZookeeper start on $hostName...\e[0m\n"
ssh $hostName '/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh start'

exit
