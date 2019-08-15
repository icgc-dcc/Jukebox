#!/bin/bash
# This script checks if there are any 4 or 6 TB drives with a status different than READY
#var1=`sudo /etc/zabbix/sas3ircu 0 DISPLAY | grep -B1 3815447 | grep State | egrep -v Ready| wc -l`
#var2=`sudo /etc/zabbix/sas3ircu 0 DISPLAY | grep -B1 5723166 | grep State | egrep -v Ready| wc -l`
#var3=`sudo /etc/zabbix/sas3ircu 0 DISPLAY | grep -B1 3815447 | grep State | egrep -v Ready| wc -l`
#var3=$((var1 + var2))
#echo $var3
# New revision below, not hard coded to any drive sizes.
sudo /etc/zabbix/sas3ircu 0 DISPLAY | grep -A4 "Device is a Hard disk" | grep -i state | grep -c Ready
