#!/usr/bin/env bash

echo -e "\\n\\Install Pathogen..."
echo "==========================="

# Install Pathogen (https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle
mkdir -p ~/.vim/bundle/vim/colors
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo " Remember to add to .vimrc:   execute pathogen#infect()"

echo -e "\\n\\Install each plugin..."
echo "=============================="
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/ntpeters/vim-better-whitespace.git
git clone https://github.com/Raimondi/delimitMate
git clone https://github.com/Yggdroot/indentLine
git clone https://github.com/sheerun/vim-polyglot
#git clone https://github.com/ervandew/screen #<------- UNINSTALLED 
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/tpope/vim-repeat
git clone https://github.com/svermeulen/vim-easyclip
git clone https://github.com/ervandew/supertab
git clone https://github.com/junegunn/goyo.vim
git clone https://github.com/vimwiki/vimwiki.git
git clone https://github.com/vim-pandoc/vim-pandoc-syntax

wget https://github.com/dracula/vim/tree/master/colors/dracula.vim -O ~/.vim/bundle/vim/colors/dracula.vim
cp pencil.vim ~/.vim/bundle/vim/colors/pencil.vim
#wget https://github.com/reedes/vim-colors-pencil/tree/master/colors/pencil.vim -O ~/.vim/bundle/vim/colors/pencil.vim

sudo npm -g install instant-markdown-d
wget https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim -P after/ftplugin/markdown

