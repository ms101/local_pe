#!/bin/bash
# automate shit (w+ps)

if [ ! $(which screen 2>/dev/null) ]
then
        echo "[!] screen not found, call them directory. Exiting"
        exit
fi

screen -dmS observe

# start checking w
screen -S observe -p 0 -X stuff './w_checker.sh\n' && echo "[*] w_checker started"

# start checking ps
screen -S observe -p 0 -X stuff './ps_checker.sh\n' && echo "[*] ps_checker started"

echo "[*] attach to screen with 'screen -r'"
