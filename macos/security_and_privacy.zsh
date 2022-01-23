#!/usr/bin/env zsh

# Security & Privacy > General > Require password after sleep or screen saver begins: 5 seconds
# TODO: check
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Security & Privacy > General > (Check) Disable automatic login
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist autoLoginUser 0
sudo defaults delete /Library/Preferences/com.apple.loginwindow.plist autoLoginUser

# Security & Privacy > Firewall > Turn On Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true

# Security & Privacy > Firewall > Firewall Options > Enable Stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Security & Privacy > Firewall > Firewall Options > (Uncheck) Automatically allow built-in software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

# Security & Privacy > Firewall > Firewall Options > (Uncheck) Automatically allow downloaded signed software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false

# Security & Privacy > Privacy > Apple Advertising > (Uncheck) Personalised Ads
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib forceLimitAdTracking -bool true