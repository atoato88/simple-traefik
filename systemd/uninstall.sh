#!/bin/bash

sudo systemctl stop traefik.service
sudo systemctl disable traefik.service
sudo rm /usr/bin/traefik
sudo rm -rf /etc/traefik
sudo rm -f /etc/systemd/system/traefik.service

