#!/bin/bash
#set -x
space=$1
direction=$2

#traffic_$direction=`ip netns exec $1 ifconfig "$DEV"| awk '{print $5}' | sed 's/%//'`
active_qg=`sudo ip netns exec $space ifconfig | grep -A8 qg-| grep "inet 142"| wc -l`
if [ $active_qg -ne 0 ]
then
	if [ $direction = "RX" ]
	then traffic_direction=`sudo ip netns exec $space ifconfig | grep -A8 qg-| grep "$direction packets"| awk '{print $5}'`
		echo $traffic_direction
	elif [ $direction = "TX" ]
	then traffic_direction=`sudo ip netns exec $space ifconfig | grep -A8 qg-| grep "$direction packets"| awk '{print $5}'`
		echo $traffic_direction
	else echo 0
	fi
else echo 0
fi
