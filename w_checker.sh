#!/bin/bash
# continuos analysis of w

while :
do
	w -osh >> w_complete
	< w_complete sort -u > w_unique #TODO -k6?
	sleep 10
done
