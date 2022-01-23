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

# Finder > Preferences > Advanced > (Check) Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# Finder > Preferences > Advanced > (Uncheck) Show warning before changing an extension
# TODO: check default
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
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# TODO: find defatults key for Finder > View Menu > View Options > Calculate all size

# TODO: find way to setup Finder Preferences > Sidebar

# Finder Extra: User Folder (right click on any folder inside) > Show View Options > Show Library Folder
# TODO: confirm if works in Monterey
chflags nohidden ~/Library

# Finder Extra: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder Extra: (Check) Quick Look text selection
# TODO: check if enabled by default in Monterey
# defaults write com.apple.finder QLEnableTextSelection -bool true

# TODO: check if FK_StandardViewSettings and StandardViewSettings exist and need to be changed
# # Create the `FK_StandardViewSettings` dictionary in `com.apple.finder.plist` if it doesn't exist
# if [[ ! $(/usr/libexec/PlistBuddy -c "Print :FK_StandardViewSettings" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null) ]]; then
#     /usr/libexec/PlistBuddy -c "Add :FK_StandardViewSettings dict" ~/Library/Preferences/com.apple.finder.plist
# fi

# # Create the `FK_StandardViewSettings:IconViewSettings` dictionary in `com.apple.finder.plist` if it doesn't exist
# if [[ ! $(/usr/libexec/PlistBuddy -c "Print :FK_StandardViewSettings:IconViewSettings" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null) ]]; then
#     /usr/libexec/PlistBuddy -c "Add :FK_StandardViewSettings:IconViewSettings dict" ~/Library/Preferences/com.apple.finder.plist
# fi

# Finder Extra: Right click on desktop > Show View Options > (Check) Show item info
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# TODO: check if the keys below exist and change
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# OR ###
# key=showItemInfo
# if [[ ! $(/usr/libexec/PlistBuddy -c "Print :FK_StandardViewSettings:IconViewSettings:$key" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null) ]]; then
#     action=Add; type=bool
# else
#     action=Set; type=
# fi
# /usr/libexec/PlistBuddy -c "$action :FK_StandardViewSettings:IconViewSettings:$key $type false" ~/Library/Preferences/com.apple.finder.plist

# Finder Extra: Right click on desktop > Use Stacks
/usr/libexec/PlistBuddy -c "Set :FXPreferredGroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:GroupBy Kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy dateAdded" ~/Library/Preferences/com.apple.finder.plist

# Finder Extra: Expand the following File Info panes: “General”, “Open with”
# TODO: check defaults
# defaults write com.apple.finder FXInfoPanesExpanded -dict \
#   General -bool true \
#   OpenWith -bool true