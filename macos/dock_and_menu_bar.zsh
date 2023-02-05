#!/usr/bin/env zsh

# Dock & Menu Bar > Size / (Check) Magnification
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock magnification -bool true

# Dock & Menu Bar > Position on screen: Left
# defaults write com.apple.dock orientation -string "left"

# Dock & Menu Bar > Minimize windows using: Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Dock & Menu Bar > (Uncheck) Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Dock & Menu Bar > Bluetooth > (Check) Show Bluetooth in menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18

# Dock & Menu Bar > Sound > (Check) Show in Menu Bar: Always
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18

# Dock & Menu Bar > Spotlight > (Uncheck) Show in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool true

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
