#!/bin/bash
#set -x
mysql -u root -p{{ mysql_root_pass }} -e "show status like 'wsrep_cluster_size';"| grep size | awk '{print $2}'
