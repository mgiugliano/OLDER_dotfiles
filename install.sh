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

#echo "creating vim directories"
#mkdir -p ~/.vim-tmp

echo "Done. Reload your terminal."
