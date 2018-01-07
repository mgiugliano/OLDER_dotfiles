#
# Set personal aliases
#
# For a full list of active aliases, run `alias`

#echo $'\e[34m'" (l)ls la lsd .. ... .... ..... o ql f v :q clc subl matlab j"   
#echo " htop path ql ungzip fs diskspace_report ip/2 hosts flushdns"
#echo " emtpytrash hide/showdesktop hibernateon/off show/hidedotfiles"
echo

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Time to upgrade `ls`
# ls (standard) lls (long) la (incl. hidden files) lsd (dir only)
#
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# List all files colorized in long format
alias ls="ls -GFhp"
alias lls="ls -lGFhp"
alias l="ls -lGFhp"
alias la="ls -GAFhp"
alias lsd='ls -lG | grep "^d"'

# Easier navigation: .., ...,
#
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cwd="cd $CWD"
alias scwd="export CWD=$(pwd)"
# mv, rm, cp, gunzip
#
alias mv='mv -i -v'
# brew install trash
alias rm="trash -v"
#alias rm='rm -i -v'
alias cp='cp -v'
alias mkdir='mkdir -pv'                    # Preferred 'mkdir' implementation
alias less='less -FRXc'                    # Preferred 'less' implementation
alias ungzip="gunzip -k"
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
ql() { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview


# Disc utils and File size
#
alias df="df -H"
alias du="du -sh"
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"
alias fs="stat -f \"%z bytes\""

# Networking. IP address, dig, DNS, Enhanced WHOIS lookups
#
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ip2="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
alias whois="whois -h whois-servers.net"
alias flushdns="dscacheutil -flushcache"


# Be nice (brew install htop)
#
alias htop='sudo htop'
alias hosts='sudo vim /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

# Shortcuts
#
alias o="open"
alias f="open -a Finder ./"			# Opens current directory in MacOS Finder
alias vim="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias vi="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias v="vim"
alias :w="echo this isn\'t vim 🌟"
alias :q='exit'
alias clc="clear"
#alias ps="ps -ax"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias matlab="/Applications/MATLAB_R2017a.app/bin/matlab -nodesktop -nosplash"
alias j="julia"
alias cw="cd ~/Dropbox/Pvt/HAM_RADIO/CW_Academy/Michele_practice_CW/single_characters/"

#alias imac="~/vpn.sh UA; xhost +imac;  ssh michi@imac"
#alias mini="~/vpn.sh UA; xhost +macmini;  ssh michele@macmini"
#alias bigcrunch="~/vpn.sh UA; xhost +bigcrunch;  ssh michi@bigcrunch"

# I am using tmux as an environment (for both local and remote connections): started up programs and processes will stay in the background upon "detaching" from the session.
#
alias tm="~/tm.sh" 
alias imac="~/vpn.sh UA; ssh michi@imac -t '~/tm.sh'"
alias mini="~/vpn.sh UA; ssh michele@macmini -t '~/tm.sh'"
alias bigcrunch="~/vpn.sh UA; ssh michi@bigcrunch -t 'source ~/tm.sh'"

# Enable hibernation
alias hibernateon="sudo pmset -a hibernatemode 5"
alias hibernateoff="sudo pmset -a hibernatemode 0"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/hide all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD.
alias emptytrash='trash -e'

# Update installed Homebrew, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew prune; brew doctor"

