#!/bin/bash
# test if parameter is given (path), else choose root (/)
path=$(test $# -lt 1 && echo "/" || echo "$1")
#clear

echo "[*] current uid/gid:"
id
echo

# 1. get a list of files with suid that are executable
echo -n "[*] checking for SUID files..."
sfiles=$(find $path -perm /4000 -not -path "/proc/" 2>/dev/null)

echo -en "\r"
echo "[*] executable SUID files:       "

# check if executable and print
while IFS= read -r line; do
	if [ -x "$line" ]; then
		ls -l "$line";
	fi
done <<< "$sfiles"
echo 

# 2. get a list of files with guid that are executbale
echo -n "[*] checking for GUID files..."
gfiles=$(find $path -perm /2000 -type f -and -not -path "/proc/" 2>/dev/null)

echo -en "\r"
echo "[*] executable GUID files:       "

# check if executable and print
while IFS= read -r line; do
	if [ -x "$line" ]; then
		ls -l "$line";
	fi
done <<< "$gfiles"
echo

# 3. get GUID directories that are writabel
echo -n "[*] checking for GUID directories..."
gdirs=$(find $path -perm /2000 -type d -and -not -path "/proc/" 2>/dev/null)

echo -en "\r"
echo "[*] writable GUID directories:       "

# check if writable and print
while IFS= read -r line; do
	if [ -w "$line" ]; then
		ls -ld "$line";
	fi
done <<< "$gdirs"


