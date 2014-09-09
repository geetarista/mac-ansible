#!/bin/bash
#
# Upgrade dependencies.
set -e

echo "==> Upgrading homebrew..."
brew upgrade

echo "==> Upgrading ansible..."
sudo pip install -U ansible
