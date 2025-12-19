#!/bin/sh

## Git and GitHub CLI
sudo dnf -y install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo wget https://cli.github.com/packages/rpm/gh-cli.repo -O /etc/yum.repos.d/gh-cli.repo
sudo dnf -y install gh --repo gh-cli
sudo dnf -y install lazygit colordiff

# Packaging
sudo dnf -y install task-devel task-c-devel task-c++-devel clang llvm lrzip rpm-build packaging-tools

# Python
sudo dnf -y install python-ensurepip python-virtualenv

# Pascal
sudo dnf -y install lazarus

## Java Environment
sudo dnf -y install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -y install zulu21-jdk
sudo alternatives --install /usr/lib/jvm/jdk jdk /usr/lib/jvm/java-21-zulu-openjdk-ca 1
sudo dnf -y install ant gradle

# Virtual Machines
sudo dnf install virt-manager qemu-img iptables

# Containers
sudo dnf -y install docker docker-cli docker-compose containerd lazydocker
sudo systemctl enable docker
sudo usermod -a -G docker $USER
# sudo dnf -y install podman podman-compose crun passt

# Ruby
sudo dnf -y install ruby
sudo dnf -y install rbenv

# Node
sudo dnf -y install nodejs
mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

flatpak -y install com.github.Murmele.Gittyup squirrel_sql