#!/bin/bash
# This script reports the aggregated usage
#total_usage=`sudo df -h | grep /var/lib/ceph/osd/ | awk '{print $3}'| sed 's/T//' | awk '{ sum += $1} END {print sum}'`
#total_usage=`sudo df -BG | grep /var/lib/ceph/osd/ | awk '{print $3}'| sed 's/G//' | awk '{ sum += $1} END {print sum}'`
total_usage=`sudo df -B1| grep /var/lib/ceph/osd/ | awk '{print $3}' | awk '{ sum += $1} END {print sum}'`
echo $total_usage
