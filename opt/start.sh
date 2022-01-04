#!/bin/sh
## Preparing all the variables like IP, Hostname, etc, all of them from the container
sleep 5
HOSTNAME=$(hostname -a)
DOMAIN=$(hostname -d)
CONTAINERIP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
RANDOMHAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMSPAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMVIRUS=$(date +%s|sha256sum|base64|head -c 10)

##Install the Zimbra Collaboration ##

echo "Downloading Zimbra Collaboration 8.8.15"
wget -O /opt/zimbra-install/zimbra-zcs-8.8.15.tar.gz https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_3869.UBUNTU18_64.20190918004220.tgz

echo "Extracting files from the archive"
tar xzvf /opt/zimbra-install/zimbra-zcs-8.8.15.tar.gz -C /opt/zimbra-install/

echo "Update package cache"
apt update
echo "Installing Zimbra Collaboration just the Software"
cd /opt/zimbra-install/zcs-* && ./install.sh -s < /opt/zimbra-install/installZimbra-keystrokes
echo "Installing Zimbra Collaboration injecting the configuration"
/opt/zimbra/libexec/zmsetup.pl -c /opt/zimbra-install/installZimbraScript
su - zimbra -c 'zmcontrol restart'
echo "You can access now to your Zimbra Collaboration Server"
if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi
if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
