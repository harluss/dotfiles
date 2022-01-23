#!/usr/bin/env zsh

# Hidden: Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Hidden: Save screenshots in JPG format
# Possible values: BMP, GIF, JPG, PDF, PNG, TIFF
defaults write com.apple.screencapture type -string "JPG"

# Hidden: Disable .DS_Store file creation on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Hidden: Expand Save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Hidden: Expand Print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Hidden: Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Hidden: Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Hidden: Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Hidden: (Disable) Quick Look animation
defaults write -g QLPanelAnimationDuration -float 0

# Hidden: (Disable) Window animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Hidden: Speed up Window resize animation
defaults write -g NSWindowResizeTime -float 0.001

# Hidden: Enable subpixel font rendering on non-Apple LCDs
# TODO: test
# defaults write -g AppleFontSmoothing -int 2

# Hidden: Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.05