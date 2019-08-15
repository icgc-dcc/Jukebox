#!/bin/bash
#set -x

mem_kb=`ps aux | grep "$1" | egrep -v grep | awk '{ sum+=$6} END {print sum}'`
#mem=`echo $mem_kb/1024|bc`
mem=`echo $mem_kb*1024|bc`

if [ -z $mem ]
	then echo 0
	else echo "$mem"
fi
