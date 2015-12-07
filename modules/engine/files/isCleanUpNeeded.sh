#!/bin/zsh
FLAG=`cat /root/cleanflag 2>/dev/null`
if [ ! $FLAG ]; then
    echo not initiating clean
    exit 1
fi
echo initiating clean
exit 0
