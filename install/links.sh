#!/usr/bin/env bash

DOTFILES=$HOME/.mydotfiles

echo -e "\\nCreating symlinks"
echo "=============================="

ln -s $DOTFILES/tm.sh tm.sh
ln -s $DOTFILES/z.sh z.sh
ln -s $DOTFILES/tm.sh tm.sh
ln -s $DOTFILES/.vimrc .vimrc
ln -s $DOTFILES/.tmux.conf .tmux.conf
ln -s $DOTFILES/.skhdrc .skhdrc
ln -s $DOTFILES/.juliarc.jl .juliarc.jl
ln -s $DOTFILES/.iterm2_shell_integration.bash .iterm2_shell_integration.bash
ln -s $DOTFILES/.condarc .condarc
ln -s $DOTFILES/.chunkwmrc .chunkwmrc
ln -s $DOTFILES/.bash_profile .bash_profile
ln -s $DOTFILES/.bash_aliases .bash_aliases
ln -s $DOTFILES/.condarc .condarc
ln -s $DOTFILES/.gitconfig .gitconfig
ln -s $DOTFILES/.inputrc .inputrc
ln -s $DOTFILES/.git-completion.bash .git-completion.bash

echo "iTerm2 must be pointed to search the config at $DOTFILES"
