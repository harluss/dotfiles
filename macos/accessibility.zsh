#!/usr/bin/env zsh

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