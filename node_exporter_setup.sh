#! /bin/bash
sudo useradd -M -U node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v$1/node_exporter-$1.linux-amd64.tar.gz
tar -xzvf node_exporter-$1.linux-amd64.tar.gz
sudo mv node_exporter-$1.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

sudo cp node_exporter.service /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter.service
sudo systemctl enable node_exporter.service

rm -rf node_exporter-$1.linux-amd64/
rm node_exporter-$1.linux-amd64.tar.gz
