#!/usr/bin/env zsh

# Finder Preferences > General > Show these items on the desktop > (Enable) Connected Servers
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder > Preferences > General > New Finder windows show: Home
# Desktop:      "PfDe", Path: "file://${HOME}/Desktop/"
# Home:         "PfHm", Path: "file://${HOME}/"
# Macintosh HD: "Pfvo", Path: "file:///"
# Other:        "PfLo", Path: "file:///<path>/"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# TODO: Finder > Preferences > Sidebar: Check/Uncheck required locations

# Finder > Preferences > Advanced > (Check) Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# Finder > Preferences > Advanced > (Uncheck) Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Advanced > Keep folders on top > (Check) In windows when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder > Preferences > Advanced > Keep folders on top > (Check) On Desktop
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# Finder > Preferences > Advanced > When performing a search: Search the Current Folder
# Current Folder: "SCcf"
# This Mac:       "SCev"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder > View Menu > (Check) Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder > View Menu > (Check) Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > View Menu > View Options > (Check) Always open in list view
# Column view:  "clmv"
# List view:    "Nlsv"
# TODO: did not work for some locations (Applications), fix required
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# TODO: Finder > View Menu > Show View Options > Calculate all size

# Finder Extra: User Folder (right click on any folder inside) > Show View Options > Show Library Folder
chflags nohidden ~/Library

# Finder Extra: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder Extra: Right click on desktop > Show View Options > (Check) Show item info
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Finder Extra: Right click on desktop > Use Stacks
# TODO: did not work, fix required (Set: Entry, ":DesktopViewSettings:GroupBy", Does Not Exist)
/usr/libexec/PlistBuddy -c "Set :FXPreferredGroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:GroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy dateAdded" ~/Library/Preferences/com.apple.finder.plist

# Finder (Side bar) > AirDrop > Allow me to be discovered by: Off
# Possible values: No One as "Off", Contacts Only, Everyone
defaults write com.apple.sharingd DiscoverableMode -string "Off"