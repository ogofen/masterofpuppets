#!/bin/bash
if [ ! -f /root/fa_tmp ]
then
cat /var/log/ovirt-engine/engine.log |ack --passthru --color "INFO" --color-match="bold white"|ack --passthru --color " ERROR |[A-Z][a-z]{3,8}Exception|Command [A-Z][a-zA-Z]{5,15}Command" --color-match="bold red"|ack --passthru --color "\[org.[a-z\.]{22,50}|START|FINISH" --color-match="bold green"|ack --passthru --color "^201.{16}|WARN" --color-match="bold yellow"|ack --passthru --color "[A-Z][a-zA-Z]{8,40}\]|, [A-Z][a-zA-Z]{8,40}Command" --color-match="bold cyan"|ack --passthru --color "storagePoolId = [a-zA-z0-9,-/.= ]{100,241}|HostName = [a-zA-z0-9,-/.=\[\]\{\}/;: ]{70,250}" --color-match="bold blue"|ack --passthru --color "\[[0-9a-z]{6,12}\]" --color-match="bold magenta">/root/fa
sudo cp --force /root/fa /root/fa_tmp
fi
sleep 1
A=some
LOG=/var/log/ovirt-engine/engine.log
while [ "$A" ]
do
  TMP_LOG=/root/fa_tmp
  if [ "$LOG" -nt "$TMP_LOG" ]; then
  A=`ps aux | grep "less -R -g /root/fa" | grep -v grep`
  cat /var/log/ovirt-engine/engine.log |ack --passthru --color "INFO" --color-match="bold white"|ack --passthru --color " ERROR |[A-Z][a-z]{3,8}Exception|Command [A-Z][a-zA-Z]{5,15}Command" --color-match="bold red"|ack --passthru --color "\[org.[a-z\.]{22,50}|START|FINISH" --color-match="bold green"|ack --passthru --color "^201.{16}|WARN" --color-match="bold yellow"|ack --passthru --color "[A-Z][a-zA-Z]{8,40}\]|, [A-Z][a-zA-Z]{8,40}Command" --color-match="bold cyan"|ack --passthru --color "storagePoolId = [a-zA-z0-9,-/.= ]{100,241}|HostName = [a-zA-z0-9,-/.=\[\]\{\}/;: ]{70,250}" --color-match="bold blue"|ack --passthru --color "\[[0-9a-z]{6,12}\]" --color-match="bold magenta">/root/fa
  sudo cp --force /root/fa /root/fa_tmp
else
  A=`ps aux | grep "less -R -g /root/fa" | grep -v grep`
fi
sleep 1
done

