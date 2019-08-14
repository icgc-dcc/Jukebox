#!/bin/bash
# Check for unexpected read-only filesystems
grep -v iso9660 /proc/mounts | grep -v tmpfs | grep -v snap | awk '{ print $4 }'| awk -F"," '{print $1}' | grep -v errors | grep -c ro
