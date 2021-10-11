#!/bin/bash
# collects ps output: complete and unified regarding args
# can help detecting cronjobs without special rights

while :
do
    ps hkargs -eo pid,user,lstart,etime,args | grep -vE "\[|other_uninteresting_stuff" | cut -c 1-150 >> ps_complete
    sort -k9 -u ps_complete > ps_unique
    sleep 10
done
