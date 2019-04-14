# ~/.bash_profile

#  bash_profile of Michele Giugliano, 4/1/2019
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

# Autocomplete without case-sensitivity
set show-all-if-ambiguous on
set completion-ignore-case on

# Vi mode in Bash
#set -o vi

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

export EDITOR=/usr/local/bin/vim              # brew install vim  (the default has no clipboard support in OSX)
export MANPAGER="less -X"                     # Don’t clear the screen after quitting a manual page
export HISTCONTROL="ignoredups:erasedups"     # Ignore duplicate commands in the history
export HISTFILESIZE=10000                     # Increase the maximum number of lines contained in the history file
shopt -s histappend                           # Merge histories of all terminals into one

export BIB="/Users/michi/Dropbox/Pro/BibTex/bib.bib"

export FFF_COL1=5                           # Setting for "fff"
export FFF_COL2=1                           # Setting for "fff"
export FFF_OPENER="open"                    # Setting for "fff" - was "open"
export FFF_FAV1=~/                          # Setting for "fff"
export FFF_FAV2=~/Documents                 # Setting for "fff"
export FFF_FAV3=~/Dropbox/Pro               # Setting for "fff"
export FFF_FAV4=~/Dropbox/Pvt               # Setting for "fff"
export FFF_FAV5=~/Dropbox/Pvt/dev           # Setting for "fff"
export FFF_FAV6=~/Desktop/AUTO_DELETE       # Setting for "fff"



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
export FZF_DEFAULT_OPTS='--reverse --extended --color=bg+:24 --inline-info --height=95% --preview="echo $(basename {}) - $(stat -f%z {}); echo; bat -p --color=always --theme=zenburn {}" --preview-window=right:50%:wrap'
#export FZF_DEFAULT_OPTS='--reverse --extended --color=bw --inline-info --height=95% --preview="echo $(basename {}) - $(stat -f%z {}); echo; head -$LINES {}" --preview-window=right:50%:wrap'
#export FZF_DEFAULT_COMMAND='find'
#export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# Launches the "z" (jump around folders) command
# Requires installing "z.sh" first - https://github.com/rupa/z
source /usr/local/bin/z.sh

# Add bash-completion for git
complete -o default -o nospace -F _git g

export HOMEBREW_NO_ANALYTICS=1    	# Disable homebrew analytics
export HOMEBREW_NO_EMOJI=1          # Disable crazy characters in brew
export HOMEBREW_NO_AUTO_UPDATE=1    # Stop homebrew from auto-updating

# Launches the Message of the Day script
source ~/.mydotfiles/mymotd.sh

#   Set Paths
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="$PATH:/Library/TeX/texbin"
export PATH="$PATH:/Applications/Julia-1.0.app/Contents/Resources/julia/bin"  #added for Julia
export PATH="$PATH:/opt/X11/bin"
export PATH="$PATH:/Library/TeX/texbin"
export PATH="$PATH:/Applications/gnuplot/bin"
export PATH="$PATH:/Users/michi/edirect"
export PATH="/Applications/NEURON-7.6/nrn/x86_64/bin":$PATH #added by NEURON installer

export PYTHONPATH="/Applications/NEURON-7.6/nrn/lib/python":$PYTHONPATH #added by NEURON installer
