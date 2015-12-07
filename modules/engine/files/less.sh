#!/bin/bash
/root/do_while.sh &
export LESS_TERMCAP_so=$'\E[01;33;03;44m'
if [ ! -f /root/fa_tmp ]
then
  sleep 8
fi
less -R -g /root/fa_tmp
export LESS_TERMCAP_so=
