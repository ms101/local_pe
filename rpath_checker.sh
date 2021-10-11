#!/bin/bash
# check for occurences of ".." or "." in RPATH and RUNPATH of all binaries executable (by user)

find / -type f -and -executable -not -path "/proc" 2>/dev/null | xargs -I% readelf -W -d "%" 2>/dev/null | grep path | grep "\."
# s/-executable/-readable/
