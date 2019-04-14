#
# Set personal aliases
#
# For a full list of active aliases, run `alias`

#  -----------------------------
#   MAKE TERMINAL BETTER
#  -----------------------------
alias sudo="sudo " # Enable aliases to be sudo’ed (note the final space character)
# Time to upgrade `ls`
# ls (standard) lls (long) la (incl. hidden files) lsd (dir only)
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# List all files colorized in long format
alias ls="ls -GFhp"
alias lls="ls -lGFhp"
alias l="ls -lGFhp"
alias la="ls -GAFhp"
alias lsd='ls -lG | grep "^d"'

# Grep puts in bold the searched string
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# History and background jobs
alias h='history'
#alias j='jobs -l'

# Easier navigation: .., ...,
cd() { builtin cd "$@"; ls -GFhp; }   # Always list directory contents upon 'cd'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cwd="cd $CWD" 		    # Go back to the current working directory
alias scwd="export CWD=$(pwd)"  # Set a current working directory

# mv, rm, cp, gunzip
#alias rm='rm -iv'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FRXc'                    # Preferred 'less' implementation (option S removed)
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)

alias ungzip="gunzip -k"
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths

# Disc utils and File size
alias df="df -H"
alias du="du -sh"
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"
alias fs="stat -f \"%z bytes\""
alias numfiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

# Shortcuts
alias vim="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias vi="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias v="/usr/local/bin/vim"
#vf() { fzf | xargs -r -I % $EDITOR % ; }
vf() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

alias :w="echo this isn\'t vim 🌟"
alias :q='exit'
alias x='exit'
alias clc="clear"
alias c='clear'                             # c:            Clear terminal display
alias ~="cd ~"                              # ~:            Go Home
#alias ps="ps -ax"

# fff invoked as ff makes the last folder explore the current working directory upon exit.
function ff { iterm_profile fff; fff ; cd $(<~/.cache/fff/.fff_d) ; iterm_profile ; }

#   ---------------------------
#   iTerm SPECIFIC
#   ---------------------------
# Changing iTerm2 color in MacOSX when SSHing (so you know at a glance that you're no longer in Kansas)
# Adapted from https://gist.github.com/porras/5856906
# 1. Create a theme in your terminal setting with the name "SSH" and the desired colors, background, etc.
# 2. Add this to your .bash_profile (or .bashrc, I always forget the difference ;))
# 3. Optional but useful: in the terminal, go to Settings > Startup and set "New tabs open with" to
#    "default settings" (otherwise, if you open a new tab from the changed one, you get a local tab with
#    the SSH colors)

function iterm_profile {
	local profileName
	if [[ -z $1 ]]; then
    	profileName="Default"      # "Default" is the name of the default theme
    else
		profileName=$1
	fi

    echo -e "\033]50;SetProfile=$profileName\a"
	clear
}
export -f iterm_profile # make them available to any copy of bash run as a child process

function colorssh() {
  clear
  echo "ssh $@"
  iterm_profile SSH
  command ssh "$@"
  iterm_profile
  clear
}
alias ssh="colorssh"

# This would be easy to extend to check if a theme with the name of the server exists and set it, and
# fall back to the SSH theme. This way you can have different colors for different remote environments
# (per project, production, staging, etc.)

# From https://github.com/lf94/peek-for-tmux
peek() { tmux split-window -h -p 66 $EDITOR $@ || exit;}

peek2() { ~/iterm2.sh "$EDITOR $@ && exit" &>/dev/null;}

#   ---------------------------
#   macOs SPECIFIC
#   ---------------------------
ql() { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview
export -f ql                               # make it available to any copy of bash run as a child process
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; } # spotlight-search for a file, using MacOS Spotlight's metadata
#alias rm='rm -i -v'                 		# Preferred 'rm' implementation
alias rm="trash -v" 						# brew install trash
alias emptytrash='trash -e' 				# Empty the Trash on all mounted volumes and the main HDD.
alias diff='colordiff'						# with colorized output (run brew install colordiff)
alias o="open"								# Opens file with default MacOS application
alias f="open -a Finder ./"					# Opens current directory in MacOS Finder
alias hibernateon="sudo pmset -a hibernatemode 25; sudo pmset -a standby 1; sudo pmset -a standbydelaylow 60; sudo pmset -a standbydelayhigh 60"	# Enable hibernation
alias hibernateoff="sudo pmset -a hibernatemode 0; sudo pmset -a standby 5; sudo pmset -a standbydelaylow 10800; sudo pmset -a standbydelayhigh 86400"
# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Show/hide all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"
alias muteSpotify="~/.mydotfiles/muteSpotifyAds.sh &"
# Update installed Homebrew, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle; brew cleanup --prune-prefix; brew doctor"

fkill() { kill -9 $(ps ax | fzf | awk '{ print $1 }') ; }

fcd() {
  local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
			                  -o -type d -print 2> /dev/null | fzf +m) &&
					    cd "$dir"
}

# fuzzy (dir) changer:
# I wrote the following command to directly navigate to any directory, upon fuzzy finding
# a file containied in it - if no result or aborted, no action is taken.
fc() {
  local file cwd key
  cwd=$(pwd)      # store the current working directory in 'cwd'
  command cd ~/   # "command cd" to home (for fzf) and do the search...
  IFS=$'\n' file=$(fzf-tmux --query="$1" --select-1 --exit-0 --expect=ctrl-j,ctrl-o,ctrl-e)

  key=$(head -1 <<< "$file")               # this may be empty or may be ctrl-j/o/e
  file=$(head -2 <<< "$file" | tail -1)    # this contains the file

  if [ -n "$key" ]; then
	  [ "$key" = ctrl-o ] && open "$file"
	  [ "$key" = ctrl-e ] && ${EDITOR:-vim} "$file"
	  [ "$key" = ctrl-j ] && open -a Finder $(dirname $file)
  else # key is empty - the user must have simply selected the file to navigate to
  	if [ -n "$file" ]; then
	  cd $(dirname $file)
    else
	  command cd $cwd
	fi
  fi
}
alias j="fc"

fc2() {
  local file key
  IFS=$'\n' file=$(fzf-tmux --query="$1" --select-1 --exit-0 --expect=ctrl-j,ctrl-o,ctrl-e)

  key=$(head -1 <<< "$file")               # this may be empty or may be ctrl-j/o/e
  file=$(head -2 <<< "$file" | tail -1)    # this contains the file

  if [ -n "$key" ]; then
	  [ "$key" = ctrl-o ] && open "$file"
	  [ "$key" = ctrl-e ] && ${EDITOR:-vim} "$file"
	  [ "$key" = ctrl-j ] && open -a Finder $(dirname $file)
  else # key is empty - the user must have simply selected the file to navigate to
  	if [ -n "$file" ]; then
	  cd $(dirname $file)
	fi
  fi
}
alias jj="fc2"


fssh() {
  local selected_host=$(cat ~/.ssh/known_hosts | awk '{print $1;}' | fzf --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    ssh ${selected_host}
  fi
}


#   ---------------------------
#   SEARCHING UTILITIES
#   ---------------------------
alias qfind="find . -name"				#  qfind:    Quickly search for file
alias google="googler -n 8 -l en -x " 	# Googler
g() { googler -n 100 -l en -x --np $1 $2 $3 $4 $5 $6| less; }
alias wikipedia="wikit " 				# Wikit
how_in()
{
  where="$1"; shift
  IFS=+ curl "https://cht.sh/$where/ $*"
}

#   ---------------------------
#   Personal VimWikis
#   ---------------------------
wikimd() { $EDITOR /Users/michi/Dropbox/Pvt/a_private.wiki/index.md ;}
wikibib() { $EDITOR /Users/michi/Dropbox/Pro/BibTex/wiki/index.md ;}

#   ---------------------------
#   Background rainy sounds
#   ---------------------------
rainymood() { # MPV Audio Player snippet to RainyMood
		FILE=$((RANDOM%8))
		URL="https://rainymood.com/audio1110/${FILE}.ogg"
		mpv "$URL" && rainymood
}


# Slack integration webhook
done2slack () { echo "Processing done" | slacktee.sh -a "good" -e "Date and Time" "$(date)" -s "Host" "$(hostname)"; }

#   ---------------------------
#   ACADEMIC WRITING TOOLS
#   ---------------------------
pandocme() {
 echo "Processing $1..."
 pandoc -V geometry="paperwidth=21cm, paperheight=29.7cm, margin=2.54cm" --bibliography=/Users/michi/Dropbox/Pro/BibTex/bib.bib --csl=/Users/michi/Dropbox/Pro/BibTex/csl_style/european-journal-of-neuroscience.csl $1 -o $1.pdf
 pandoc -V geometry="paperwidth=21cm, paperheight=29.7cm, margin=2.54cm" --bibliography=/Users/michi/Dropbox/Pro/BibTex/bib.bib --csl=/Users/michi/Dropbox/Pro/BibTex/csl_style/european-journal-of-neuroscience.csl --reference-doc=/Users/michi/Dropbox/Pro/BibTex/templates/manuscript-docx.docx $1 -o $1.docx
}

doigrep() {
 [ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
 grep -oP "\b(10[.][0-9]{4,}(?:[.][0-9]+)*/(?:(?![\"&\'<>])\S)+)\b" "$input"
}

doi2bib() {
 echo "Searching $1..."
 echo >> /Users/michi/Dropbox/Pro/BibTex/bib.bib
 curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" >> /Users/michi/Dropbox/Pro/BibTex/bib.bib;
 echo >> /Users/michi/Dropbox/Pro/BibTex/bib.bib
 echo "Appended to bib.bib"
}

pmid2bib() {
 echo "Searching $1..."
 echo >> /Users/michi/Dropbox/Pro/BibTex/bib.bib
 curl -s "http://www.bioinformatics.org/texmed/cgi-bin/list.cgi?PMID=$1" | tail -n +15 | sed '$d' | sed '$d' | sed '$d' | sed '$d' >> /Users/michi/Dropbox/Pro/BibTex/bib.bib;
 echo >> /Users/michi/Dropbox/Pro/BibTex/bib.bib
 echo "Appended to bib.bib"
}

pubmed() {
 esearch -db pubmed -query "$1"  | efetch -format medline | grep -e 'PMID- ' -e 'TI' -e 'LID'
 }

pdf2doi() {
    pdftotext "$1" - | doigrep | while read doi; do doi2bib "$doi"; done
}
#   ---------------------------
#   NETWORK
#   ---------------------------
tunnel() { command ssh -fN -L 10000:telstar:80 michele@castafiore ; echo "http://localhost:10000/lab/wiki/index.php/Main_Page"; } # SSH Tunnel to acces the lab wiki

# Networking. IP address, dig, DNS, Enhanced WHOIS lookups
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ip2="dig +short myip.opendns.com @resolver1.opendns.com"
#alias ip3="curl ifconfig.me"
alias dig="dig +nocmd any +multiline +noall +answer"
alias whois="whois -h whois-servers.net"
alias flushdns="dscacheutil -flushcache"

# I am using tmux as an environment (for both local and remote connections):
# started up programs and processes will stay in the background upon "detaching" from the session.
alias tm="~/tm.sh"
# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
alias imac="~/vpn.sh UA; ssh michi@imac -t '~/tm.sh'"
alias mini="~/vpn.sh UA; ssh michele@mini -t '~/tm.sh'"
alias bigcrunch="~/vpn.sh UA; ssh michi@bigcrunch -t 'source ~/tm.sh'"
alias castafiore="ssh michele@castafiore"
alias telstar="~/vpn.sh UA; ssh michi@telstar"
alias stargate="~/vpn.sh UA; ssh michi@stargate"
alias ballerini="~/vpn.sh SISSA; ssh macpro@ballerini"
alias sissa="~/vpn.sh SISSA; ssh mgiuglia@sissa"
alias sissafs="~/vpn.sh SISSA; sshfs mgiuglia@sissa:/u/nb/mgiuglia ~/Dropbox/Pro/projects/ANTWERPEN_LABORATORY/0_SISSA2018/home -ocache=no -onolocalcaches -ovolname=home; sshfs mgiuglia@sissa:/scratch/mgiuglia ~/Dropbox/Pro/projects/ANTWERPEN_LABORATORY/0_SISSA2018/scratch -ocache=no -onolocalcaches -ovolname=scratch"

alias htop='sudo htop'				# Be nice (brew install htop)

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditional information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ; ip2
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


	alias vimconfig='vim -o ~/.vimrc'
	alias tmuxconfig='vim ~/.tmux.conf && tmux source-file ~/.tmux.conf'
	alias sshconfig='vim ~/.ssh/config'
	alias aliasconfig='vim ~/.bash_aliases && source ~/.bash_aliases'
	alias hostsconfig='sudo vim /etc/hosts'
	alias hosts='sudo vim /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)
	alias bashconfig="vim -o ~/.bash_profile && source ~/.bash_profile"

#   ---------------------------
#   APPLICATIONS SHORTCUTS
#   ---------------------------

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
#alias xcode="open -a '/Applications/XCode.app'"
alias safari="open -a safari"
alias firefox="open -a firefox"
#alias textedit='open -a TextEdit'
alias skype='open -a Skype'
alias mail='open -a /Applications/mail.app'
alias calibre='open -a /Applications/calibre.app/Contents/MacOS/calibre'
alias matlab="/Applications/MATLAB_R2018a.app/bin/matlab -nodesktop -nosplash"
alias j1="/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia"
alias gvim='/Applications/MacVim.app/Contents/bin/gvim -c "set lines=50 columns=98" -p'
alias cws="cd ~/Dropbox/Pvt/HAM_RADIO/CW_Academy/Michele_practice_CW/single_characters && ./CWsingle 1 2 3 4 5 6 7 8 9 0 = q w e r t y u i o p a s d f g h j k l z x c v b n m / ?"
alias cwp="cd ~/Dropbox/Pvt/HAM_RADIO/CW_Academy/Michele_practice_CW/pairs_characters && ./CWpairs q w e r t y u i o p a s d f g h j k l z x c v b n m"
#alias neurojupyter='docker run -d --name myneurojupyter -p 8888:8888 -v "/Users/michi:/opt/notebooks" meekeee/neurojupyter'
#alias qneurojupyter='docker stop myneurojupyter && docker rm myneurojupyter'
alias clock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &"
#alias mutt="neomutt"
#plot() { gnuplot -e "set terminal png; plot '$@' using 1:2 with line" | imgcat; }
plot() { gnuplot -persist -e "set terminal x11; plot '$@' using 1:2 with line"; }
plot1() { gnuplot -persist -e "set terminal x11; plot '$@' with line"; }
