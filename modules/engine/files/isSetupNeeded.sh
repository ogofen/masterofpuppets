#!/bin/zsh
FLAG=`cat /root/setupflag 2>/dev/null`
if [ ! $FLAG ]; then
    echo not initiating  setup
    exit 1
fi
echo initiating setup
exit 0
