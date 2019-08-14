#!/bin/bash
# set -x
var=`sudo /usr/sbin/smartctl -a $1 |grep "Elements in grown defect list"|awk '{print$6}'`
echo -n $var
