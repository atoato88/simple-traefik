#!/bin/bash

curl -L -O https://github.com/containous/traefik/releases/download/v1.7.3/traefik
sudo mv ./traefik /usr/bin
sudo chmod +x /usr/bin/traefik
sudo chown root:root /usr/bin/traefik

curl -L -O https://raw.githubusercontent.com/containous/traefik/master/traefik.sample.toml
sudo mkdir -p /etc/traefik/
sudo mv ./traefik.sample.toml /etc/traefik/traefik.toml
sudo chown root:root /etc/traefik/traefik.toml

curl -L -O https://raw.githubusercontent.com/containous/traefik/master/contrib/systemd/traefik.service
sed -i -e "s/etc/etc\\/traefik/g" ./traefik.service
sudo mv ./traefik.service /etc/systemd/system
sudo chmod 644 /etc/systemd/system/traefik.service
sudo systemctl enable traefik.service
sudo systemctl start traefik.service

echo "Finish install."
echo "For remove all files, run commands following."
echo "sudo systemctl stop traefik.service"
echo "sudo systemctl disable traefik.service"
echo "sudo rm /usr/bin/traefik"
echo "sudo rm -rf /etc/traefik"
echo "sudo rm -f /etc/systemd/system/traefik.service"
