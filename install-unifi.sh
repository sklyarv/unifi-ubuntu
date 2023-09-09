#!/bin/bash

FQDN=$1
EMAIL=$2

#Update packages list
apt update
#Install required packages
apt install -y ca-certificates apt-transport-https mc htop gnupg
#Add a new source list
echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
#Add the GPG Keys
wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg



#Install need packages and unifi server
wget https://get.glennr.nl/unifi/install/unifi-7.5.174.sh
bash unifi-7.5.174.sh --skip --fqdn ${FQDN} --email ${EMAIL}

#Install Let's Encrypt certificate
wget https://get.glennr.nl/unifi/extra/unifi-easy-encrypt.sh
bash unifi-easy-encrypt.sh --skip --fqdn ${FQDN} --email ${EMAIL}