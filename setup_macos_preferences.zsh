#!/usr/bin/env zsh

# Inspired by: 
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh
# https://github.com/0-vortex/dotfiles/blob/main/scripts/monterey.sh
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh


# TODO: Add env file for variables?
# HOSTNAME="Harlus"

# Close any open System Preferences panes, to prevent them from overriding new settings
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

### GENERAL ###

# General > Appearance
defaults write -g AppleInterfaceStyle -string "Dark"

# General > Show scroll bars
defaults write -g AppleShowScrollBars -string "Always"

# General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -bool true

### MOUSE & TRACKPAD & KEYBOARD ###

# Built-in trackpad:  AppleMultitouchTrackpad
# Bluetooth trackpad: AppleBluetoothMultitouch

# Trackpad > Point & Click > (Enable) Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
# defaults write -g com.apple.mouse.tapBehavior -int 1

# Trackpad > Point & Click > (Enable) Secondary click
# TODO: check as it should be set by default
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true
# defaults write -g ContextMenuGesture -int 1
# OR
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
# defaults write -g ContextMenuGesture -int 1

# Trackpad > Point & Click > (Enable) Silent clicking
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuationStrength -int 0

# Trackpad > More Gestures > (Enable) App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2

# Keyboard > Keyboard > Key Repeat / Delay Until Repeat
# 2 us the faster in GUI, but real is 1
defaults write -g KeyRepeat -int 1
# 15 is the faster in GUI, but real is 10
defaults write -g InitialKeyRepeat -int 10

# Keyboard > Text > (Disable) auto correct and other substitutions
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Keyboard > Shortcuts > Use keyboard navigation to move focus between controls
defaults write -g AppleKeyboardUIMode -int 3

# Keyboard > Shortcuts > Spotlight > (Unbind) Show Spotlight search
# TODO: check if persists after system reboot
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
  <dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>49</integer>
        <integer>1048576</integer>
      </array>
      <key>type</key>
      <string>standard</string>
    </dict>
  </dict>
"
# Or
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist \
#   -c "Delete :AppleSymbolicHotKeys:64" \
#   -c "Add :AppleSymbolicHotKeys:64:enabled bool false" \
#   -c "Add :AppleSymbolicHotKeys:64:value:parameters array" \
#   -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 65535" \
#   -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 49" \
#   -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 1048576" \
#   -c "Add :AppleSymbolicHotKeys:64:type string standard"

## Possible different approach:
## https://superuser.com/questions/1211108/remove-osx-spotlight-keyboard-shortcut-from-command-line
## https://apple.stackexchange.com/questions/405937/how-can-i-enable-keyboard-shortcut-preference-after-modifying-it-through-defaul

# Keyboard Other: Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

### BLUETOOTH ###

# TODO: check default setting for Bluetooth > Advanced > Allow Bluetooth devices to take this computer
# TODO: check defatults key for Show Bluetooth in menu bar
# defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18


### SOUND ###

# Sound > Sound Effects > (Disable) Play sound on startup
# TODO: use "defaults read > ${FILE}" save settings before and after startup sound is disabled in Sys Pref and "diff" to find the setting
# sudo nvram StartupMute=%01

# Sound > Sound Effects > (Disable) Play feedback when volume is changed
defaults write com.apple.sound.beep.feedback -bool false

# TODO: find defatults key for Show volume in menu bar

### FINDER & DESKTOP ###

# Finder > General > New Finder windows show (Home)
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Finder > General > Show these items on the desktop > (Enable) Connected Servers
# TODO: check default settings match the ones below
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder > Advanced > Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# Finder > Advanced > Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder > Advanced > (Disable) Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Advanced > Keep folders on top > In windows / On Desktop
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# Finder > Advanced > When performing a search > Search the Current Folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder > View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > View > View Options > Always open in list view
# Column view option: `clmv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# TODO: find defatults key for Finder > View > View Options > Calculate all sized

# Desktop (right click on any file on desktop) > Show View Options > Show item info
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Finder Other: User Folder (right click on any folder inside) > Show View Options > Show Library Folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Finder Other: (Enable) Quick Look text selection
# TODO: check if enabled by default in Monterey
# defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder Other: (Disable) Quick Look animation
# defaults write -g QLPanelAnimationDuration -float 0

# Finder Other: (Disable) Window animations
# defaults write com.apple.finder DisableAllAnimations -bool true

# Finder Other: Speed up Window resize animation
# defaults write -g NSWindowResizeTime -float 0.001

### DOCK & SPACES ###

# Dock > Size / (Enable) Magnification
defaults write com.apple.dock tilesize -int 28
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock magnification -bool true

# Dock > Minimize windows using
defaults write com.apple.dock mineffect -string "scale"

# Dock > (Disable) Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool false

# Dock > (Disable) Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Mission Control > (Disable) Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Other: Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.05

# Other: Remove all (default) app icons from the Dock
# NOTE: This is only really useful when setting up a new Mac.
defaults write com.apple.dock persistent-apps -array ""

### DISPLAY ###

# TODO: find defaults keys for Night Shift settings

# Display Other: Enable subpixel font rendering on non-Apple LCDs
defaults write -g AppleFontSmoothing -int 2

### SECURITY & PRIVACY & USERS & GROUPS ###

# Security & Privacy > General > Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Security & Privacy > General > Disable automatic login
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist autoLoginUser 0
sudo defaults delete /Library/Preferences/com.apple.loginwindow.plist autoLoginUser

# Security & Privacy > Firewall > Turn On Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true

# Security & Privacy > Firewall > Firewall Options > Enable Stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Security & Privacy > Firewall > Firewall Options > (Disable) Automatically allow signed software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

# Security & Privacy > Firewall > Firewall Options > (Disable) Automatically allow downloaded signed software to receive incoming connections
# sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false

# Security & Privacy > Privacy > Advertising > (Enable) Limit Ad Tracking
defaults write com.apple.AdLib forceLimitAdTracking -bool true

# TODO: find defaults keys and disable Security & Privacy > Privacy > Analytics & Improvements 

# Users & Groups > Guest User > (Disable) Allow guests to log in to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# TODO: check default settings for Users & Groups > Login Options > (Disable) Automatic login / Display login windows as (List of users) / (Disable) Show fast user switching menu as

### SHARING ###

# TODO: check default settings and find defaults keys for File Sharing

# Sharing > (Disable) File sharing > Options > Share files and folders using SMB / AFP
# TODO: check if persitent
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# Sharing > Computer Name
# sudo scutil --set ComputerName "Mini $HOSTNAME"
# sudo scutil --set HostName "$HOSTNAME"
# sudo scutil --set LocalHostName "$HOSTNAME"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOSTNAME"

# Sharing Other: Finder (Side bar) > AirDrop > Allow me to be discovered by 
# Possible values: No One as "Off", Contacts Only, Everyone
defaults write com.apple.sharingd DiscoverableMode -string "Off"

### OTHER ###

# Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Other: Screenshots > Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Other: Screenshots > Save in JPG format
# Possible values: BMP, GIF, JPG, PDF, PNG, TIFF
defaults write com.apple.screencapture type -string "JPG"

# Other: Disable .DS_Store file creation on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Other: Expand Save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Other: Expand Print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Other: Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Other: Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

### SOFTWARE UPDATES ###
# TODO: check default settings and find defaults keys in Monterey

# Software Update > Automatically keep my Mac up to date
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool true

# Software Update > Advanced
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool true
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool false
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false
# sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true

# App Store: Enable the automatic update check
# defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

### ACCESSIBILITY ###

# Accessibility > Pointer Control > Trackpad Options > Enable dragging > three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Accessiblity > Zoom > Use scroll gesture with the (Ctrl (^)) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Accessiblity > Zoom > Advanced > Appearance > Follow the keyboard focus
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

### TODO: MENU BAR ###
# Show these menu bar icons
# defaults write com.apple.systemuiserver menuExtras -array \
# "/System/Library/CoreServices/Menu Extras/Volume.menu" \
# "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
# "/System/Library/CoreServices/Menu Extras/Clock.menu" \
# "/System/Library/CoreServices/Menu Extras/AirPort.menu"

# Hide these menu bar icons
# defaults write ~/Library/Preferences/ByHost/com.apple.systemuiserver dontAutoLoad -array \
# "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
# "/System/Library/CoreServices/Menu Extras/User.menu"

### ENERGY SAVER ###

# Energy Saver > Turn display off after
# TODO: check default setting
# sudo pmset -a displaysleep 15

# Energy Saver > (Disable) Prevent computer from sleeping automatically when the display is off
sudo systemsetup -setcomputersleep off > /dev/null

# Energy Saver > (Disable) Wake for network access
sudo systemsetup -setwakeonnetworkaccess off

### TODO: TERMINAL ###

### TIME MACHINE ###

# Time Machine Other: Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Time Machine Other: Disable Time Machine
# sudo defaults write /Library/Preferences/com.apple.TimeMachine MobileBackups -bool false
# sudo defaults write /Library/Preferences/com.apple.TimeMachine AutoBackup -bool false

# TODO: check default settings and find defaults keys for Time Machine > Back Up Automatically

### TODO: SAFARI ###

# Allow hitting the Backspace key to go to the previous page in history
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write -g WebKitDeveloperExtras -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write -g WebKitDeveloperExtras -bool true

# Disable autocorrect in Safari
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

### ACTIVITY MONITOR ###

# Activity Monitor Other: Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Activity Monitor Other: Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Activity Monitor Other: Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# TODO: Add settings for other app i.e. Chrome, iTerm2...

for app in "Activity Monitor" "Dock" "Finder" "Safari" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

# TODO: Add info about the need of rebooting and any additional settings that still need to be changed manually
