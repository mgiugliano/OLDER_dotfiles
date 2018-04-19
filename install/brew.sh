#!/usr/bin/env bash

if test ! "$( which brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    git
    'grep --with-default-names'
    #markdown
    node
    python
    tmux
    tree
    wget
    vim
    mas
    chunkwm
    colordiff
    fortune
    htop
	parallel
    ffmpeg
    imagemagick
    irssi
    mpv
    node
    openssl
    python3
    skhd
    trash
    tree
    vim
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

