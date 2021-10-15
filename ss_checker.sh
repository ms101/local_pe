#!/bin/bash
# continuously ceck output of ss (network connections)

while :
do
        ss -Haptun >> ss_complete       # no timestamp atm...
        < ss_complete sort -k6 -u > ss_unique_egress
        < ss_complete sort -k5 -u > ss_unique_ingress
        sleep 10
done
