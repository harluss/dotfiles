#!/usr/bin/env zsh

# General > Appearance: Dark
defaults write -g AppleInterfaceStyle -string "Dark"
defaults delete -g AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1

# General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -bool true

# Generala > (Check) Ask to keep changes when closing documents
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

# TODO: check default settings for General > Allow Handoff between this Mac and your iCloud devices
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true