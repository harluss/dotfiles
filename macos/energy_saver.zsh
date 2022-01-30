#!/usr/bin/env zsh

# NOTE: setup for a mac with power adapter (battery settings not included).
# TODO: Add conditional settings for laptop: Energy Saver (Battery)

# Energy Saver > (Uncheck) Prevent computer from sleeping automatically when the display is off
sudo pmset -c sleep 30

# Energy Saver > (Uncheck) Wake for network access
sudo pmset -c womp 0