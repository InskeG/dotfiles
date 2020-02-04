#!/usr/bin/env bash

set -e
set -x

vim +PlugInstall +qall


if type code >/dev/null; then
	# Install VS Code extensions listed in extensions.list that are missing from `code --list-extensions`
	comm -13 <(code --list-extensions|sort) <(grep -v -E '^#' $(dirname $BASH_SOURCE)/src/.vscode/extensions.list | sort) | gxargs --no-run-if-empty --max-lines=1 -- code --install-extension

	ln -f -s ../../../../.vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
fi