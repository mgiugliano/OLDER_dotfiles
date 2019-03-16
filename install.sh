#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

source install/link.sh
source install/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on OSX"

    source install/brew.sh
    source install/osx.sh
fi

source install/vim_plugins.sh
source install/tmux_plugins.sh
source install/utils.sh

echo "Done. Reload your terminal."
