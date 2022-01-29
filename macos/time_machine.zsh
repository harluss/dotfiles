#!/usr/bin/env zsh

# Time Machine > (Uncheck) Back Up Automatically
sudo tmutil disable

# Time Machine > (Uncheck) Show Time Machine in menu bar
# TODO: check if persistent
# defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool false
# OR
# local domain="com.apple.menuextra.TimeMachine"
# local plist="${HOME}"/Library/Preferences/com.apple.systemuiserver.plist
# /usr/libexec/PlistBuddy -c "Delete :NSStatusItem\ Preferred\ Position\ $domain" $plist
# /usr/libexec/PlistBuddy -c "Delete :NSStatusItem\ Visible\ $domain" $plist
# local IS_TIMEMACHINE=$(defaults read com.apple.systemuiserver menuExtras | grep "TimeMachine")
# [[ -n ${IS_TIMEMACHINE} ]] && /usr/libexec/PlistBuddy -c "Delete :menuExtras:${IS_TIMEMACHINE}" $plist

# Time Machine Other: Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true