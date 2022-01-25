#!/usr/bin/env zsh

# TODO: Add env file for variables, ask on start?

# Close any open System Preferences panes, to prevent them from overriding new settings
osascript -e 'tell application "System Preferences" to quit'

# TODO: Add settings for: Brave, Displays (Night Shift), Firefox, Safari(?), Terminal (?)
# TODO: Add conditional settings for laptop: Energy Saver (Battery), Keyboard (Illumination), Screen (Brightness)

_set_system_preferences() {
  for script in macos/*; do
    echo "Setting up: ${script}"
    # ${script}
  done
}

_kill_apps() {
  local apps=(
    "cfprefsd"
    "Dock"
    "Finder"
    "System Preferences"
    "SystemUIServer"
  )

  for app in ${apps[@]}; do
    echo "Restarting: ${app}"
    # killall ${app} &> /dev/null
  done
}

_set_system_preferences
_kill_apps

# TODO: Add info about the need of rebooting and any additional settings that still need to be changed manually
