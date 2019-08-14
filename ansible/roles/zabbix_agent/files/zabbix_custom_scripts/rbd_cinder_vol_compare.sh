#!/bin/bash
# Script to compare number of ceph rbd's to cinder's inventory. Use with Zabbix.
# Status 0 = No discrepencies, Status 1 = Discrepencies, please investigate
# Jared Baker 2016/10/17
set -x
rm /tmp/rbdcindervolcompare
source /root/openrc-admin
openstack volume list --all -f value | awk '{print $1}' >> /tmp/rbdcindervolcompare
rbd -p volumes ls | sed "s/volume-//" >> /tmp/rbdcindervolcompare
sort /tmp/rbdcindervolcompare | uniq -u
var=`sort /tmp/rbdcindervolcompare | uniq -u`
if [ -z "$var" ];
then echo 0
else echo 1
fi
