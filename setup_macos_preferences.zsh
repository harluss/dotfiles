#!/usr/bin/env zsh

# TODO: Add env file for variables
HOSTNAME="Harlus"

echo "\n=== Starting macOS System Preferebce Setup ===\n"

# Close any open System Preferences panes, to prevent them from overriding new settings
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### GENERAL ###################################################################

# Default to dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Show scroll bars
defaults write -g AppleShowScrollBars -string "Always"


### MOUSE & TRACKPAD ##########################################################

# Built-in trackpad:  AppleMultitouchTrackpad
# Bluetooth trackpad: AppleBluetoothMultitouch

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: enable two finger tap to right click
# TODO: check as it should be set by default
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
# defaults write NSGlobalDomain ContextMenuGesture -int 1

# Trackpad: enable silent clicking
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Trackpad: enable three finger drag -> moved to Accessibility

# Enable App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true


### KEYBOARD ##################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a short initial delay and fast repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 0.5

# Enable full keyboard access for all controls (tab through inputs, etc)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto correct and other substitutions
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


### BLUETOOTH #################################################################

# Increase sound quality for Bluetooth headphones
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


### SOUND #####################################################################

# Disable the startup chime
# TODO: use "defaults read > ${FILE}" save settings before and after startup sound is disabled in Sys Pref and "diff" to find the setting
# sudo nvram StartupMute=%01

# Disable audio feedback when volume is changed
defaults write com.apple.sound.beep.feedback -bool false


### FINDER & DESKTOP ##########################################################

# Use the home directory as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Shot hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# Search the current directory by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show the path bar
defaults write com.apple.finder ShowPathbar -bool true

# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# TODO: Enable calculate all sized by default

# Quick Look
# TODO: check if enabled by default in Monterey
# defaults write com.apple.finder QLEnableTextSelection -bool true

# Show ~/Library folder
chflags nohidden "${HOME}/Library"

# Show/hide icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist


### DOCK & SPACES #############################################################

# Set the icon size of Dock items to 28->64 pixels with magnification
defaults write com.apple.dock tilesize -int 28
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock magnification -bool true

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Don't minimize windows into their applications icon
defaults write com.apple.dock minimize-to-application -bool false

# Don't show recent applications in the dock
defaults write com.apple.dock show-recents -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.05

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove all (default) app icons from the Dock
# NOTE: This is only really useful when setting up a new Mac.
defaults write com.apple.dock persistent-apps -array ""


### SCREEN ####################################################################

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# TODO: setup Night Shift


### SECURITY & PRIVACY ########################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Turn on Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true

# Enable Stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Do not automatically allow signed software to receive incoming connections
#sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

# Do not automatically allow downloaded signed software to receive incoming connections
#sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false


### USERS & GROUPS ############################################################

# Disable guest account login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false


### SHARING ###################################################################

# TODO: check if persitent
# Disable file-sharing via AFP or SMB
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "Mini $HOSTNAME"
sudo scutil --set HostName "$HOSTNAME"
sudo scutil --set LocalHostName "$HOSTNAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOSTNAME"


### OTHER #####################################################################

# Screenshots: Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Screenshots: save in JPG format (other options: BMP, GIF, JPG, PDF, PNG, TIFF)
defaults write com.apple.screencapture type -string "JPG"

# Disable .DS_Store file creation on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand Save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand Print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Unbind kSHKShowSpotlightSearch shortcut
# TODO: check if persists after system reboot
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = (32, 49, 1048576); type = standard; }; }"


### SOFTWARE UPDATES ##########################################################
# TODO: check defaults in Monterey

# Set automatic updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true

# App Store: Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true


### ACCESSIBILITY##############################################################

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true


### TODO: SAFARI ##############################################################

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


### TODO: MENU BAR ############################################################
# TODO: add/remove/shuffle menu bar items


### TODO: ENERGY SAVER ########################################################
# TODO: prevent computer from sleeping automatically when the display is off

# Disable Wake for network access
sudo systemsetup -setwakeonnetworkaccess off


### TODO: TERMINAL ############################################################


### TODO: TIME MACHINE ########################################################
# TODO: disable time machine?

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


for app in "Dock" "Finder" "Safari" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
