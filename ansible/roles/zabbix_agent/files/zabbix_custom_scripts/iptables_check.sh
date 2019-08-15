#!/bin/bash

rules=`sudo iptables -L -nv | grep -c neutron-openvswi-sg-chain`

if [ $rules -ge 1 ]
	then echo 0
	else echo 1
fi
