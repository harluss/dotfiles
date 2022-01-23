#!/usr/bin/env zsh

# Users & Groups > Guest User > (Uncheck) Allow guests to log in to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# TODO: check default settings for Users & Groups > Login Options > (Uncheck) Automatic login / Display login windows as (List of users) / (Disable) Show fast user switching menu as