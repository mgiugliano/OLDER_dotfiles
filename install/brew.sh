#!/usr/bin/env bash

echo "It is advisable first to remove Anaconda from the PATH and then install brew..."
read -p "Press ENTER to continue" -n 1 -r

if test ! "$( which brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "========================================"

formulas=(
    caskformula/caskformula/xquartz 
    caskformula/caskformula/inkscape
    caskroom/cask/gimp
	caskroom/cask/xquartz
    csvkit
    jq
    pandoc-crossref 
	pandoc-citeproc
    pandoc
    reattach-to-user-namespace
	git
    'grep --with-default-names'
    #markdown
    node
    python
    python@2
    tmux
    tree
    wget
    vim
    mas
    crisidev/homebrew-chunkwm/chunkwm
    colordiff
    fortune
    htop
	parallel
    ffmpeg
    imagemagick
    'weechat --with-perl --with-python@2' 
	#irssi
    mpv
    node
    openssl
    python3
    koekeishiya/formulae/skhd 
    trash
    tree
    vim
	#neomutt/homebrew-neomutt/neomutt
	fzf
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

brew services start skhd
brew services start chunkwm

(brew --prefix)/opt/fzf/install

# https://github.com/wee-slack/wee-slack (Integration Slack - WeeChat)
pip install websocket-client
wget https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py
cp wee_slack.py ~/.weechat/python/autoload

