#!/bin/bash
# read list with binaries and check their dependencies for vulns
# "Note that it is not recommended to run ldd with any untrusted third-party executable because some versions of ldd may directly invoke the executable to identify its library dependencies, which can be security risk."
# better: objdump -p /path/to/program | grep NEEDED

if [ $# -lt 1 ]; then
	echo "[!] no parameter given (path to file with list of binaries), exiting"
	exit 1
else
	list=$(<"$1")
fi

# check executables for their libs via ldd
for bin in $list; do
	echo "[*] $bin"
	ldd=$(ldd "$bin" | grep -E "\/|not found")
	echo "$ldd"
	echo

	# lib not found?
	echo "$ldd" | grep "not found" | awk '{print $3}' | xargs -I% echo -e "\t[!] not found: %"

	# check if a lib is writable
	libs=$(echo "$ldd" | grep -v "not found" | awk '{print $3}')
	for lib in $libs; do
		test -w "$lib" && echo -e "\t[!] writable: $lib"
		
		# check for $ORIGIN and ".."  in RPATH/RUNPATH
		if which readelf >/dev/null; then
			readelf -d "$lib" | grep PATH | grep -E "ORIGIN|.."
		fi
	done
done


