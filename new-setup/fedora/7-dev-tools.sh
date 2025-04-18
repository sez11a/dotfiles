#!/bin/sh 

sudo dnf -qy install lazarus nodejs nodejs-npm docker-cli docker-compose gitui yarnpkg
sudo dnf -qy install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo wget https://cli.github.com/packages/rpm/gh-cli.repo -O /etc/yum.repos.d/gh-cli.repo
sudo dnf -qy install gh --repo gh-cli

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

