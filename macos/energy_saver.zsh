#!/usr/bin/env zsh

# NOTE: setup for a mac with power adapter (battery settings not included).
# Energy Saver > Turn display off after
# TODO: check default setting
sudo pmset -c displaysleep 10

# Energy Saver > (Uncheck) Prevent computer from sleeping automatically when the display is off
sudo pmset -c sleep 30

# Energy Saver > (Uncheck) Wake for network access
sudo pmset -c womp 0