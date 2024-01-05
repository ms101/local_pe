# Local Privilege Escalation (LPE) helper scripts for Linux

## Continuous Analysis
start them with detached screen session via **automate_it.sh**

| script | description |
| --- | --- |
| **w_checker.sh** | log connected users |
| **ps_checker.sh** | log running processes |
| **netstat_checker.sh/ss_checker.sh** | log open connections |

## One-time Analysis
| script | description |
| --- | --- |
| **suid_checker.sh** | search for suid/sgid files/dirs |
| **rpath_checker.sh** | search for executables with vulnerable RPATHs (requires readelf) |
| **lib_checker.sh** | check list of executables for missing (writable) libraries |
