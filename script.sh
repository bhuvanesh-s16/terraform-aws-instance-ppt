#!/bin/bash
set -x



# Install necessary dependencies
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get update
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates



# Setup sudo to allow no-password sudo for "hashicorp" group and adding "terraform" user
sudo groupadd -r hashicorp
sudo useradd -m -s /bin/bash harry_potter
sudo usermod -a -G hashicorp harry_potter
sudo cp /etc/sudoers /etc/sudoers.orig
echo "harry_potter  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/harry_potter



# Installing SSH key
sudo mkdir -p /home/harry_potter/.ssh
sudo chmod 700 /home/harry_potter/.ssh
sudo cp /tmp/tf-packer.pub /home/harry_potter/.ssh/authorized_keys
sudo chmod 600 /home/harry_potter/.ssh/authorized_keys
sudo chown -R terraform /home/harry_potter/.ssh
sudo usermod --shell /bin/bash harry_potter
