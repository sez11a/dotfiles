#!/bin/sh

sudo dnf -y install task-devel task-c-devel task-c++-devel clang llvm lrzip rpm-build packaging-tools
sudo dnf -y install python-ensurepip python-virtualenv
sudo dnf -y install lazarus nodejs lazygit

## Java Environment
sudo dnf -y install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -y install zulu21-jdk
sudo alternatives --install /usr/lib/jvm/jdk jdk /usr/lib/jvm/java-21-zulu-openjdk-ca 1

sudo dnf -y install podman podman-compose crun passt colordiff
sudo dnf -y install ant gradle
sudo dnf -y install ruby

## GitHub CLI
sudo dnf -y install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo wget https://cli.github.com/packages/rpm/gh-cli.repo -O /etc/yum.repos.d/gh-cli.repo
sudo dnf -y install gh --repo gh-cli

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

flatpak -y install Gittyup squirrel_sql PodmanDesktop