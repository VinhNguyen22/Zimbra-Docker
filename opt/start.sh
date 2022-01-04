#!/bin/sh
## Preparing all the variables like IP, Hostname, etc, all of them from the container

su - zimbra -c 'zmcontrol restart'
echo "You can access now to your Zimbra Collaboration Server"

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
