#!/usr/bin/python

import json
import subprocess

if __name__ == '__main__':
#    process = subprocess.Popen("cat /proc/diskstats | awk '{print $3}' | grep -v 'ram\|loop\|sr'", shell=True, stdout=subprocess.PIPE)
    process = subprocess.Popen("sudo megacli -pdlist -aall -nolog | egrep 'DiskGroup|Device Id'", shell=True, stdout=subprocess.PIPE)
    output = process.communicate()[0]
    data = list()
    for line in output.split("\n"):
        if "DiskGroup" in line:
            devicenum = int(line.split()[3].replace(",", ""))
            if devicenum == 0:
                device = "/dev/sda"
            if devicenum == 1:
                device = "/dev/sdb"
            if devicenum == 2:
                device = "/dev/sdc"
        if "Device Id" in line:
            data.append({"{#DEVICEID}": line.split()[2], "{#DEVICE}": device})

    print(json.dumps({"data": data}, indent=4))
