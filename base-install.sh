#!/bin/bash

apt update

apt install -y ca-certificates apt-transport-https mc htop gnupg

echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list && wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg


#Install MongoDB
curl -fsSL https://pgp.mongodb.com/server-4.4.asc | gpg -o /usr/share/keyrings/mongodb-server-4.4.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-4.4.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

apt update

LIBSSL=libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb

wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/${LIBSSL} -P /tmp || {
  echo "You must change link for a file at http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0"
  exit 1
}

apt install -y /tmp/${LIBSSL} &&
rm /tmp/${LIBSSL}

apt install -y openjdk-17-jre-headless && apt install -y mongodb-org unifi
