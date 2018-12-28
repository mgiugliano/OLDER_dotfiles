# ~/.bash_profile

#  bash_profile of Michele Giugliano, 20/4/2018
#  ---------------------------------------------------------------------------
#  Description: BASH configurations and aliases
#  ---------------------------------------------------------------------------

[[ -s ~/.bashrc ]] && source ~/.bashrc

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

bind -f ~/.inputrc
source ~/.git-completion.bash

shopt -s autocd             # Typing a directory name just by itself will automatically change into that directory.
shopt -s cdspell            # fix directory name typos when changing directory
shopt -s direxpand dirspell # xpand directory globs and fix directory name typos whilst completing

# My own git-prompt machinery
gb() {
		modified=""
		if [ -d ".git" ]; then
		    modified=$(git status -s | grep 'M' | head -n 1| cut -c 2)
		fi
		echo -n ' (' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo -n $modified && echo -n ')'
#		echo -n ' (' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo -n '-' && echo -n $modified && echo -n ')'
}

git_branch2() {
		gb | sed 's/()//'
}

#   Change Prompt
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
 #export PS1="$RESETCOLOR\A $(if [ `date +%H` -lt 19 ]; then echo ''; else echo '☽'; fi) $RED\u$PURPLE@$BLUE\W$RESETCOLOR\$ "
 export PS1="$RESETCOLOR\A $(if [ `date +%H` -lt 19 ]; then echo ''; else echo '☽'; fi) $RED\u$PURPLE@$BLUE\W$REDBOLD\$(git_branch2)$RESETCOLOR $ "
}

prompt

#   Set Paths
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
  export PATH="$PATH:/Library/TeX/texbin"
  export PATH="$PATH:/Applications/Julia-0.6.app/Contents/Resources/julia/bin"  #added for Julia
  export PATH="$PATH:/Applications/NEURON-7.5/nrn/x86_64/bin"                   #added by NEURON installer
  export PATH="$PATH:/opt/X11/bin"
  export PATH="$PATH:/Library/TeX/texbin"
  export PATH="$PATH:/Applications/gnuplot/bin"
  export PATH="$PATH:/Users/michi/edirect"

#   Set Default Editor (change 'Vim' to the editor of your choice)
export EDITOR=/usr/local/bin/vim              # brew install vim  (the default has no clipboard support in OSX)
  #/usr/bin/vim

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Ignore duplicate commands in the history
export HISTCONTROL="ignoredups:erasedups"

# Merge histories of all terminals into one
shopt -s histappend

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

# Fuzzy Search Finder default options
export FZF_DEFAULT_OPTS="--reverse --extended --inline-info --height 40%"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Launches the "z" (jump around folders) command
# Requires installing "z.sh" first - https://github.com/rupa/z
source ~/z.sh

# Add bash-completion for git
complete -o default -o nospace -F _git g

# Disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1
# Disable crazy characters in brew
export HOMEBREW_NO_EMOJI=1
# Stop homebrew from auto-updating
export HOMEBREW_NO_AUTO_UPDATE=1

# Launches the Message of the Day script
source ~/.mydotfiles/mymotd.sh

export PATH="/Applications/NEURON-7.6/nrn/x86_64/bin":$PATH #added by NEURON installer
export PYTHONPATH="/Applications/NEURON-7.6/nrn/lib/python":$PYTHONPATH #added by NEURON installer
