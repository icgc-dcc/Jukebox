#!/bin/bash
# set -x
var=`sudo /usr/sbin/smartctl -d megaraid,$2 -a $1 | egrep "Media_Wearout_Indicator|Percent lifetime remaining" | awk '{print $4}'`
echo -n $var
