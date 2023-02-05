#!/usr/bin/env zsh

source scripts/utils.zsh

_browser() {
  NEW_BROWSER=${1:-"Brave Browser"}

  ask_for_confirmation "${NEW_BROWSER} - Open the app, so you can set it as the default browser and sync settings?." 'open_app ${NEW_BROWSER} && press_enter_to_continue'
}

_iterm() {
  ask_for_confirmation "iTerm - Open the app, co you can set it up as the default Term?" 'open_app "iTerm" && press_enter_to_continue'
}

_rectangle() {
  ask_for_confirmation "Rectangle - Open the app, so you can set it up?" 'open_app "Rectangle" && press_enter_to_continue'
}

# TODO: when adding profiles, add optional installation based on profile
_setup_other_apps() {
  _browser
  _iterm
  _rectangle
}

ask_for_confirmation "Do you want to set up other apps?" _setup_other_apps
