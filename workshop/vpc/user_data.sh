#!/bin/bash
set -e

# Log output for debugging
exec > /var/log/user-data.log 2>&1

echo "===== Updating system ====="
sudo apt update -y

echo "===== Installing prerequisites ====="
sudo apt install -y wget curl gnupg ca-certificates apt-transport-https

echo "===== Installing Java 21 ====="
sudo apt install -y openjdk-21-jdk

echo "===== Creating keyrings directory ====="
sudo mkdir -p /etc/apt/keyrings

echo "===== Adding Jenkins repository key ====="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | sudo tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null

echo "===== Adding Jenkins repository ====="
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "===== Installing Jenkins ====="
sudo apt update -y
sudo apt install -y jenkins

echo "===== Enabling & starting Jenkins ====="
sudo systemctl daemon-reexec
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "===== Jenkins installation completed ====="
