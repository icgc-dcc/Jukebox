#!/bin/bash

file="/etc/zabbix/check_api.conf"
export OS_USERNAME="`grep user $file | awk -F "=" '{ print $2 }'`"
export OS_PASSWORD="`grep password $file | awk -F "=" '{ print $2 }'`"
export OS_TENANT_NAME="`grep user $file | awk -F "=" '{ print $2 }' | grep -v tenant`"
export OS_AUTH_URL="https://console.cancercollaboratory.org:5000/v2.0/"

neutron router-list | grep network_id | wc -l
