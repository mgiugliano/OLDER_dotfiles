#
# Set personal aliases
#
# For a full list of active aliases, run `alias`

# Enable aliases to be sudo’ed (note the final space character)
alias sudo="sudo "

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

# Diff with colorized output (run brew install colordiff)
alias diff='colordiff'

# History and background jobs
alias h='history'
alias j='jobs -l'

# Easier navigation: .., ...,
cd() { builtin cd "$@"; ls; }   # Always list directory contents upon 'cd'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cwd="cd $CWD" 		    # Go back to the current working directory
alias scwd="export CWD=$(pwd)"  # Set a current working directory

# mv, rm, cp, gunzip
alias mv='mv -i -v'
# brew install trash
alias rm="trash -v"
#alias rm='rm -i -v'
alias cp='cp -v'
alias mkdir='mkdir -pv'                    # Preferred 'mkdir' implementation (creates parent dirs on demand)
alias less='less -FRXc'                    # Preferred 'less' implementation
alias ungzip="gunzip -k"
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
ql() { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview


# Disc utils and File size
alias df="df -H"
alias du="du -sh"
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"
alias fs="stat -f \"%z bytes\""
alias numfiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

# Searching utilities
alias qfind="find . -name"		#  qfind:    Quickly search for file

#   spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# Googler
alias google="googler -n 8 -l en -x "
g() { googler -n 100 -l en -x --np $1 $2 $3 $4 $5 $6| less; }

# Wikit
alias wikipedia="wikit " 

# VimWiki
wikimd() { $EDITOR /Users/michi/Dropbox/Pvt/a_private.wiki/index.md ;}
wikibib() { $EDITOR /Users/michi/Dropbox/Pro/BibTex/wiki/index.md ;}

# MPV Audio Player snippet to RainyMood
rainymood() { 
		FILE=$((RANDOM%8)) 
		URL="https://rainymood.com/audio1110/${FILE}.ogg"
		mpv "$URL" && rainymood
}


# Slack integration webhook
done2slack () { echo "Processing done" | slacktee.sh -a "good" -e "Date and Time" "$(date)" -s "Host" "$(hostname)"; }

# Academic writing tips
pandocme() {
 echo "Processing $1..."
 pandoc -V geometry="paperwidth=21cm, paperheight=29.7cm, margin=2.54cm" --bibliography=/Users/michi/Dropbox/Pro/BibTex/bib.bib --csl=/Users/michi/Dropbox/Pro/BibTex/csl_style/european-journal-of-neuroscience.csl $1 -o $1.pdf
 pandoc -V geometry="paperwidth=21cm, paperheight=29.7cm, margin=2.54cm" --bibliography=/Users/michi/Dropbox/Pro/BibTex/bib.bib --csl=/Users/michi/Dropbox/Pro/BibTex/csl_style/european-journal-of-neuroscience.csl --reference-doc=/Users/michi/Dropbox/Pro/BibTex/templates/manuscript-docx.docx $1 -o $1.docx
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
 
# SSH Tunnel to acces the lab wiki
tunnel() { ssh -fN -L 10000:telstar:80 michele@castafiore ; }

# Networking. IP address, dig, DNS, Enhanced WHOIS lookups
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ip2="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
alias whois="whois -h whois-servers.net"
alias flushdns="dscacheutil -flushcache"

# Be nice (brew install htop)
alias htop='sudo htop'
alias hosts='sudo vim /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

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

# Shortcuts
alias o="open"
alias f="open -a Finder ./"			# Opens current directory in MacOS Finder
alias vim="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias vi="/usr/local/bin/vim"		# brew install vim (the default does not work with clipboard)
alias v="/usr/local/bin/vim"
alias :w="echo this isn\'t vim 🌟"
alias :q='exit'
alias clc="clear"
#alias ps="ps -ax"

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias matlab="/Applications/MATLAB_R2018a.app/bin/matlab -nodesktop -nosplash"
alias j="julia"
alias cws="cd ~/Dropbox/Pvt/HAM_RADIO/CW_Academy/Michele_practice_CW/single_characters && ./CWsingle 1 2 3 4 5 6 7 8 9 0 = q w e r t y u i o p a s d f g h j k l z x c v b n m / ?"
alias cwp="cd ~/Dropbox/Pvt/HAM_RADIO/CW_Academy/Michele_practice_CW/pairs_characters && ./CWpairs q w e r t y u i o p a s d f g h j k l z x c v b n m"
alias neurojupyter='docker run -d --name myneurojupyter -p 8888:8888 -v "/Users/michi:/opt/notebooks" meekeee/neurojupyter'
alias qneurojupyter='docker stop myneurojupyter && docker rm myneurojupyter'

#plot() { gnuplot -e "set terminal png; plot '$@' using 1:2 with line" | imgcat; }
plot() { gnuplot -persist -e "set terminal x11; plot '$@' using 1:2 with line"; } 
plot1() { gnuplot -persist -e "set terminal x11; plot '$@' with line"; } 

# I am using tmux as an environment (for both local and remote connections): started up programs and processes will stay in the background upon "detaching" from the session.
#
alias tm="~/tm.sh" 
alias imac="~/vpn.sh UA; ssh michi@imac -t '~/tm.sh'"
alias mini="~/vpn.sh UA; ssh michele@mini -t '~/tm.sh'"
alias bigcrunch="~/vpn.sh UA; ssh michi@bigcrunch -t 'source ~/tm.sh'"
alias castafiore="ssh michele@castafiore"
alias telstar="~/vpn.sh UA; ssh michi@telstar"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

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

