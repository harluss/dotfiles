#!/usr/bin/env zsh

# Security & Privacy > General > Require password after sleep or screen saver begins: 5 seconds
# TODO: did not work, fix required
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Security & Privacy > Firewall > Turn On Firewall
# TODO: did not work, fix required
sudo defaults write ~/Library/Preferences/com.apple.alf globalstate -bool true

# Security & Privacy > Firewall > Firewall Options > Enable Stealth mode
# TODO: did not work, fix required
sudo defaults write ~/Library/Preferences/com.apple.alf stealthenabled -bool true

# Security & Privacy > Firewall > Firewall Options > (Uncheck) Automatically allow built-in software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

# Security & Privacy > Firewall > Firewall Options > (Uncheck) Automatically allow downloaded signed software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false

# Security & Privacy > Privacy > Apple Advertising > (Uncheck) Personalised Ads
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib forceLimitAdTracking -bool true