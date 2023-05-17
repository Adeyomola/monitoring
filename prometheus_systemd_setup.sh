#! /bin/bash

sudo useradd -M -U prometheus

wget https://github.com/prometheus/prometheus/releases/download/v$1/prometheus-$1.linux-amd64.tar.gz
tar -xzvf prometheus-$1.linux-amd64.tar.gz
sudo mv prometheus-$1.linux-amd64/prometheus /usr/local/bin
sudo mv prometheus-$1.linux-amd64/promtool /usr/local/bin
sudo mkdir /etc/prometheus
sudo mv prometheus-$1.linux-amd64/prometheus.yml /etc/prometheus
sudo chown prometheus:prometheus -R /etc/prometheus

sudo cp prometheus.service /etc/systemd/system/prometheus.service
sudo systemctl daemon-reload
sudo systemctl start prometheus.service
sudo systemctl enable prometheus.service

rm -rf prometheus-$1.linux-amd64
rm prometheus-$1.linux-amd64.tar.gz
