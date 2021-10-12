#!/bin/bash
# check for occurences of ".." or "." in RPATH and RUNPATH of all binaries executable (by user)

#find / -type f -and -executable ! -path "/proc" 2>/dev/null | xargs -I% readelf -W -d "%" 2>/dev/null | grep path | grep "\."
find / -type f -and -executable ! -path "/proc/*" ! -path "/.xy/*" 2>/dev/null | xargs -I% sh -c 'readelf -W -d "%" 2>/dev/null | grep path | grep -E "\.:|:\.|\.\." && echo "%"' | tee rpath_complete
# s/-executable/-readable/
