#!/usr/bin/env zsh

source scripts/utils.zsh

_alfred() {
  ask_for_confirmation "Alfred - Open the app, so you can add your licence and sync settings with Dropbox?" 'open_app "Alfred 4" && press_enter_to_continue'
}

_browser() {
  NEW_BROWSER=${1:-"Brave Browser"}

  ask_for_confirmation "${NEW_BROWSER} - Open the app, so you can set it as the default browser and sync settings?." 'open_app ${NEW_BROWSER} && press_enter_to_continue'
}

_dropbox() {
  ask_for_confirmation "Dropbox - Open the app, so you can sign in and sync files?" 'open_app "Dropbox" && press_enter_to_continue'
}

_iterm() {
  ask_for_confirmation "iTerm - Open the app, co you can set it up as the default Term?" 'open_app "iTerm" && press_enter_to_continue'
}

_jetbrains_toolbox() {
  ask_for_confirmation "JetBrains Toolbox - Open the app, so you can sign in and download apps?" 'open_app "JetBrains Toolbox" && press_enter_to_continue'
}

_one_password() {
  ask_for_confirmation "1Password - Open the app, so you can sign in?" 'open_app "1Password 7" && press_enter_to_continue'
}

_rectangle() {
  ask_for_confirmation "Rectangle - Open the app, so you can set it up?" 'open_app "Rectangle" && press_enter_to_continue'
}

# TODO: when adding profiles, add optional installation based on profile
_setup_other_apps() {
  _browser
  _one_password
  _dropbox
  _jetbrains_toolbox
  _iterm
  _rectangle
  _alfred
}

ask_for_confirmation "Do you want to set up other apps?" _setup_other_apps
