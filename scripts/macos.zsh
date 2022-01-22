#!/usr/bin/env zsh

# Inspired by: 
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh
# https://github.com/0-vortex/dotfiles/blob/main/scripts/monterey.sh
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

# TODO: Add env file for variables, ask on start?
# HOSTNAME="harlus"

# Close any open System Preferences panes, to prevent them from overriding new settings
osascript -e 'tell application "System Preferences" to quit'

_accessibility() {
  # Accessibility > Pointer Control > Trackpad Options > Enable dragging > three finger drag
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

  # Accessibility > Zoom > Use scroll gesture with the (Ctrl (^)) modifier key to zoom
  defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

  # Accessibility > Zoom > Advanced > Appearance > When zoomed in, the screen image moves: Only when the pointer reaches an edge
  defaults write com.apple.universalaccess closeViewPanningMode -int 1

  # Accessibility > Zoom > Advanced > Follow Focus > Follow keyboard focus: Always
  defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
}

_desktop_and_screen_saver() {
  # Desktop & Screen Saver > Screen Saver > (Uncheck) Show screen saver after
  defaults -currentHost write com.apple.screensaver idleTime -int 0
}

_displays() {
  # TODO: Displays > Night Shift: find defaults keys
}

_dock_and_menu_bar() {
  # Dock & Menu Bar > Size / (Check) Magnification
  defaults write com.apple.dock tilesize -int 32
  defaults write com.apple.dock largesize -int 64
  defaults write com.apple.dock magnification -bool true

  # Dock & Menu Bar > Position on screen: Left
  defaults write com.apple.dock orientation -string "left"

  # Dock & Menu Bar > Minimize windows using: Scale effect
  defaults write com.apple.dock mineffect -string "scale"

  # Dock & Menu Bar > (Uncheck) Minimize windows into application icon
  defaults write com.apple.dock minimize-to-application -bool false

  # Dock & Menu Bar > (Uncheck) Show recent applications in Dock
  defaults write com.apple.dock show-recents -bool false

  # Dock & Menu Bar > Wi-Fi > (Check) Show Wi-Fi status in menu bar
  # TODO: check default settings
  defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true
  defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist WiFi -int 18

  # Dock & Menu Bar > Bluetooth > (Check) Show Bluetooth in menu bar
  defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
  defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18

  # TODO: Dock & Menu Bar > Sound > (Check) Show in Menu Bar: Always
  defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
  defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18

  # TODO: check default settings
  # # Dock & Menu Bar > Clock > Date Options: (Check) Show the day of the week
  # defaults write com.apple.menuextra.clock.plist ShowDayOfWeek -bool true

  # # Dock & Menu Bar > Clock > Date Options: (Check) Show date
  # defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true

  # # Dock & Menu Bar > Clock > Time Options: (Check) Digital
  # defaults write com.apple.menuextra.clock.plist IsAnalog -bool false

  # # Dock & Menu Bar > Clock > Time Options: (Check) Use a 24-hour clock
  # defaults delete -g AppleICUForce12HourTime > /dev/null 2>&1
  # defaults write com.apple.menuextra.clock.plist Show24Hour -bool true
  # defaults write com.apple.menuextra.clock.plist ShowSeconds -bool false

  # # Dock & Menu Bar > Clock > (Uncheck) Show am/pm
  # # TODO: check this, should be disabled 
  # defaults write com.apple.menuextra.clock.plist ShowAMPM -bool false

  # # Dock & Menu Bar > Clock (date format)
  # defaults write com.apple.menuextra.clock.plist DateFormat -string "EEE d MMM HH:mm"

  # Dock & Menu Bar > Spotlight > (Uncheck) Show in menu bar
  defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool true

  # Dock & Menu Bar > Siri > (Uncheck) Show Siri in menu bar
  defaults write com.apple.Siri StatusMenuVisible -bool false

  # TODO: Dock & Menu Bar > Time Machine > (Uncheck) Show Siri in menu bar

  # Dock & Menu Extra: Remove all (default) app icons from Dock
  # NOTE: This is only really useful when setting up a new Mac.
  defaults write com.apple.dock persistent-apps -array ""

  # TODO: Dock & Menu Extra: Add selected apps to Dock (persistent-apps array)

  # Dock & Menu Bar Extra: Right click on Downloads stack > Display as: Folder
  # TODO: check default settings
  # Note: This works with Downloads being either the only or the first object there as it modifies the object at index 0
  /usr/libexec/PlistBuddy -c "Set :persistent-others:0:tile-data:displayas 1" ~/Library/Preferences/com.apple.dock.plist

  # Dock & Menu Bar Extra: Right click on Downloads stack > View content as: List
  # TODO: check default settings
  # Note: This works with Downloads being either the only or the first object there as it modifies the object at index 0
  /usr/libexec/PlistBuddy -c "Set :persistent-others:0:tile-data:showas 3" ~/Library/Preferences/com.apple.dock.plist

}

_energy_saver() {
  # NOTE: setup for a mac with power adapter (battery settings not included).
  # Energy Saver > Turn display off after
  # TODO: check default setting
  sudo pmset -c displaysleep 10

  # Energy Saver > (Uncheck) Prevent computer from sleeping automatically when the display is off
  sudo pmset -c sleep 30

  # Energy Saver > (Uncheck) Wake for network access
  sudo pmset -c womp 0
}

_finder() {
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
}

_general() {
  # General > Appearance: Dark
  defaults write -g AppleInterfaceStyle -string "Dark"
  defaults delete -g AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1

  # General > Click in the scrollbar to: Jump to the spot that's clicked
  defaults write -g AppleScrollerPagingBehavior -bool true

  # Generala > (Check) Ask to keep changes when closing documents
  defaults write -g NSCloseAlwaysConfirmsChanges -bool true

  # TODO: check default settings for General > Allow Handoff between this Mac and your iCloud devices
  defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
  defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true
}

_hidden_settings() {
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
}

_keyboard() {
  # Keyboard > Keyboard > Key Repeat / Delay Until Repeat
  # 2 us the fastest in GUI, but real is 1
  defaults write -g KeyRepeat -int 1
  # 15 is the fastest in GUI, but real is 10
  defaults write -g InitialKeyRepeat -int 10

  # Keyboard > Text > Clear Replace-With
  defaults write -g NSUserDictionaryReplacementItems -array

  # Keyboard > Text > (Uncheck) auto correct and other substitutions
  defaults write -g NSAutomaticCapitalizationEnabled -bool false
  defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
  defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

  # Keyboard > Shortcuts > (Check) Use keyboard navigation to move focus between controls
  # TODO: check default setting
  defaults write -g AppleKeyboardUIMode -int 3

  # Keyboard > Shortcuts > Spotlight > (Unbind) Show Spotlight search
  /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist \
    -c "Delete :AppleSymbolicHotKeys:64" \
    -c "Add :AppleSymbolicHotKeys:64:enabled bool false" \
    -c "Add :AppleSymbolicHotKeys:64:value:parameters array" \
    -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 65535" \
    -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 49" \
    -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 1048576" \
    -c "Add :AppleSymbolicHotKeys:64:type string standard"
  # defaults read com.apple.symbolichotkeys.plist > /dev/null
  /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

  # Keyboard > Input Sources > (Uncheck) Show Input menu in menu bar
  # TODO: check default setting
  defaults write com.apple.TextInputMenu visible -bool false
}

_mission_control() {
  # Mission Control > (Uncheck) Automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false
}

_mouse_and_trackpad() {
  # Built-in trackpad:  AppleMultitouchTrackpad
  # Bluetooth trackpad: AppleBluetoothMultitouch

  # Trackpad > Point & Click > (Check) Tap to click
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write -g com.apple.mouse.tapBehavior -int 1
  defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1

  # Trackpad > Point & Click > (Check) Secondary click
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

  # Trackpad > More Gestures > (Check) App Expose: Swipe down with four fingers
  defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
}

_safari() {
  ### TODO: SAFARI ###
}

_security_and_privacy() {
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
}

_sharing() {
  # TODO: check default settings and find defaults keys for File Sharing

  # Sharing > (Uncheck) File sharing > Options > Share files and folders using SMB / AFP
  # TODO: check if persitent
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

  # Sharing > Computer Name
  # sudo scutil --set ComputerName "mini $HOSTNAME"
  # Shell prompt
  # sudo scutil --set HostName "$HOSTNAME"
  # Bonjour Name
  # sudo scutil --set LocalHostName "$HOSTNAME"

  # TODO: Sharing > (Enable) AirPlay Receiver: Current user - find defaults keys

  # Sharing Extra: Finder (Side bar) > AirDrop > Allow me to be discovered by: Off
  # Possible values: No One as "Off", Contacts Only, Everyone
  defaults write com.apple.sharingd DiscoverableMode -string "Off"
}

_software_update(){
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
}

_sound() {
  # Sound > Sound Effects > (Uncheck) Play sound on startup
  sudo nvram StartupMute=%01
}

_terminal() {
  ### TODO: TERMINAL ###
}

_time_machine() {
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
}

_users_and_groups() {
  # Users & Groups > Guest User > (Uncheck) Allow guests to log in to this computer
  sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
  
  # TODO: check default settings for Users & Groups > Login Options > (Uncheck) Automatic login / Display login windows as (List of users) / (Disable) Show fast user switching menu as
}

# TODO: Add settings for other app i.e. Brave, Firefox, Safari(?), Terminal (?)

# /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

settings=(
  _accessibility
  _bluetooth
  _desktop_and_screen_saver
  _displays
  _dock_and_menu_bar
  _energy_saver
  _finder
  _general
  _hidden_settings
  _keyboard
  _mission_control
  _mouse_and_trackpad
  # _safari
  _security_and_privacy
  _sharing
  _software_update
  _sound
  # _terminal
  _time_machine
  _users_and_groups
)

for setting in ${settings[@]}; do
  echo "Setting up: ${setting}"
  ${setting}
done

apps=(
  "cfprefsd"
  "Dock"
  "Finder"
  "Safari"
  "SystemUIServer"
)

for app in ${apps[@]}; do
  echo "Killing: ${app}"
  killall ${app} &> /dev/null
done

# TODO: Add info about the need of rebooting and any additional settings that still need to be changed manually
