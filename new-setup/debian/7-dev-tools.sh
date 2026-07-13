#!/bin/sh

## GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# Lazygit
sudo apt install -y lazygit

# Packaging
sudo apt install -y build-essential
sudo apt update && \
  sudo apt dist-upgrade -y && \
  sudo apt install -y \
    autopkgtest \
    dh-make \
    git-buildpackage \
    pastebinit \
    ubuntu-dev-tools && \
  sudo snap install lxd && \
  sudo snap install --classic snapcraft && \
  sudo snap install --classic git-ubuntu

# Python
sudo apt install -y python3-full

# Pascal
sudo apt install -y lazarus

## Java Environment
sudo apt install -y openjdk-21-jdk
sudo apt install -y ant gradle

# Virtual Machines
sudo apt install -y virt-manager qemu-system-modules-spice-hwe firewalld

# Containers
sudo apt install -y docker.io
sudo systemctl enable docker
sudo usermod -a -G docker $USER
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Ruby
sudo apt install -y ruby rbenv

# Node
sudo apt install -y nodejs
mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

sudo snap install squirrelsql