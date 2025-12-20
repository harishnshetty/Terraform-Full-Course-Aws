#!/bin/bash
set -e

# Log output for debugging
exec > /var/log/user-data.log 2>&1

echo "===== Updating system ====="
sudo apt update -y

echo "===== Installing prerequisites ====="
sudo apt install -y nginx


echo "===== Starting and enabling nginx ====="
sudo systemctl daemon-reexec
sudo systemctl start nginx
sudo systemctl enable nginx