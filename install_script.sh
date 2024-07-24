#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y net-tools lsof docker.io python3-pip
pip3 install tabulate

# Create systemd service file
sudo tee /etc/systemd/system/devopsfetch.service <<EOF
[Unit]
Description=DevOps Fetch Monitoring Service

[Service]
ExecStart=/usr/bin/python3 /home/rexbrown21/devopsfetch/devopsfetch.py -p
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the service
sudo systemctl daemon-reload
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

echo "Installation complete. DevOps Fetch is now running as a service."
