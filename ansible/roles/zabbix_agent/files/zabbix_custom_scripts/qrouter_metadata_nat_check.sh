#!/bin/bash
fail=0
for i in `ip netns | awk '/qrouter/{ print $1 }'` ; do res=`/usr/local/sbin/sudo_shim $i`;\
if [ $res -ne 1 ]
	then fail=$(( fail + 1 ))
fi;\
done
echo $fail
