#!/bin/bash
# if mysql is dead in this node, then other node will bind the IP.
client_conf=/root/scripts/mysql_conf/client_conf.cnf

mysql --defaults-extra-file=${client_conf} --connect_timeout=3 -e "select version();"

if [ $? -ne 0 ]; then
 echo "bad"
 exit 2      # mysql node is bad
fi
echo "good"
exit 0       # mysql node is good
