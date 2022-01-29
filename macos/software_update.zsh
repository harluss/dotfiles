#!/usr/bin/env zsh

# TODO: check default settings and find defaults keys in Monterey

# Software Update > Automatically keep my Mac up to date
# Software Update > Advanced > Install macOS updates
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false

# Software Update > Advanced > Check for updates
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool true

# Software Update > Advanced > Install system data files and security updates
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool false
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false

# Software Update > Advanced > Download new updates when available
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool true

# Software Update > Advanced > Install app updates from the App Store
# sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true