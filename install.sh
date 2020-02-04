#!/bin/bash

set -e
if [ -e /etc/environment ]; then
	source /etc/environment
fi
cd "$HOME/.dotfiles"

shopt -s nullglob
set -x

for script in */preinstall.sh
do
	$script
done

dotfiles.sh patch
if [ "$(uname)" == "Darwin" ]; then
	dotfiles.sh link
else
	dotfiles.sh link --force-file --relative
fi

for script in */postinstall.sh
do
	$script
done
