#!/usr/bin/env zsh

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