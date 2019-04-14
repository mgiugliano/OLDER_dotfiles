#!/bin/sh

# My Message-of-the-Day!

bold=$(tput bold)
normal=$(tput sgr0)

#echo "${bold}Logged ☻n:${normal} $(uname -n) [$(uname -s) $(uname -r) $(uname -m)]"
#echo "${bold}Uptime   :${normal} $(uptime)"
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  	#echo "IPv4 is up"
	echo "${bold}Public IP:${normal} $(curl -s ipinfo.io/ip)"
#	echo "${bold}Antwerp  :${normal} $(curl -s wttr.in/Antwerpen?T | grep -m 1 -Eo -e '-?[[:digit:]].*°C.*')"
#	echo "${bold}Lausanne :${normal} $(curl -s wttr.in/Lausanne?T | grep -m 1 -Eo -e '-?[[:digit:]].*°C.*')"
	echo "${bold}Trieste :${normal} $(curl -s wttr.in/Trieste?T | grep -m 1 -Eo -e '-?[[:digit:]].*°C.*')"
	echo "${bold}Milan :${normal} $(curl -s wttr.in/Milan?T | grep -m 1 -Eo -e '-?[[:digit:]].*°C.*')"
else
  	echo "IPv4 is down"
fi

normal=$(tput sgr0)$(tput setaf 4)
bold=$(tput bold)$(tput setaf 4)
echo
echo "${bold}Shell    :${normal} (l)ls, la, lsd, cd.., .., ..., ...., ....."
echo "           qfind, o, ql, f, v, :q, clc, h, z, fzf (CTRL+T/R + **TAB)"
echo "${bold}Network  :${normal} tunnel, castafiore, telstar, imac, mini, bigcrunch"
echo "           hosts, ip/2, flushdns, pubkey"
echo "${bold}Utils    :${normal} emptytrash, hide/showdesktop, hibernateon/off"
echo "           show/hidedotfiles, done2slack"
echo "${bold}System   :${normal} diskspace_report, htop, ungzip, fs"
echo "${bold}Search   :${normal} spotlight, google, g, wikipedia, wikibib, wikimd"
echo "${bold}App      :${normal} matlab, subl (s), j, plot, plot1, cws, cwp"
echo "           brew_update, q/neurojupyter, rainymood"
echo "${bold}Bib      :${normal} doi2bib, pbmid2bib, pubmed, pandocme"
echo
normal=$(tput sgr0)
echo "${normal} $(fortune -s)"
echo

