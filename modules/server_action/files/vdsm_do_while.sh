#!/bin/bash
cat /var/log/vdsm/vdsm.log | ack --passthru --color  " [a-z][a-z]{2,6}[A-Z][a-zA-Z]{2,15}|\(spUUI.*\)" --color-match="bold blue"|ack --passthru --color  "ERROR|Traceback" --color-match="bold red"|ack --passthru --color  "DEBUG|INFO" --color-match="bold white"|ack --passthru --color  "[A-Z][a-z]{2,11}\.[A-Z][a-zA-Z]{2,15}|/.Owner" --color-match="bold cyan"|ack --passthru --color  "\[[0-9a-z]{6,12}\]" --color-match="bold magenta"|ack --passthru --color  "2014.{15}|Thread.{3,4}|Dummy.{3,5}" --color-match="bold yellow">/root/fa
sudo cp --force /root/fa /root/fa_tmp
sleep 1
A=some
LOG=/var/log/vdsm/vdsm.log
while [ "$A" ]
do
  TMP_LOG=/root/fa_tmp
  if [ "$LOG" -nt "$TMP_LOG" ]; then
  A=`ps aux | grep "less -R -g /root/fa" | grep -v grep`
  cat /var/log/vdsm/vdsm.log | ack --passthru --color  " [a-z][a-z]{2,6}[A-Z][a-zA-Z]{2,15}|\(spUUI.*\)" --color-match="bold blue"|ack --passthru --color  "ERROR|Traceback" --color-match="bold red"|ack --passthru --color  "DEBUG|INFO" --color-match="bold white"|ack --passthru --color  "[A-Z][a-z]{2,11}\.[A-Z][a-zA-Z]{2,15}|/.Owner" --color-match="bold cyan"|ack --passthru --color  "\[[0-9a-z]{6,12}\]" --color-match="bold magenta"|ack --passthru --color  "2014.{15}|Thread.{3,4}|Dummy.{3,5}" --color-match="bold yellow">/root/fa
  sudo cp --force /root/fa /root/fa_tmp
else
  A=`ps aux | grep "less -R -g /root/fa" | grep -v grep`
fi
sleep 1
done

