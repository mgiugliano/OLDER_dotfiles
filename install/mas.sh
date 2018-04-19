#!/usr/bin/env bash

# Automatically install purchased apps from the Mac App Store

mas signout

read -r -t 60 -p "What is yout Apple ID?: " appleid
mas signin --dialog "$appleid"

# Mac App Store apps to install
apps=(
    "Keynote:409183694"
    "Numbers:409203825"
    "Pages:409201541"
	"Slack:803453959"
	"be-focused-focus-timer:973134470"
	"the-unarchiver:425424353"
	"EchoHam:873302145"
	"microsoft-remote-desktop-8-0:715768417"
	"giphy-capture-the-gif-maker:668208984"
	"Kindle:405399194"
    "apple-configurator-2:1037126344"
	"spike-recorder:972173310"
	"evernote-stay-organized:406056744"
	"onedrive:823766827"
	"garageband:682658836"
	"imovie:408981434"
	"XCode:497799835"
)

for app in "${apps[@]}"; do
    name=${app%%:*}
    id=${app#*:}

    echo -e "Attempting to install $name"
    mas install "$id"
done
