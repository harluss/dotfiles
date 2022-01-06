#!/usr/bin/env zsh

# Inspired by: 
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh
# https://github.com/0-vortex/dotfiles/blob/main/scripts/monterey.sh
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

# TODO: Add env file for variables, ask on start?
# HOSTNAME="Harlus"

# Close any open System Preferences panes, to prevent them from overriding new settings
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

_general_setup() {
  # General > Appearance: Dark
  # defaults delete -g AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
  defaults write -g AppleInterfaceStyle -string "Dark"

  # General > Show scroll bars: Always
  defaults write -g AppleShowScrollBars -string "Always"

  # General > Click in the scrollbar to: Jump to the spot that's clicked
  defaults write -g AppleScrollerPagingBehavior -bool true
}

_mouse_and_trackpad_setup() {
  # Built-in trackpad:  AppleMultitouchTrackpad
  # Bluetooth trackpad: AppleBluetoothMultitouch

  # Trackpad > Point & Click > (Enable) Tap to click
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

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

  # Trackpad > More Gestures > (Enable) App Expose: Swipe down with four fingers
  defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
}

_keyboard_setup() {
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
  #
  ## Possible different approach:
  ## https://superuser.com/questions/1211108/remove-osx-spotlight-keyboard-shortcut-from-command-line
  ## https://apple.stackexchange.com/questions/405937/how-can-i-enable-keyboard-shortcut-preference-after-modifying-it-through-defaul
}

_bluetooth_setup() {
  # Bluetooth > (Enable) Show Bluetooth in menu bar
  defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
  defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
}

_sound_setup() {
  # Sound > Sound Effects > (Disable) Play sound on startup
  # sudo nvram StartupMute=%01

  # Sound > Sound Effects > (Disable) Play feedback when volume is changed
  defaults write com.apple.sound.beep.feedback -bool false

  # Sound > Show volume in menu bar
  defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
  defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
}

_finder_and_desktop_setup() {
  # Finder Preferences > General > Show these items on the desktop > (Enable) Connected Servers
  # TODO: check default settings match the ones below
  # defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  # defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
  # defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

  # Finder Preferences > General > New Finder windows show: Home
  defaults write com.apple.finder NewWindowTarget -string "PfHm"
  # defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

  # Finder Preferences > Advanced > (Enable) Show all file extensions
  defaults write -g AppleShowAllExtensions -bool true

  # Finder Preferences > Advanced > (Disable) Show warning before changing an extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Finder Preferences > Advanced > (Enable) Keep folders on top > In windows / On Desktop
  defaults write com.apple.finder _FXSortFoldersFirst -bool true
  defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

  # Finder Preferences > Advanced > When performing a search: Search the Current Folder
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Finder > View Menu > Show Status Bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder > View Menu > Show Path Bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Finder > View Menu > View Options > Always open in list view
  # Column view option: `clmv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # TODO: find defatults key for Finder > View Menu > View Options > Calculate all sized

  # TODO: find way to setup Finder Preferences > Sidebar

  # Finder Other: User Folder (right click on any folder inside) > Show View Options > Show Library Folder
  chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

  # Right click on desktop > Show View Options > (Enable) Show item info
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
}

_dock_and_menu_bar_setup() {
  # Dock & Menu Bar > Size / (Enable) Magnification
  defaults write com.apple.dock tilesize -int 28
  defaults write com.apple.dock largesize -int 64
  defaults write com.apple.dock magnification -bool true

  # Dock & Menu Bar > Minimize windows using
  defaults write com.apple.dock mineffect -string "scale"

  # Dock & Menu Bar > (Disable) Minimize windows into application icon
  defaults write com.apple.dock minimize-to-application -bool false

  # Dock & Menu Bar > (Disable) Show recent applications in Dock
  defaults write com.apple.dock show-recents -bool false

  # Dock & Menu Bar > Spotlight > (Disable) Show in menu bar
  defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool true
}

# Dock & Menu Bar Other: Remove all (default) app icons from the Dock
# NOTE: This is only really useful when setting up a new Mac.
defaults write com.apple.dock persistent-apps -array ""

# TODO: Dock & Menu Bar Other: Add selected apps to Dock (persistent-app array)

# TODO: Dock & Menu Bar Other: Right click on download stack > Display as: Folder (presistent-other array)

# Mission Control > (Disable) Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Mission Control Other: Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.05

### DISPLAY ###

# TODO: find defaults keys for Night Shift settings

_security_and_privacy_settings() {
  # Security & Privacy > General > Require password after sleep or screen saver begins: Immediately
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

  # Security & Privacy > Privacy > Apple Advertising > (Disable) Personalised Ads
  defatults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false

  # Security & Privacy > Privacy > Advertising > (Enable) Limit Ad Tracking
  # GUI toggle removed in Monterey?
  defaults write com.apple.AdLib forceLimitAdTracking -bool true
  
  # TODO: find defaults keys and disable Security & Privacy > Privacy > Analytics & Improvements 
}


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

_extra_settings() {

}
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

# Keyboard Other: Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Finder > Advanced > Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder Other: (Enable) Quick Look text selection
# TODO: check if enabled by default in Monterey
# defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder Other: (Disable) Quick Look animation
# defaults write -g QLPanelAnimationDuration -float 0

# Finder Other: (Disable) Window animations
# defaults write com.apple.finder DisableAllAnimations -bool true

# Finder Other: Speed up Window resize animation
defaults write -g NSWindowResizeTime -float 0.001

# Display Other: Enable subpixel font rendering on non-Apple LCDs
defaults write -g AppleFontSmoothing -int 2

_software_update_setup(){
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
}

_accessibility_setup() {
  # Accessibility > Pointer Control > Trackpad Options > Enable dragging > three finger drag
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

  # Accessibility > Zoom > Use scroll gesture with the (Ctrl (^)) modifier key to zoom
  # TODO: check default setting
  # defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  # defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

  # Accessibility > Zoom > Advanced > Appearance > When zoomed in, the screen image moves: Only when the pointer reaches an edge
  defaults write com.apple.universalaccess closeViewPanningMode -int 1

  # Accessibility > Zoom > Advanced > Follow Focus > Follow keyboard focus: Always
  defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
}

_energy_saver() {
  # Energy Saver > Turn display off after
  # TODO: check default setting
  sudo pmset -a displaysleep 10

  # Energy Saver > (Disable) Prevent computer from sleeping automatically when the display is off
  sudo systemsetup -setcomputersleep off > /dev/null

  # Energy Saver > (Disable) Wake for network access
  sudo systemsetup -setwakeonnetworkaccess off
}

_terminal_setup() {
  ### TODO: TERMINAL ###
}

_time_machine_setup() {
  # Time Machine > (Disable) Back Up Automatically
  sudo tmutil disable

  # Time Machine > (Disable) Show Time Machine in menu bar
  # TODO: check if persistent
  # defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool false
  local domain="com.apple.menuextra.TimeMachine"
  local plist="${HOME}"/Library/Preferences/com.apple.systemuiserver.plist
  /usr/libexec/PlistBuddy -c "Delete :NSStatusItem\ Preferred\ Position\ $domain" $plist
  /usr/libexec/PlistBuddy -c "Delete :NSStatusItem\ Visible\ $domain" $plist
  local IS_TIMEMACHINE=$(defaults read com.apple.systemuiserver menuExtras | grep "TimeMachine")
  [[ -n ${IS_TIMEMACHINE} ]] && /usr/libexec/PlistBuddy -c "Delete :menuExtras:${IS_TIMEMACHINE}" $plist

  # Time Machine Other: Prevent Time Machine from prompting to use new hard drives as backup volume
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
}

_safari_setup() {
  ### TODO: SAFARI ###
}

_siri_setup() {
  # Siri > (Disable) Enable Ask Siri
  # defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false 

  # Siri > (Disable) Show Siri in menu bar
  defaults write com.apple.Siri StatusMenuVisible -bool false
}

# TODO: Add settings for other app i.e. Chrome, iTerm2...

_general_setup
_mouse_and_trackpad_setup
_keyboard_setup
_finder_and_desktop_setup
_bluetooth_setup
_accessibility_setup
_energy_saver
_sound_setup
_security_and_privacy_settings
_time_machine_setup
_siri_setup
_software_update_setup

for app in "Activity Monitor" "Dock" "Finder" "Safari" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

# TODO: Add info about the need of rebooting and any additional settings that still need to be changed manually
