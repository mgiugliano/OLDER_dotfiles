# ~/.bash_profile

#
#  bash_profile of Michele Giugliano (mgiugliano@gmail.com), 3/1/2018
#  ---------------------------------------------------------------------------
#  Description: BASH configurations and aliases
#  ---------------------------------------------------------------------------
#

defaults write NSGlobalDomain _HIHideMenuBar -bool true
# restore by: defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write com.apple.dock autohide-time-modifier -float 0.25;killall Dock
# restore by: defaults delete com.apple.dock autohide-time-modifier;killall Dock

[[ -s ~/.bashrc ]] && source ~/.bashrc

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

#   Change Prompt
#   ------------------------------------------------------------

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  local iRED="\[\033[7;31m\]"
  local iPURPLE="\[\033[7;35m\]"
  local iBLUE="\[\033[7;34m\]"

  #export PS1="\n$RED\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(git branch 2&gt; /dev/null)\n $BLUE[\#] → $RESETCOLOR"
  #export PS2=" | → $RESETCOLOR"

 #export PS1="$RED\u$PURPLE@$BLUE\h:$GREEN\W$RESETCOLOR\$ "
 #export PS1="$RESETCOLOR\A  $RED\u$PURPLE@$BLUE\W$RESETCOLOR\$ "
 export PS1="$RESETCOLOR\A $(if [ `date +%H` -lt 19 ]; then echo ''; else echo '☽'; fi) $RED\u$PURPLE@$BLUE\W$RESETCOLOR\$ "
}

prompt

#   Set Paths
#   ------------------------------------------------------------

  export PATH="$PATH:/usr/local/bin/"
  export PATH="$PATH:/Applications/Julia-0.6.app/Contents/Resources/julia/bin"  #added for Julia
  export PATH="$PATH:/Applications/NEURON-7.5/nrn/x86_64/bin"                   #added by NEURON installer
  export PATH="$PATH:/opt/X11/bin"
  export PATH="$PATH:/Library/TeX/texbin"
  export PATH="$PATH:/Applications/gnuplot/bin"
  export PATH="$PATH:/Users/michi/anaconda/bin"                     # added by Anaconda3 4.3.1 installer

#   Set Default Editor (change 'Vim' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/local/bin/vim              # brew install vim  (the default has no clipboard support in OSX)
  #/usr/bin/vim

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Autocomplete without case-sensitivity
set show-all-if-ambiguous on
set completion-ignore-case on

# added by MG as a remedy to the import matplotlib error messages
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Only show the current directory's name in the tab of iTerm
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Launches the "z" (jump around folders) command
# Requires installing "z.sh" first - https://github.com/rupa/z
source ~/z.sh

# Launches the Message of the Day script
source ~/.mydotfiles/mymotd.sh
