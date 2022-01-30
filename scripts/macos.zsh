#!/usr/bin/env zsh

source scripts/utils.zsh

osascript -e 'tell application "System Preferences" to quit'

_set_system_preferences() {
  for script in macos/*; do
    echo "Setting up: ${script}"
    ${script}
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
    killall ${app} &> /dev/null
  done
}

_setup_macos() {
  _set_system_preferences
  _kill_apps
  ask_for_confirmation "Reboot is required for some changes to take effect. Reboot now?" 'sudo reboot'
}

ask_for_confirmation "Do you want to set up macOS System Preferences?" '_setup_macos'