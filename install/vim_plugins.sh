#!/usr/bin/env bash

echo -e "\\n\\Installing Vim's plugins and accessories"

# Download plug.vim and put it in ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the dictionaries for spell checking
mkdir -p ~/.vim/spell
cp install/spell/* ~/.vim/spell

curl -LSso ~/.vim/words.txt https://raw.githubusercontent.com/words/moby/master/words.txt

sudo npm -g install instant-markdown-d
wget https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim -P after/ftplugin/markdown

vim +PlugInstall
