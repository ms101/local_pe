#!/bin/bash
# connection statistics via netstat
# optional: include listening with -a

while :
do
        netstat -tunWeep >> netstat_complete
        sort -k5 -u netstat_complete > netstat_unique_egress
        sort -k4 -u netstat_complete > netstat_unique_ingress
        sleep 10
done
