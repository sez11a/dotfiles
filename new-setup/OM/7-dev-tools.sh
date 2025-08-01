#!/bin/sh

sudo dnf -y install task-devel task-c-devel task-c++-devel clang llvm lrzip
sudo dnf -y install lazarus nodejs lazygit podman podman-compose crun passt colordiff
sudo dnf -y install ant gradle
sudo dnf -y ruby
sudo dnf -y install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo wget https://cli.github.com/packages/rpm/gh-cli.repo -O /etc/yum.repos.d/gh-cli.repo
sudo dnf -y install gh --repo gh-cli

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

flatpak -y install Gittyup squirrel_sql PodmanDesktop