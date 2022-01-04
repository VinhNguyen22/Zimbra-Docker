#!/bin/sh
## Preparing all the variables like IP, Hostname, etc, all of them from the container
sleep 5
HOSTNAME=$(hostname -a)
DOMAIN=$(hostname -f)
CONTAINERIP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
RANDOMHAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMSPAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMVIRUS=$(date +%s|sha256sum|base64|head -c 10)

cat <<EOF >>/etc/resolv.conf
nameserver=172.29.139.30
EOF




if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
