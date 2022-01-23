#!/usr/bin/env zsh

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

# Dock & Menu Bar > Sound > (Check) Show in Menu Bar: Always
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
# defaults write com.apple.dock persistent-apps -array ""