#!/usr/bin/env bash

DOTFILES=$HOME/.mydotfiles

echo -e "\\nCreating symlinks"
echo "=============================="

ln -s .mydotfiles/tm.sh tm.sh
ln -s .mydotfiles/z.sh z.sh
ln -s .mydotfiles/tm.sh tm.sh
ln -s .mydotfiles/.vimrc .vimrc
ln -s .mydotfiles/.tmux.conf .tmux.conf
ln -s .mydotfiles/.skhdrc .skhdrc
ln -s .mydotfiles/.juliarc.jl .juliarc.jl
ln -s .mydotfiles/.iterm2_shell_integration.bash .iterm2_shell_integration.bash
ln -s .mydotfiles/.condarc .condarc
ln -s .mydotfiles/.chunkwmrc .chunkwmrc
ln -s .mydotfiles/.bash_profile .bash_profile
ln -s .mydotfiles/.bash_aliases .bash_aliases

