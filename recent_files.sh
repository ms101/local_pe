#!/bin/bash
path="$1"
[ $# -eq 0 ] && path=.

find "$path" -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head -n100
