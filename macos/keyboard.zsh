#!/usr/bin/env zsh

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