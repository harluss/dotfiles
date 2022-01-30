#!/usr/bin/env zsh

# Accessibility > Pointer Control > Trackpad Options > Enable dragging > three finger drag
# TODO: did not work, fix required
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Accessibility > Zoom > Use scroll gesture with the (Ctrl (^)) modifier key to zoom
# TODO: did not work, fix required
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
