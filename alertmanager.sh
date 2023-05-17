#! /bin/bash

sudo useradd -M -U alertmanager

wget https://github.com/prometheus/alertmanager/releases/download/v$1/alertmanager-$1.linux-amd64.tar.gz
tar -xzf alertmanager-$1.linux-amd64.tar.gz
sudo mv alertmanager-$1.linux-amd64/alertmanager /usr/local/bin
sudo mv alertmanager-$1.linux-amd64/amtool /usr/local/bin
sudo mkdir /etc/alertmanager
sudo mv alertmanager-$1.linux-amd64/alertmanager.yml /etc/alertmanager
sudo chown alertmanager:alertmanager -R /etc/alertmanager

sudo cp alertmanager.service /etc/systemd/system/alertmanager.service
sudo systemctl daemon-reload
sudo systemctl start alertmanager.service
sudo systemctl enable alertmanager.service

rm -rf alertmanager-$1.linux-amd64
rm alertmanager-$1.linux-amd64.tar.gz
