#!/usr/bin/env zsh

# Built-in trackpad:  AppleMultitouchTrackpad
# Bluetooth trackpad: AppleBluetoothMultitouch

# Trackpad > Point & Click > (Check) Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write -g com.apple.mouse.tapBehavior -int 1
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1

# Trackpad > More Gestures > (Check) App Expose: Swipe down with four fingers
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
