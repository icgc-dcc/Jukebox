#!/bin/bash
source /etc/zabbix/openrc-admin
fail=0
res=1
host=`hostname`
for i in `ip netns|grep qrouter | sed 's/qrouter-//'` ;
        do var=`neutron l3-agent-list-hosting-router $i 2> /dev/null | grep -i ${host} | grep -c active` ;\
        if [ $var -eq 1 ]
        then res=`/usr/local/sbin/sudo_shim_meta qrouter-${i}`

        fi;
        if [ $res -eq 0 ]
        then fail=$(( fail + 1 ))
        fi ;\
done
echo $fail
