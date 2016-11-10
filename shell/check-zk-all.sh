#! /bin/bash
# This shell script is for checking all the zookeeper nodes in our cluster.
# You can change the IP address to yours,and then it will be your tools.
# @Author  signalfeng@gmail.com
# @VERSION 1.0	2016/11/9

# Check zookeeper on master node

hostName=`hostname`
echo -e "\e[1;41mZookeeper checked on $hostName...\e[0m\n"
/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh status > status.txt
status=`cat status.txt | grep "Mode:" | awk '{print $2}'`
if [ "$status" = "" ];then
  echo -e "$hostName is not running."
else
  echo -e "$hostName is $status.\n"
fi
sleep 1s


# Check zookeeper on slave1 node

hostName=`ssh 192.168.38.130 'hostname'`
echo -e "\e[1;41mZookeeper checked on $hostName...\e[0m\n"
ssh $hostName '/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh status' > status.txt
status=`cat status.txt | grep "Mode:" | awk '{print $2}'`
if [ "$status" = "" ];then
  echo -e "$hostName is not running."
else
  echo -e "$hostName is $status.\n"
fi
sleep 1s


# Check zookeeper on slave2 node

hostName=`ssh 192.168.38.131 'hostname'`
echo -e "\e[1;41mZookeeper checked on $hostName...\e[0m\n"
ssh $hostName '/usr/hadoop/zookeeper-3.4.8/bin/zkServer.sh status' > status.txt
status=`cat status.txt | grep "Mode:" | awk '{print $2}'`
if [ "$status" = "" ];then
  echo "$hostName is not running."
else
  echo -e "$hostName is $status."
fi


exit
