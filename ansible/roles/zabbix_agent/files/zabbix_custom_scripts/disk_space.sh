#!/bin/bash
DEV=$1

free_space=`sudo df -h | grep "$DEV"| awk '{print $5}' | sed 's/%//'`
echo $free_space
