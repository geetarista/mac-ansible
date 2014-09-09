#!/bin/bash
#
# Install dependencies.
set -e

SETUP_INIT="${HOME}/.setup_init"

if [ -f "${SETUP_INIT}" ]; then exit 0; fi

echo "==> Installing dependencies..."

if [ ! `which brew` ]; then
	echo "==>   Installing homebrew..."
    ruby -e "curl -fssl https://raw.github.com/homebrew/homebrew/go/install"
fi

if [ ! `which pip` ]; then
	echo "==>   Installing pip..."
    sudo easy_install pip
fi

if [ ! `which ansible` ]; then
	echo "==>   Installing ansible..."
    sudo pip install ansible
fi

touch $SETUP_INIT
