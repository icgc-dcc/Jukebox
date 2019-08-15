#!/bin/bash
rm -f /tmp/qrouter_initial
rm -f /tmp/qrouter_final
source /etc/zabbix/openrc-admin_v3
openstack router list -c Name -c ID -f json | sed 's/ID/{#ROUTERID}/g' | sed 's/Name/{#ROUTERNAME}/g' > /tmp/qrouter_initial
cat << EOF > /tmp/qrouter_final
{
    "data":

EOF

cat /tmp/qrouter_initial >> /tmp/qrouter_final
echo "}" >> /tmp/qrouter_final

cat /tmp/qrouter_final
