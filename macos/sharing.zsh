#!/usr/bin/env zsh

# TODO: check default settings and find defaults keys for File Sharing

# Sharing > (Uncheck) File sharing > Options > Share files and folders using SMB / AFP
# TODO: check if persitent
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# Sharing > Computer Name
# sudo scutil --set ComputerName "mini $HOSTNAME"
# Shell prompt
# sudo scutil --set HostName "$HOSTNAME"
# Bonjour Name
# sudo scutil --set LocalHostName "$HOSTNAME"

# TODO: Sharing > (Enable) AirPlay Receiver: Current user - find defaults keys

# Sharing Extra: Finder (Side bar) > AirDrop > Allow me to be discovered by: Off
# Possible values: No One as "Off", Contacts Only, Everyone
defaults write com.apple.sharingd DiscoverableMode -string "Off"